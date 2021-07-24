package com.osp.common;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;

import java.util.Collection;

public class ConstantAuthor {

    public class User{ //nguoi dung admin
    	public static final String view="ROLE_SYSTEM_USER_VIEW";
    	public static final String add="ROLE_SYSTEM_USER_ADD";
    	public static final String edit="ROLE_SYSTEM_USER_EDIT";
    	public static final String author="ROLE_SYSTEM_USER_AUTHORITY";
    	public static final String delete="ROLE_SYSTEM_USER_DELETE";
    }
    public class Group{ // nhom quyen
    	public static final String view="ROLE_SYSTEM_GROUP_VIEW";
    	public static final String add="ROLE_SYSTEM_GROUP_ADD";
    	public static final String edit="ROLE_SYSTEM_GROUP_EDIT";
    	public static final String delete="ROLE_SYSTEM_GROUP_DELETE";
    }
    public class Log{//log
    	public static final String view="ROLE_SYSTEM_LOG_VIEW";
	}

	public class ConfigPackage{//goi cuoc
    	public static final String view="ROLE_MANAGER_CONFIG_PACKAGE_VIEW";
    	public static final String add="ROLE_MANAGER_CONFIG_PACKAGE_ADD";
    	public static final String edit="ROLE_MANAGER_CONFIG_PACKAGE_EDIT";
    	public static final String delete="ROLE_MANAGER_CONFIG_PACKAGE_DELETE";
	}
	public class Customer{//nguoi ban
    	public static final String block="ROLE_CUSTOMER_BLOCK";
    	public static final String view="ROLE_CUSTOMER_VIEW";
	}

	public class Transpay{//Lich su goi cuoc nguoi ban
		public static final String view="ROLE_MANAGER_TRANSPAY_VIEW";
	}
	public class MsisdnHistory{//Lich su dang so
		public static final String view="ROLE_MANAGER_HISTORY_CUSTOMER_MSISDN_VIEW";
	}
	public class MOMT{//lich su MO/MT
		public static final String view="ROLE_MANAGER_HISTORY_MO_MT_VIEW";
		public static final String resend_mt="ROLE_MANAGER_HISTORY_MO_MT_RESEND_MT";

	}

	public class Report{
    	public static final String general_sale_sms="ROLE_REPORT_GENERAL_SALE_SMS";
    	public static final String detail_sale_sms="ROLE_REPORT_DETAIL_SALE_SMS";
    	public static final String general_trade="ROLE_REPORT_GENERAL_TRADE";
    	public static final String detail_trade="ROLE_REPORT_DETAIL_TRADE";
    	public static final String add_and_delete_msisdn="ROLE_REPORT_ADD_AND_DELETE_MSISDN";
    }

    public class GroupPrice{
		public static final String view="ROLE_CATEGORY_GROUP_PRICE_VIEW";
		public static final String add="ROLE_CATEGORY_GROUP_PRICE_ADD";
		public static final String edit="ROLE_CATEGORY_GROUP_PRICE_EDIT";
		public static final String delete="ROLE_CATEGORY_GROUP_PRICE_DELETE";
	}
	public class GroupYear{
		public static final String view="ROLE_CATEGORY_GROUP_YEAR_VIEW";
		public static final String add="ROLE_CATEGORY_GROUP_YEAR_ADD";
		public static final String edit="ROLE_CATEGORY_GROUP_YEAR_EDIT";
		public static final String delete="ROLE_CATEGORY_GROUP_YEAR_DELETE";
	}
	public class GroupMsisdn{
		public static final String view="ROLE_CATEGORY_GROUP_MSISDN_VIEW";
		public static final String edit="ROLE_CATEGORY_GROUP_MSISDN_EDIT";
	}

	//Nhóm chủ đề
	public class GroupTopic{
		public static final String view="ROLE_CONTENT_GROUP_TOPIC_VIEW";
		public static final String add="ROLE_CONTENT_GROUP_TOPIC_ADD";
		public static final String edit="ROLE_CONTENT_GROUP_TOPIC_EDIT";
		public static final String delete="ROLE_CONTENT_GROUP_TOPIC_DELETE";
	}

	//Chuyên mục
	public class Category{
    	public static final String view="ROLE_CONTENT_CATEGORY_VIEW";
    	public static final String add="ROLE_CONTENT_CATEGORY_ADD";
    	public static final String edit="ROLE_CONTENT_CATEGORY_EDIT";
    	public static final String delete="ROLE_CONTENT_CATEGORY_DELETE";
	}

	//Tin tức
	public class Article{
    	public static final String view="ROLE_CONTENT_ARTICLE_VIEW";
    	public static final String add="ROLE_CONTENT_ARTICLE_ADD";
    	public static final String edit="ROLE_CONTENT_ARTICLE_EDIT";
    	public static final String delete="ROLE_CONTENT_ARTICLE_DELETE";
		public static final String browse="ROLE_CONTENT_ARTICLE_BROWSE";
	}

	//DAICQ
	public class Prevent{
		public static final String view="ROLE_PREVENT_VIEW";
		public static final String add="ROLE_PREVENT_ADD";
		public static final String edit="ROLE_PREVENT_EDIT";
		public static final String delete="ROLE_PREVENT_DELETE";

	}

	public class NotaryOffice{
		public static final String view="ROLE_NOTARY_OFFICE_VIEW";
		public static final String add="ROLE_NOTARY_OFFICE_ADD";
		public static final String edit="ROLE_NOTARY_OFFICE_EDIT";
		public static final String delete="ROLE_NOTARY_OFFICE_DELETE";

	}

	public class Notary{
		public static final String view="ROLE_NOTARY_VIEW";
		public static final String add="ROLE_NOTARY_ADD";
		public static final String edit="ROLE_NOTARY_EDIT";
		public static final String delete="ROLE_NOTARY_DELETE";

	}

	public class Province{
		public static final String view="ROLE_PROVINCE_VIEW";
		public static final String add="ROLE_PROVINCE_ADD";
		public static final String edit="ROLE_PROVINCE_EDIT";
		public static final String delete="ROLE_PROVINCE_DELETE";

	}

	public class Partners{
		public static final String view="ROLE_PARTNERS_VIEW";
		public static final String add="ROLE_PARTNERS_ADD";
		public static final String edit="ROLE_PARTNERS_EDIT";
		public static final String delete="ROLE_PARTNERS_DELETE";

	}

	/*public class District{
		public static final String view="ROLE_DISTRICT_VIEW";
		public static final String add="ROLE_DISTRICT_ADD";
		public static final String edit="ROLE_DISTRICT_EDIT";
		public static final String delete="ROLE_DISTRICT_DELETE";

	}*/

	public class NotarizedRequest{
		public static final String view="ROLE_NOTARIZED_REQUEST_VIEW";
		public static final String add="ROLE_NOTARIZED_REQUEST_ADD";
		public static final String edit="ROLE_NOTARIZED_REQUEST_EDIT";
		public static final String delete="ROLE_NOTARIZED_REQUEST_DELETE";

	}



    public static boolean contain(String right){
    	Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		Collection<? extends GrantedAuthority> checkRight =  auth.getAuthorities();
		boolean authorized = checkRight.contains(new SimpleGrantedAuthority(right));
		if(!authorized){
			return false;
		}
    	return true;
    }
}
