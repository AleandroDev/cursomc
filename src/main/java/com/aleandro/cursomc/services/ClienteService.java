package com.aleandro.cursomc.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aleandro.cursomc.domain.Cliente;
import com.aleandro.cursomc.repositories.ClienteRepository;
import com.aleandro.cursomc.services.exceptions.ObjectNotFoundException;

@Service
public class ClienteService {
	
	@Autowired
	private ClienteRepository repo;
	
	public Cliente find(Integer id) {
		Cliente obj = repo.findOne(id);
		
		if (obj == null) {
			throw new ObjectNotFoundException("Objeto não encontrado! " + 
						id + ", tipo: " + Cliente.class.getName());
		} 
		return obj;
	}
	
}
