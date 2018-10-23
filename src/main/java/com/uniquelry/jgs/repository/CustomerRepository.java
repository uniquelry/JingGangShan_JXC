package com.uniquelry.jgs.repository;

import com.uniquelry.jgs.entity.Customer;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

/**
 * @Description  客户Repository接口
 * @Author uniquelry
 * @Email 1909506001@qq.com
 * @Date 2018/10/20 0:17
 * @Version V1.0
 */
public interface CustomerRepository extends JpaRepository<Customer, Integer>,JpaSpecificationExecutor<Customer>{

	/**
	 * 根据名称模糊查询客户信息
	 * @param name
	 * @return
	 */
	@Query(value="select * from t_customer where name like ?1",nativeQuery=true)
	public List<Customer> findByName(String name);
}
