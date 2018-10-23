package com.uniquelry.jgs.repository;

import com.uniquelry.jgs.entity.CustomerReturnList;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;

/**
 * @Description  客户退货单Repository接口
 * @Author uniquelry
 * @Email 1909506001@qq.com
 * @Date 2018/10/20 0:17
 * @Version V1.0
 */
public interface CustomerReturnListRepository extends JpaRepository<CustomerReturnList, Integer>,JpaSpecificationExecutor<CustomerReturnList>{

	/**
	 * 获取当天最大客户退货单号
	 * @return
	 */
	@Query(value="SELECT MAX(customer_return_number) FROM t_customer_return_list WHERE TO_DAYS(customer_return_date) = TO_DAYS(NOW())",nativeQuery=true)
	public String getTodayMaxCustomerReturnNumber();
}
