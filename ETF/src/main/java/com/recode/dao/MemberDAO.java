package com.recode.dao;

import com.recode.domain.MemberDTO;

public interface MemberDAO {

	void joinMember(MemberDTO memberDTO);

	public MemberDTO checkMember(MemberDTO memberDTO);

}
