-- =========================================================================
-- Atividade avaliativa: TRANSFORMAÇÃO DO MODELO CONCEITUAL (DER)
-- Contexto: Módulo de Cadastro / Petshop
-- =========================================================================

-- Remove o banco de dados se ele já existir para evitar erros
DROP DATABASE IF EXISTS PetshopDB;

-- Criação do banco de dados (o nosso "container" de tabelas)
CREATE DATABASE PetshopDB;
USE PetshopDB;

-- =========================================================================
-- 1. TABELA CLIENTE (Entidade Forte)
-- CONCEITO:
-- No DER em papel, o Cliente (tutor) possui o CPF como identificador
-- natural. Adotamos idCliente como identificador artificial (Surrogate Key)
-- do tipo INT UNSIGNED.
-- =========================================================================
-- SOBRE 1ª FORMA NORMAL (1FN - ATOMICIDADE):
--
-- CONCEITO INICIAL REPRESENTADO NO MODELO DE ENTIDADE E RELACIONAMENTO:
-- O Cliente possui Atributo Composto (Endereço) e Atributo Multivalorado
-- (Telefone).
--
-- APLICAÇÃO DA 1ª FORMA NORMAL (1FN - ATOMICIDADE):
-- 1. Atributo Composto (Endereço): Foi DESMEMBRADO em suas partes simples e
--    atômicas: logradouro, numero, bairro, cidade, uf e cep.
-- 2. Atributo Multivalorado (Telefone): Foi REMOVIDO desta tabela e virou
--    uma nova tabela relacionada ('ClienteTelefone'), permitindo cadastrar
--    vários telefones para o mesmo cliente sem violar a 1FN.
-- =========================================================================

CREATE TABLE Cliente (
  -- idCliente: Chave Primária (PK). Identifica unicamente cada tutor.
  idCliente INT UNSIGNED NOT NULL PRIMARY KEY,

  -- nome: Atributo simples/atômico obrigatório (NOT NULL).
  nome VARCHAR(125) NOT NULL,
  CPF VARCHAR(11) NOT NULL UNIQUE,

  -- ATRIBUTO COMPOSTO (ENDEREÇO) DESMEMBRADO (1FN):
  -- Todos os campos são atômicos e indivisíveis.
  logradouro VARCHAR(150) NOT NULL,
  numero VARCHAR(10) NOT NULL,
  bairro VARCHAR(60) NOT NULL,
  cidade VARCHAR(60) NOT NULL,
  uf CHAR(2) NOT NULL,
  cep CHAR(8) NOT NULL
);

-- =========================================================================
-- 1.1 TABELA CLIENTE_TELEFONE (Solução da 1FN para Atributo Multivalorado)
--
-- CONCEITO:
-- Como um Cliente pode ter zero, um ou múltiplos telefones, criamos esta
-- tabela associada.
-- A chave primária é COMPOSTA (idCliente + telefone) para evitar que o
-- mesmo telefone seja cadastrado duas vezes para o mesmo cliente.
-- =========================================================================
CREATE TABLE ClienteTelefone (
  idCliente INT UNSIGNED NOT NULL,
  telefone VARCHAR(20) NOT NULL,

  -- Chave Primária Composta
  PRIMARY KEY (idCliente, telefone),

  -- Chave Estrangeira com Integridade Referencial
  CONSTRAINT fk_cliente_telefone
    FOREIGN KEY (idCliente)
    REFERENCES Cliente(idCliente)
);

-- =========================================================================
-- 2. TABELA PET (O Lado "N" do Relacionamento 1:N com Cliente)
-- CONCEITO DE MAPEAMENTO (REGRA DE OURO):
-- - No relacionamento 1:N ("Um cliente possui muitos pets"), a chave
--   primária da entidade "1" (Cliente) "viaja" para a entidade "N" (Pet),
--   transformando-se em uma Chave Estrangeira (Foreign Key).
-- =========================================================================
CREATE TABLE Pet (

  -- idPet: Identificador único de cada pet cadastrado
  idPet INT UNSIGNED NOT NULL PRIMARY KEY,

  -- nome: Armazena o nome do animal
  nome VARCHAR(80) NOT NULL,

  -- dataNascimento: Armazena a data de nascimento do animal
  dataNascimento DATE NOT NULL,

  -- idCliente (FK): A "ponte" que liga o pet ao seu respectivo tutor.
  -- Precisa ter EXATAMENTE o mesmo tipo de dado da origem (INT UNSIGNED).
  idCliente INT UNSIGNED NOT NULL,

  -- CONSTRAINT (Restrição de Integridade Referencial):
  -- Garante que nenhum pet seja cadastrado para um tutor inexistente.
  CONSTRAINT fk_cliente
    FOREIGN KEY (idCliente)
    REFERENCES Cliente(idCliente)
);

CREATE TABLE Funcionarios (
    cpf VARCHAR(11) PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cargo VARCHAR(50) NOT NULL,
    comissao DECIMAL(5, 2) NOT NULL,
    data_admissao DATE NOT NULL
);

CREATE TABLE Especialidades (
    id_especialidade INT not null PRIMARY KEY UNSIGNED,
    nome_especialidade VARCHAR(100) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    descricao VARCHAR(255)
);

CREATE TABLE Funcionario_Especialidades (
    cpf_funcionario VARCHAR(11),
    id_especialidade INT UNSIGNED NOT NULL,
    data_obtencao DATE NOT NULL,
    numero_certificado VARCHAR(50),
    PRIMARY KEY (cpf_funcionario, id_especialidade),
    constraint fk_funcionario
    FOREIGN KEY (cpf_funcionario) REFERENCES Funcionarios(cpf),
    constraint fk_especialidade
    FOREIGN KEY (id_especialidade) REFERENCES Especialidades(id_especialidade)
);

 Create Table servico(
  nome VARCHAR(80) Not null,
  idServico INT UNSIGNED NOT NULL PRIMARY KEY,
  preco DECIMAL(8,2) NOT NULL,
  descricao VARCHAR(225) Not null
 );

 CREATE Table Agendamento(
  data_hora datetime Not null,
  situacao VARCHAR(20),
  idServico INT UNSIGNED NOT NULL,
  idPet INT UNSIGNED NOT NULL,
  cpf VARCHAR(11), 

  primary key(idServico,idPet,cpf),

CONSTRAINT fk_pet
    FOREIGN KEY (idPet)
    REFERENCES Pet(idPet),

    constraint fk_funcionario
    foreign key (cpf)
    references funcionarios(cpf),

    CONSTRAINT fk_servico
    FOREIGN KEY (idServico)
    REFERENCES Servico(idServico)


 );

