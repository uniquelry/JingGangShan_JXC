package com.uniquelry.jgs.repository;


import com.uniquelry.jgs.entity.Goods;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;

import java.util.List;


/**
 * @Description  商品Repository接口
 * @Author uniquelry
 * @Email 1909506001@qq.com
 * @Date 2018/10/20 0:18
 * @Version V1.0
 */
public interface GoodsRepository extends JpaRepository<Goods, Integer>,JpaSpecificationExecutor<Goods>{

	/**
	 * 获取最大的商品编号
	 * @return
	 */
	@Query(value="select max(code) from t_goods",nativeQuery=true)
	public String getMaxGoodsCode();
	
	/**
	 * 查询库存报警商品 库存小于库存下限的商品
	 * @return
	 */
	@Query(value="SELECT * FROM t_goods WHERE inventory_quantity<min_num",nativeQuery=true)
	public List<Goods> listAlarm();
	
}
