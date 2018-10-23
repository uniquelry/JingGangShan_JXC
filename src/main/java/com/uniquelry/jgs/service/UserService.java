package com.uniquelry.jgs.service;

import com.uniquelry.jgs.entity.User;
import org.springframework.data.domain.Sort.Direction;

import java.util.List;

/**
 * @Description  用户Service接口
 * @Author uniquelry
 * @Email 1909506001@qq.com
 * @Date 2018/10/20 0:33
 * @Version V1.0
 */
public interface UserService {

	/**
	 * 根据用户名查找用户实体
	 * @param userName
	 * @return
	 */
	public User findByUserName(String userName);
	
	/**
	 * 根据id查询用户实体
	 * @param id
	 * @return
	 */
	public User findById(Integer id);
	
	/**
	 * 修改或者修改用户信息
	 * @param user
	 */
	public void save(User user);
	
	/**
	 * 根据条件分页查询用户信息
	 * @param user
	 * @param page
	 * @param pageSize
	 * @param direction
	 * @param properties
	 * @return
	 */
	public List<User> list(User user, Integer page, Integer pageSize, Direction direction, String... properties);
	
	/**
	 * 获取总记录数
	 * @param user
	 * @return
	 */
	public Long getCount(User user);
	
	/**
	 * 根据id删除用户
	 * @param id
	 */
	public void delete(Integer id);
}
