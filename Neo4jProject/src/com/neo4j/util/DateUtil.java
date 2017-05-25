package com.neo4j.util;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
public class DateUtil {

	
    public static final int DayModel = 0;
    public static final int MonthModel = 1;

    public static String defaultFormat(Date date) {
        SimpleDateFormat defaultFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return defaultFormat.format(date);
    }
    
    public static String format(Date date){
        SimpleDateFormat yyyyMMdd = new SimpleDateFormat("yyyyMMdd");
        return yyyyMMdd.format(date);
    }

    public static boolean isToday(String date) {
        return today().equals(date);
    }

    public static boolean isThisMonth(String date) {
        SimpleDateFormat yyyyMM = new SimpleDateFormat("yyyyMM");
        return yyyyMM.format(new Date()).equals(date);
    }

    public static String nextMonth(String monthDate){
        try {
            SimpleDateFormat yyyyMM = new SimpleDateFormat("yyyyMM");
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(yyyyMM.parse(monthDate));
            if (Calendar.DECEMBER==calendar.get(Calendar.MONTH)) {
                calendar.set(Calendar.YEAR, calendar.get(Calendar.YEAR)+1);
                calendar.set(Calendar.MONTH, Calendar.JANUARY);
            } else {
                calendar.set(Calendar.MONTH, calendar.get(Calendar.MONTH)+1);
            }
            return yyyyMM.format(calendar.getTime());
        } catch (ParseException e) {
            // ignore
            return monthDate;
        }

    }

    public static String tomorrow(String date) {
        try {
            SimpleDateFormat yyyyMMdd = new SimpleDateFormat("yyyyMMdd");
            Date d = yyyyMMdd.parse(date);
            d.setTime(d.getTime() + 24*60*60*1000);
            return yyyyMMdd.format(d);
        } catch (Exception e) {
            // ignore
        }
        return null;
    }
    public static String yesterday(String date) {
        try {
            SimpleDateFormat yyyyMMdd = new SimpleDateFormat("yyyyMMdd");
            Date d = yyyyMMdd.parse(date);
            d.setTime(d.getTime() - 24*60*60*1000);
            return yyyyMMdd.format(d);
        } catch (Exception e) {
            // ignore
        }
        return null;
    }

    public static String before180Day(String day) {
        try {
            SimpleDateFormat yyyyMMdd = new SimpleDateFormat("yyyyMMdd");
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(yyyyMMdd.parse(day));
            calendar.set(Calendar.DAY_OF_MONTH, calendar.get(Calendar.DAY_OF_MONTH)-181);
            return yyyyMMdd.format(calendar.getTime());
        } catch (ParseException e) {
        }
        return null;

    }

    public static String beforeDay(String day,int offset) {
        try {
            SimpleDateFormat yyyyMMdd = new SimpleDateFormat("yyyyMMdd");
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(yyyyMMdd.parse(day));
            calendar.set(Calendar.DAY_OF_MONTH, calendar.get(Calendar.DAY_OF_MONTH)-offset);
            return yyyyMMdd.format(calendar.getTime());
        } catch (ParseException e) {
        }
        return null;

    }

    public static String today() {
        SimpleDateFormat yyyyMMdd = new SimpleDateFormat("yyyyMMdd");
        return yyyyMMdd.format(new Date());
    }

    public static int intToday() {
        Calendar calendar = Calendar.getInstance();
        calendar.setTimeInMillis(System.currentTimeMillis());
        return calendar.get(Calendar.YEAR)*10000
                +(calendar.get(Calendar.MONTH)+1)*100
                +calendar.get(Calendar.DAY_OF_MONTH);
    }

    public static int intTomonth() {
        Calendar calendar = Calendar.getInstance();
        calendar.setTimeInMillis(System.currentTimeMillis());
        return calendar.get(Calendar.YEAR)*100
                +calendar.get(Calendar.MONTH)+1;
    }

    public static int toDayInt(long timeMillis) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTimeInMillis(timeMillis);
        return calendar.get(Calendar.YEAR)*10000
                +(calendar.get(Calendar.MONTH)+1)*100
                +calendar.get(Calendar.DATE);
    }

    public static String formatTimeDuration(long duration) {
        long sec = (duration / 1000) % 60;
        long min = (duration / 1000 / 60) % 60;
        long hour = (duration / 1000 / 60 / 60) % 24;
        long day = duration / 1000 / 60 / 60 / 24;
        if (day > 0) {
            return day + "天" + hour + "小时" + min + "分钟" + sec + "秒";
        }
        if (hour > 0) {
            return hour + "小时" + min + "分钟" + sec + "秒";
        }
        if (min > 0) {
            return min + "分钟" + sec + "秒";
        }
        return sec + "秒";
    }

    public static class DateCursor {
        private Calendar begin = Calendar.getInstance();
        private Calendar end = Calendar.getInstance();
        private int model;
        public DateCursor(int model,int beginDate,int endDate) {
            this.model=model;
            if (model==DayModel) {
                begin.set(Calendar.YEAR, beginDate/10000);
                begin.set(Calendar.MONTH,(beginDate%10000)/100-1);
                begin.set(Calendar.DAY_OF_MONTH,beginDate%100);
                end.set(Calendar.YEAR, endDate/10000);
                end.set(Calendar.MONTH,(endDate%10000)/100-1);
                end.set(Calendar.DAY_OF_MONTH,endDate%100);
            } else if(model==MonthModel) {
                begin.set(Calendar.DAY_OF_MONTH,1);
                end.set(Calendar.DAY_OF_MONTH,1);
                begin.set(Calendar.YEAR, beginDate/100);
                begin.set(Calendar.MONTH,beginDate%100-1);
                end.set(Calendar.YEAR, endDate/100);
                end.set(Calendar.MONTH,endDate%100-1);
            }
        }

        public Integer nextDate() {
            Integer date = null;
            if (begin.compareTo(end)<=0) {
                date = begin.get(Calendar.YEAR);
                date = date*100+begin.get(Calendar.MONTH)+1;
                if (model==DayModel) {
                    date = date*100+begin.get(Calendar.DAY_OF_MONTH);
                    begin.set(Calendar.DAY_OF_MONTH, begin.get(Calendar.DAY_OF_MONTH)+1);
                } else if(model==MonthModel) {
                    begin.set(Calendar.MONTH, begin.get(Calendar.MONTH)+1);
                }
            }
            return date;
        }
    }

    public static void main(String[] args) {
        String day = "20150801";
        String d = before180Day(day);
        DateCursor cursor = new DateCursor(DayModel, Integer.parseInt(d), Integer.parseInt(day));
        int i =0;
        Integer date = null;
        while ((date=cursor.nextDate())!=null) {
            i++;
            System.out.println(i+":"+date);
        }
    }

}

