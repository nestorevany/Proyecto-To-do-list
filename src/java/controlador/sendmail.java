/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;


public class sendmail {
public static void main(String[] args) {
    
String to="nestorevany@gmail.com";//change accordingly correo que recibe
//Get the session object
Properties props = new Properties();
props.put("mail.smtp.host", "smtp.gmail.com");
props.put("mail.smtp.socketFactory.port", "465");
props.put("mail.smtp.socketFactory.class",
"javax.net.ssl.SSLSocketFactory");
props.put("mail.smtp.auth", "true");
props.put("mail.smtp.port", "465");
Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
@Override
protected PasswordAuthentication getPasswordAuthentication() {
return new PasswordAuthentication("nestorevany@gmail.com","ITbenjamin6");//Put your email id and password here
}
});
//compose message
try {
MimeMessage message = new MimeMessage(session);
message.setFrom(new InternetAddress("nestorevany@gmail.com"));//change accordingly correo que envia.
message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));
message.setSubject("Recuperar Password Car Online");
message.setText("Gracias por utilizar recuperacion de Password. Su contrasena es...." );
//send message
Transport.send(message);
System.out.println("message sent successfully");
} catch (MessagingException e) {throw new RuntimeException(e);}
}
}
