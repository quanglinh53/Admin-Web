/*
 * *******************************************************************
 * Copyright (c) 2018 Isofh.com to present.
 * All rights reserved.
 *
 * Author: tuanld
 * ******************************************************************
 *
 */

package com.osp.common;

import java.time.format.DateTimeFormatter;

public class AppConst {
    public static final Integer SERVICE_VERSION = 1;
    public static final String MIN_PRICE = "MinPrice";
    public static final String TRANSPORT_FEE = "TransportFee";
    public static final String SUPPORT_PHONE = "SupportPhone";

    /**
     * 1 hour to milisecond
     */
    public static final Integer ONE_HOUR = 60 * 60 * 1000;

    /**
     * 1 day to milisecond
     */
    public static final Integer ONE_DAY = 24 * ONE_HOUR;

    public static final String ADMIN_UID = "002519151495736800427-61377a91b3744dafae2b73d6163f471c";

    public static final String EMAIL = "@nmcevent.com";

    public static final String LOCALE_DATE_TIME_FORMAT = "yyyy-MM-dd HH:mm:ss";
    public static final String LOCALE_DATE_FORMAT_1 = "yyyy-MM-dd";
    public static final String DATE_FORMAT_2 = "dd-MM-yyyy";
    public static final String DATE_FORMAT_EXPORT = "dd/MM/yyyy";
    
    public static final String CHARAC_SHADOW = "_";
    
    public static final String CHARAC_SHADOW_2 = "~";
    
    public static final String DEFAULT_VALUE = "DEFAULT";

    public static final DateTimeFormatter DATE_FORMATTER = DateTimeFormatter.ofPattern(AppConst.LOCALE_DATE_TIME_FORMAT);
    public static final DateTimeFormatter DATE_TIME_FORMATTER = DateTimeFormatter.ofPattern(AppConst.LOCALE_DATE_FORMAT_1);
}
