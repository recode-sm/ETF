package com.recode.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.recode.domain.EtfDTO;

@Repository
public class ETFboardDAOImpl implements ETFboardDAO {

	@Inject
	private SqlSession sqlSession;

	private static final String namespace = "com.recode.etf.etfBoardMapper";

	@Override
	public List<EtfDTO> getetf() {
		return sqlSession.selectList(namespace + ".getetf");
	}

	@Override
	public List<EtfDTO> getetfBoardList() {
		return sqlSession.selectList(namespace + ".getetfBoardList");
	}

}
