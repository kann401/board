package com.example.board.service.member;

import com.example.board.model.member.dto.MemberDTO;

public interface MemberService {
	public void join(MemberDTO dto);
	public String login(MemberDTO dto);
	public MemberDTO idcheck_db(String searchId);
}
