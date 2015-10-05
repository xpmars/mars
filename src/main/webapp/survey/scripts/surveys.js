//OPTIONAL VALUES
// DONE value: "coco" // puts a default value in the answer for a question
// DONE report : "true" // 
// DONE secrecy: "always" is preferred to report for always on fields 
// TODO required: "true"
// TODO validation: 
// TODO navigation :

var surveys = {
    "surveys": [
        {
            id: "0", type: "base", description: "Base survey",
            questions: [
                {id: "1", question: "你倾向从何处得到力量：", type: "2", options: ["(E)别人。", "(I)自己的想法。"]},
                {
                    id: "2",
                    question: "当你参加一个社交聚会时，你会：",
                    type: "2",
                    options: ["(E)在夜色很深时，一旦你开始投入，也许就是最晚离开的那一个。", "(I)在夜晚刚开始的时候，我就疲倦了并且想回家。"]
                },
                {
                    id: "3",
                    question: "下列哪一件事听起来比较吸引你？",
                    type: "2",
                    options: ["(E)与情人到有很多人且社交活动频繁的地方。", "(I)待在家中与情人做一些特别的事情，例如说观赏一部有趣的录影带并享用你最喜欢的外卖食物。"]
                },
                {id: "4", question: "在约会中，你通常：", type: "2", options: ["(E)整体来说很健谈。", "(I)较安静并保留，直到你觉得舒服。"]},
                {
                    id: "5",
                    question: "过去，你遇见你大部分的情人是：",
                    type: "2",
                    options: ["(E)在宴会中、夜总会、工作上、休闲活动中、会议上或当朋友介绍我给他们的朋友时。", "(I)通过私人的方式，例如个人广告、录影约会，或是由亲密的朋友和家人介绍。"]
                },
                {id: "6", question: "你倾向拥有：", type: "2", options: ["(E)很多认识的人和很亲密的朋友。", "(I)一些很亲密的朋友和一些认识的人。"]},
                {
                    id: "7",
                    question: "过去，你的爱人和情人倾向对你说：",
                    type: "2",
                    options: ["(E)你难道不可以安静一会儿吗？", "(I)可以请你从你的世界中出来一下吗？"]
                },
                {id: "8", question: "你倾向通过以下哪种方式收集信息：", type: "2", options: ["(N)你对有可能发生之事的想像和期望。", "(S)你对目前状况的实际认知。"]},
                {id: "9", question: "你倾向相信：", type: "2", options: ["(N)你的直觉。", "(S)你直接的观察和现成的经验。"]},
                {id: "10", question: "当你置身于一段关系中时，你倾向相信：", type: "2", options: ["(N)永远有进步的空间。", "(S)若它没有被破坏，不予修补。"]},
                {
                    id: "11",
                    question: "当你对一个约会觉得放心时，你偏向谈论：",
                    type: "2",
                    options: ["(N)未来，关于改进或发明事物和生活的种种可能性。例如，你也许会谈论一个新的科学发明，或一个更好的方法来表达你的感受。", "(S)实际的、具体的、关于“此时此地”的事物。例如，你也许会谈论品酒的好方法，或你即将要参加的新奇旅程。"]
                },
                {id: "12", question: "你是这种人:", type: "2", options: ["(N)喜欢先纵观全局。", "(S)喜欢先掌握细节。"]},
                {id: "13", question: "你是这类型的人：", type: "2", options: ["(N)与其活在现实中，不如活在想像里。", "(S)与其活在想像里，不如活在现实中。"]},
                {
                    id: "14",
                    question: "你通常：",
                    type: "2",
                    options: ["(N)偏向于去想像一大堆关于即将来临的约会的事情。", "(S)偏向于拘谨地想像即将来临的约会，只期待让它自然地发生。"]
                },
                {id: "15", question: "你倾向如此做决定：", type: "2", options: ["((F)首先依你的心意，然后依你的逻辑。", "(T)当人们不合逻辑时。"]},
                {id: "16", question: "你倾向比较能够察觉到：", type: "2", options: ["(F)当人们需要情感上的支持时。", "(S)喜欢先掌握细节。"]},
                {
                    id: "17",
                    question: "当和某人分手时：",
                    type: "2",
                    options: ["(F)你通常让自己的情绪深陷其中，很难抽身出来。", "(T)虽然你觉得受伤，但一旦下定决心，你会直截了当地将过去恋人的影子甩开。"]
                },
                {
                    id: "18",
                    question: "当与一个人交往时，你倾向于看重：",
                    type: "2",
                    options: ["(F)情感上的相容性：表达爱意和对另一半的需求很敏感。", "(T)智慧上的相容性：沟通重要的想法；客观地讨论和辩论事情。"]
                },
                {
                    id: "19",
                    question: "当你不同意情人的想法时：",
                    type: "2",
                    options: ["(F)你尽可能地避免伤害对方的感情；若是会对对方造成伤害的话，你就不会说。", "(T)你通常毫无保留地说话，并且对情人直言不讳，因为对的就是对的。"]
                },
                {id: "20", question: "认识你的人倾向形容你为：", type: "2", options: ["(F)热情和敏感。", "(T)逻辑和明确。"]},
                {id: "21", question: "你把大部分和别人的相遇视为：", type: "2", options: ["(F)友善及重要的。", "(T)另有目的。"]},
                {
                    id: "22",
                    question: "若你有时间和金钱，你的朋友邀请你到国外度假，并且在前一天才通知，你会：",
                    type: "2",
                    options: ["(J)必须先检查你的时间表。", "(P)立刻收拾行装。"]
                },
                {
                    id: "23",
                    question: "在第一次约会中：",
                    type: "2",
                    options: ["((J)若你所约的人来迟了，你会很不高兴。", "(P)一点儿都不在乎，因为你自己常常迟到。"]
                },
                {
                    id: "24",
                    question: "你偏好：",
                    type: "2",
                    options: ["(J)事先知道约会的行程：要去哪里、有谁参加、你会在那里多久、该如何打扮。", "(P)让约会自然地发生，不做太多事先的计划。"]
                },
                {id: "25", question: "你选择的生活充满着：", type: "2", options: ["(J)日程表和组织。", "(P)自然发生和弹性。"]},
                {id: "26", question: "哪一项较常见：", type: "2", options: ["(J)你准时出席而其他人都迟到。", "(P)其他人都准时出席而你迟到。"]},
                {id: "27", question: "你是这种喜欢的人：", type: "2", options: ["(J)下定决心并且做出最后肯定的结论。", "(P)放宽你的选择面并且持续收集信息。"]},
                {id: "28", question: "你是此类型的人：", type: "2", options: ["(J)喜欢在一段时间里专心于一件事情直到完成。", "(P)享受同时进行好几件事情。"]},

            ]
        }

    ]
};

for (var i = 0; i < surveys.surveys.length; i++) {
    surveys_dao.save(surveys.surveys[i]);
}

window.localStorage.setItem(surveys_dao.INDEX, surveys.surveys.length);