package com.uniquelry.jgs.service;

import com.uniquelry.jgs.entity.OverflowListGoods;

import java.util.List;

/**
 * @Description  报溢单商品Service接口
 * @Author uniquelry
 * @Email 1909506001@qq.com
 * @Date 2018/10/20 0:29
 * @Version V1.0
 */
public interface OverflowListGoodsService {

	/**
	 * 根据报溢单id查询所有报溢单商品
	 * @param overflowListId
	 * @return
	 */
	public List<OverflowListGoods> listByOverflowListId(Integer overflowListId);


}
