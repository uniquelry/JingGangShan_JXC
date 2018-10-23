package com.uniquelry.jgs.service;

import com.uniquelry.jgs.entity.CustomerReturnListGoods;

import java.util.List;

/**
 * @Description  客户退货单商品Service接口
 * @Author uniquelry
 * @Email 1909506001@qq.com
 * @Date 2018/10/20 0:27
 * @Version V1.0
 */
public interface CustomerReturnListGoodsService {

	/**
	 * 根据客户退货单id查询所有客户退货单商品
	 * @param customerReturnListId
	 * @return
	 */
	public List<CustomerReturnListGoods> listByCustomerReturnListId(Integer customerReturnListId);

	/**
	 * 统计某个商品的客户退货总量
	 * @param goodsId
	 * @return
	 */
	public Integer getTotalByGoodsId(Integer goodsId);
	
	/**
	 * 根据条件查询客户退货单商品
	 * @param customerReturnListGoods
	 * @return
	 */
	public List<CustomerReturnListGoods> list(CustomerReturnListGoods customerReturnListGoods);
	
	
}
