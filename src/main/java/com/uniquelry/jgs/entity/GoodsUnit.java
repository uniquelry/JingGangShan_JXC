package com.uniquelry.jgs.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * @Description  商品单位实体
 * @Author uniquelry
 * @Email 1909506001@qq.com
 * @Date 2018/10/20 0:05
 * @Version V1.0
 */
@Entity
@Table(name="t_goodsunit")
public class GoodsUnit {
	
	@Id
	@GeneratedValue
	private Integer id; // 编号
	
	@Column(length=10)
	private String name; // 商品单位名称

	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "[id=" + id + ", name=" + name + "]";
	}
	
	
}
