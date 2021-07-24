//package com.osp.model;
//
//import lombok.Data;
//
//import javax.persistence.*;
//import java.io.Serializable;
//
//@Data
//@Entity
//@Table(name = "cdv_partners")
//public class Partners implements Serializable {
//    private static final long serialVersionUID = 1L;
//    @Id
//    @GeneratedValue(strategy = GenerationType.IDENTITY)
//    @Column(name="id", nullable = false)
//    private Long id;
//
//    @Column(name="name", nullable = false)
//    private String name;
//
//    @Column(name="key_api", nullable = false)
//    private String key;
//
//    @Column(name="active_flg", nullable = false)
//    private int active_flg;
//
//    @Column(name ="matp")
//    private String matp;
//
//    public Partners() {
//    }
//
//    public static long getSerialVersionUID() {
//        return serialVersionUID;
//    }
//
//    public Long getId() {
//        return id;
//    }
//
//    public void setId(Long id) {
//        this.id = id;
//    }
//
//    public String getName() {
//        return name;
//    }
//
//    public void setName(String name) {
//        this.name = name;
//    }
//
//    public String getKey() {
//        return key;
//    }
//
//    public void setKey(String key) {
//        this.key = key;
//    }
//
//    public int getActive_flg() {
//        return active_flg;
//    }
//
//    public void setActive_flg(int active_flg) {
//        this.active_flg = active_flg;
//    }
//
//    public String getMatp() {
//        return matp;
//    }
//
//    public void setMatp(String matp) {
//        this.matp = matp;
//    }
//}
