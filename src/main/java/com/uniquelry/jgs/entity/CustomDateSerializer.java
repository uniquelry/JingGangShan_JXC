package com.uniquelry.jgs.entity;

import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.databind.JsonSerializer;
import com.fasterxml.jackson.databind.SerializerProvider;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @Description  自定义返回JSON 数据格式中日期格式化处理
 * @Author uniquelry
 * @Email 1909506001@qq.com
 * @Date 2018/10/20 0:03
 * @Version V1.0
 */
public class CustomDateSerializer extends JsonSerializer<Date>{

	@Override
	public void serialize(Date value, JsonGenerator gen, SerializerProvider serializers)
			throws IOException{
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");  
		gen.writeString(sdf.format(value));  
	}

}
