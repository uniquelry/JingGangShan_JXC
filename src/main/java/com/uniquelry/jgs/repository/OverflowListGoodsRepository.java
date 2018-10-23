package com.uniquelry.jgs.repository;

import com.uniquelry.jgs.entity.OverflowListGoods;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

/**
 * @Description  报溢单商品Repository接口
 * @Author uniquelry
 * @Email 1909506001@qq.com
 * @Date 2018/10/20 0:19
 * @Version V1.0
 */
public interface OverflowListGoodsRepository extends JpaRepository<OverflowListGoods, Integer>,JpaSpecificationExecutor<OverflowListGoods>{

	/**
	 * 根据报溢单id查询所有报溢单商品
	 * @param overflowListId
	 * @return
	 */
	@Query(value="select * from t_overflow_list_goods where overflow_list_id=?1",nativeQuery=true)
	public List<OverflowListGoods> listByOverflowListId(Integer overflowListId);
	
	/**
	 * 删除指定报溢单的所有商品
	 * @param overflowListId
	 */
	@Query(value="delete from t_overflow_list_goods where overflow_list_id=?1",nativeQuery=true)
	@Modifying
	public void deleteByOverflowListId(Integer overflowListId);
}
