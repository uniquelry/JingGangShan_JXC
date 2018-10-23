package com.uniquelry.jgs.repository;

import com.uniquelry.jgs.entity.Supplier;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

/**
 * @Description  供应商Repository接口
 * @Author uniquelry
 * @Email 1909506001@qq.com
 * @Date 2018/10/20 0:21
 * @Version V1.0
 */
public interface SupplierRepository extends JpaRepository<Supplier, Integer>,JpaSpecificationExecutor<Supplier>{

	/**
	 * 根据名称模糊查询供应商信息
	 * @param name
	 * @return
	 */
	@Query(value="select * from t_supplier where name like ?1",nativeQuery=true)
	public List<Supplier> findByName(String name);
	
}
