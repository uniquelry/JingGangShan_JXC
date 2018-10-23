package com.uniquelry.jgs.repository;

import com.uniquelry.jgs.entity.Log;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

/**
 * @Description  系统日志Repository接口
 * @Author uniquelry
 * @Email 1909506001@qq.com
 * @Date 2018/10/20 0:18
 * @Version V1.0
 */
public interface LogRepository extends JpaRepository<Log, Integer>,JpaSpecificationExecutor<Log>{

	
}
