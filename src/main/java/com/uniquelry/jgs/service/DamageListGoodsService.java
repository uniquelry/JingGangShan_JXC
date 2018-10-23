package com.uniquelry.jgs.service;

import com.uniquelry.jgs.entity.DamageListGoods;

import java.util.List;

/**
 * @Description  报损单商品Service接口
 * @Author uniquelry
 * @Email 1909506001@qq.com
 * @Date 2018/10/20 0:28
 * @Version V1.0
 */
public interface DamageListGoodsService {

	/**
	 * 根据报损单id查询所有报损单商品
	 * @param damageListId
	 * @return
	 */
	public List<DamageListGoods> listByDamageListId(Integer damageListId);


}
