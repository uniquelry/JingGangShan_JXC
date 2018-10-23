package com.uniquelry.jgs.service;

import com.uniquelry.jgs.entity.Supplier;
import org.springframework.data.domain.Sort.Direction;

import java.util.List;

/**
 * @Description  供应商Service接口
 * @Author uniquelry
 * @Email 1909506001@qq.com
 * @Date 2018/10/20 0:32
 * @Version V1.0
 */
public interface SupplierService {

	/**
	 * 根据名称模糊查询供应商信息
	 * @param name
	 * @return
	 */
	public List<Supplier> findByName(String name);
	
	/**
	 * 根据id查询实体
	 * @param id
	 * @return
	 */
	public Supplier findById(Integer id);
	
	/**
	 * 修改或者修改供应商信息
	 * @param supplier
	 */
	public void save(Supplier supplier);
	
	/**
	 * 根据条件分页查询供应商信息
	 * @param supplier
	 * @param page
	 * @param pageSize
	 * @param direction
	 * @param properties
	 * @return
	 */
	public List<Supplier> list(Supplier supplier, Integer page, Integer pageSize, Direction direction, String... properties);
	
	/**
	 * 获取总记录数
	 * @param supplier
	 * @return
	 */
	public Long getCount(Supplier supplier);
	
	/**
	 * 根据id删除供应商
	 * @param id
	 */
	public void delete(Integer id);
}
