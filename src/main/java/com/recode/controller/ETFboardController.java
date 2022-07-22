package com.recode.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.recode.domain.EtfDTO;

import com.recode.service.ETFboardService;

@Controller
public class ETFboardController {

	@Inject
	private ETFboardService etfBoardService;

	@RequestMapping(value = "/etf/etfBoard", method = RequestMethod.GET)
	public String joinForm(Model model) {

		List<EtfDTO> etfList = etfBoardService.getetfBoardList();
		model.addAttribute("etfList", etfList);
		return "/etf/etfBoard";
	}

}
