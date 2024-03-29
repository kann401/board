package com.example.board.model.board.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.board.model.board.dto.ReplyDTO;

@Repository
public class ReplyDAOImple implements ReplyDAO {

	@Inject
	SqlSession sqlsession;
	@Override
	public List<ReplyDTO> list(Integer bno, int start, int end) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("bno", bno);
		map.put("start", start);
		map.put("end", end);
		return sqlsession.selectList("reply.listReply", map);
	}

	@Override
	public int count(int bno) {
		return sqlsession.selectOne("reply.count", bno);
	}

	@Override
	public void create(ReplyDTO dto) {
		sqlsession.insert("reply.insertReply", dto);
		
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
