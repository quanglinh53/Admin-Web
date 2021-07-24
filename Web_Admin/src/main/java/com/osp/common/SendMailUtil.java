package com.osp.common;

import com.osp.model.Customer;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;

import javax.mail.*;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import java.util.Properties;

/**
 * Created by Admin on 6/1/2018.
 */
public class SendMailUtil {
    private static final Logger logger = LoggerFactory.getLogger(SendMailUtil.class);


    /**
     * Created by tranv on 4/18/2017.
     */
    public static class SendMailTLS {

        public static boolean mail(Customer customer) {
            String mailTo=customer.getEmail();
            final String username = SystemProperties.getProperty("email.username"); //"ospuchitest@gmail.com";
            final String password = SystemProperties.getProperty("email.password");//"tongcongty";

            Properties props = new Properties();
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.starttls.enable", "true");
            props.put("mail.smtp.host", "smtp.gmail.com");
            props.put("mail.smtp.port", "587");
            props.put("mail.smtp.ssl.trust", "smtp.gmail.com");

            Session session = Session.getInstance(props,
                    new javax.mail.Authenticator() {
                        protected PasswordAuthentication getPasswordAuthentication() {
                            return new PasswordAuthentication(username, password);
                        }
                    });

            try {

                MimeMessage message = new MimeMessage(session);
                message.setFrom(new InternetAddress("3kchiton@gmail.com"));
                message.setRecipients(Message.RecipientType.TO,
                        InternetAddress.parse(mailTo));
                message.setSubject("Thay đổi mật khẩu","utf-8");
                message.setContent("Chào "+customer.getUsername()+", để đặt lại mật khẩu của bạn tại , bạn cần phải bấm vào liên kết bên dưới:</br>\n" +
                        "http://url/"+customer.getCode()+"\n</br>" +
                        "Nếu bạn không yêu cầu việc này, bạn có thể thoải mái bỏ qua thư này.", "text/html; charset=UTF-8");
                //message.setText(newPass);
                Transport.send(message);

                System.out.println("Done");
                return true;
            } catch (MessagingException e) {
                e.printStackTrace();
                return false;
            }
        }
    }

    public static void main(final String[] args) {

    }
}
//    public static void main(String[] args) {
//        System.out.println("backup_%date:~7,2%-%date:~4,2%-%date:~10,4%.sql");
//    }

