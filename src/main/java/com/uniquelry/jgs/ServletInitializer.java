package com.uniquelry.jgs;

import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.support.SpringBootServletInitializer;

/**
 * @Description  TODO
 * @Author uniquelry
 * @Email 1909506001@qq.com
 * @Date 2018/10/18 22:31
 * @Version V1.0
 */
public class ServletInitializer extends SpringBootServletInitializer {

	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
		return application.sources(JingGangShanApplication.class);
	}

}
