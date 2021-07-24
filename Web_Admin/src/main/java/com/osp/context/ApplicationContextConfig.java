package com.osp.context;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

import java.io.File;

/**
 * Created by Admin on 28/7/2017.
 */
@Configuration
@EnableWebMvc
/*@EnableTransactionManagement*/
public class ApplicationContextConfig extends WebMvcConfigurerAdapter {

    @Value("${user_folder}")
    private String user_folder;

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        String rootPath = user_folder;
        File dir = new File(rootPath + File.separator + "tmpFiles");
        String dirTrue = dir.getAbsolutePath();
        registry
                .addResourceHandler("/tmpFiles*//**")
                .addResourceLocations("file:///"+dir.getAbsolutePath());
    }
//        @Override
//        public void addResourceHandlers(ResourceHandlerRegistry registry) {
//            String rootPath = notary_office_folder;
//            File dir = new File(rootPath + File.separator + "upload");
//            String dirTrue = dir.getAbsolutePath();
//            registry
//                    .addResourceHandler("/upload*//**")
//                    .addResourceLocations("file:///"+dir.getAbsolutePath());
//        }

}

