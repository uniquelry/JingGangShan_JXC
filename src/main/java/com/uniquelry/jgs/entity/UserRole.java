package com.uniquelry.jgs.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * @Description  用户角色关联实体
 * @Author uniquelry
 * @Email 1909506001@qq.com
 * @Date 2018/10/20 0:15
 * @Version V1.0
 */
@Entity
@Table(name="t_userRole")
public class UserRole {

	@Id
	@GeneratedValue
	private Integer id; // 编号
	
	@ManyToOne
	@JoinColumn(name="userId")
	private User user; // 用户
	
	@ManyToOne
	@JoinColumn(name="roleId")
	private Role role; // 角色

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	@Override
	public String toString() {
		return "[id=" + id + ", user=" + user + ", role=" + role + "]";
	}
	
	
	
}
