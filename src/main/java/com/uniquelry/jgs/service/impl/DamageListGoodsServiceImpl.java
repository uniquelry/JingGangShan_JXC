package com.uniquelry.jgs.service.impl;

import com.uniquelry.jgs.entity.DamageListGoods;
import com.uniquelry.jgs.repository.DamageListGoodsRepository;
import com.uniquelry.jgs.service.DamageListGoodsService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @Description  报损单商品Service实现类
 * @Author uniquelry
 * @Email 1909506001@qq.com
 * @Date 2018/10/20 0:23
 * @Version V1.0
 */
@Service("damageListGoodsService")
public class DamageListGoodsServiceImpl implements DamageListGoodsService{

	@Resource
	private DamageListGoodsRepository damageListGoodsRepository;

	@Override
	public List<DamageListGoods> listByDamageListId(Integer damageListId) {
		return damageListGoodsRepository.listByDamageListId(damageListId);
	}

	

}
