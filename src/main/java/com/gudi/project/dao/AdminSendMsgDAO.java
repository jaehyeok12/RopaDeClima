package com.gudi.project.dao;

import java.sql.Date;

public interface AdminSendMsgDAO {

/*
 * 참고용.
 * start_mapper 확인할 것
 * 여기다 코드 적으면 바보
 * */

	int getIdx(String admin_name);
	int sendMSG(Date date, int admin_id, String content);
}
