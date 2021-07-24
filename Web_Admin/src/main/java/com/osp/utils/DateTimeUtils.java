/*
 * *******************************************************************
 * Copyright (c) 2018 Isofh.com to present.
 * All rights reserved.
 *
 * Author: tuanld
 * ******************************************************************
 *
 */

package com.osp.utils;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.Date;

public class DateTimeUtils {

    public static long getCurrentTimeInMilis() {
        return Calendar.getInstance().getTimeInMillis();
    }

    /**
     * Get gio hien tai
     *
     * @return
     */
    public static Date getCurrentDate() {
        return new Date();
    }


    /**
     * Add date
     *
     * @param date
     * @param day
     * @return
     */
    public static Date addDays(Date date, int day) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        calendar.add(Calendar.DAY_OF_YEAR, day);
        return calendar.getTime();
    }

  public static Date addHours(Date date, int hours) {
    Calendar calendar = Calendar.getInstance();
    calendar.setTime(date);
    calendar.add(Calendar.HOUR_OF_DAY, hours);
    return calendar.getTime();
  }

    /**
     * Lay thoi diem bat dau trong ngay 0h0m0s
     *
     * @return
     */
    public static Long getStartDayTime() {
        Calendar calendarStart = Calendar.getInstance();
        calendarStart.set(Calendar.HOUR_OF_DAY, 0);
        calendarStart.set(Calendar.MINUTE, 0);
        calendarStart.set(Calendar.SECOND, 0);
        Long time = calendarStart.getTimeInMillis();
        // remove ticktac
        time = time - time % 1000;
        return time;
    }

    /**
     * convert millis to string
     * @param millis
     * @return
     */
    public static String toString(long millis) {
        Date date=new Date(millis);
        return date.toString();
    }

    /**
     * get current time in string
     * @return
     */
    public static String getCurrentTime() {
        return new SimpleDateFormat("yyyy.MM.dd.HH.mm.ss").format(new Date());
    }
    
    public static String convertLocalDateTimeToString(LocalDateTime dateTime, String patten) {
    	DateTimeFormatter formatter = DateTimeFormatter.ofPattern(patten);
    	String formattedDateTime = dateTime.format(formatter); // "1986-04-08 12:30"
    	return formattedDateTime;
    }
    
    public static String convertLocalDateToString(LocalDate dateTime, String pattern) {
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern(pattern);
		String formattedDateTime = dateTime.format(formatter); // "1986-04-08 12:30"
		return formattedDateTime;
	}
    
    public static LocalDateTime convertStringToLocalDateTime(String timeString) {
    	DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MM/dd/yy");
    	LocalDate  dateTime = LocalDate.parse(timeString, formatter);
    	LocalDateTime ldt = LocalDateTime.of(dateTime, LocalTime.of(0,0));
    	return ldt;
    }
    
    public static LocalDate convertStringToLocalDate(String timeString, String pattern) {
		if(timeString==null) {
			return null;
		}
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern(pattern);
		LocalDate date = LocalDate.parse(timeString, formatter);
		return date;
	}

  public static LocalDateTime convertStringToLocalDateTime2(String timeString, String pattern) {
    DateTimeFormatter formatter = DateTimeFormatter.ofPattern(pattern);
    LocalDate  dateTime = LocalDate.parse(timeString, formatter);
    LocalDateTime ldt = LocalDateTime.of(dateTime, LocalTime.of(0,0));
    return ldt;
  }

  public static String converDate(String start_dt){
    DateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
    SimpleDateFormat newFormat = new SimpleDateFormat("yyyy-MM-dd");
    Date date = null;
    try {
      date = formatter.parse(start_dt);
      return newFormat.format(date);
    } catch (ParseException e) {
      e.printStackTrace();
    }
    return "1970-01-01";
  }
}
