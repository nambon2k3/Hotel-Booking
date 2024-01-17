/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package util;

import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author nhatm
 */
public class EmailUtil {

    //Email: focuslearn927@gmail.com
    final String from = "housesharing8386@gmail.com";
    //Pass: sedwroyckpunaubh
    final String password = "wfhafodgecsstbii";

    //Send email from ... to ..., if type is signup then send sign up mail, type is forgotpass then send password reset mail
    public void sendEmail(String to, String type, String generatedValue) {
        String emailContent = "";
        PasswordUtil passUtil = new PasswordUtil();
        //Properties
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        //Authenticator
        Authenticator auth = new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(from, password);
            }

        };
        //Session
        Session session = Session.getInstance(props, auth);

        //Send email
        MimeMessage msg = new MimeMessage(session);

        try {
            msg.addHeader("Content-type", "text/HTML; charset=UTF-8");

            //Sender
            msg.setFrom(from);

            //Receiver
            msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to, false));

            if (type.equals("forgotpass")) {
                //Genpass
                //generatedValue = passUtil.generatePassword(); 
                //Subject
                msg.setSubject("Request to reset password ");

                //Content
                emailContent = "Hello user,\n\n"
                        + "** This is an automated message -- please do not reply as you will not receive a response. **\n\n"
                        + "This message is in response to your request to reset your account password. Please click the link below and follow the instructions to change your password.\n\n"
                        + "Your password is: " + generatedValue + "\n\n"
                        + "Note: Your temporary password is only available in 3 mins from the momment this email is sent!!\n\n"
                        + "http://localhost:9999/FocusLearn/login.jsp \n\n"
                        + "Thank you.\n\n"
                        + "Le Thi.";
            } else if (type.equals("signup")) {
                //GenOTP
                //generatedValue = passUtil.generateOTP();
                //Subject
                msg.setSubject("Request signup ");
                //Content
                emailContent = "Hello user,\n\n"
                        + "** This is an automated message -- please do not reply as you will not receive a response. **\n\n"
                        + "This message is in response to your request to signup. Please enter the following OTP, remember to not share this with anyone.\n\n"
                        + "Your OTP is: " + generatedValue + "\n\n"
                        + "Note: YThis OTP Code is only available in 3 mins from the momment this email is sent!!\n\n"
                        + "http://localhost:9999/FocusLearn/login.jsp \n\n"
                        + "Thank you.\n\n"
                        + "Le Thi.";
            } else if (type.equals("lecturerpass")) {
                //Subject
                msg.setSubject("Change Your Password");

                //Content
                emailContent = "Hello user,\n\n"
                        + "** This is an automated message -- please do not reply as you will not receive a response. **\n\n"
                        + "This message notice about your new creator account in our website. Please click the link below, use your username and follow the instructions to change your password.\n\n"
                        + "Your password is: " + generatedValue + "\n\n"
                        + "http://localhost:9999/FocusLearn/login.jsp \n\n"
                        + "Thank you.\n\n"
                        + "Le Thi.";
            } else if (type.equals("Banned account")) {
                //Subject
                msg.setSubject("Deative account");
                //Content
                emailContent = "Hello user,\n\n"
                        + "** This is an automated message -- please do not reply as you will not receive a response. **\n\n"
                        + "This message notice about your account in our website has no longer active.\n\n"
                        + "Thank you.\n\n"
                        + "Le Thi.";
            } else if (type.equals("UnBanned account")) {
                //Subject
                msg.setSubject("Avtive account");
                //Content
                emailContent = "Hello user,\n\n"
                        + "** This is an automated message -- please do not reply as you will not receive a response. **\n\n"
                        + "This message notice about your account in our website is active.\n\n"
                        + "Thank you.\n\n"
                        + "Le Thi.";
            }
            msg.setText(emailContent, "UTF-8");
            //Send Email
            Transport.send(msg);
        } catch (Exception e) {
            System.out.println("sendEmail(): " + e.getMessage());
        }
    }
}
