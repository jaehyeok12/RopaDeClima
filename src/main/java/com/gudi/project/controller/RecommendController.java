package com.gudi.project.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.time.LocalDate;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class RecommendController {

	Logger logger = LoggerFactory.getLogger(this.getClass());

	@RequestMapping(value = "/")
	public String main(Model model) throws Exception {

		// 홈占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙 占쏙옙占쏙옙 키
		LocalDate nowDate = LocalDate.now();
		String apiUrl = "http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst";
		// 占쏙옙占쏙옙 키
		String serviceKey = "0C0KxQlchEfYKRkvh2LGG%2BA1EWgJYxjN9yNA1TOUc94OOtJV9yHRv8a0yJj5DnyLaR%2F3qbtacF808BhBY8tr3w%3D%3D";
		// 占쏙옙占쏙옙, 占썸도
		String dataType = "JSON";
		String base_date = nowDate.toString().replace("-", "");
		String base_time = "0500";
		String nx = "37";
		String ny = "126";
		String page = "1";
		String numOfRows = "1000";

		StringBuilder urlBuilder = new StringBuilder(apiUrl); /* URL */

		StringBuilder serv = urlBuilder
				.append("?" + URLEncoder.encode("serviceKey", "UTF-8") + "=" + serviceKey); /* Service Key */
		

		// 占쏙옙占쏙옙占쏙옙 占쏙옙호
		StringBuilder pag = urlBuilder
				.append("&" + URLEncoder.encode("pageNo", "UTF-8") + "=" + URLEncoder.encode(page, "UTF-8"));

		// 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙호
		StringBuilder row = urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "="
				+ URLEncoder.encode(numOfRows, "UTF-8")); /* 占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙占� 占쏙옙 */
		
		// 占쏙옙占쏙옙占쏙옙 타占쏙옙
		StringBuilder data = urlBuilder.append("&" + URLEncoder.encode("dataType", "UTF-8") + "="
				+ URLEncoder.encode(dataType, "UTF-8")); /* 占쏙옙청占쌘뤄옙占쏙옙占쏙옙(XML/JSON) Default: XML */
		
		// 占쏙옙회 占쏙옙짜
		StringBuilder date = urlBuilder.append("&" + URLEncoder.encode("base_date", "UTF-8") + "="
				+ URLEncoder.encode(base_date, "UTF-8")); /* 占쏙옙21占쏙옙 6占쏙옙 28占쏙옙 占쏙옙표 */
		
		StringBuilder time = urlBuilder.append("&" + URLEncoder.encode("base_time", "UTF-8") + "="
				+ URLEncoder.encode(base_time, "UTF-8")); /* 06占쏙옙 占쏙옙표(占쏙옙占시댐옙占쏙옙) */
		
		StringBuilder x = urlBuilder
				.append("&" + URLEncoder.encode("nx", "UTF-8") + "=" + URLEncoder.encode(nx, "UTF-8")); /* 占쏙옙占쏙옙 X : 58 */
		
		StringBuilder y = urlBuilder
				.append("&" + URLEncoder.encode("ny", "UTF-8") + "=" + URLEncoder.encode(ny, "UTF-8")); /* 占쏙옙占쏙옙 Y : 125 */
		

		URL url = new URL(urlBuilder.toString());
		logger.info("url"+url);
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-type", "application/json");
		System.out.println("Response code: " + conn.getResponseCode());
		BufferedReader rd;

		if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
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
		//logger.info("msg" + result);
		JSONParser parser = new JSONParser(); 
		JSONObject obj = (JSONObject)parser.parse(result); 
		JSONObject response = (JSONObject) obj.get("response");
		JSONObject body = (JSONObject) response.get("body"); 
		JSONObject items =(JSONObject) body.get("items"); 
		JSONArray item = (JSONArray)items.get("item");
		JSONObject TMX = (JSONObject) item.get(120);
		JSONObject TMN = (JSONObject) item.get(591);
		JSONObject SKY = (JSONObject) item.get(5);
		logger.info("TMX : "+TMX);
		logger.info("TMN : "+TMN);
		logger.info("SKY : "+SKY);

		JSONObject weather; 
		String category;
		String day = ""; 
		String val  = "";

		for (int i = 0; i < item.size(); i++) { 
			
			weather = (JSONObject) item.get(i);
			Object fcstValue = weather.get("fcstValue");
			Object fcstDate = weather.get("fcstDate");
			category = (String) weather.get("category");
			
			if(!day.equals(fcstDate.toString())) {
				day = fcstDate.toString();
			}
			if(!val.equals(fcstValue.toString())) {
				val = fcstValue.toString();
			}
		}	
		
		model.addAttribute("TMX",TMX);
		model.addAttribute("TMN",TMN);
		model.addAttribute("SKY",SKY);
		return "ropadeclima_Main";

	}
	
}