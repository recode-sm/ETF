package com.recode.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.recode.dao.ETFboardDAO;
import com.recode.domain.EtfDTO;

@Service
public class ETFboardServiceImpl implements ETFboardService {

	@Inject
	private ETFboardDAO etfBoardDAO;

	@Override
	public List<EtfDTO> getetf() {
		return etfBoardDAO.getetf();
	}

	@Override
	public List<EtfDTO> getetfBoardList() {
		return etfBoardDAO.getetfBoardList();
	}
}
