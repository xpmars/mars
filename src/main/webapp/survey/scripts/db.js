if (!Array.prototype.filter)
{
  Array.prototype.filter = function(fun /*, thisp*/)
  {
    var len = this.length;
    if (typeof fun != "function")
      throw new TypeError();

    var res = new Array();
    var thisp = arguments[1];
    for (var i = 0; i < len; i++)
    {
      if (i in this)
      {
        var val = this[i]; // in case fun mutates this
        if (fun.call(thisp, val, i, this))
          res.push(val);
      }
    }

    return res;
  };
}

if (typeof Object.create !== 'function') {
    Object.create = function (o) {
        function F() {}
        F.prototype = o;
        return new F();
    };
}

function has(array, value) {
    for (var i = 0; i < array.length; i++) {
		if (array[i] === value) {
			return true;
		}
    }
    return false;
}

function getParameterByName( name ) {
    name = name.replace(/[\[]/,"\\\[").replace(/[\]]/,"\\\]");
    var regexS = "[\\?&]"+name+"=([^&#]*)";
    var regex = new RegExp( regexS );
    var results = regex.exec( window.location.href );
    if( results == null ) {
		return undefined;
    }
    return decodeURIComponent(results[1].replace(/\+/g, " "));
}

var dao = {
    INDEX: "KEY:index",
    KEY: "KEY:",

    init: function() {
        // initialize the storage index
		if (!this.index()) {
			window.localStorage.setItem(this.INDEX, 0);
		}
    },

    index: function() {
		var ind = window.localStorage.getItem(this.INDEX);
		if (ind) {
			return parseInt(ind);
		}
		return undefined;
    },

    save: function(entry) {
		//horrible hack with to avoid the problem of the id =0 = false
		if ((typeof entry.id) === 'undefined') {
			entry.id = this.index();
			entry.create_date = new Date();
			entry.active = "true";
            window.localStorage.setItem(this.INDEX, this.index()+1);
		}
		entry.update_date = new Date();
        window.localStorage.setItem(this.KEY + entry.id, JSON.stringify(entry));
    },

    /** inactivate actually doesn't remove but restricts to the active registers */
    inactivate: function(entry) {
		entry.active = "false";
		this.save(entry);
    },

    remove: function(entry) {
		window.localStorage.removeItem(this.KEY + entry.id);
    },

    get: function(id) {
		return JSON.parse(window.localStorage.getItem(this.KEY + id));
    },

    exists: function(id) {
		return (this.get(id));
    },

    getAll: function() {
		var all = [];
		for (var i=0; i < this.index(); i++) {
			var value = JSON.parse(window.localStorage.getItem(this.KEY + i));
			if (value) {
				all.push(value);
			}
		}
		return all;
    },

    /** TODO not tested, use getAll().filter() for the moment */
    getByCondition: function(fun) {
		var len = this.index(); //this.length
		if (typeof fun != "function") {
			throw new TypeError();
		}
		var res = new Array();
		var thisp = arguments[1];
		for (var i = 0; i < len; i++) {
			if (i in this) {
			// var val = this[i] in case fun mutates this
				var val = JSON.parse(window.localStorage.getItem(this.KEY + i)); 
				if (fun.call(thisp, val, i, this)) {
					res.push(val);
				}
			}
		}
		return res;
		//return this.getAll().filter(condition);
    }
};

// surveys.surveys.filter( function(val) { return (val.id_survey == 0 );} );

var surveys_dao = Object.create(dao);
surveys_dao.INDEX = "surveys:index";
surveys_dao.KEY = "surveys:";
surveys_dao.init();

var answers_dao = Object.create(dao);
answers_dao.INDEX = "answers:index";
answers_dao.KEY = "answers:";
answers_dao.init();

/** returns the object with the new empty answers for a given survey */
answers_dao.createForSurvey = function(id_survey) {
    var survey = surveys_dao.get(id_survey);
    if(survey) {
	var answers = { id_answers: Math.uuid(), id_survey: id_survey, 
			answers: new Array(survey.questions.length) }; 
	//id is added on save time if not defined, same for creation and update dates
	for (var i=0; i < survey.questions.length; i++) {
	    var val = "";
	    // we add the default value if its established
	    if ((typeof survey.questions[i].value) !== 'undefined') {
			val = survey.questions[i].value;
	    }
	    answers.answers[i] = {id: i, answer: val}; //extra will be added in the future an saved in serialization
	}
	return answers;
    }
    return undefined;
};


/*
var computer_id_dao = Object.create(dao);
computer_id_dao.INDEX = "computer:index";
computer_id_dao.KEY = "computer:";
computer_id_dao.init();
computer_id_dao.save({id_computer: Math.uuid()});
*/

var associated_answers_dao = Object.create(dao);
associated_answers_dao.INDEX = "associated_answers:index";
associated_answers_dao.KEY = "associated_answers:";
associated_answers_dao.init();
associated_answers_dao.associate = function(id_answer_parent, answers) {
    if (id_answer_parent) {
	var associated_answer = this.get(id_answer_parent);
	if (!associated_answer) {
	    associated_answer = {
			// the id should be the same that for the parent
			id: id_answer_parent,
			id_answers: new Array()
	    };
	}
	if (!has(associated_answer.id_answers, answers.id)) {
	    associated_answer.id_answers.push(answers.id);
	}
	this.save(associated_answer);
    }
};




//params should be id_survey, typeofquestion
var getExportDataAsHtml = function(id_survey, type) {

    var survey = surveys_dao.get(id_survey);
    var filtered_questions = survey.questions.filter(function(val) {
	// if no type parameter we show all the questions
	if (!type) { return true; }
	// if questions don't have a defined secrecy parameter we make them public
	if (!val.secrecy) {
	    val.secrecy = "public";
	}
	// if the question is set to be show in the report it makes it's secrecy private
	if (val.report) {
	    val.secrecy = "report";
	}
	// if secrecy is always we make it the same as the type in order to return it
	if (val.secrecy === "always") {
	    val.secrecy = type;
	}
	return (val.secrecy === type);
    });
    
    // we build the header
    var table = "<table><tbody>";

    // we print the ids of the questions
    table += "<tr>";
    table += "<th></th>";
    for (var i = 0; i < filtered_questions.length ; i++) {
	table += "<th>" + filtered_questions[i].id +"</th>";
    }
    if (type === "report") {
	table += '<th rowspan="2">Associated<br/>Surveys</th>';
	table += '<th rowspan="2" colspan="4">Options</th>';
    }
    table += "</tr>";
    // Next row is the header questions
    table += "<tr>";
    table += "<th>Id survey</th>";
    for (var i = 0; i < filtered_questions.length ; i++) {
	table += "<th>" + filtered_questions[i].question +"</th>";
    }
    table += "</tr>";

    // we get all the surveys of a given id_survey type
    var answers_by_survey = answers_dao.getAll().filter(function(val) {
	return (val.id_survey === id_survey);
    });

    // now we print the answers
    for (var i = 0; i < answers_by_survey.length ; i++) {
	var answer = answers_by_survey[i];
	table += "<tr>";
	table += "<td>" + answer.id + "</td>";
	// we print the corresponding answers for each survey
	for (var j = 0; j < filtered_questions.length ; j++) {
	    var answer_for_question = answer.answers[filtered_questions[j].id];
	    if (answer_for_question) {
		table += "<td>" + answer_for_question.answer + "</td>";		    		  
	    } else {
		table += "<td></td>";
	    }
	}

//	table += '<td><a href="consult_survey.html?id_answer=' + answer.id +'">View</a></td>';
	if (type === "report") {
	    var associated_answers = associated_answers_dao.get(answer.id);
	    if (associated_answers) {
		table += '<td>';
		for (var j = 0; j < associated_answers.id_answers.length; j++) {
		    var associated_answer = answers_dao.get(associated_answers.id_answers[j]);
		    if (associated_answer) {
//			table += associated_answer.id_answers + ' ';
			table += '<a href="view_answer.html?id_answer=' + associated_answer.id + '">' + associated_answer.id_answers + '</a> ';
			table += '<a href="survey.html?id_answer=' + associated_answer.id + '">Edit</a> ';
//			table += '<a href="#">Remove</a>';
			table += "<br/>";
		    }
		}
		table += '</td>';
	    } else {
		table += '<td></td>';
	    }
	    table += '<td><a href="view_answer.html?id_answer=' + answer.id +'">View</a></td>';
	    table += '<td><a href="survey.html?id_answer=' + answer.id +'">Edit</a></td>';
	    table += '<td><a href="survey.html?id_survey=1&id_answer_parent=' + answer.id + '">Associate</a></td>';
//	    table += '<td><a href="#" onclick="answers_dao.delete(' + answer.id + ')"' + '>Remove</a></td>';
	}
//	<a href="survey.html?id_survey=' + answer.id +'">Associate Survey</a></td>';
//	table += '<td><a href="survey.html?id_answer=' + answer.id +'">Edit</a></td>';
	table += "</tr>";
    }

    table += "</tbody></table>";
    return table;
};

var html_generator = {
    id_survey: 0,
    id_answer: 0,
    getHeader: function() {
    },
    getTableBody: function() {
    },
    getRow: function() {
    },
    getTable: function() {
	return "";
    }
};

var consult_surveys_html_generator = Object.create(html_generator);
consult_surveys_html_generator.getTable = function() {


}

var answers_html_generator = Object.create(html_generator);
answers_html_generator.getTable = function() {
    var table = "";
    var answer = answers_dao.get(id_answer);
    if(answer) {
	table = "<table><tbody>";
	table += "<tr><th>Id</th><th>Question</th><th>Answer</th></tr>";
	var survey = surveys_dao.get(answer.id_survey);
	for (var i=0; i < survey.questions.length; i++) {
	    table += '<tr><td>' + i + '</td><td>' + survey.questions[i].question + '</td>';
	    if (answer.answers[i]) {
		table += '<td>' + answer.answers[i].answer + '</td></tr>';
	    } else {
		table += '<td></td></tr>';
	    }
	}	
	table += "</tbody></table>";
    }
    return table;
};

var answers_html_generator2 = Object.create(html_generator);
answers_html_generator.getTable = function() {
	var table = "";
	var answer = answers_dao.get(id_answer);
	if(answer) {
		table = "<table><tbody>";
		table += "<tr><th>Id</th><th>Question</th><th>Answer</th></tr>";
		var survey = surveys_dao.get(answer.id_survey);
		for (var i=0; i < survey.questions.length; i++) {
			table += '<tr><td>' + i + '</td><td>' + survey.questions[i].question + '</td>';
			if (answer.answers[i]) {
				table += '<td>' + answer.answers[i].answer + '</td></tr>';
			} else {
				table += '<td></td></tr>';
			}
		}
		table += "</tbody></table>";
	}
	return table;
};

var weekly_html_generator = Object.create(html_generator);
weekly_html_generator.getTable = function() {
    var table = "<table><tbody>";
    // we build the header

    table += "<tr>";
    table += "<th>Id survey</th>";
    table += "<th>Kode Rumah Tangga</th>";

    table += "<th>tanggal</th>";
    table += "<th>Diare</th>";
    table += "<th>Jenis Diare</th>";
    table += "<th>ada darah / lendir</th>";
    table += "<th>Jenis Air</th>";
    table += "<th>Air dimasak/direbu</th>";

    table += "</tr>";

    // now the body
    // we get all the surveys of a given id_survey type
    var answers_by_survey = answers_dao.getAll().filter(function(val) {
	return (val.id_survey === id_survey);
    });

    // now we print the answers
    for (var i = 0; i < answers_by_survey.length ; i++) {
	var answer = answers_by_survey[i];
	for (var j = 1; j < answer.answers.length ; j++) {
	    if (j === 1 || (j-1) % 6 === 0) {
		table += "<tr>";
		table += "<td>" + answer.id + "</td>";
		table += "<td>" + answer.answers[0].answer + "</td>";
	    }
	    table += "<td>" + answer.answers[j].answer + "</td>";
	    if (j % 6 === 0) {
		table += "</tr>";
	    }
	}
    }

    table += "</tbody></table>";
    return table;

}


/** Synchronizes the answers against a REST backend */
var syncSurveyAnswers = function() {
    var backend_url = "http://chato.vividores.net/surveyapp/surveys/answers/";
    var survey = surveys_dao.get(id_survey);

    // TODO generar un UID unico para cada maquina, machine_configuration
    // for each answer 1. add synchronized_date, synchronize status, id_machine
    // PUT on server
    // update local status

/*
  surveys_dao.KEY = "surveys:";
  answers_dao.KEY = "answers:";
  associated_answers_dao.KEY = "associated_answers:";

$.ajax({
    url: window.location.pathname,
    type: 'PUT',
    contentType: 'application/json',
    data: JSON.stringify({ page: { my_data: 1 }),
    dataType: 'json'
});
*/

}