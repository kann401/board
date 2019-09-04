package com.example.board.service.member;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.board.model.member.dao.MemberDAO;
import com.example.board.model.member.dto.MemberDTO;

@Service
public class MemberServiceImple implements MemberService{

	@Inject
	MemberDAO dao;
	@Override
	public void join(MemberDTO dto) {
		dao.join(dto);
	}
	@Override
	public String login(MemberDTO dto) {
		return dao.login(dto);
	}
	@Override
	public MemberDTO idcheck_db(String searchId) {
		
		return dao.idcheck_db(searchId);
	}

}
