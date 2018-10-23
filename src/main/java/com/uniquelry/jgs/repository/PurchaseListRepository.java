package com.uniquelry.jgs.repository;

import com.uniquelry.jgs.entity.PurchaseList;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;

/**
 * @Description  进货单Repository接口
 * @Author uniquelry
 * @Email 1909506001@qq.com
 * @Date 2018/10/20 0:20
 * @Version V1.0
 */
public interface PurchaseListRepository extends JpaRepository<PurchaseList, Integer>,JpaSpecificationExecutor<PurchaseList>{

	/**
	 * 获取当天最大进货单号
	 * @return
	 */
	@Query(value="SELECT MAX(purchase_number) FROM t_purchase_list WHERE TO_DAYS(purchase_date) = TO_DAYS(NOW())",nativeQuery=true)
	public String getTodayMaxPurchaseNumber();
}
