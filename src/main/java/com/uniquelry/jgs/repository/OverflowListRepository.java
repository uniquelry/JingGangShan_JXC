package com.uniquelry.jgs.repository;

import com.uniquelry.jgs.entity.OverflowList;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;

/**
 * @Description  报溢单Repository接口
 * @Author uniquelry
 * @Email 1909506001@qq.com
 * @Date 2018/10/20 0:19
 * @Version V1.0
 */
public interface OverflowListRepository extends JpaRepository<OverflowList, Integer>,JpaSpecificationExecutor<OverflowList>{

	/**
	 * 获取当天最大报溢单号
	 * @return
	 */
	@Query(value="SELECT MAX(overflow_number) FROM t_overflow_list WHERE TO_DAYS(overflow_date) = TO_DAYS(NOW())",nativeQuery=true)
	public String getTodayMaxOverflowNumber();
}
