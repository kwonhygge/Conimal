package kr.com.conimal.service;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.com.conimal.dao.MypageDao;
import kr.com.conimal.model.dto.ConimalDto;
import kr.com.conimal.model.dto.UserDto;

@Service
public class MypageServiceImpl implements MypageService {

	@Autowired
	MypageDao dao;
	
	@Override
	public int registerConimal(ConimalDto conimal) {
		conimal.setReg_date(LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy.MM.dd HH:mm:ss")));
		System.out.println("MypageServiceImpl registerConimal() 호출");
		return dao.registerConimal(conimal);
	}

	@Override
	public int updateUserInfo(UserDto user) {
		user.setUpdate_date(LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy.MM.dd HH:mm:ss")));
		System.out.println("MypageServiceImpl updateUserInfo() 호출");
		return dao.updateUserInfo(user);
	}

	@Override
	public boolean checkPwd(String user_id, String password) {
		System.out.println("MypageServiceImpl checkPwd() 호출");
		return dao.checkPwd(user_id, password);
	}

	@Override
	public int secession(UserDto user) {
		System.out.println("MypageServiceImpl secession() 호출");
		return dao.secession(user);
	}

}
