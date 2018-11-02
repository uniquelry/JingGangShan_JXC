package com.uniquelry.jgs.service.impl;

import com.uniquelry.jgs.entity.Role;
import com.uniquelry.jgs.repository.RoleRepository;
import com.uniquelry.jgs.service.RoleService;
import com.uniquelry.jgs.util.StringUtils;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import java.util.List;

/**
 * @Description  角色Service实现类
 * @Author uniquelry
 * @Email 1909506001@qq.com
 * @Date 2018/10/20 0:26
 * @Version V1.0
 */
@Service("roleService")
public class RoleServiceImpl implements RoleService{

	@Resource
	private RoleRepository roleRepository;
	
	@Override
	public List<Role> findByUserId(Integer id) {
		return roleRepository.findByUserId(id);
	}

	@Override
	public Role findById(Integer id) {
		return roleRepository.findOne(id);
	}

	@Override
	public List<Role> listAll() {
		return roleRepository.findAll();
	}

	@Override
	public List<Role> list(Role role, Integer page, Integer pageSize, Direction direction, String... properties) {
		Pageable pageable=new PageRequest(page-1, pageSize, direction,properties);
		Page<Role> pageUser=roleRepository.findAll(new Specification<Role>() {
			
			@Override
			public Predicate toPredicate(Root<Role> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
				Predicate predicate=cb.conjunction();
				if(role!=null){
					if(StringUtils.isNotEmpty(role.getName())){
						predicate.getExpressions().add(cb.like(root.get("name"), "%"+role.getName().trim()+"%"));
					}	
					predicate.getExpressions().add(cb.notEqual(root.get("id"), 1)); // 管理员角色除外
				}
				return predicate;
			}
		}, pageable);
		return pageUser.getContent();
	}

	@Override
	public Long getCount(Role role) {
		Long count=roleRepository.count(new Specification<Role>() {

			@Override
			public Predicate toPredicate(Root<Role> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
				Predicate predicate=cb.conjunction();
				if(role!=null){
					if(StringUtils.isNotEmpty(role.getName())){
						predicate.getExpressions().add(cb.like(root.get("name"), "%"+role.getName().trim()+"%"));
					}	
					predicate.getExpressions().add(cb.notEqual(root.get("id"), 1)); // 管理员角色除外
				}
				return predicate;
			}
		});
		return count;
	}

	@Override
	public void save(Role role) {
		roleRepository.save(role);
	}

	@Override
	public void delete(Integer id) {
		roleRepository.delete(id);
	}

}
