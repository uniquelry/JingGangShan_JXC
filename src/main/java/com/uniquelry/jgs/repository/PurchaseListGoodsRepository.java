package com.uniquelry.jgs.repository;

import com.uniquelry.jgs.entity.PurchaseListGoods;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

/**
 * @Description  进货单商品Repository接口
 * @Author uniquelry
 * @Email 1909506001@qq.com
 * @Date 2018/10/20 0:20
 * @Version V1.0
 */
public interface PurchaseListGoodsRepository extends JpaRepository<PurchaseListGoods, Integer>,JpaSpecificationExecutor<PurchaseListGoods>{

	/**
	 * 根据进货单id查询所有进货单商品
	 * @param purchaseListId
	 * @return
	 */
	@Query(value="select * from t_purchase_list_goods where purchase_list_id=?1",nativeQuery=true)
	public List<PurchaseListGoods> listByPurchaseListId(Integer purchaseListId);
	
	/**
	 * 删除指定进货单的所有商品
	 * @param purchaseListId
	 */
	@Query(value="delete from t_purchase_list_goods where purchase_list_id=?1",nativeQuery=true)
	@Modifying
	public void deleteByPurchaseListId(Integer purchaseListId);
}
