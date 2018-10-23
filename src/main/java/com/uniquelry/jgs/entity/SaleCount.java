package com.uniquelry.jgs.entity;

/**
 * @Description  销售统计
 * @Author uniquelry
 * @Email 1909506001@qq.com
 * @Date 2018/10/20 0:14
 * @Version V1.0
 */
public class SaleCount {

	
	private float amountCost; // 成本总金额
	
	private float amountSale; // 销售总金额
	
	private float amountProfit; // 销售利润
	
	private String date; // 日期

	public float getAmountCost() {
		return amountCost;
	}

	public void setAmountCost(float amountCost) {
		this.amountCost = amountCost;
	}

	public float getAmountSale() {
		return amountSale;
	}

	public void setAmountSale(float amountSale) {
		this.amountSale = amountSale;
	}
	

	public float getAmountProfit() {
		return amountProfit;
	}

	public void setAmountProfit(float amountProfit) {
		this.amountProfit = amountProfit;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}
	
	
}
