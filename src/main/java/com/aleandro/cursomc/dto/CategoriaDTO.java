package com.aleandro.cursomc.dto;

import java.io.Serializable;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

import com.aleandro.cursomc.domain.Categoria;

public class CategoriaDTO implements Serializable{
	private static final long serialVersionUID = 1L;
	
	private Integer id;
	
	@NotEmpty(message="Preenchimento Obrigatorio")
	@Length(min=5,max=80,message="O Tamanho deve ser entre {0} e {1}")
	private String nome;
	
	public CategoriaDTO(){
	}
		
	public CategoriaDTO(Categoria obj){
		id = obj.getId();
		nome = obj.getNome();
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}
	
}
