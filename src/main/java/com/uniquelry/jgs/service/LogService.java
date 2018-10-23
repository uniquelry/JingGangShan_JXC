package com.uniquelry.jgs.service;

import com.uniquelry.jgs.entity.Log;
import org.springframework.data.domain.Sort.Direction;

import java.util.List;

/**
 * @Description  系统日志Service接口
 * @Author uniquelry
 * @Email 1909506001@qq.com
 * @Date 2018/10/20 0:28
 * @Version V1.0
 */
public interface LogService {


	
	/**
	 * 修改或者修改日志信息
	 * @param log
	 */
	public void save(Log log);
	
	/**
	 * 根据条件分页查询日志信息
	 * @param log
	 * @param page
	 * @param pageSize
	 * @param direction
	 * @param properties
	 * @return
	 */
	public List<Log> list(Log log, Integer page, Integer pageSize, Direction direction, String... properties);
	
	/**
	 * 获取总记录数
	 * @param user
	 * @return
	 */
	public Long getCount(Log log);

}
