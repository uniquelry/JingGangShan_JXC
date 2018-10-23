package com.uniquelry.jgs.service;

import com.uniquelry.jgs.entity.SaleList;
import com.uniquelry.jgs.entity.SaleListGoods;
import org.springframework.data.domain.Sort.Direction;

import java.util.List;

/**
 * @Description  销售单Service接口
 * @Author uniquelry
 * @Email 1909506001@qq.com
 * @Date 2018/10/20 0:31
 * @Version V1.0
 */
public interface SaleListService {

	/**
	 * 根据id查询实体
	 * @param id
	 * @return
	 */
	public SaleList findById(Integer id);
	
	/**
	 * 获取当天最大销售单号
	 * @return
	 */
	public String getTodayMaxSaleNumber();
	
	/**
	 * 添加销售单 以及所有销售单商品 以及 修改商品的成本均价
	 * @param saleList 销售单
	 * @param saleListGoodsList 销售单商品
	 */
	public void save(SaleList saleList, List<SaleListGoods> saleListGoodsList);
	
	/**
	 * 根据条件查询销售单信息
	 * @param saleList
	 * @param direction
	 * @param properties
	 * @return
	 */
	public List<SaleList> list(SaleList saleList, Direction direction, String... properties);
	
	/**
	 * 根据id删除销售单信息 包括销售单里的商品
	 * @param id
	 */
	public void delete(Integer id);
	
	/**
	 * 更新销售单
	 * @param saleList
	 */
	public void update(SaleList saleList);
	
	/**
	 * 按天统计某个日期范围内的销售信息
	 * @param begin
	 * @param end
	 * @return
	 */
	public List<Object> countSaleByDay(String begin, String end);
	
	/**
	 * 按月统计某个日期范围内的销售信息
	 * @param begin
	 * @param end
	 * @return
	 */
	public List<Object> countSaleByMonth(String begin, String end);

}
