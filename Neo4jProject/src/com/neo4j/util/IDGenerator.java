package com.neo4j.util;


import java.text.SimpleDateFormat;
import java.util.Date;

public class IDGenerator {
	private static Integer num = 0;
	public static final String PERSON = "P";
	public static final String MOMENT = "M";
	public static final String FOLLOWRELATION = "FR";
	public static final String MOMENTRELATION = "MR";
	public static String genKey(String type) {
		Date nowTime = new Date(); 
		SimpleDateFormat time = new SimpleDateFormat("yyyyMMddHHmmss");
		synchronized(num) {
			num ++;
			if(num == 1000000) num = 0;			
		}
		return type + time.format(nowTime) + num;
	}
	public static void main(String[] args) {
		for(int i = 0; i < 1; ++i) {
			System.out.println(genKey(PERSON));
		}
	}
}