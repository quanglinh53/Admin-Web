package com.osp.common;

//import com.osp.model2.serverout.account;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class EnCode {
    public static String enCode(String password) throws NoSuchAlgorithmException {

        MessageDigest md = MessageDigest.getInstance("MD5");
        byte[] hashInBytes = md.digest(password.getBytes(StandardCharsets.UTF_8));

        StringBuilder sb = new StringBuilder();
        for (byte b : hashInBytes) {
            sb.append(String.format("%02x", b));
        }
        System.out.println(sb.toString());
        return sb.toString();
    }}

//    public static void main(String[] args) throws NoSuchAlgorithmException {
//        EntityManagerFactory emf = Persistence.createEntityManagerFactory("gamtcq");
//        EntityManager em = emf.createEntityManager();
//
//        EntityTransaction transaction = em.getTransaction();
//        transaction.begin();
//        em.find(account.class,1);
//        transaction.commit();
//    }}