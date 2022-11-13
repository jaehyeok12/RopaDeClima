package com.gudi.project.dao;

import java.util.ArrayList;
import com.gudi.project.dto.DecListDTO;

public interface AdminRecRepListDAO {

	int recRepCnt();

	ArrayList<DecListDTO> RecRepList();

	ArrayList<String> recRepManagerList();

	ArrayList<DecListDTO> searchRepList(String state);

	int searchRepCnt(String state);

/*
 * 참고용.
 * start_mapper 확인할 것
 * 여기다 코드 적으면 바보
 * */
}
