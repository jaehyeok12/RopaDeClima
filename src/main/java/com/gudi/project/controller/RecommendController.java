package com.gudi.project.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.lang.reflect.Method;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.core.JsonParser;

@Controller
public class RecommendController {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@RequestMapping(value = "/")
    public String main(Model model) throws Exception {
		

    	//홈페이지 에서 받은 키 
    	String apiUrl = "http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getUltraSrtNcst";
    	//서비스 키
    	String serviceKey = "0C0KxQlchEfYKRkvh2LGG%2BA1EWgJYxjN9yNA1TOUc94OOtJV9yHRv8a0yJj5DnyLaR%2F3qbtacF808BhBY8tr3w%3D%3D";
    	//위도, 경도
    	String dataType = "JSON";
    	String base_date = "20221107";
    	String base_time = "0600";
    	String nx = "58";
    	String ny = "125";
    	String TMX = null;
    	String TMN = null;
    	String page = "1";
    	
    	
    	
    	
        StringBuilder urlBuilder = new StringBuilder(apiUrl); /*URL*/
        
        StringBuilder serv = urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "="+serviceKey); /*Service Key*/
        logger.info("1 : "+serv);
        
        //페이지 번호
        StringBuilder pag = urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode(page, "UTF-8")); 
        logger.info("page : ", page);
        
        //데이터 타입
        StringBuilder data = urlBuilder.append("&" + URLEncoder.encode("dataType","UTF-8") + "=" + URLEncoder.encode(dataType, "UTF-8")); /*요청자료형식(XML/JSON) Default: XML*/
        logger.info("2 : "+data);
        //조회 날짜
        StringBuilder date = urlBuilder.append("&" + URLEncoder.encode("base_date","UTF-8") + "=" + URLEncoder.encode(base_date, "UTF-8")); /*‘21년 6월 28일 발표*/
        logger.info("3 : "+date);
        StringBuilder time = urlBuilder.append("&" + URLEncoder.encode("base_time","UTF-8") + "=" + URLEncoder.encode(base_time, "UTF-8")); /*06시 발표(정시단위) */
        logger.info("4 : "+time);
        StringBuilder x = urlBuilder.append("&" + URLEncoder.encode("nx","UTF-8") + "=" + URLEncoder.encode(nx, "UTF-8")); /*가산 X : 58*/
        logger.info("5 : "+x);
        StringBuilder y = urlBuilder.append("&" + URLEncoder.encode("ny","UTF-8") + "=" + URLEncoder.encode(ny, "UTF-8")); /*가산 Y : 125*/
        logger.info("6 : "+y);
        //urlBuilder.append("&"+URLEncoder.encode("TMX","UTF-8") + "=" + URLEncoder.encode(TMX,"UTF-8"));
        //urlBuilder.append("&"+URLEncoder.encode("TMX","UTF-8") + "=" + URLEncoder.encode(TMN,"UTF-8"));
      
        
        URL url = new URL(urlBuilder.toString());
        logger.info("3 번 : ",url);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        logger.info("4 번 : ",conn);
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        System.out.println("Response code: " + conn.getResponseCode());
        BufferedReader rd;
        
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        rd.close();
        conn.disconnect();
        String result = sb.toString();
        logger.info("msg",result);
        
        //model.addAttribute("weather", sb.toString());
        
        JSONParser jp = new JSONParser();
        JSONObject jo = new JSONObject();
        
        jo = (JSONObject) jp.parse(result);
        logger.info("jo : ",jo);
        model.addAttribute("weather", jo);
        
        
        
		
    	return "test";
        

        
    }
}