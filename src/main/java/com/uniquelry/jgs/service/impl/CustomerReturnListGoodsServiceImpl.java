package com.uniquelry.jgs.service.impl;

import com.uniquelry.jgs.entity.CustomerReturnListGoods;
import com.uniquelry.jgs.repository.CustomerReturnListGoodsRepository;
import com.uniquelry.jgs.service.CustomerReturnListGoodsService;
import com.uniquelry.jgs.util.StringUtils;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import java.util.List;

/**
 * @Description  客户退货单商品Service实现类
 * @Author uniquelry
 * @Email 1909506001@qq.com
 * @Date 2018/10/20 0:22
 * @Version V1.0
 */
@Service("customerReturnListGoodsService")
public class CustomerReturnListGoodsServiceImpl implements CustomerReturnListGoodsService{

	@Resource
	private CustomerReturnListGoodsRepository customerReturnListGoodsRepository;

	@Override
	public List<CustomerReturnListGoods> listByCustomerReturnListId(Integer customerReturnListId) {
		return customerReturnListGoodsRepository.listByCustomerReturnListId(customerReturnListId);
	}

	@Override
	public Integer getTotalByGoodsId(Integer goodsId) {
		return customerReturnListGoodsRepository.getTotalByGoodsId(goodsId)==null?0:customerReturnListGoodsRepository.getTotalByGoodsId(goodsId);
	}

	@Override
	public List<CustomerReturnListGoods> list(CustomerReturnListGoods customerReturnListGoods) {
		return customerReturnListGoodsRepository.findAll(new Specification<CustomerReturnListGoods>() {
					
					@Override
					public Predicate toPredicate(Root<CustomerReturnListGoods> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
						Predicate predicate=cb.conjunction();
						if(customerReturnListGoods!=null){
							if(customerReturnListGoods.getType()!=null && customerReturnListGoods.getType().getId()!=null && customerReturnListGoods.getType().getId()!=1){
								predicate.getExpressions().add(cb.equal(root.get("type").get("id"), customerReturnListGoods.getType().getId()));
							}
							if(StringUtils.isNotEmpty(customerReturnListGoods.getCodeOrName())){
								predicate.getExpressions().add(cb.or(cb.like(root.get("code"),"%"+customerReturnListGoods.getCodeOrName()+"%"), cb.like(root.get("name"),"%"+customerReturnListGoods.getCodeOrName()+"%")));
							}
							if(customerReturnListGoods.getCustomerReturnList()!=null && StringUtils.isNotEmpty(customerReturnListGoods.getCustomerReturnList().getCustomerReturnNumber())){
								predicate.getExpressions().add(cb.like(root.get("customerReturnList").get("customerReturnNumber"), "%"+customerReturnListGoods.getCustomerReturnList().getCustomerReturnNumber()+"%"));
							}
						}
						return predicate;
					}
				});
	}

	

}
