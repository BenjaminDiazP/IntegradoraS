package com.sigma.sigma.utils;

import javax.mail.*;
import javax.mail.internet.*;
import java.util.Properties;

public class Send {
    private static final String FROM_EMAIL = "utezsigma@gmail.com";
    private static final String PASSWORD = "nkxllqfpgvabfspz";

    public static void sendEmail(String toEmail, String subject, String message) throws MessagingException {
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        Session session = Session.getInstance(props, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(FROM_EMAIL, PASSWORD);
            }
        });

        Message msg = new MimeMessage(session);

        // Establecemos el nombre y la dirección de correo electrónico del remitente
        String from = "Tu Nombre <" + FROM_EMAIL + ">";
        msg.setFrom(new InternetAddress(from));

        msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));
        msg.setSubject(subject);
        msg.setContent(message, "text/plain"); // Agregamos el tipo de contenido como texto simple
        Transport.send(msg);
    }
}