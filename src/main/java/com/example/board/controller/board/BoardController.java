package com.example.board.controller.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.board.model.board.dto.BoardDTO;
import com.example.board.service.board.BoardService;
import com.example.board.service.board.Pager;

@Controller
@RequestMapping("/board/*")	//공통 Mapping
public class BoardController {
	
	@Inject
	BoardService service;
	
	@RequestMapping("list.do")
	public ModelAndView list(
			@RequestParam(defaultValue="1") int curPage, //넘어온 값이 없으면 1로 설정
			@RequestParam(defaultValue="all") String search_option,
			@RequestParam(defaultValue="") String keyword
			) throws Exception {
		//1. 레코드 갯수가 필요하다
		int count=service.countArticle(search_option, keyword);
		
		//2. ★다른 여타 page값을 구하기 위한 기본값으로 전체게시글 개수와 현재페이지 번호가 필요하다.
		Pager pager=new Pager(count, curPage);
		System.out.println(pager.toString());
		int start=pager.getPageBegin();	//1
		int end=pager.getPageEnd();	//10
		
		List<BoardDTO> list = service.listAll(start, end, search_option, keyword); 
		ModelAndView mav = new ModelAndView();
		mav.setViewName("board/list_proto");	//이동할 페이지
		Map<String,Object> map = new HashMap<>();
		map.put("list", list);	//맵에 자료 저장
		map.put("count", count);
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		map.put("pager", pager);
		mav.addObject("map", map);
		return mav;
	}
	
	@RequestMapping("writeForm")
	// 입력Form으로 단순히 이동만 할 것이므로 String을 반환타입으로 한다.
	public String writeForm() {
		
		return "board/write_proto";
	}
	
	@RequestMapping(value="insert.do", method=RequestMethod.POST)
	public String insert(BoardDTO dto, HttpSession session) throws Exception{
		//DTO에 저장되는 값 : 제목, 본문, 작성자이름
		String writer=(String)session.getAttribute("userid");
		dto.setWriter(writer);
		System.out.println("content가 null인지 디버깅"+dto.toString());
		//레코드가 저장된다.
		service.create(dto);
		
		//목록 갱신
		return "redirect:/board/list.do";
	}
	
	//상세페이지
	@RequestMapping(value="view.do",method=RequestMethod.GET)
	public ModelAndView view(@RequestParam int bno,
			@RequestParam int curPage,
			@RequestParam String search_option,
			@RequestParam String keyword,
			HttpSession session) throws Exception {
		//클릭한 게시물의 조회수를 +1 하는 쿼리 실행
		service.increaseViewcnt(bno);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("board/view_proto");
		mav.addObject("dto", service.read(bno));
		mav.addObject("curPage", curPage);
		mav.addObject("search_option", search_option);
		mav.addObject("keyword", keyword);
		System.out.println("##content확인용"+service.read(bno).toString());
		return mav;
	}
	
	@RequestMapping(value="updateForm")
	public ModelAndView updateForm(BoardDTO dto, ModelAndView mav) {
		mav.addObject("dto", dto);
		mav.setViewName("board/updateForm");
		return mav;
	}
	
	
	@RequestMapping("update.do")
	public String update(BoardDTO dto) throws Exception {
		service.update(dto);
		return "redirect:/board/list.do";
	}
	
	//게시글 삭제
	@RequestMapping("delete.do")
	public String delete(int bno) throws Exception {
		service.delete(bno);
		return "redirect:/board/list.do";
	}
	
}
