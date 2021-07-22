package com.osp.web.controller.admin.content;

import com.osp.common.SystemProperties;
import com.osp.model.ResultUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.Valid;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;

@Controller
@RequestMapping("/common")
public class CommonController {

    @RequestMapping(value = "/anhBaiViet", method = RequestMethod.POST)
    public ResponseEntity<ResultUpload> uploadFile(@RequestBody @Valid final MultipartFile file) {
        String path = "/icon_baiviet/";
        String base64 = "";
        String filename=System.currentTimeMillis()+file.getOriginalFilename();
        ResultUpload resultUpload=new ResultUpload();
        System.out.println(path+" "+filename);
        try{
            String rootPath = SystemProperties.getProperty("image_folder");
            File dir = new File(rootPath + File.separator + "icon_baiviet");
            if (!dir.exists()) {
                dir.mkdirs();
            }
            byte barr[]=file.getBytes();

            BufferedOutputStream bout=new BufferedOutputStream(
                    new FileOutputStream(rootPath+"/icon_baiviet"+"/"+filename));
            bout.write(barr);
            bout.flush();
            bout.close();
            resultUpload.setPath(path+filename);
        }catch(Exception e){System.out.println(e);}
        return new ResponseEntity<ResultUpload>(resultUpload, HttpStatus.OK);
    }
}