package com.osp.context;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

import java.io.File;
@Configuration
@EnableWebMvc
public class BaiVietImageContextConfig extends WebMvcConfigurerAdapter {
    @Value("${image_folder}")
    private String notary_office_folder;

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        String rootPath = notary_office_folder;
        File dir = new File(rootPath + File.separator + "icon_baiviet");
        String dirTrue = dir.getAbsolutePath();
        registry
                .addResourceHandler("/icon_baiviet*//**")
                .addResourceLocations("file:///"+dir.getAbsolutePath());
    }
}