package com.sigma.sigma.utils;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

public class Send {
    private final String correoRemitente = "sigmautez@gmail.co";
    private final String contraseñaRemitente = "bfezkvhciuiknxrj";

    public void enviarCorreo(String destinatario, String asunto, String contenido) throws MessagingException {
        try {
            Properties props = new Properties();
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.starttls.enable", "true");
            props.put("mail.smtp.host", "smtp.gmail.com");
            props.put("mail.smtp.port", "587");

            // Crea una sesión de correo con autenticación
            Session session = Session.getInstance(props, new Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(correoRemitente, contraseñaRemitente);
                }
            });

            // Crea el mensaje
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(correoRemitente));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(destinatario));
            message.setSubject(asunto);
            message.setText(contenido);

            // Envía el mensaje
            Transport.send(message);
        } catch (MessagingException e) {
            e.printStackTrace();
            throw e;
        }
    }
}