//posible parameters are id_survey, id_question, id_answer, id_survey_parent
var id_survey = (getParameterByName("id_survey") &&
surveys_dao.exists(getParameterByName("id_survey")))
    ? parseInt(getParameterByName("id_survey")) : 0;
var current_survey = surveys_dao.get(id_survey);

var answers = answers_dao.createForSurvey(id_survey);
var id_answer = getParameterByName("id_answer");
if (id_answer) {
    var val = answers_dao.get(id_answer);
    if (val) {
        answers = val;
        // in case the survey id doesn't correspond it gets fixed
        if (val.id_survey !== id_survey) {
            id_survey = val.id_survey;x
            current_survey = surveys_dao.get(id_survey);
        }
    }
}

var id_question = (getParameterByName("id_question") &&
getParameterByName("id_question") < answers.answers.length)
    ? getParameterByName("id_question") : 0;
var current_question = current_survey.questions[id_question];

var id_answer_parent = getParameterByName("id_answer_parent");
if (id_answer_parent) {
    //TODO hacky code that assumes that the first question is going to be filled with the 
    //answer of the first question of the parent survey (house identifier)
    var parent_answer = answers_dao.get(id_answer_parent);
    answers.answers[0].answer = parent_answer.answers[0].answer;
}

var previousQuestion = function () {
    if (id_question > 0) {
        id_question -= 1;
        current_question = current_survey.questions[id_question];
    }
    paintQuestion();
    //we persist the data
    answers_dao.save(answers);
    if (id_answer_parent) {
        associated_answers_dao.associate(id_answer_parent, answers);
    }
};

var nextQuestion = function () {
    if (id_question < current_survey.questions.length - 1) {
//	$("#question").fadeOut(); //"slow"
        id_question += 1;
        current_question = current_survey.questions[id_question];
    } else {
        $("#navigation").append("<input type='button' id='xxx' name='xxx' value='提交' onclick='xxx()'/>");
        $("#next").hide();
    }
    paintQuestion();
    //we persist the data
    answers_dao.save(answers);
    if (id_answer_parent) {
        associated_answers_dao.associate(id_answer_parent, answers);
    }
};

var paintQuestion = function () {
    if (current_question) {
//	$("#question").fadeOut(); //"slow"
//	$("ul").fadeOut();
        $("ul").remove();
        // input text
        var html_answer = '<input type="text" id="answer" name="answer">';
        // radio
        if (current_question.type === "2") {
            html_answer = "";
            for (var i = 0; i < current_question.options.length; i++) {
                html_answer += '<input type="radio" id="answer" name="answer" value="' + current_question.options[i] + '"/>' + current_question.options[i] + '<br />';
            }
        }

        // checkbox
        if (current_question.type === "3") {
            html_answer = "";
            for (var i = 0; i < current_question.options.length; i++) {
                html_answer += '<input type="checkbox" id="answer" name="answer" value="' +
                    current_question.options[i] + '"/>' + current_question.options[i] + '<br />';
            }
        }

        // fecha
        if (current_question.type === "4") {
            html_answer = '<input type="text" class="date_input" id="answer" name="answer">';
        }

        $("#question").append(function (index, html) {
            var num_questions = current_survey.questions.length;
            var html = "<ul>" +
               /* "<li><b>Survey # </b> " + answers.id_answers + "</li>" +*/
                "<li><b>Question # </b>" + current_question.id + " / " + num_questions + "</li>" +
                "<li><b>" + current_question.question + "</b></li>" +
                "<li>" + html_answer + "</li></ul>";
            return html;
        });

        $('.date_input').datepicker($.datepicker.regional["id"]);

        // We update the view with the values of the model (answers)
        $('input:text').val(function (index, value) {
            return answers.answers[id_question].answer;
        });
        $('input:radio').filter(function () {
            return (this.value === answers.answers[id_question].answer);
        }).attr('checked', 'true');
        $('input:checkbox').filter(function () {
            for (var i = 0; i < answers.answers[id_question].answer.length; i++) {
                if (this.value === answers.answers[id_question].answer[i]) {
                    return true;
                }
            }
            return false;
        }).attr('checked', 'true');

        // We add the event handlers
        $('input:text').keyup(function (event) {
            answers.answers[id_question].answer = event.target.value;
        });

        $('input:text').change(function (event) {
            answers.answers[id_question].answer = event.target.value;
        });

        $('input:radio').click(function (event) {
            answers.answers[id_question].answer = $('input:radio:checked').val();
        });

        $('input:checkbox').click(function (event) {
            var answer_data = [];
            $('#answer:checked').each(function () {
                answer_data.push($(this).val());
            });
            answers.answers[id_question].answer = answer_data;
        });

        $('#answer').get(0).focus();

        // It is not focused for all types of input ('#answer')
        // because radio and checkboxes take the default of the document

        $('#answer').bind('keyup', 'return', function (event) {
            nextQuestion();
            event.preventDefault();
        });
        /*
         $('#answer').bind('keyup', 'ctrl+right', function(event) {
         nextQuestion();
         event.preventDefault();
         });
         */
        $('#answer').bind('keyup', 'ctrl+left', function (event) {
            previousQuestion();
            event.preventDefault();
        });
    }
};

var paintExportedSurvey = function () {
//    $("table").fadeOut();
    $("table").remove();
    var id_survey = (getParameterByName("id_survey")) ? parseInt(getParameterByName("id_survey")) : 0;
    var type = getParameterByName("type");
    // defines the type of survey to be built, the factory for the table
    var style = (getParameterByName("style")) ? getParameterByName("style") : "normal";

    if (style === 'weekly') {
        weekly_html_generator.id_survey = id_survey;
        var export_data = weekly_html_generator.getTable();
        $("#navigation").append(export_data);
        return;
    }

    var export_data = getExportDataAsHtml(id_survey, type); //valid arguments "public", "private"

    $("#navigation").append(export_data);
};

var paintAnswer = function () {
    $("table").remove();
    var id_answer = (getParameterByName("id_answer")) ? parseInt(getParameterByName("id_answer")) : 0;
    // Here this is like the factory of functions
    answers_html_generator.id_answer = id_answer;
    var export_data = answers_html_generator.getTable();
    $("#navigation").append(export_data);
};
