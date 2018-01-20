package com.aleandro.cursomc.dto;

import java.io.Serializable;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

import com.aleandro.cursomc.domain.Produto;
import com.aleandro.cursomc.services.validation.ClienteUpdate;

@ClienteUpdate
public class ProdutoDTO implements Serializable{
	private static final long serialVersionUID = 1L;
	
	private Integer id;
	
	@NotEmpty(message="Preenchimento Obrigatorio")
	@Length(min=5,max=80,message="O Tamanho deve ser entre 5 e 80 caracteres")
	private String nome;
	
	@NotEmpty(message="Preenchimento Obrigatorio")
	private Double preco;
	
	public ProdutoDTO() {
	}

	public ProdutoDTO(Produto obj) {
		this.id   = obj.getId();
		this.nome = obj.getNome();
		this.preco= obj.getPreco();
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

	public Double getPreco() {
		return preco;
	}

	public void setPreco(Double preco) {
		this.preco = preco;
	}
	
}
