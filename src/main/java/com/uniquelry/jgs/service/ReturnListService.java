package com.uniquelry.jgs.service;

import com.uniquelry.jgs.entity.ReturnList;
import com.uniquelry.jgs.entity.ReturnListGoods;
import org.springframework.data.domain.Sort.Direction;

import java.util.List;

/**
 * @Description  退货单Service接口
 * @Author uniquelry
 * @Email 1909506001@qq.com
 * @Date 2018/10/20 0:30
 * @Version V1.0
 */
public interface ReturnListService {

	/**
	 * 根据id查询实体
	 * @param id
	 * @return
	 */
	public ReturnList findById(Integer id);
	
	/**
	 * 获取当天最大退货单号
	 * @return
	 */
	public String getTodayMaxReturnNumber();
	
	/**
	 * 添加退货单 以及所有退货单商品
	 * @param returnList 退货单
	 * @param returnListGoodsList 退货单商品
	 */
	public void save(ReturnList returnList, List<ReturnListGoods> returnListGoodsList);
	
	/**
	 * 根据条件查询退货单信息
	 * @param returnList
	 * @param direction
	 * @param properties
	 * @return
	 */
	public List<ReturnList> list(ReturnList returnList, Direction direction, String... properties);
	
	/**
	 * 根据id删除退货单信息 包括退货单里的商品
	 * @param id
	 */
	public void delete(Integer id);
	
	/**
	 * 更新退货单
	 * @param returnList
	 */
	public void update(ReturnList returnList);
}
