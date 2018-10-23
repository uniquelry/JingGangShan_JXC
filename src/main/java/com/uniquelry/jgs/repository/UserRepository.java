package com.uniquelry.jgs.repository;

import com.uniquelry.jgs.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;

/**
 * @Description  用户Repository接口
 * @Author uniquelry
 * @Email 1909506001@qq.com
 * @Date 2018/10/20 0:22
 * @Version V1.0
 */
public interface UserRepository extends JpaRepository<User, Integer>,JpaSpecificationExecutor<User>{

	/**
	 * 根据用户名查找用户实体
	 * @param userName
	 * @return
	 */
	@Query(value="select * from t_user where user_name=?1",nativeQuery=true)
	public User findByUserName(String userName);
}
