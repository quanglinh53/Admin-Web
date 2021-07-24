package com.osp.common;

import java.util.List;

/**
 * Created by tranv on 12/20/2016.
 */
public class QueryFactory {

    /*
     * author vietmanh
     * date 3/14/2017
     * Ham dem so trang
     * */
    public static int countPage(int total) {
        int rowPerpage = Constant.ROW_PER_PAGE;
        int result = 0;
        result = total / rowPerpage;
        int temp = total % rowPerpage;
        if (temp > 0) {
            result = result + 1;
            return result;
        } else return result;
    }

}
