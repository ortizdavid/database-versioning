CREATE DATABASE teste_identificacao;
USE teste_identificacao;

CREATE TABLE tipo_identificacao (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome_tipo VARCHAR(50) NOT NULL,
    codigo VARCHAR(20) UNIQUE NOT NULL
);

CREATE TABLE pessoa (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    sexo ENUM('M', 'F'),
    id_tipo INT NOT NULL,
    num_identificacao VARCHAR(20) UNIQUE NOT NULL,
    CONSTRAINT fk_ident_pessoa FOREIGN KEY (id_tipo) REFERENCES tipo_identificacao (id)
);

CREATE TABLE candidato (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_pessoa INT NOT NULL,
    cod_candidato VARCHAR (20) NOT NULL,
    CONSTRAINT fk_pessoa_candidato FOREIGN KEY (id_pessoa) REFERENCES pessoa (id)
);

CREATE TABLE area_formacao (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome_area VARCHAR(100) NOT NULL,
    descricao VARCHAR(200)
);

CREATE TABLE vaga(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_area_formacao INT NOT NULL,
    nome_vaga VARCHAR(100) NOT NULL,
    estado ENUM('Aberta', 'Fechada') NOT NULL DEFAULT 'Aberta',
    forma_trabalho ENUM('Full-Time', 'Part-Time') NOT NULL,
    descricao VARCHAR(200),
    CONSTRAINT fk_area_vaga FOREIGN KEY (id_area_formacao) REFERENCES area_formacao (id)
);

CREATE TABLE candidatura(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_candidato INT NOT NULL,
    id_vaga INT NOT NULL,
    data_candidatura DATETIME DEFAULT NOW(),
    estado ENUM('Pendente', 'Validada', 'Revogada'),
    CONSTRAINT fk_candidato_inscricao FOREIGN KEY (id_candidato) REFERENCES candidato (id)
    CONSTRAINT fk_vaga_inscricao FOREIGN KEY (id_vaga) REFERENCES vaga (id)
);

v