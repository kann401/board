package com.example.board.model.member.dao;

import com.example.board.model.member.dto.MemberDTO;

public interface MemberDAO {
	public void join(MemberDTO dto);
	public String login(MemberDTO dto);
	public MemberDTO idcheck_db(String searchId);
}
