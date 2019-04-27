package com.uniquelry.jgs.service.impl;

import com.uniquelry.jgs.entity.Goods;
import com.uniquelry.jgs.entity.SaleList;
import com.uniquelry.jgs.entity.SaleListGoods;
import com.uniquelry.jgs.repository.GoodsRepository;
import com.uniquelry.jgs.repository.GoodsTypeRepository;
import com.uniquelry.jgs.repository.SaleListGoodsRepository;
import com.uniquelry.jgs.repository.SaleListRepository;
import com.uniquelry.jgs.service.SaleListService;
import com.uniquelry.jgs.util.StringUtils;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import javax.transaction.Transactional;
import java.util.List;

/**
 * @Description  销售单Service实现类
 * @Author uniquelry
 * @Email 1909506001@qq.com
 * @Date 2018/10/20 0:26
 * @Version V1.0
 */
@Service("saleListService")
@Transactional
public class SaleListServiceImpl implements SaleListService{

	@Resource
	private SaleListRepository saleListRepository;
	@Resource
	private SaleListGoodsRepository saleListGoodsRepository;
	@Resource
	private GoodsRepository goodsRepository;
	@Resource
	private GoodsTypeRepository goodsTypeRepository;
	@Override
	public String getTodayMaxSaleNumber() {
		return saleListRepository.getTodayMaxSaleNumber();
	}

	@Transactional
	public void save(SaleList saleList, List<SaleListGoods> saleListGoodsList) {
		// 保存每个销售单商品
		for(SaleListGoods saleListGoods:saleListGoodsList){
			saleListGoods.setType(goodsTypeRepository.findOne(saleListGoods.getTypeId())); // 设置类别
			saleListGoods.setSaleList(saleList); // 设置采购单
			saleListGoodsRepository.save(saleListGoods);
			// 修改商品库存
			Goods goods=goodsRepository.findOne(saleListGoods.getGoodsId());
			goods.setInventoryQuantity(goods.getInventoryQuantity()-saleListGoods.getNum());
			goods.setState(2);
			goodsRepository.save(goods);
		}
		saleListRepository.save(saleList); // 保存销售单
	}

	@Override
	public List<SaleList> list(SaleList saleList, Direction direction,
			String... properties) {
		return saleListRepository.findAll(new Specification<SaleList>(){

			@Override
			public Predicate toPredicate(Root<SaleList> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
				Predicate predicate=cb.conjunction();
				if(saleList!=null){
					if(saleList.getCustomer()!=null && saleList.getCustomer().getId()!=null){
						predicate.getExpressions().add(cb.equal(root.get("customer").get("id"), saleList.getCustomer().getId()));
					}
					if(StringUtils.isNotEmpty(saleList.getSaleNumber())){
						predicate.getExpressions().add(cb.like(root.get("saleNumber"), "%"+saleList.getSaleNumber().trim()+"%"));
					}
					if(saleList.getState()!=null){
						predicate.getExpressions().add(cb.equal(root.get("state"), saleList.getState()));
					}
					if(saleList.getbSaleDate()!=null){
						predicate.getExpressions().add(cb.greaterThanOrEqualTo(root.get("saleDate"), saleList.getbSaleDate()));
					}
					if(saleList.geteSaleDate()!=null){
						predicate.getExpressions().add(cb.lessThanOrEqualTo(root.get("saleDate"), saleList.geteSaleDate()));
					}
				}
				return predicate;
			}
		  },new Sort(direction, properties));
	}

	@Override
	public void delete(Integer id) {
		saleListGoodsRepository.deleteBySaleListId(id);
		saleListRepository.delete(id);
	}

	@Override
	public SaleList findById(Integer id) {
		return saleListRepository.findOne(id);
	}

	@Override
	public void update(SaleList saleList) {
		saleListRepository.save(saleList);
	}

	@Override
	public List<Object> countSaleByDay(String begin, String end) {
		return saleListRepository.countSaleByDay(begin, end);
	}

	@Override
	public List<Object> countSaleByMonth(String begin, String end) {
		return saleListRepository.countSaleByMonth(begin, end);
	}

}
