package com.ispan.eeit64.jsonBean.reader;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;

import org.springframework.core.io.ClassPathResource;

public class ReadJson {
	public static String getJsonFileString(String filePath) {
		ClassPathResource cpr = new ClassPathResource(filePath);
		try {
			InputStream is = cpr.getInputStream();
			File source = cpr.getFile();
			
			byte[] buf = new byte[(int)source.length()];
			is.read(buf);						
			is.close();
			return new String(buf);
		} catch (IOException e) {
			System.out.println(e);
			return null;
		}
	}
}
