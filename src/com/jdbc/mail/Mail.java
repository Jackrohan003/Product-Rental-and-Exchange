package com.jdbc.mail;

import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class Mail {
  
    private static boolean SendEMail(String to, String sub, String body) {
        
        
        try
        {
        Properties property = System.getProperties();
        property.put("mail.smtp.host", "smtp.gmail.com");
        property.put("mail.smtp.socketFactory.port", "465");
        property.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
        property.put("mail.smtp.auth", "true");
        property.put("mail.smtp.port", "465");
            Authenticator auth = new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("productrentalandexchange@gmail.com", "productrental"); 
            }   
            };
            Session session = Session.getInstance(property, auth);
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress("productrentalandexchange@gmail.com"));
            message.setSubject(sub);


            message.setText(body);
            message.setRecipient(Message.RecipientType.TO, new InternetAddress(to));
            message.setContent(body, "text/html");
            message.setSentDate(new Date());
            Transport.send(message);
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        }
        return true;
    }
    public static boolean randomnumber(String uname,int otp)
    {
        
        String msg = " <h1 style=\"text-align:center;color:red;\"> PRODUCT RENTAL AND EXCHANGE </h1>"
            + "<h2 style=\"text-align:center;\">Your OTP is :: <font color=\"blue\"><b><i><u> "+otp+" </U></i></b></font> </h2>";
        if(SendEMail(uname, "OTP", msg))
        {
        
                    return true;
        } 
        else 
        {
                    return false;
        }
    }
    
    
    public static void main(String[] args) {
        System.out.println("hi");
      /* boolean status= randomnumber("idrisrupawala@gmail.com");
       if (status==true)
       {
           System.out.println("successs");
       }
       else
       {
           System.out.println("fail");
       }*/
        
    }
    
}
