package com.uniquelry.jgs.service;

import com.uniquelry.jgs.entity.GoodsUnit;

import java.util.List;

/**
 * @Description  商品单位Service接口
 * @Author uniquelry
 * @Email 1909506001@qq.com
 * @Date 2018/10/20 0:28
 * @Version V1.0
 */
public interface GoodsUnitService {

	/**
	 * 根据id查询实体
	 * @param id
	 * @return
	 */
	public GoodsUnit findById(Integer id);
	
	/**
	 * 查询所有商品单位信息
	 * @return
	 */
	public List<GoodsUnit> listAll();
	
	/**
	 * 修改或者修改商品单位信息
	 * @param goods
	 */
	public void save(GoodsUnit goodsUnit);
	
	/**
	 * 根据id删除商品单位
	 * @param id
	 */
	public void delete(Integer id);
}
