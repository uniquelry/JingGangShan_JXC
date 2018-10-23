package com.uniquelry.jgs.service;

import com.uniquelry.jgs.entity.PurchaseListGoods;

import java.util.List;

/**
 * @Description  进货单商品Service接口
 * @Author uniquelry
 * @Email 1909506001@qq.com
 * @Date 2018/10/20 0:29
 * @Version V1.0
 */
public interface PurchaseListGoodsService {

	/**
	 * 根据进货单id查询所有进货单商品
	 * @param purchaseListId
	 * @return
	 */
	public List<PurchaseListGoods> listByPurchaseListId(Integer purchaseListId);
	
	/**
	 * 根据条件查询进货单商品
	 * @param purchaseListGoods
	 * @return
	 */
	public List<PurchaseListGoods> list(PurchaseListGoods purchaseListGoods);


}
