package com.uniquelry.jgs.repository;

import com.uniquelry.jgs.entity.DamageListGoods;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

/**
 * @Description  报损单商品Repository接口
 * @Author uniquelry
 * @Email 1909506001@qq.com
 * @Date 2018/10/20 0:17
 * @Version V1.0
 */
public interface DamageListGoodsRepository extends JpaRepository<DamageListGoods, Integer>,JpaSpecificationExecutor<DamageListGoods>{

	/**
	 * 根据报损单id查询所有报损单商品
	 * @param damageListId
	 * @return
	 */
	@Query(value="select * from t_damage_list_goods where damage_list_id=?1",nativeQuery=true)
	public List<DamageListGoods> listByDamageListId(Integer damageListId);
	
	/**
	 * 删除指定报损单的所有商品
	 * @param damageListId
	 */
	@Query(value="delete from t_damage_list_goods where damage_list_id=?1",nativeQuery=true)
	@Modifying
	public void deleteByDamageListId(Integer damageListId);
}
