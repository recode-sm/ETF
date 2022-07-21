package com.recode.controller;

import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.recode.domain.MemberDTO;
import com.recode.service.MemberService;

@Controller
public class MemberController {

	@Inject
	private MemberService memberService;

	@RequestMapping(value = "/member/joinForm", method = RequestMethod.GET)
	public String joinForm() {
		// joinForm 회원가입 페이지로 이동
		return "/member/joinForm";
	}

	@RequestMapping(value = "/member/joinPro", method = RequestMethod.POST)
	public String joinPro(MemberDTO memberDTO) {
		// joinForm 회원가입 후 메인 페이지로 이동
		memberService.joinMember(memberDTO);
		return "redirect:/member/loginForm";
	}

	@RequestMapping(value = "/member/loginForm", method = RequestMethod.GET)
	public String loginForm(Locale locale, Model model) {
		// 회원가입 후 로그인 페이지로 이동
		return "/member/loginForm";
	}

	@RequestMapping(value = "/member/loginPro", method = RequestMethod.POST)
	public String loginPro(MemberDTO memberDTO, HttpSession session) {
		System.out.println(memberDTO.getId());
		
		MemberDTO memberDTO2 = memberService.checkMember(memberDTO);
		System.out.println(memberDTO2);
		if (memberDTO2 != null) {
			// 로그인 성공하면 아이디 세션 생성
			session.setAttribute("id", memberDTO2.getId());
			return "redirect:/";
		} else {
			return "redirect:/member/loginForm";
		}
	}
}
