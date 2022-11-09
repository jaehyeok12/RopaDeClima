package com.gudi.project.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import com.fasterxml.jackson.databind.ObjectMapper;
@RestController
@EnableWebMvc
@RequestMapping("/api")
public class RecommendController {

	Logger logger = LoggerFactory.getLogger(this.getClass());

	@GetMapping("/weather")
	public String getAPI() throws Exception {
		logger.info("0번 Test : ㅎㅇ?");
		String url = "http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst"
				+"?serviceKey=d0wdVz9%2F6IoBnzlimyssRquFcK3mdZVoBxgxRs66sewefUQKLLPcI8oaOBBSHRLYVibLj6NpFrXph2p%2BFxvrHg%3D%3D"
				+"&dataType=JSON"
				+"&numOfRows=1000"
				+"&pageNo=1"
				+"&base_date=20221107"
				+"&base_time=0200"
				+"&nx=37"
				+"&ny=127";
		
		HashMap<String, Object> resultMap = getDataFromJson(url,"UTF-8","get","");
		logger.info("#Req : " + resultMap);
		JSONObject jsonobj = new JSONObject();
		jsonobj.put("result", resultMap);
		logger.info("1번 Test : 기본 정보");
		return jsonobj.toString();



	}

	private HashMap<String, Object> getDataFromJson(String url, String encoding, String type, String jsonStr) throws Exception {
		logger.info("2번 Test : 잘 받아왔니?");
		boolean isPost = false;

		if("post".equals(type)) {
			isPost=true;
		}else {
			url = "".equals(jsonStr) ? url : url + "?request="+jsonStr;


		}
		logger.info("3번 Test : if문 TEST");
		return getStringFromURL(url, encoding, isPost, jsonStr, "application/json");
	}

	private HashMap<String, Object> getStringFromURL(String url, String encoding, boolean isPost, String parameter,
			String contentType) throws Exception {
		logger.info("4번 Test");
		URL apiURL = new URL(url);

		HttpURLConnection conn=null;
		BufferedReader br = null;
		BufferedWriter bw = null;

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		logger.info("5번 Test");
		try {
			conn=(HttpURLConnection)apiURL.openConnection();
			conn.setConnectTimeout(5000);
			conn.setReadTimeout(5000);
			conn.setDoOutput(true);

			if(isPost) {
				conn.setRequestMethod("POST");
				conn.setRequestProperty("content-Type", contentType);
				conn.setRequestProperty("Accept", "*/*");
			}else {
				conn.setRequestMethod("GET");
			}

			conn.connect();
			logger.info("6번 Connection Check");

			if(isPost) {
				bw=new BufferedWriter(new OutputStreamWriter(conn.getOutputStream(),"UTF-8"));
				bw.write(parameter);
				bw.flush();
				bw=null;
			}

			br=new BufferedReader(new InputStreamReader(conn.getInputStream(),encoding));

			String line = null;
			StringBuffer result = new StringBuffer();

			while((line=br.readLine())!=null)result.append(line);

			ObjectMapper mapper = new ObjectMapper();

			resultMap=mapper.readValue(result.toString(), HashMap.class);

			logger.info("7번 Buffered Check");

		}catch(Exception e){
			e.printStackTrace();
		}finally {
			if(conn!=null) conn.disconnect();
			if(br!=null) br.close();
			if(bw!=null) bw.close();

		}

		return resultMap;
	}
}