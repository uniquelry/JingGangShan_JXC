package com.uniquelry.jgs.repository;

import com.uniquelry.jgs.entity.DamageList;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;

/**
 * @Description  报损单Repository接口
 * @Author uniquelry
 * @Email 1909506001@qq.com
 * @Date 2018/10/20 0:18
 * @Version V1.0
 */
public interface DamageListRepository extends JpaRepository<DamageList, Integer>,JpaSpecificationExecutor<DamageList>{

	/**
	 * 获取当天最大报损单号
	 * @return
	 */
	@Query(value="SELECT MAX(damage_number) FROM t_damage_list WHERE TO_DAYS(damage_date) = TO_DAYS(NOW())",nativeQuery=true)
	public String getTodayMaxDamageNumber();
}
