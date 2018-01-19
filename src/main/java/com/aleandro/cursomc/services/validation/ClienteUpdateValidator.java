package com.aleandro.cursomc.services.validation;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerMapping;

import com.aleandro.cursomc.domain.Cliente;
import com.aleandro.cursomc.dto.ClienteDTO;
import com.aleandro.cursomc.repositories.ClienteRepository;
import com.aleandro.cursomc.resources.exception.FieldMessage;


public class ClienteUpdateValidator implements ConstraintValidator<ClienteUpdate, ClienteDTO> {

	
	/*
		Injeção de dependencia do HttpServletRequest para que seja permitido recuperar o id da URI do cliente 
		que será para comparar entre o cliente do metodo isvalid e o retornado no pelo o metodo findByEmail.
	 */
	@Autowired
	private HttpServletRequest request;
	
	@Autowired
	private ClienteRepository repo;

	@Override
	public void initialize(ClienteUpdate ann) {
	}

	@Override
	public boolean isValid(ClienteDTO objDto, ConstraintValidatorContext context) {
		// Inclua os testes aqui, inserindo erros na lista
		
		@SuppressWarnings("unchecked")
		Map<String, String> map = (Map<String, String>) request.getAttribute(HandlerMapping.URI_TEMPLATE_VARIABLES_ATTRIBUTE);
		Integer uriId = Integer.parseInt(map.get("id"));//Id da URI
		
		List<FieldMessage> list = new ArrayList<>();

		Cliente aux = repo.findByEmail(objDto.getEmail());
		
		
		if(aux != null && !aux.getId().equals(uriId)) {
			list.add(new FieldMessage("email"," o e-mail " + objDto.getEmail() + " Já é um e-mail utilizado"));
		}
		
		for (FieldMessage e : list) {
			context.disableDefaultConstraintViolation();
			context.buildConstraintViolationWithTemplate(e.getMessage()).addPropertyNode(e.getFieldName())
					.addConstraintViolation();
		}
		return list.isEmpty();
	}

}
