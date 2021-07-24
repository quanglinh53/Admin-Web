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

import java.security.MessageDigest;
import java.text.DateFormat;
import java.text.Normalizer;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.regex.Pattern;
import javax.annotation.CheckForNull;
import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.util.StringUtils;

public class StrUtils {

    /**
     * Check where String Null or WhiteSpace
     *
     * @param str
     * @return
     */
    public static boolean isNullOrWhiteSpace(String str) {
        return str == null || str.trim().isEmpty();
    }

    /**
     * Check whether one of strings is Null or WhiteSpace
     *
     * @param strings
     * @return
     */
    public static boolean isNullOrWhiteSpace(String... strings) {
        for (String str : strings) {
            if (isNullOrWhiteSpace(str)) return true;
        }
        return false;
    }

    /**
     * Lop tien ich xu ly ky tu tieng Viet
     *
     * @author quyetdv
     */
    // Mang cac ky tu goc co dau
    private static char[] SOURCE_CHARACTERS = {'À', 'Á', 'Â', 'Ã', 'È', 'É',
            'Ê', 'Ì', 'Í', 'Ò', 'Ó', 'Ô', 'Õ', 'Ù', 'Ú', 'Ý', 'à', 'á', 'â',
            'ã', 'è', 'é', 'ê', 'ì', 'í', 'ò', 'ó', 'ô', 'õ', 'ù', 'ú', 'ý',
            'Ă', 'ă', 'Đ', 'đ', 'Ĩ', 'ĩ', 'Ũ', 'ũ', 'Ơ', 'ơ', 'Ư', 'ư', 'Ạ',
            'ạ', 'Ả', 'ả', 'Ấ', 'ấ', 'Ầ', 'ầ', 'Ẩ', 'ẩ', 'Ẫ', 'ẫ', 'Ậ', 'ậ',
            'Ắ', 'ắ', 'Ằ', 'ằ', 'Ẳ', 'ẳ', 'Ẵ', 'ẵ', 'Ặ', 'ặ', 'Ẹ', 'ẹ', 'Ẻ',
            'ẻ', 'Ẽ', 'ẽ', 'Ế', 'ế', 'Ề', 'ề', 'Ể', 'ể', 'Ễ', 'ễ', 'Ệ', 'ệ',
            'Ỉ', 'ỉ', 'Ị', 'ị', 'Ọ', 'ọ', 'Ỏ', 'ỏ', 'Ố', 'ố', 'Ồ', 'ồ', 'Ổ',
            'ổ', 'Ỗ', 'ỗ', 'Ộ', 'ộ', 'Ớ', 'ớ', 'Ờ', 'ờ', 'Ở', 'ở', 'Ỡ', 'ỡ',
            'Ợ', 'ợ', 'Ụ', 'ụ', 'Ủ', 'ủ', 'Ứ', 'ứ', 'Ừ', 'ừ', 'Ử', 'ử', 'Ữ',
            'ữ', 'Ự', 'ự',};

    // Mang cac ky tu thay the khong dau
    private static char[] DESTINATION_CHARACTERS = {'A', 'A', 'A', 'A', 'E',
            'E', 'E', 'I', 'I', 'O', 'O', 'O', 'O', 'U', 'U', 'Y', 'a', 'a',
            'a', 'a', 'e', 'e', 'e', 'i', 'i', 'o', 'o', 'o', 'o', 'u', 'u',
            'y', 'A', 'a', 'D', 'd', 'I', 'i', 'U', 'u', 'O', 'o', 'U', 'u',
            'A', 'a', 'A', 'a', 'A', 'a', 'A', 'a', 'A', 'a', 'A', 'a', 'A',
            'a', 'A', 'a', 'A', 'a', 'A', 'a', 'A', 'a', 'A', 'a', 'E', 'e',
            'E', 'e', 'E', 'e', 'E', 'e', 'E', 'e', 'E', 'e', 'E', 'e', 'E',
            'e', 'I', 'i', 'I', 'i', 'O', 'o', 'O', 'o', 'O', 'o', 'O', 'o',
            'O', 'o', 'O', 'o', 'O', 'o', 'O', 'o', 'O', 'o', 'O', 'o', 'O',
            'o', 'O', 'o', 'U', 'u', 'U', 'u', 'U', 'u', 'U', 'u', 'U', 'u',
            'U', 'u', 'U', 'u',};

    /**
     * Bo dau 1 ky tu
     *
     * @param ch
     * @return
     */
    public static char removeAccent(char ch) {
        int index = Arrays.binarySearch(SOURCE_CHARACTERS, ch);
        if (index >= 0) {
            ch = DESTINATION_CHARACTERS[index];
        }
        return ch;
    }

//    /**
//     * Bo dau 1 chuoi
//     *
//     * @param s
//     * @return
//     */
//    public static String removeAccent(String s) {
//        StringBuilder sb = new StringBuilder(s);
//        for (int i = 0; i < sb.length(); i++) {
//            sb.setCharAt(i, removeAccent(sb.charAt(i)));
//        }
//        return sb.toStringResult();
//    }

//    public static String removeAccent(String text) {
//        String nfdNormalizedString = Normalizer.normalize(text, Normalizer.Form.NFD);
//        Pattern pattern = Pattern.compile("\\p{InCombiningDiacriticalMarks}+");
//        text = pattern.matcher(nfdNormalizedString).replaceAll("").replaceAll("Đ", "D").replaceAll("đ", "d");
//        return text;
//    }

    public static String removeAccent(String text) {
        String nfdNormalizedString = Normalizer.normalize(text, Normalizer.Form.NFD);
        Pattern pattern = Pattern.compile("\\p{InCombiningDiacriticalMarks}+");
        text = pattern.matcher(nfdNormalizedString).replaceAll("").replaceAll("Đ", "D").replaceAll("đ", "d");
        return text;
    }

    /**
     * Remove vietnamese and toLowerCase
     *
     * @param str
     * @return
     */
    public static String convertToUnsignedLowerCase(String str) {
        if (str == null) return null;
        return removeAccent(str).toLowerCase();
    }

    /**
     * Convert String to MD5 Hash
     *
     * @param md5
     * @return
     */
    public static String toMD5(String md5) {
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] array = md.digest(md5.getBytes());
            StringBuffer sb = new StringBuffer();
            for (int i = 0; i < array.length; ++i) {
                sb.append(Integer.toHexString((array[i] & 0xFF) | 0x100).substring(1, 3));
            }
            return sb.toString();
        } catch (Exception ex) {
            return null;
        }
    }

    /**
     * Tao ra hash default from string "123456"
     *
     * @return
     */
    public static String generateDefaultPassword() {
        return toMD5("123456");
    }


    public static String createUrlFromStringAndTime(String str, long time) {
        String newUrl = "";
        if (str == null) str = "";
        if (str.length() > 50) {
            str = str.substring(0, 50);
        }
        if (str.length() > 0) {
            newUrl = removeSpecialCharactor(str) + "-";
        }
        Date date = new Date(time);
        DateFormat dateFormat = new SimpleDateFormat("yyyyMMddhhmmssSSS");
        return newUrl + dateFormat.format(date) + ".html";
    }

    @CheckForNull
    public static String removeSpecialCharactor(String str) {
        try {
            String valueConvert = convertToUnsignedLowerCase(str);
            if (valueConvert != null) {
                String strValue = valueConvert
                        .replace(" ", "-")
                        .replace("/", "")
                        .replace(";", "")
                        .replace(":", "")
                        .replace("&", "")
                        .replace("*", "")
                        .replace("\\", "")
                        .replace("'", "")
                        .replace("\"", "")
                        .replace("\n", "")
                        .replace(",", "")
                        .replace("%", "")
                        .replace("!", "")
                        .replace("?", "");
                return strValue;
            } else {
                return null;
            }
        } catch (Exception e) {
            return null;
        }
    }


    /**
     * Create url from a string with current time in format yyyyMMddhhmmssfff
     *
     * @param str
     * @return
     */
    public static String createUrlFromString(String str) {
        return createUrlFromStringAndTime(str, DateTimeUtils.getCurrentTimeInMilis());
    }

    public static String validateString(String str) {
        return StringUtils.isEmpty(str) ? "" : str;
    }

    public static String validateString(Long str) {
        return str != null ? str.toString() : "";
    }

    public static Integer parse2Integer(String str) {
        return StringUtils.isEmpty(str) ? null : Integer.valueOf(str);
    }

    public static Long parse2Long(String str) {
        return StringUtils.isEmpty(str) ? null : Long.valueOf(str);
    }

    public static String generateRandomString(int length) {
        return RandomStringUtils.randomAlphabetic(length);
    }
}
