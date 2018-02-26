package com.aleandro.cursomc.services;

import org.springframework.mail.SimpleMailMessage;

import com.aleandro.cursomc.domain.Pedido;

public interface EmailService {
	
	void sendOrderConfirmationEmail(Pedido obj);
	
	void sendEmail(SimpleMailMessage msg);
}
