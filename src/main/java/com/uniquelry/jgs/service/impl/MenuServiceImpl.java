package com.uniquelry.jgs.service.impl;

import com.uniquelry.jgs.entity.Menu;
import com.uniquelry.jgs.repository.MenuRepository;
import com.uniquelry.jgs.service.MenuService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @Description  权限菜单Service实现类
 * @Author uniquelry
 * @Email 1909506001@qq.com
 * @Date 2018/10/20 0:24
 * @Version V1.0
 */
@Service("menuService")
public class MenuServiceImpl implements MenuService{

	@Resource
	private MenuRepository menuRepository;
	
	@Override
	public List<Menu> findByRoleId(int roleId) {
		return menuRepository.findByRoleId(roleId);
	}

	@Override
	public List<Menu> findByParentIdAndRoleId(int parentId, int roleId) {
		return menuRepository.findByParentIdAndRoleId(parentId, roleId);
	}

	@Override
	public List<Menu> findByParentId(int parentId) {
		return menuRepository.findByParentId(parentId);
	}

	@Override
	public Menu findById(Integer id) {
		return menuRepository.findOne(id);
	}

}
