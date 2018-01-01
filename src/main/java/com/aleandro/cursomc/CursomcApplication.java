package com.aleandro.cursomc;

import java.util.Arrays;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import com.aleandro.cursomc.domain.Categoria;
import com.aleandro.cursomc.domain.Cidade;
import com.aleandro.cursomc.domain.Cliente;
import com.aleandro.cursomc.domain.Endereco;
import com.aleandro.cursomc.domain.Estado;
import com.aleandro.cursomc.domain.Produto;
import com.aleandro.cursomc.domain.enums.TipoCliente;
import com.aleandro.cursomc.repositories.CategoriaRepository;
import com.aleandro.cursomc.repositories.CidadeRepository;
import com.aleandro.cursomc.repositories.ClienteRepository;
import com.aleandro.cursomc.repositories.EnderecoRepository;
import com.aleandro.cursomc.repositories.EstadoRepository;
import com.aleandro.cursomc.repositories.ProdutoRepository;

@SpringBootApplication
public class CursomcApplication implements CommandLineRunner{
	
	/*Injeção de dependencias
	 * 
	 */
	@Autowired
	private CategoriaRepository categoriaRepository;
	@Autowired
	private ProdutoRepository produtoRepository;
	@Autowired
	private EstadoRepository estadoRepository;
	@Autowired
	private CidadeRepository cidadeRepository;
	@Autowired
	private ClienteRepository clienteRepository;
	@Autowired
	private EnderecoRepository enderecoRepository;
		
		
		
	
	public static void main(String[] args) {
		SpringApplication.run(CursomcApplication.class, args);
	}

	@Override
	public void run(String... arg0) throws Exception {
		Categoria cat1 = new Categoria(null,"Informática");
		Categoria cat2 = new Categoria(null,"Grafica");
		Categoria cat3 = new Categoria(null,"Padaria");
		Categoria cat4 = new Categoria(null,"Igreja");
		
		Produto p1 = new Produto(null, "Computador", 2000.00);
		Produto p2 = new Produto(null, "Impressora", 800.00);
		Produto p3 = new Produto(null, "Mouse", 80.00);
		
		cat1.getProdutos().addAll(Arrays.asList(p1,p2,p3));
		cat2.getProdutos().addAll(Arrays.asList(p2));
		
		p1.getCategorias().addAll(Arrays.asList(cat1));
		p2.getCategorias().addAll(Arrays.asList(cat1,cat2));
		p3.getCategorias().addAll(Arrays.asList(cat1));
		
		categoriaRepository.save(Arrays.asList(cat1,cat2,cat3,cat4));
		produtoRepository.save(Arrays.asList(p1,p2,p3));
		
		Estado est1 = new Estado(null,"Minas Gerais");
		Estado est2 = new Estado(null,"São Paulo");
		
		Cidade cid1 = new Cidade(null,"Uberlandia",est1);
		Cidade cid2 = new Cidade(null,"São Paulo",est2);
		Cidade cid3 = new Cidade(null,"São Paulo",est2);
		
		est1.getCidades().addAll(Arrays.asList(cid1));
		est2.getCidades().addAll(Arrays.asList(cid2,cid3));
		
		estadoRepository.save(Arrays.asList(est1,est2));
		cidadeRepository.save(Arrays.asList(cid1,cid2,cid3));
		
		Cliente cli1 = new Cliente(null,"Maria Silva", "maria@gmail.com","1234564-56",TipoCliente.PESSOAFISICA);
		cli1.getTelefones().addAll(Arrays.asList("9999-9999","612346-4645"));
		
		Endereco e1 = new Endereco(null, "Rua Flores", "300", "Apartamento 203", "Jardim", "38220834", cli1, cid1);
		Endereco e2 = new Endereco(null, "Avenida Matos", "105", "Sala 108","Centro","12345645",cli1,cid2);
		
		cli1.getEnderecos().addAll(Arrays.asList(e1,e2));
		
		clienteRepository.save(Arrays.asList(cli1));
		enderecoRepository.save(Arrays.asList(e1,e2));
		
	}
}
