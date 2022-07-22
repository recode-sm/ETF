package com.recode.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.recode.domain.MemberDTO;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Inject
	private SqlSession sqlSession;

	private static final String namespace = "com.recode.etf.MemberMapper";

	@Override
	public void joinMember(MemberDTO memberDTO) {
		sqlSession.insert(namespace + ".joinMember", memberDTO);
	}

	@Override
	public MemberDTO checkMember(MemberDTO memberDTO) {
		return sqlSession.selectOne(namespace + ".checkMember", memberDTO);
	}

}
