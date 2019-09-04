package com.example.board.service.board;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.board.model.board.dao.BoardDAO;
import com.example.board.model.board.dto.BoardDTO;

@Service
public class BoardServiceImpl implements BoardService {

	@Inject
	BoardDAO dao;
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
		dao.create(dto);

	}

	@Override
	public BoardDTO read(int bno) throws Exception {
		return dao.read(bno);
	}

	@Override
	public void update(BoardDTO dto) throws Exception {
		dao.update(dto);

	}

	@Override
	public void delete(int bno) throws Exception {
		dao.delete(bno);

	}

	@Override
	public List<BoardDTO> listAll(int start, int end, String search_option, String keyword) throws Exception {
		return dao.listAll(start, end, search_option, keyword);
	}

	@Override
	public void increaseViewcnt(int bno) throws Exception {
		dao.increaseViewcnt(bno);

	}

	@Override
	public int countArticle(String search_option, String keyword) throws Exception {
		// TODO Auto-generated method stub
		return dao.countArticle(search_option, keyword);
	}

}
