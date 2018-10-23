package com.uniquelry.jgs.service.impl;

import com.uniquelry.jgs.entity.PurchaseListGoods;
import com.uniquelry.jgs.repository.PurchaseListGoodsRepository;
import com.uniquelry.jgs.service.PurchaseListGoodsService;
import com.uniquelry.jgs.utils.StringUtils;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import java.util.List;

/**
 * @Description  进货单商品Service实现类
 * @Author uniquelry
 * @Email 1909506001@qq.com
 * @Date 2018/10/20 0:25
 * @Version V1.0
 */
@Service("purchaseListGoodsService")
public class PurchaseListGoodsServiceImpl implements PurchaseListGoodsService{

	@Resource
	private PurchaseListGoodsRepository purchaseListGoodsRepository;

	@Override
	public List<PurchaseListGoods> listByPurchaseListId(Integer purchaseListId) {
		return purchaseListGoodsRepository.listByPurchaseListId(purchaseListId);
	}

	@Override
	public List<PurchaseListGoods> list(PurchaseListGoods purchaseListGoods) {
		return purchaseListGoodsRepository.findAll(new Specification<PurchaseListGoods>() {
			
			@Override
			public Predicate toPredicate(Root<PurchaseListGoods> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
				Predicate predicate=cb.conjunction();
				if(purchaseListGoods!=null){
					if(purchaseListGoods.getType()!=null && purchaseListGoods.getType().getId()!=null && purchaseListGoods.getType().getId()!=1){
						predicate.getExpressions().add(cb.equal(root.get("type").get("id"), purchaseListGoods.getType().getId()));
					}
					if(StringUtils.isNotEmpty(purchaseListGoods.getCodeOrName())){
						predicate.getExpressions().add(cb.or(cb.like(root.get("code"),"%"+purchaseListGoods.getCodeOrName()+"%"), cb.like(root.get("name"),"%"+purchaseListGoods.getCodeOrName()+"%")));
					}
					if(purchaseListGoods.getPurchaseList()!=null && StringUtils.isNotEmpty(purchaseListGoods.getPurchaseList().getPurchaseNumber())){
						predicate.getExpressions().add(cb.like(root.get("purchaseList").get("purchaseNumber"), "%"+purchaseListGoods.getPurchaseList().getPurchaseNumber()+"%"));
					}
				}
				return predicate;
			}
		});
	}

	

}
