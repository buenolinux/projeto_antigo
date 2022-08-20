
CREATE DATABASE lojavirtual;
USE lojavirtual;

CREATE TABLE tab_animais( id_animal INT NOT NULL PRIMARY KEY AUTO_INCREMENT, nome VARCHAR(20) );

CREATE TABLE tab_fornecedores(
	id_fornecedor INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(20) NOT NULL,
	telefone VARCHAR(15)
);

CREATE TABLE tab_pedidos(
	id_pedido INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	id_fornecedor INT NOT NULL,

	CONSTRAINT fk_id_fornecedor
	FOREIGN KEY (id_fornecedor)
	REFERENCES tab_fornecedores(id_fornecedor)
);

CREATE TABLE tab_marcas(
	id_marca INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(20) NOT NULL
);


CREATE TABLE tab_lotes(
	id_lote INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	id_marca INT NOT NULL,
	id_pedido INT NOT NULL,
	entrada DATE NOT NULL,
	vencimento DATE NOT NULL,
	
	CONSTRAINT fk_id_marca
	FOREIGN KEY (id_marca)
	REFERENCES tab_marcas(id_marca),	
	
	CONSTRAINT fk_id_pedido
	FOREIGN KEY (id_pedido)
	REFERENCES tab_pedidos(id_pedido)

			
);

CREATE TABLE tab_categorias(
	id_categoria INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(20)
);



CREATE TABLE tab_departamentos(
	id_departamento INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(20)

);

CREATE TABLE tab_estoques(
	id_estoque INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	id_lote INT NOT NULL,
	id_departamento INT NOT NULL,
	quantidade INT NOT NULL,

	CONSTRAINT fk_id_lote
	FOREIGN KEY (id_lote)
	REFERENCES tab_lotes(id_lote),

	CONSTRAINT fk_id_departamento
	FOREIGN KEY (id_departamento)
	REFERENCES tab_departamentos(id_departamento)
);

CREATE TABLE tab_cargos(
	id_cargo INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	id_departamento INT NOT NULL,
	nome VARCHAR(20),
	
	CONSTRAINT fk2_id_departamento
	FOREIGN KEY (id_departamento)
	REFERENCES tab_departamentos (id_departamento)
	
);

CREATE TABLE tab_funcionarios(
	id_funcionario INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(20) NOT NULL,
	sobrenome VARCHAR(60) NOT NULL,
	senha VARCHAR(200) NOT NULL,
	nomeusuario VARCHAR(50) NOT NULL,
	perfil INT NOT NULL,
	id_cargo INT NOT NULL,
	
	CONSTRAINT id_cargo
	FOREIGN KEY (id_cargo)
	REFERENCES tab_cargos(id_cargo)

);

CREATE TABLE tab_clientes(
	id_cliente INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(20) NOT NULL,
	sobrenome VARCHAR(50) NOT NULL,
	cpf VARCHAR(15) NOT NULL,
	rg VARCHAR(12),
	nascimento DATE,	
	sexo VARCHAR(1) NOT NULL,	
	email VARCHAR(50) NOT NULL,
	senha VARCHAR(200) NOT NULL,
	cep VARCHAR(8) NOT NULL,
	logradouro VARCHAR(100) NOT NULL,
	numero VARCHAR(5) NOT NULL,
	bairro VARCHAR(20) NOT NULL,
	cidade VARCHAR(30) NOT NULL,
	estado VARCHAR(2) NOT NULL
	
	
);

CREATE TABLE tab_vendas(
	id_venda INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	id_cliente INT NOT NULL,
	data DATE NOT NULL,
	total DECIMAL(10,2) NOT NULL,

	CONSTRAINT fk_id_cliente
	FOREIGN KEY (id_cliente)
	REFERENCES tab_clientes(id_cliente)
);

CREATE TABLE tab_produtos(
	id_produto INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(20) NOT NULL,
	imagem VARCHAR(30)NOT NULL,
	descricao TEXT NOT NULL,
	tamanho INT NOT NULL,
	unidademedida INT NOT NULL,
	id_categoria INT NOT NULL,
	id_animal INT NOT NULL,
	id_marca INT NOT NULL,

	CONSTRAINT fk_id_categoria
	FOREIGN KEY (id_categoria)
	REFERENCES tab_categorias(id_categoria),

	CONSTRAINT fk_id_animal
	FOREIGN KEY (id_animal)
	REFERENCES tab_animais(id_animal),

	CONSTRAINT fk2_id_marca
	FOREIGN KEY (id_marca)
	REFERENCES tab_marcas(id_marca)

);
	
	


CREATE TABLE tab_itens_pedidos(
	id_item_pedido INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	id_produto INT NOT NULL,
	id_pedido INT NOT NULL,
	id_venda INT NOT NULL,
	quantidade INT NOT NULL ,
	
	CONSTRAINT fk_id_produto
	FOREIGN KEY (id_produto)
	REFERENCES tab_produtos(id_produto),

	CONSTRAINT fk2_id_pedido
	FOREIGN KEY (id_pedido)
	REFERENCES tab_pedidos(id_pedido),

	CONSTRAINT fk_id_venda
	FOREIGN KEY (id_venda)
	REFERENCES tab_vendas(id_venda)

);
