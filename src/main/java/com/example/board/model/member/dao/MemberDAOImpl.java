package com.example.board.model.member.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.board.model.member.dto.MemberDTO;

@Repository
public class MemberDAOImpl implements MemberDAO{

	@Inject
	SqlSession session;
	
	@Override
	public void join(MemberDTO dto) {
		session.insert("member.join", dto);
	}
	@Override
	public String login(MemberDTO dto) {
		return session.selectOne("member.login",dto);
	}
	@Override
	public MemberDTO idcheck_db(String searchId) {
		return session.selectOne("member.idcheck", searchId);
	}
	

}
