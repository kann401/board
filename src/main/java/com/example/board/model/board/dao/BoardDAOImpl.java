package com.example.board.model.board.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.board.model.board.dto.BoardDTO;

@Repository
public class BoardDAOImpl implements BoardDAO {

	@Inject
	SqlSession sqlsession;
	
	@Override
	public void deleteFile(String fullName) {
		// TODO Auto-generated method stub

	}

	@Override
	public List<String> getAttach(int bno) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void addAttach(String fullName) {
		// TODO Auto-generated method stub

	}

	@Override
	public void updateAttach(String fullName, int bno) {
		// TODO Auto-generated method stub

	}

	@Override
	public void create(BoardDTO dto) throws Exception {
		sqlsession.insert("board.insert", dto);

	}

	@Override
	public BoardDTO read(int bno) throws Exception {
		return sqlsession.selectOne("board.view", bno);
	}

	@Override
	public void update(BoardDTO dto) throws Exception {
		sqlsession.update("board.updateArticle", dto);

	}

	@Override
	public void delete(int bno) throws Exception {
		sqlsession.delete("board.deleteArticle", bno);
	}
	
	// 게시글 목록을 불러오자.
	@Override
	public List<BoardDTO> listAll(int start, int end, String search_option, String keyword) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		map.put("start", start);
		map.put("end", end);
		return sqlsession.selectList("board.listAll", map);
	}

	@Override
	public void increaseViewcnt(int bno) throws Exception {
		sqlsession.update("board.increaseViewcnt", bno);

	}

	@Override
	// 총 게시글의 숫자를 가져온다.
	//처음 게시판을 클릭하게 되면 컨트롤러로 부터 search_option에는 "all", keyword에는 ""가 넘어오게 된다.
	public int countArticle(String search_option, String keyword) throws Exception { 
		// DB에서 값을 가져오기 위해 search_option과 keyword를 mapper로 보내줘야 한다.
		Map<String,String> map = new HashMap<String, String>();
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		return sqlsession.selectOne("board.countArticle", map);
	}

}
