package com.recode.service;

import java.util.List;

import com.recode.domain.EtfDTO;

public interface ETFboardService {
	
	// 메인 페이지 최신 ETF
	public List<EtfDTO> getetf();

	public List<EtfDTO> getetfBoardList();

}
