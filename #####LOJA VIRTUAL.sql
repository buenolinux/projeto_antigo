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
