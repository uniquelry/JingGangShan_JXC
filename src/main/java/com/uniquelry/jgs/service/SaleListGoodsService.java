package com.uniquelry.jgs.service;

import com.uniquelry.jgs.entity.SaleListGoods;

import java.util.List;

/**
 * @Description  销售单商品Service接口
 * @Author uniquelry
 * @Email 1909506001@qq.com
 * @Date 2018/10/20 0:31
 * @Version V1.0
 */
public interface SaleListGoodsService {

	/**
	 * 根据销售单id查询所有销售单商品
	 * @param saleListId
	 * @return
	 */
	public List<SaleListGoods> listBySaleListId(Integer saleListId);
	
	/**
	 * 统计某个商品的销售总量
	 * @param goodsId
	 * @return
	 */
	public Integer getTotalByGoodsId(Integer goodsId);
	
	/**
	 * 根据条件查询销售单所有商品
	 * @param saleListGoods
	 * @return
	 */
	public List<SaleListGoods> list(SaleListGoods saleListGoods);


}
