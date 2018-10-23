package com.uniquelry.jgs.service;

import com.uniquelry.jgs.entity.PurchaseList;
import com.uniquelry.jgs.entity.PurchaseListGoods;
import org.springframework.data.domain.Sort.Direction;

import java.util.List;

/**
 * @Description  进货单Service接口
 * @Author uniquelry
 * @Email 1909506001@qq.com
 * @Date 2018/10/20 0:30
 * @Version V1.0
 */
public interface PurchaseListService {

	/**
	 * 根据id查询实体
	 * @param id
	 * @return
	 */
	public PurchaseList findById(Integer id);
	
	/**
	 * 获取当天最大进货单号
	 * @return
	 */
	public String getTodayMaxPurchaseNumber();
	
	/**
	 * 添加进货单 以及所有进货单商品 以及 修改商品的成本均价
	 * @param purchaseList 进货单
	 * @param purchaseListGoodsList 进货单商品
	 */
	public void save(PurchaseList purchaseList, List<PurchaseListGoods> purchaseListGoodsList);
	
	/**
	 * 根据条件查询进货单信息
	 * @param purchaseList
	 * @param direction
	 * @param properties
	 * @return
	 */
	public List<PurchaseList> list(PurchaseList purchaseList, Direction direction, String... properties);
	
	/**
	 * 根据id删除进货单信息 包括进货单里的商品
	 * @param id
	 */
	public void delete(Integer id);
	
	/**
	 * 更新进货单
	 * @param purchaseList
	 */
	public void update(PurchaseList purchaseList);

}
