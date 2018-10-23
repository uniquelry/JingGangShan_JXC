package com.uniquelry.jgs.service;

import com.uniquelry.jgs.entity.GoodsType;

import java.util.List;

/**
 * @Description  商品类别Service接口
 * @Author uniquelry
 * @Email 1909506001@qq.com
 * @Date 2018/10/20 0:28
 * @Version V1.0
 */
public interface GoodsTypeService {

	/**
	 * 根据id查询商品类别实体
	 * @param id
	 * @return
	 */
	public GoodsType findById(Integer id);
	
	/**
	 * 根据父节点查找商品类别
	 * @param parentId
	 * @return
	 */
	public List<GoodsType> findByParentId(int parentId);
	
	/**
	 * 添加或者修改商品类别信息
	 * @param goodsType
	 */
	public void save(GoodsType goodsType);
	
	/**
	 * 根据id删除商品类别信息
	 * @param id
	 */
	public void delete(Integer id);
}
