package com.wwz.bookSystem.test;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Test {

	public static void main(String[] args) {
		String str = "https://book.douban.com/tag/[0-9]+/";
		Pattern p = Pattern.compile(str);
		Matcher m = p.matcher("https://book.douban.com/tag/6951256/");
		boolean isValid = m.matches();
		System.out.println(isValid);
		System.out.println(m.group());
		System.out.println(Integer.MAX_VALUE);
	}

}
