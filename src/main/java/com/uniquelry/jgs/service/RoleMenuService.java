package com.uniquelry.jgs.service;

import com.uniquelry.jgs.entity.RoleMenu;

/**
 * @Description  角色权限关联Service接口
 * @Author uniquelry
 * @Email 1909506001@qq.com
 * @Date 2018/10/20 0:31
 * @Version V1.0
 */
public interface RoleMenuService {

	/**
	 * 根据角色id删除所有关联信息
	 * @param roleId
	 */
	public void deleteByRoleId(Integer roleId);
	
	/**
	 * 保存
	 * @param roleMenu
	 */
	public void save(RoleMenu roleMenu);
}
