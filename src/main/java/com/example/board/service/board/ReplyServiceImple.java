package com.example.board.service.board;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.example.board.model.board.dao.ReplyDAO;
import com.example.board.model.board.dto.ReplyDTO;

@Service
public class ReplyServiceImple implements ReplyService {

	@Inject
	ReplyDAO replydao;


	@Override
	public List<ReplyDTO> list(Integer bno, int start, int end, HttpSession session) {
		return replydao.list(bno, start, end);
	}

	@Override
	public int count(int bno) {
		return replydao.count(bno);
	}

	@Override
	public void create(ReplyDTO dto) {
		replydao.create(dto);
		
	}

	@Override
	public void update(ReplyDTO dto) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(Integer rno) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public ReplyDTO detail(int rno) {
		// TODO Auto-generated method stub
		return null;
	}

	

}
