package com.recode.service;

import com.recode.domain.MemberDTO;

public interface MemberService {

	void joinMember(MemberDTO memberDTO);

	public MemberDTO checkMember(MemberDTO memberDTO);

}
