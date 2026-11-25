-- =========================================================================
-- 3. POVOANDO O BANCO DE DADOS (INSERÇÃO DE DADOS - DML)
-- =========================================================================

-- CONCEITO DE ORDEM DE INSERÇÃO:
-- Como a tabela 'Pet' depende da tabela 'Cliente'
-- (devido à Chave Estrangeira), DEVEMOS primeiro cadastrar os Clientes.
-- Tentar cadastrar um pet para um cliente inexistente
-- resultará em erro de integridade referencial!

-- Cenário 1:
-- No início de dezembro, a clínica começa a organizar sua carteira de
-- clientes. Mariana Costa procura a equipe para cadastrar sua família
-- e informar os dados de contato e endereço. Nos dias seguintes, Rafael
-- Almeida, Camila Ferreira, Bruno Martins e Juliana Ribeiro também
-- realizam seus cadastros para utilizar os serviços da clínica.
-- Os cinco registros representam os primeiros tutores atendidos.
-- ---------------------------------------------------------------------
INSERT INTO Cliente
    (idCliente, nome, CPF, logradouro, numero, bairro, cidade, uf, cep)
VALUES
    (1, 'Mariana Costa', '10000000001', 'Rua das Acácias', '120', 'Tirol', 'Natal', 'RN', '59020000'),
    (2, 'Rafael Almeida', '10000000002', 'Avenida Praia de Ponta Negra', '450', 'Ponta Negra', 'Natal', 'RN', '59090000'),
    (3, 'Camila Ferreira', '10000000003', 'Rua Mossoró', '78', 'Petrópolis', 'Natal', 'RN', '59020010'),
    (4, 'Bruno Martins', '10000000004', 'Rua dos Jasmins', '35', 'Lagoa Nova', 'Natal', 'RN', '59056000'),
    (5, 'Juliana Ribeiro', '10000000005', 'Avenida Rio Branco', '900', 'Cidade Alta', 'Natal', 'RN', '59025000');

-- ---------------------------------------------------------------------
-- Cenário 2:
-- Durante o atendimento inicial, os tutores fornecem seus telefones
-- para que a recepção possa entrar em contato sobre consultas, horários
-- e orientações. Mariana informa um número pessoal e outro residencial.
-- Bruno também deixa dois contatos disponíveis. Rafael, Camila e
-- Juliana cadastram um telefone cada.
-- ---------------------------------------------------------------------
INSERT INTO ClienteTelefone (idCliente, telefone)
VALUES
    (1, '84990001001'),
    (1, '8432001001'),
    (2, '84990001002'),
    (3, '84990001003'),
    (4, '84990001004'),
    (4, '8432001004'),
    (5, '84990001005');

-- ---------------------------------------------------------------------
-- Cenário 3:
-- Após os cadastros dos tutores, a recepção registra os animais que
-- serão atendidos. Mariana cadastra Mel, uma cadela nascida em abril
-- de 2021. Rafael registra Thor, nascido em setembro de 2019. Camila
-- cadastra Luna; Bruno, seu cão Bob; e Juliana, a gata Nina. Cada ficha
-- reúne o nome, a data de nascimento e o tutor responsável pelo animal.
-- ---------------------------------------------------------------------
INSERT INTO Pet (idPet, nome, dataNascimento, idCliente)
VALUES
    (1, 'Mel', '2021-04-12', 1),
    (2, 'Thor', '2019-09-03', 2),
    (3, 'Luna', '2022-01-25', 3),
    (4, 'Bob', '2020-06-18', 4),
    (5, 'Nina', '2023-02-10', 5);

-- ---------------------------------------------------------------------
-- Cenário 4:
-- Com os primeiros clientes e animais registrados, a clínica organiza
-- sua equipe de atendimento. Ana Beatriz Lima e Larissa Gomes integram
-- o corpo de veterinários. Pedro Henrique Souza atua na área de banho
-- e tosa, Diego Carvalho trabalha como auxiliar veterinário e Fernanda
-- Oliveira atende demandas relacionadas ao comportamento animal.
-- As datas de admissão registram a entrada de cada profissional.
-- ---------------------------------------------------------------------
INSERT INTO Funcionarios (cpf, nome, cargo, comissao, data_admissao)
VALUES
    ('20000000001', 'Ana Beatriz Lima', 'Veterinária', 8.50, '2023-02-01'),
    ('20000000002', 'Pedro Henrique Souza', 'Tosador', 6.00, '2023-03-15'),
    ('20000000003', 'Larissa Gomes', 'Veterinária', 9.00, '2022-11-10'),
    ('20000000004', 'Diego Carvalho', 'Auxiliar veterinário', 4.50, '2024-01-08'),
    ('20000000005', 'Fernanda Oliveira', 'Especialista em comportamento', 7.00, '2023-08-21');

-- ---------------------------------------------------------------------
-- Cenário 5:
-- Para apresentar melhor as áreas de atendimento, a administração
-- cadastra as especialidades oferecidas pela clínica. O catálogo reúne
-- clínica geral, dermatologia veterinária, banho e tosa, comportamento
-- animal e odontologia veterinária. Cada especialidade recebe um nome,
-- uma categoria e uma breve descrição para consulta da equipe.
-- ---------------------------------------------------------------------
INSERT INTO Especialidades
    (id_especialidade, nome_especialidade, categoria, descricao)
VALUES
    (1, 'Clínica geral', 'Medicina veterinária', 'Avaliação geral e acompanhamento da saúde dos animais.'),
    (2, 'Dermatologia veterinária', 'Medicina veterinária', 'Avaliação e cuidados relacionados à pele e pelagem.'),
    (3, 'Banho e tosa', 'Estética animal', 'Higienização, escovação e cuidados estéticos.'),
    (4, 'Comportamento animal', 'Comportamento', 'Orientação sobre comportamento e adaptação dos animais.'),
    (5, 'Odontologia veterinária', 'Medicina veterinária', 'Avaliação e prevenção de problemas odontológicos.');

-- ---------------------------------------------------------------------
-- Cenário 6:
-- Depois de organizar o catálogo de especialidades, a gerência atualiza
-- as fichas profissionais com as qualificações apresentadas por cada
-- funcionário. Ana Beatriz possui registros em clínica geral e
-- odontologia veterinária. Pedro atua em banho e tosa, Larissa em
-- dermatologia, Diego em clínica geral e Fernanda em comportamento
-- animal. As datas e os números de certificado ficam registrados.
-- ---------------------------------------------------------------------
INSERT INTO Funcionario_Especialidades
    (cpf_funcionario, id_especialidade, data_obtencao, numero_certificado)
VALUES
    ('20000000001', 1, '2022-12-15', 'CERT-CLG-001'),
    ('20000000001', 5, '2023-05-20', 'CERT-ODO-001'),
    ('20000000002', 3, '2023-03-01', 'CERT-BT-002'),
    ('20000000003', 2, '2022-10-05', 'CERT-DER-003'),
    ('20000000004', 1, '2023-12-12', 'CERT-CLG-004'),
    ('20000000005', 4, '2023-07-30', 'CERT-COM-005');

-- ---------------------------------------------------------------------
-- Cenário 7:
-- Com a equipe e as áreas de atendimento organizadas, a clínica prepara
-- sua lista de serviços para apresentar aos tutores. São cadastrados
-- cinco atendimentos: consulta veterinária, banho e tosa, avaliação
-- dermatológica, orientação comportamental e avaliação odontológica.
-- Cada serviço recebe um preço e uma descrição para o agendamento.
-- ---------------------------------------------------------------------
INSERT INTO servico (nome, idServico, preco, descricao)
VALUES
    ('Consulta veterinária', 1, 120.00, 'Consulta clínica para avaliação geral do animal.'),
    ('Banho e tosa', 2, 85.00, 'Banho, secagem, escovação e tosa conforme necessidade.'),
    ('Avaliação dermatológica', 3, 180.00, 'Consulta direcionada à avaliação da pele e da pelagem.'),
    ('Orientação comportamental', 4, 150.00, 'Atendimento para orientação sobre comportamento animal.'),
    ('Avaliação odontológica', 5, 160.00, 'Avaliação preventiva da saúde bucal do animal.');

-- ---------------------------------------------------------------------
-- Cenário 8:
-- Com os cadastros concluídos e os serviços disponíveis, os tutores
-- começam a marcar os atendimentos de seus animais. Em 1º de dezembro,
-- Mel tem uma consulta com Ana Beatriz e Thor está agendado para banho
-- e tosa com Pedro Henrique. No dia 2, Luna tem uma avaliação
-- dermatológica com Larissa. Em 3 de dezembro, Bob participa de uma
-- orientação comportamental com Fernanda. Por fim, Nina tem uma
-- avaliação odontológica marcada para 4 de dezembro com Ana Beatriz.
-- Os registros informam data, horário, situação, serviço, pet e
-- funcionário responsável por cada atendimento.
-- ---------------------------------------------------------------------
INSERT INTO Agendamento (data_hora, situacao, idServico, idPet, cpf)
VALUES
    ('2026-12-01 09:00:00', 'Confirmado', 1, 1, '20000000001'),
    ('2026-12-01 10:30:00', 'Confirmado', 2, 2, '20000000002'),
    ('2026-12-02 14:00:00', 'Agendado',   3, 3, '20000000003'),
    ('2026-12-03 11:00:00', 'Agendado',   4, 4, '20000000005'),
    ('2026-12-04 15:30:00', 'Confirmado', 5, 5, '20000000001');