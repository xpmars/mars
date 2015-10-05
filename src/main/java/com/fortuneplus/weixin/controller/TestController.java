package com.fortuneplus.weixin.controller;

import com.fortuneplus.weixin.model.MbtiAnswer;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

/**
 * Created by xiaopang on 2015/9/24.
 */
@Controller
@RequestMapping(value = "/test", method = RequestMethod.POST)
public class TestController {
    private static Properties prop;
    static {
        prop = new Properties();
        try {
            prop.load(new InputStreamReader(TestController.class.getClassLoader().getResourceAsStream("mbti.properties"), "UTF-8"));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @RequestMapping(value = "/mbti", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> testMbti(@RequestBody String answer) {

        System.out.println(answer);

        JSONArray jsonArray = JSONArray.fromObject(answer);

        Map<String, Integer> mbtiCountMap = new HashMap();
        mbtiCountMap.put("E", 0);
        mbtiCountMap.put("I", 0);
        mbtiCountMap.put("S", 0);
        mbtiCountMap.put("N", 0);
        mbtiCountMap.put("T", 0);
        mbtiCountMap.put("F", 0);
        mbtiCountMap.put("J", 0);
        mbtiCountMap.put("P", 0);

        for (Object aJsonArray : jsonArray) {
            JSONObject jobj = (JSONObject) aJsonArray;
            MbtiAnswer mbtiAnswer = (MbtiAnswer) JSONObject.toBean(jobj, MbtiAnswer.class);
            countMbti(mbtiAnswer, mbtiCountMap);
        }

        String arg_1 = mbtiCountMap.get("E") > mbtiCountMap.get("I") ? "E" : "I";
        String arg_2 = mbtiCountMap.get("S") > mbtiCountMap.get("N") ? "S" : "N";
        String arg_3 = mbtiCountMap.get("T") > mbtiCountMap.get("F") ? "T" : "F";
        String arg_4 = mbtiCountMap.get("J") > mbtiCountMap.get("P") ? "J" : "P";
        answer = arg_1 + arg_2 + arg_3 + arg_4;
        String describe = prop.getProperty(answer).trim();

        System.out.println(answer);
        System.out.println(describe);

        Map<String, Object> map = new HashMap<>();
        map.put("success", "true");
        map.put("result_answer", answer);
        map.put("result_describe", describe);
        return map;
    }

    private void countMbti(MbtiAnswer mbtiAnswer, Map<String, Integer> mbtiCountMap) {
        String answer = mbtiAnswer.getAnswer();
        if (StringUtils.isEmpty(answer))
            return;
        String rex="[()]+";
        String[] str = answer.split(rex);
        int count = mbtiCountMap.get(str[1]);
        mbtiCountMap.put(str[1], ++count);
    }

    @RequestMapping(value = "/fxpg", method = RequestMethod.POST)
    public ModelAndView testFx(HttpServletRequest request, ModelMap modelMap) {
        String qes1 = request.getParameter("qes1");
        String qes2 = request.getParameter("qes2");
        String qes3 = request.getParameter("qes3");
        String qes4 = request.getParameter("qes4");
        String qes5 = request.getParameter("qes5");
        String qes6 = request.getParameter("qes6");
        String qes7 = request.getParameter("qes7");
        String qes8 = request.getParameter("qes8");
        String qes9 = request.getParameter("qes9");
        String qes10 = request.getParameter("qes10");

        int source = fxSource(qes1) + fxSource(qes2) + fxSource(qes3) + fxSource(qes4) + fxSource(qes5) +
                fxSource(qes6) + fxSource(qes7) + fxSource(qes8) + fxSource(qes9) + fxSource(qes10);
        String level = getLevel(source);


        System.out.println(source);
        System.out.println(level);

        modelMap.put("source", source);
        modelMap.put("level", level);
        return new ModelAndView("result");
    }

    private String getLevel(int source) {
        String level = null;
        if (source <= 14)
            level = "保守型";
        else if (source >= 14 && source < 28)
            level = "稳健型";
        else if (source >= 28 && source < 46)
            level = "平衡型";
        else if (source >= 46 && source < 60)
            level = "积极型";
        else if (source >= 60)
            level = "激进型";

        return level;
    }


    private int fxSource(String option) {

        if (StringUtils.isEmpty(option))
            return 0;
        switch (option) {
            case "1":
                return 1;
            case "3":
                return 3;
            case "5":
                return 5;
            case "7":
                return 7;
        }
        return 0;
    }
}
