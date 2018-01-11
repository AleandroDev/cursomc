package com.aleandro.cursomc.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aleandro.cursomc.domain.Pedido;
import com.aleandro.cursomc.repositories.PedidoRepository;
import com.aleandro.cursomc.services.exceptions.ObjectNotFoundException;

@Service
public class PedidoService {
	
	@Autowired
	private PedidoRepository repo;
	
	public Pedido find(Integer id) {
		Pedido obj = repo.findOne(id);
		
		if (obj == null) {
			throw new ObjectNotFoundException("Objeto não encontrado! " + 
						id + ", tipo: " + Pedido.class.getName());
		} 
		return obj;
	}
	
}
