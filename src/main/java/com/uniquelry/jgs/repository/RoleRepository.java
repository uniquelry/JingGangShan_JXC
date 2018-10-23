package com.uniquelry.jgs.repository;

import com.uniquelry.jgs.entity.Role;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

/**
 * @Description  角色Repository接口
 * @Author uniquelry
 * @Email 1909506001@qq.com
 * @Date 2018/10/20 0:21
 * @Version V1.0
 */
public interface RoleRepository extends JpaRepository<Role, Integer>,JpaSpecificationExecutor<Role>{

	/**
	 * 根据用户id查询角色集合
	 * @param id
	 * @return
	 */
	@Query(value="SELECT r.* FROM t_user u,t_role r,t_user_role ur WHERE ur.user_id=u.`id` AND ur.role_id=r.`id` AND u.`id`=?1",nativeQuery=true)
	public List<Role> findByUserId(Integer id);
	

	
}
