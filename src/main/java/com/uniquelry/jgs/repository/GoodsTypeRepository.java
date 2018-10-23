package com.uniquelry.jgs.repository;

import com.uniquelry.jgs.entity.GoodsType;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

/**
 * @Description  商品类别Repository接口
 * @Author uniquelry
 * @Email 1909506001@qq.com
 * @Date 2018/10/20 0:18
 * @Version V1.0
 */
public interface GoodsTypeRepository extends JpaRepository<GoodsType, Integer>,JpaSpecificationExecutor<GoodsType>{

	/**
	 * 根据父节点查找商品类别
	 * @param parentId
	 * @return
	 */
	@Query(value="select * from t_goodstype where p_id=?1",nativeQuery=true)
	public List<GoodsType> findByParentId(int parentId);
}
