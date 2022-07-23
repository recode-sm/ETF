package com.recode.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.recode.dao.MemberDAO;
import com.recode.domain.MemberDTO;

@Service
public class MemberServiceImpl implements MemberService {

	@Inject
	private MemberDAO memberDAO;

	@Override
	public void joinMember(MemberDTO memberDTO) {
		memberDAO.joinMember(memberDTO);
	}

	@Override
	public MemberDTO checkMember(MemberDTO memberDTO) {
		return memberDAO.checkMember(memberDTO);
	}

}
