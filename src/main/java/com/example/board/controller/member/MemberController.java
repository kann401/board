package com.example.board.controller.member;


import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.example.board.model.member.dto.MemberDTO;
import com.example.board.service.member.MemberService;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	
	@Inject
	MemberService service;
	
	//로그인 페이지로 이동
	@RequestMapping("loginForm")
	public String loginForm() {
		return "member/loginForm";
	}
	
	//로그아웃 처리
	@RequestMapping("logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	//회원가입 페이지 이동
	@RequestMapping("joinForm.do")
	public String joinForm() {
		return "member/joinForm";
	}
	
	@RequestMapping("join.do")
	public String join(MemberDTO dto) {
		service.join(dto);
		return "redirect:/";
	}
	
	@RequestMapping(value="login_check.do", method=RequestMethod.POST)
	// 매개변수를 dto로 하여 userid,passwd를 담아오고 거기에 다른 유저정보도 넣어서 넘겨준다.
	//페이지 이동을 위해 반환타입 String, 로그인 처리를 위한 session객체
	//반환타입 String에 Model객체를 매개변수로 하여서 따로 처리할수 있지만, ModelAndView로 한번에 처리하겠다.
	public String loginCheck(MemberDTO dto, HttpSession session) {
		String name = service.login(dto);
		if(name != null) {
			//null이 아니라는건 DB에 존재하는 회원정보 이므로 session에 id와 name을 등록해준다.
			session.setAttribute("userid", dto.getUserid());
			session.setAttribute("name", name);
			System.out.println(dto.getUserid()+name);
			return "member/member";
		}else {
			return "redirect:/";
		}
	}
	
	// ID 중복 확인 폼 보기
	@RequestMapping(value = "idcheck", method = RequestMethod.GET)
	public String idcheck(Model model) {
		// 검색 전 후 확인용
		model.addAttribute("search", false);
		return "member/idcheck";
	}
	
	@RequestMapping(value = "idcheck2", method = RequestMethod.POST)
	public ModelAndView idcheckDB(String searchId, ModelAndView mav) {
		System.out.println("왔어요 와써~~");
		MemberDTO dto = service.idcheck_db(searchId);
		// 검색ID와 검색 결과, 검색전후 확인용 값 저장
		Map<String,Object> map = new HashMap<>();
		map.put("searchId", searchId);
		map.put("searchResult", dto);
		map.put("search", true);
		mav.setViewName("member/idcheck");
		mav.addObject("result",map);
		return mav;
	}
	
	@RequestMapping(value="join", method=RequestMethod.POST)
	public String join() {
		System.out.println("도착");
		return null;
	}
}
