package com.recode.domain;

import java.sql.Timestamp;

public class EtfDTO {
	private int ETF_code;
	private String ETF_name;
	private Timestamp ETF_date;
	private String ETF_index;
	private String market;
	private String assets;
	
	public int getETF_code() {
		return ETF_code;
	}
	public void setETF_code(int eTF_code) {
		ETF_code = eTF_code;
	}
	public String getETF_name() {
		return ETF_name;
	}
	public void setETF_name(String eTF_name) {
		ETF_name = eTF_name;
	}
	public Timestamp getETF_date() {
		return ETF_date;
	}
	public void setETF_date(Timestamp eTF_date) {
		ETF_date = eTF_date;
	}
	public String getETF_index() {
		return ETF_index;
	}
	public void setETF_index(String eTF_index) {
		ETF_index = eTF_index;
	}
	public String getMarket() {
		return market;
	}
	public void setMarket(String market) {
		this.market = market;
	}
	public String getAssets() {
		return assets;
	}
	public void setAssets(String assets) {
		this.assets = assets;
	}
	
}
