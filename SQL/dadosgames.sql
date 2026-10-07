DROP TABLE IF EXISTS Pedidos;
DROP TABLE IF EXISTS Clientes;
DROP TABLE IF EXISTS Produtos;

CREATE TABLE Clientes (
    cliente_id INTEGER PRIMARY KEY,
    nome_cliente VARCHAR(100),
    cidade_cliente VARCHAR(100)
);

CREATE TABLE Produtos (
    produto_id INTEGER PRIMARY KEY,
    produto_nome VARCHAR(100),
    produto_preco DECIMAL(10,2),
    categoria VARCHAR(50)
);

CREATE TABLE Pedidos (
    ID INTEGER PRIMARY KEY,
    quantidade INTEGER,
    cliente_id INTEGER,
    produto_id INTEGER
);

ALTER TABLE Pedidos ADD CONSTRAINT FK_Pedidos_2
    FOREIGN KEY (cliente_id)
    REFERENCES Clientes (cliente_id)
    ON DELETE CASCADE;

ALTER TABLE Pedidos ADD CONSTRAINT FK_Pedidos_3
    FOREIGN KEY (produto_id)
    REFERENCES Produtos (produto_id)
    ON DELETE CASCADE;

INSERT INTO Clientes (cliente_id , nome_cliente , cidade_cliente) VALUES
(1 , 'Ana' , 'São Paulo'),
(2 , 'Bruno' , 'Rio de Janeiro'),
(3 , 'Carla' , 'São Paulo'),
(4 , 'Diego' , 'Belo Horizonte'),
(5 , 'Thomas' , 'São Paulo');

INSERT INTO Produtos (produto_id , produto_nome , produto_preco , categoria) VALUES
(1 , 'Elden Ring' , 249.90 , 'RPG'),
(2 , 'Minecraft' , 99.90 , 'Sandbox'),
(3 , 'Hollow Knight' , 46.99 , 'Aventura'),
(4 , 'GTA V' , 79.90 , 'Aventura'),
(5 , 'Cyberpunk 2077' , 199.90 , 'RPG');

INSERT INTO Pedidos (ID , quantidade , cliente_id , produto_id) VALUES
(1 , 2 , 1 , 1),
(2 , 1 , 1 , 3),
(3 , 1 , 2 , 5),
(4 , 3 , 3 , 1),
(5 , 2 , 3 , 2),
(6 , 1 , 5 , 4),
(7 , 4 , 5 , 3);

SELECT produto_nome , produto_preco
FROM Produtos
WHERE categoria = 'RPG'
ORDER BY produto_preco DESC;

SELECT c.nome_cliente, p.ID AS pedido
FROM Clientes c
LEFT JOIN Pedidos p ON p.cliente_id = c.cliente_id;

SELECT c.nome_cliente,
       SUM(pr.produto_preco * p.quantidade) AS valor_total
FROM Clientes c
JOIN Pedidos p   ON p.cliente_id = c.cliente_id
JOIN Produtos pr ON pr.produto_id = p.produto_id
GROUP BY c.cliente_id, c.nome_cliente;

SELECT categoria,
       AVG(produto_preco) AS preco_medio
FROM Produtos
GROUP BY categoria
HAVING AVG(produto_preco) > 100;

SELECT pr.produto_nome,
       COUNT(p.ID) AS total_pedido
FROM Produtos pr
LEFT JOIN Pedidos p ON p.produto_id = pr.produto_id
GROUP BY pr.produto_id, pr.produto_nome;