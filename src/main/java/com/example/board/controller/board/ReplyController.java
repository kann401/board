package com.example.board.controller.board;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.example.board.model.board.dto.ReplyDTO;
import com.example.board.service.board.Pager;
import com.example.board.service.board.ReplyService;

@RestController
@RequestMapping("/reply/*")
public class ReplyController {
	
	@Inject
	ReplyService replyservice;
	
	@RequestMapping("insert.do")
	public void insert(ReplyDTO dto, HttpSession session) {
		String userid = (String)session.getAttribute("userid");
		dto.setReplyer(userid);
		replyservice.create(dto);
	}
	
	@RequestMapping("list.do")
	public ModelAndView list(int bno,
			@RequestParam(defaultValue="1") int curPage,
			ModelAndView mav, HttpSession session) {
		int count=replyservice.count(bno); //댓글 갯수
		Pager pager=new Pager(count, curPage);
		int start=pager.getPageBegin();
		int end=pager.getPageEnd();
		List<ReplyDTO> list = replyservice.list(bno, start, end,session);
		mav.setViewName("board/reply_list");
		mav.addObject("list", list);
		mav.addObject("pager", pager);
		return mav;
	}

}
