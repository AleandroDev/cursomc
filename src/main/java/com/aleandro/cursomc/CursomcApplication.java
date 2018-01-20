package com.aleandro.cursomc;

import java.text.SimpleDateFormat;
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
import com.aleandro.cursomc.domain.ItemPedido;
import com.aleandro.cursomc.domain.Pagamento;
import com.aleandro.cursomc.domain.PagamentoComBoleto;
import com.aleandro.cursomc.domain.PagamentoComCartao;
import com.aleandro.cursomc.domain.Pedido;
import com.aleandro.cursomc.domain.Produto;
import com.aleandro.cursomc.domain.enums.EstadoPagamento;
import com.aleandro.cursomc.domain.enums.TipoCliente;
import com.aleandro.cursomc.repositories.CategoriaRepository;
import com.aleandro.cursomc.repositories.CidadeRepository;
import com.aleandro.cursomc.repositories.ClienteRepository;
import com.aleandro.cursomc.repositories.EnderecoRepository;
import com.aleandro.cursomc.repositories.EstadoRepository;
import com.aleandro.cursomc.repositories.ItemPedidoRepository;
import com.aleandro.cursomc.repositories.PagamentoRepository;
import com.aleandro.cursomc.repositories.PedidoRepository;
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
	@Autowired
	private PedidoRepository pedidoRepository;
	@Autowired
	private PagamentoRepository pagamentoRepository;
	@Autowired
	private ItemPedidoRepository itemPedidoRepository;
	

	public static void main(String[] args) {
		SpringApplication.run(CursomcApplication.class, args);
	}

	@Override
	public void run(String... arg0) throws Exception {
		
		Categoria cat1 = new Categoria(null,"Informática");
		Categoria cat2 = new Categoria(null,"Grafica");
		Categoria cat3 = new Categoria(null,"Padaria");
		Categoria cat4 = new Categoria(null,"Igreja");
		Categoria cat5 = new Categoria(null,"Jardim");
		Categoria cat6 = new Categoria(null,"Mesa/Banho");
		Categoria cat7 = new Categoria(null,"Perfumaria");
		
		Produto p1  = new Produto(null, "Computador", 2000.00);
		Produto p2  = new Produto(null, "Impressora", 800.00);
		Produto p3  = new Produto(null, "Mouse", 80.00);
		Produto p4  = new Produto(null, "Mesa de escritorio", 300.00);
		Produto p5  = new Produto(null, "Toalha", 50.00);
		Produto p6  = new Produto(null, "Colcha", 200.00);
		Produto p7  = new Produto(null, "TV true color", 1200.00);
		Produto p8  = new Produto(null, "Roçadeira", 800.00);
		Produto p9  = new Produto(null, "Abajour", 100.00);
		Produto p10 = new Produto(null, "Pendente", 180.00);
		Produto p11 = new Produto(null, "Shampoo", 90.00);
		
		
		
		cat1.getProdutos().addAll(Arrays.asList(p1,p2,p3));
		cat2.getProdutos().addAll(Arrays.asList(p2,p4));
		cat3.getProdutos().addAll(Arrays.asList(p5,p6));
		cat4.getProdutos().addAll(Arrays.asList(p1,p2,p3,p7));
		cat5.getProdutos().addAll(Arrays.asList(p8));
		cat6.getProdutos().addAll(Arrays.asList(p9,p10));
		cat7.getProdutos().addAll(Arrays.asList(p11));
		
		
		p1.getCategorias().addAll(Arrays.asList(cat1,cat4));
		p2.getCategorias().addAll(Arrays.asList(cat1,cat2,cat4));
		p3.getCategorias().addAll(Arrays.asList(cat1,cat4));
		p4.getCategorias().addAll(Arrays.asList(cat2));
		p5.getCategorias().addAll(Arrays.asList(cat3));
		p6.getCategorias().addAll(Arrays.asList(cat3));
		p7.getCategorias().addAll(Arrays.asList(cat4));
		p8.getCategorias().addAll(Arrays.asList(cat5));
		p9.getCategorias().addAll(Arrays.asList(cat6));
		p10.getCategorias().addAll(Arrays.asList(cat6));
		p11.getCategorias().addAll(Arrays.asList(cat7));
		
		categoriaRepository.save(Arrays.asList(cat1,cat2,cat3,cat4,cat5,cat6,cat7));
		produtoRepository.save(Arrays.asList(p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11));
		
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
			
		SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy hh:mm");
		
		Pedido ped1 = new Pedido(null, sdf.parse("30/09/2017 10:32"), cli1, e1);
		Pedido ped2 = new Pedido(null, sdf.parse("10/10/2017 19:35"), cli1, e2);
		
		Pagamento pagto1 = new PagamentoComCartao(null, EstadoPagamento.QUITADO, ped1, 6);
		ped1.setPagamento(pagto1);
		Pagamento pagto2 = new PagamentoComBoleto(null, EstadoPagamento.PENDENTE, ped2, sdf.parse("20/10/2017 00:00"), null);
		ped2.setPagamento(pagto2);
		
		cli1.getPedidos().addAll(Arrays.asList(ped1,ped2));
		
		pedidoRepository.save(Arrays.asList(ped1,ped2));
		pagamentoRepository.save(Arrays.asList(pagto1,pagto2));
		
		ItemPedido ip1 = new ItemPedido(ped1, p1, 0.00, 1, 2000.00);
		ItemPedido ip2 = new ItemPedido(ped1, p3, 0.00, 2, 80.00);
		ItemPedido ip3 = new ItemPedido(ped2, p2, 100.00, 1, 800.00);
		
		ped1.getItens().addAll(Arrays.asList(ip1,ip2));
		ped2.getItens().addAll(Arrays.asList(ip3));
		
		p1.getItens().addAll(Arrays.asList(ip1));
		p2.getItens().addAll(Arrays.asList(ip3));
		p3.getItens().addAll(Arrays.asList(ip2));
		
		itemPedidoRepository.save(Arrays.asList(ip1,ip2,ip3));

		}
	}
