/**
 *
 */
package com.osp.common;

import java.math.BigInteger;
import java.net.InetAddress;
import java.net.NetworkInterface;
import java.net.SocketException;
import java.net.UnknownHostException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;
import java.util.Vector;

/**
 * @author SONY
 *
 */
public class Constant {

    public static SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");

    public static final String ENTER = "\n";
    public static final String SPACE = " ";
    public static final String MASK = "\"";
    public static final String PLUS = "\\+";
    public static final String MINUS = "\\-";

    public static final Integer ROW_PER_PAGE= 25;
    public static class CUSTOMER{
        public static final Long ACTIVE=1L;

        public static final Long DISABLE=0L;
        public static final Long SEND_ACCOUNT=0L;
        public  static final Long NOT_SEND=1L;

    }

    //config trạng thái của chủ đề tin tức
    public static final int STATUS_CATEGORY_ON = 1;
    public static final int STATUS_CATEGORY_OFF = 0;

    //config trạng thái của tin tức
    public static final int STATUS_ARTICLE_ON = 1;
    public static final int STATUS_ARTICLE_OFF = 0;

    //config trạng thái bài viết
    public static class TRANG_THAI_BAI_VIET{
        public static final int CONG_KHAI = 0;
        public static final int NHAP = 1;
        public static final int XOA = 2;
    }

    public static class CONFIG_VALUE{
        public static final Long ID_GROUP_TOPIC_NOTIFICES = 1l;
        public static final Integer IS_NOTIFICE = 1;
        public static final Integer IS_NOT_NOTIFICE = 0;
    }
    public static class Status{
        public static final Integer MOI_TAO=0;
        public static final Integer DA_GUI=1;
        public static final Integer DA_DUYET=2;
        public static final Integer TU_CHOI=3;
    }

    public static class ACCOUNT_STATUS{
        public static final Integer HOAT_DONG=0;
        public static final Integer KHOA=1;
    }
}
