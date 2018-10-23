package com.uniquelry.jgs.service;

import com.uniquelry.jgs.entity.ReturnListGoods;

import java.util.List;

/**
 * @Description  退货单商品Service接口
 * @Author uniquelry
 * @Email 1909506001@qq.com
 * @Date 2018/10/20 0:30
 * @Version V1.0
 */
public interface ReturnListGoodsService {

	/**
	 * 根据退货单id查询所有退货单商品
	 * @param returnListId
	 * @return
	 */
	public List<ReturnListGoods> listByReturnListId(Integer returnListId);
	
	/**
	 * 根据条件查询退货单所有商品
	 * @param returnListGoods
	 * @return
	 */
	public List<ReturnListGoods> list(ReturnListGoods returnListGoods);
}
