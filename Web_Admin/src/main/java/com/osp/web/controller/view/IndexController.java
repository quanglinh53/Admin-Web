package com.osp.web.controller.view;

import com.osp.common.*;
import com.osp.model.*;

import com.osp.model.view.CategoryView;
import com.osp.web.dao.content.ArticleDao;
import com.osp.web.dao.content.Category2Dao;
//import com.osp.web.dao.customer.CustomerDAO;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;


@Controller
@RequestMapping("/")
public class IndexController {
    private Logger logger = LogManager.getLogger(IndexController.class);

    @Autowired
    Category2Dao categoryDao;
    @Autowired
    ArticleDao articleDao;
    @GetMapping("/")
    public String index(Model model, HttpServletRequest request) {
        getHeader(model);
        PagingResult page=new PagingResult();
        page.setPageNumber(1);
        page=articleDao.publicHome(page,"",Constant.Status.DA_DUYET,null).orElse(null);

        model.addAttribute("page",page);
        model.addAttribute("title","Trang chủ");
        return "public_index";
    }
    @GetMapping("/chuyen-muc/{url}.html")
    public String public_by_category(Model model, HttpServletRequest request,@PathVariable("url") String url,@RequestParam(value = "p", required = false, defaultValue = "1") int pageNumber) {
        getHeader(model);
        PagingResult page=new PagingResult();
        page.setPageNumber(pageNumber);
        Category2 cate=new Category2();
        if(url!=null && !url.equals("")){
        cate=categoryDao.ltsByUrl(url);
        }else {
            return "redirect:/";
        }
        page=articleDao.publicHome(page,"",Constant.Status.DA_DUYET,cate).orElse(null);
        model.addAttribute("page",page);
        String title="";
        if(cate.getParentId()!=0){
            title=categoryDao.get(cate.getParentId()).getName() + "/";
        }
            title=title+cate.getName();
        model.addAttribute("title",title);
        model.addAttribute("url",cate.getUrl());

        return "public_index";
    }
    @GetMapping("/detail/{url}.html")
    public String detail(Model model, HttpServletRequest request,@PathVariable("url") String url) {

        Category2 cate=new Category2();
        Article article=articleDao.getByUrl(url);
        cate=categoryDao.get(article.getCategoryId());
        String title="";
        if(cate.getParentId()!=0){
            title=categoryDao.get(cate.getParentId()).getName() + "/";
        }
        getHeader(model);
        title=title+cate.getName();
        article.setView(article.getView()+1);
        articleDao.edit(article);
        List<Article> ltsLienQuan=new ArrayList<>();

            ltsLienQuan=articleDao.lienquan(cate.getId());

        model.addAttribute("size",ltsLienQuan.size());
        model.addAttribute("ltsLienQuan",ltsLienQuan);
        model.addAttribute("title",title);
        model.addAttribute("item",article);
        return "public_index_detail";
    }
    public  void getHeader(Model model){
        List<Category2> lts = categoryDao.listByRoot();
        List<Category2> lts2=categoryDao.ltsByOn();
        List<CategoryView> ltsView=new ArrayList<>();
        for(Category2 category: lts){
             CategoryView categoryView=new CategoryView();
             List<Category2> categoryList=new ArrayList<>();
             categoryList=categoryDao.ltsByIdRoot(category.getId(),Constant.STATUS_CATEGORY_ON);
             categoryView.setCategory(category);
             categoryView.setLts(categoryList);
             ltsView.add(categoryView);
        }
        List<Article> ltsTop=new ArrayList<>();
        ltsTop=articleDao.top();

        model.addAttribute("ltsTop",ltsTop);
        model.addAttribute("ltsCategory",ltsView);
        model.addAttribute("danhmuc",lts2);
    }

//    @GetMapping("thongtintaikhoan.html")
//    public String thongtintaikhoan(Model model, HttpServletRequest request, HttpSession session, @RequestParam(value = "p", required = false, defaultValue = "1") int pageNumber, @RequestParam(value = "p2", required = false, defaultValue = "1") int pageNumber2, @RequestParam(value = "p3", required = false, defaultValue = "1") int pageNumber3) {
//        Customer customer = null;
//        customer = (Customer) session.getAttribute("customer");
//        List<PagingResult> lts = new ArrayList<>();
//        if (customer == null) {
//            return "public_index";
//        } else {
//            model.addAttribute("customer", customer);
//            return "public_profile";
//        }
//    }
//
//    @GetMapping("chinh-sua-thong-tin-tai-khoan.html")
//    public String editProfile(Model model, HttpServletRequest request, HttpSession session, @RequestParam(value = "p", required = false, defaultValue = "1") int pageNumber, @RequestParam(value = "p2", required = false, defaultValue = "1") int pageNumber2, @RequestParam(value = "p3", required = false, defaultValue = "1") int pageNumber3) {
//        Customer customer = null;
//        customer = (Customer) session.getAttribute("customer");
//        List<PagingResult> lts = new ArrayList<>();
//        if (customer == null) {
//            return "public_index";
//        } else {
//            model.addAttribute("customer", customer);
//            return "public_profile.edit";
//        }
//    }
//
//    @GetMapping("/getMyProfile")
//    public ResponseEntity<Customer> getMyProfile(HttpSession session) {
//        Customer customer = null;
//        customer = (Customer) session.getAttribute("customer");
//        return new ResponseEntity<Customer>(customer, HttpStatus.OK);
//    }
//
//    @GetMapping("dang-ky.html")
//    public String registerView() {
//        return "public_register";
//    }
//
//    @PostMapping("/register")
//    ResponseEntity<Boolean> register(HttpServletRequest request, Model model, @RequestBody Customer customer) {
//        Boolean check = false;
//        check = customerDAO.checkTrung(customer.getUsername());
//        if (check) {
//
//        } else {
//            try {
//                Date date = new Date();
//                Timestamp ts = new Timestamp(date.getTime());
//                String password = EnCode.enCode(customer.getPassword());
//                customer.setPassword(password);
//                customer.setStatus(Constant.CUSTOMER.ACTIVE);
//                customer.setGendate(new Date());
//                customer.setLastUpdate(new Date());
//                customer.setScan(Constant.CUSTOMER.SEND_ACCOUNT);
//                customerDAO.add(customer);
//            } catch (NoSuchAlgorithmException e) {
//                e.printStackTrace();
//            }
//        }
//        return new ResponseEntity<Boolean>(check, HttpStatus.OK);
//    }
//
//    @PostMapping("update-profile")
//    ResponseEntity<ApiReponse> updateProfile(HttpServletRequest request, Model model, @RequestBody Customer customer) {
//        ApiReponse reponse = new ApiReponse();
//        Boolean check = false;
//        Customer userSource = (Customer) request.getSession().getAttribute("customer");
//
//        try {
//            /*get DB*/
//            userSource = customerDAO.getId(userSource.getId());
//            String passDB = userSource.getPassword();
//            userSource.setEmail(customer.getEmail());
//            userSource.setSex(customer.getSex());
//            userSource.setFullName(customer.getFullName());
//            userSource.setBirthday(customer.getBirthday());
//            userSource.setLastUpdate(new Date());
//
//            request.getSession().setAttribute("customer", userSource);
//            customerDAO.edit(userSource);
//            reponse = new ApiReponse(true, 200);
//        } catch (Exception e) {
//            e.printStackTrace();
//            reponse = new ApiReponse(false, 500, "Có lỗi trong quá trình xử lý vui lòng thử lại sau.");
//        }
//        return new ResponseEntity<ApiReponse>(reponse, HttpStatus.OK);
//
//    }
//
//    @PostMapping("change-avatar")
//    ResponseEntity<Boolean> changeAvatar(HttpServletRequest request, Model model, @RequestBody Customer customer) {
//        Boolean check = false;
//        Customer userSource = (Customer) request.getSession().getAttribute("customer");
//        /*get DB*/
//        userSource = customerDAO.getId(userSource.getId());
//
//        /*set File*/
//        if (!StringUtils.isBlank(customer.getImage())) {
//            try {
//                String base64 = "";
//                base64 = customer.getImage().substring(customer.getImage().indexOf("base64,") + 7);
//                String dateImage = new SimpleDateFormat("dd-MM-yyyy").format(new Date());
//                // Creating the directory to store file
//                String rootPath = SystemProperties.getProperty("user_folder");
//                File dir = new File(rootPath + File.separator + "tmpFiles");
//                if (!dir.exists()) {
//                    dir.mkdirs();
//                }
//                String localName = userSource.getUsername() + "_" + dateImage + "." + FilenameUtils.getExtension(customer.getFileName());
//                File serverFile = new File(dir.getAbsolutePath()
//                        + File.separator + localName);
//                FileOutputStream outThumbnail = new FileOutputStream(serverFile);
//                outThumbnail.write(DatatypeConverter.parseBase64Binary(base64));
//                outThumbnail.close();
//                /* userSource.setImage(customer.getImage());*/
//                userSource.setLinkFile("/tmpFiles/" + localName);
//                userSource.setFileName(customer.getFileName());
//                userSource.setLastUpdate(new Date());
//                customerDAO.edit(userSource);
//
//                request.getSession().setAttribute("customer", userSource);
//
//            } catch (Exception e) {
//                e.printStackTrace();
//            }
//        }
//
//        return new ResponseEntity<Boolean>(true, HttpStatus.OK);
//    }
//
//    @GetMapping("quen-mat-khau.html")
//    public String forgotPassword() {
//        return "public_forgotPassword";
//    }
//
//    @GetMapping("/reset")
//    public ResponseEntity<Customer> articleListSearch(@RequestParam(value = "p", required = false, defaultValue = "1") int pageNumber, @RequestParam(value = "username", required = false) String username, @RequestParam(value = "email", required = false) String email) {
//
//        Customer customer = new Customer();
//        try {
//            customer = customerDAO.findCustomer(username, email);
//            if (customer != null) {
//                customer.setResetDate(new Date());
//
//                customer.setCode(EnCode.enCode(String.valueOf(System.currentTimeMillis())));
//                SendMailUtil.SendMailTLS.mail(customer);
//                customerDAO.edit(customer);
//            }
//
//        } catch (NoSuchAlgorithmException e) {
//            e.printStackTrace();
//        }
//        return new ResponseEntity<Customer>(customer, HttpStatus.OK);
//    }
//
//    @GetMapping("/changePassWord")
//    public ResponseEntity<ApiReponse> changePassWord(@RequestParam(value = "p", required = false, defaultValue = "1") int pageNumber, HttpSession session, @RequestParam(value = "oldpassword", required = false) String oldpassword, @RequestParam(value = "newpassword", required = false) String newpassword) throws NoSuchAlgorithmException {
//        ApiReponse reponse = new ApiReponse();
//        Customer customer = null;
//        String error = "";
//        customer = (Customer) session.getAttribute("customer");
//        if (customer != null) {
//
//            if (customer.getPassword().equals(EnCode.enCode(oldpassword))) {
//                customer.setPassword(EnCode.enCode(newpassword));
//                customerDAO.edit(customer);
//                reponse = new ApiReponse(true, 200);
//                error = "200";
//            } else {
//                return new ResponseEntity<ApiReponse>(new ApiReponse(false, 1, "Mật khẩu cũ không chính xác."), HttpStatus.OK);
//            }
//        }
//        return new ResponseEntity<ApiReponse>(reponse, HttpStatus.OK);
//    }
//
//    @GetMapping("/{code}")
//    public String getCustomer(Model model, @PathVariable("code") String code) {
//        Customer customer = new Customer();
//        customer = customerDAO.findByCode(code);
//        model.addAttribute("modalCustomer", customer);
//        return "public_index";
//    }
//
//    @RequestMapping("logout")
//    public void logout(HttpSession session, HttpServletResponse response, HttpServletRequest request) throws IOException {
//        if (session != null) {
//
//            session.invalidate();
//            session = null;
//        }
//        response.sendRedirect(request.getContextPath() + "/");
//    }
//
//    @PostMapping("/resetPassword")
//    ResponseEntity<Boolean> resetPassword(HttpServletRequest request, Model model, @RequestBody Customer customer) {
//        Customer cus = new Customer();
//        boolean check = false;
//        try {
//            String password = EnCode.enCode(customer.getPassword());
//            cus = customerDAO.findByCode(customer.getCode());
//            if (cus != null) {
//                cus.setCode("");
//                cus.setPassword(password);
//                customerDAO.edit(cus);
//                check = true;
//            }
//        } catch (NoSuchAlgorithmException e) {
//            e.printStackTrace();
//        }
//        return new ResponseEntity<Boolean>(check, HttpStatus.OK);
//    }
//
//    @GetMapping("dang-nhap.html")
//    public String loginView() {
//        return "public_login";
//    }
//
//    @PostMapping("/login")
//    ResponseEntity<Customer> login(HttpServletRequest request, Model model, @RequestBody Customer customer, HttpServletResponse response) throws NoSuchAlgorithmException, IOException {
//        Customer cus = new Customer();
//        cus = customerDAO.Login(customer.getUsername(), EnCode.enCode(customer.getPassword()));
//        boolean check = false;
//        if (cus != null) {
//            HttpSession session = request.getSession();
//            session.setAttribute("customer", cus);
//        }
//        return new ResponseEntity<Customer>(cus, HttpStatus.OK);
//    }
//
//    @GetMapping("/thanh-vien-tich-cuc")
//    public ResponseEntity<List<Customer>> dsThanhVienTichCuc(HttpSession session) {
//        List<Customer> customers = customerDAO.listBy(" order by a.id asc limit 5");
//        return new ResponseEntity<List<Customer>>(customers, HttpStatus.OK);
//    }

}
