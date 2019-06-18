-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 11-Jun-2019 às 22:29
-- Versão do servidor: 10.1.38-MariaDB
-- versão do PHP: 7.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `site_2019`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `oficina`
--

CREATE TABLE `oficina` (
  `id` int(11) NOT NULL,
  `titulo` varchar(500) NOT NULL,
  `descricao` varchar(5000) DEFAULT NULL,
  `participante_id` int(11) NOT NULL,
  `tipo_oficina_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `oficina`
--

INSERT INTO `oficina` (`id`, `titulo`, `descricao`, `participante_id`, `tipo_oficina_id`) VALUES
(1, 'Fundamentos e desafios do blockchain 3.0', 'A tecnologia blockchain é um tópico que vem sendo muito explorado nos últimos anos, devido ao crescimento das criptomoedas, tal como Bitcoin, Ether, Ripple e outras. Desde seu surgimento o blockchain passou por diversas transformações, inicialmente apenas registrando transações financeiras (blockchain 1.0), posteriormente adicionado inteligência as transações por meio de contratos inteligentes (blockchain 2.0) e atualmente pode ser aplicado em diversos cenários (blockchain 3.0). Desse modo, esta palestra tem o objetivo de apresentar e discutir sobre os conceitos básicos do blockchain, protocolos de consenso, desafios da área, tecnologias para implementação e possíveis ambientes de aplicação.', 1, 1),
(2, 'Migrando microsserviços legados com segurança', 'Nesta palestra eu apresentarei uma experiência de migração de um microsserviço legado que se tornava cada vez menos eficaz para uma versão nova mais performática e de fácil manutenção, e como testes de integração e orientação a eventos me auxiliaram a alcançar meu objetivo de forma segura.', 2, 1),
(3, 'Docker: Administrando Containers', 'Este curso irá abordar a famosa tecnologia de containers, já adotada por grandes empresas como Paypal, Visa, Spotify, Netflix, entre outras. O docker é uma plataforma de software que permite a criação, o teste e a implantação de aplicações rapidamente, ele cria pacotes de software em unidades padronizadas chamadas de contêineres que têm tudo o que o software precisa para ser executado, inclusive bibliotecas, ferramentas de sistema, código e runtime. Ao usar o docker, é possível implantar e escalar rapidamente aplicações em qualquer ambiente e ter a certeza de que o seu código será executado. Fundamentos, práticas e ferramentas serão expostas com o objetivo do aluno ser capaz de: entender o funcionamento do docker, executar deploy de aplicações em containers, criar e gerenciar containers, criar e gerenciar imagens, criar e gerenciar clusters de docker e criar sistemas de arquivos de rede escalável.', 3, 2),
(4, 'Simplificando testes de integração com Docker', 'Neste minicurso eu procuro apresentar como testes de integração podem ser mais simples usando o Docker, criando um ecossistema de aplicações que representa bem o ambiente de produção durante a construção do projeto.', 2, 2),
(5, 'Engenharia de Linha de Produtos de Software e Modelagem de Features', 'A Engenharia de Linha de Produtos de Software (LPS) fornece uma solução para o problema de reuso sistemático e em larga-escala de artefatos como requisitos, design e código fonte. Neste minicurso será apresentada uma introdução ao processo de Engenharia de LPS, modelagem de domínio utilizando o modelo de features, que é uma forma de modelagem de variabilidade de software. Será apresentada uma demonstração da utilidade de modelos de features na resolução de problemas de reuso e como melhorar o reuso de artefatos de design como fragmentos de um diagrama de classes UML com o apoio de um modelo de features. A demonstração dos conceitos de modelagem e gerenciamento de variabilidades será realizada com o apoio de Base Variability Resolution (BVR). BVR é uma ferramenta de apoio à engenharia de LPS de código aberto e baseada na plataforma Eclipse. Os conceitos de modelagem e gerenciamento de variabilidades também são aplicáveis ao reuso de outros artefatos como requisitos, casos de teste e código fonte.', 4, 2),
(6, 'Revisão e Mapeamento Sistemático da Literatura em Ciência Computação.', 'Todo bom trabalho acadêmico necessita de uma boa revisão de literatura. Historicamente, há diversas formas para se realizar essa revisão, e a Revisão Sistemática da Literatura (RSL), nos últimos anos, tem se mostrado um dos melhores processos em termos de estrutura, confiabilidade e redução de viés. A RSL é um tipo de estudo secundário, cujo processo de pesquisa segue um conjunto de passos metodologicamente bem definidos de acordo com um protocolo prévio e cuja adoção procura reduzir o viés inerente a uma revisão informal. O objetivo deste minicurso é explicar um tipo de RSL (Mapeamento Sistemático) e exemplificar o seu processo por completo. Serão abordados tópicos em Ciência da Computação que serão utilizados para seguir todo o processo. Ao final do minicurso, espera-se que os ouvintes compreendam o processo de uma RSL e que possam realizá-la em suas pesquisas acadêmicas. ', 5, 2),
(7, 'Auditoria: uma alternativa de carreira para profissionais de TI', 'Nesta palestra você vai entender o que é auditoria, qual sua importância na sociedade e como profissionais de TI podem se destacar nesta área de atuação.', 6, 1),
(8, 'De estudante a professor – UENP ajudando a criar feras', 'Esta palestra é totalmente direcionada para os alunos que estão cursando Sistemas de Informação e, como eu um dia, perguntam “será que essa disciplina de psicologia vai me ajudar algum dia?”. Quais as vantagens e dificuldades de ser um professor de informática.', 7, 1),
(9, 'UX Design: como inserir no processo de desenvolvimento e como começar nessa carreira', 'UX (User Experience – Experiência do Usuário) Design trata-se de projetar experiências de uso colocando o usuário no centro do desenvolvimento. Assim, garantindo utilidade, facilidade de uso e prazer no uso de um produto. Mas como fazer isso? Quais técnicas utilizar? Como começar? Falaremos um pouco sobre isso e sobre a carreira de um UX Design.', 8, 1),
(10, 'Service Design: criando um serviço do zero a partir de um desafio', 'Service Design trabalha para entender o perfil dos consumidores, seus desejos e suas necessidades a fim de garantir que determinado serviço seja competitivo para o mercado e relevante para quem o usa.\r\n\r\n“Quando você tem duas cafeterias, uma ao lado da outra, e elas vendem exatamente o mesmo café, exatamente ao mesmo preço, Design de Serviços é o que faz você entrar em uma e não na outra.”\r\n\r\nNesse curso abordaremos: \r\n- O conceito de design de serviço e design centro no ser humano; \r\n- Como iniciar um projeto de service design;\r\n- Visão geral de pesquisa com usuário;\r\n- Mapeamento da jornada do usuário;\r\n- Prototipação.\r\n', 8, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `participante`
--

CREATE TABLE `participante` (
  `id` int(11) NOT NULL,
  `nome` varchar(150) NOT NULL,
  `graduacao` varchar(500) NOT NULL,
  `ano_graduacao` int(11) DEFAULT NULL,
  `pos_graduacao` varchar(1000) DEFAULT NULL,
  `empresa` varchar(500) NOT NULL,
  `area_atuacao` varchar(500) NOT NULL,
  `resumo` varchar(5000) DEFAULT NULL,
  `contato` varchar(500) DEFAULT NULL,
  `redes_sociais` varchar(1500) DEFAULT NULL,
  `foto` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `participante`
--

INSERT INTO `participante` (`id`, `nome`, `graduacao`, `ano_graduacao`, `pos_graduacao`, `empresa`, `area_atuacao`, `resumo`, `contato`, `redes_sociais`, `foto`) VALUES
(1, 'Erikson Júlio de Aguiar', 'Ciência da Computação', 2017, 'Ciência da computação e matemática computacional – ICMC/USP (Cursando)', 'ICMC - USP', 'Mestrando', 'É bacharel em Ciência da Computação pela Universidade Estadual do Norte do Paraná - UENP. No ambiente acadêmico trabalhou com projetos nas áreas de engenharia de software e gestão do conhecimento, internet das coisas e análise de sentimento no Twitter. Atualmente é aluno de mestrado na Universidade de São Paulo no programa de Pós-graduação em Ciência da Computação e Matemática Computacional e bolsistas da Fundação de Amparo à Pesquisa do Estado de São Paulo (FAPESP). No qual é membro de laboratório Intermídia, atuando nas áreas de redes de computadores e sistemas distribuídos, com ênfase na exploração da tecnologia de ledger distribuído (Blockchain) para melhoras aspectos de segurança e privacidade no compartilhamento de dados em sistemas médicos.', NULL, NULL, 'erikson-aguiar.png'),
(2, 'Roberto Elero Junior', 'Sistemas de Informação', 2015, NULL, 'iFood', 'Desenvolvedor Java', 'atualmente é desenvolvedor Java no iFood. É certificado pela Oracle com 8 anos de experiência em desenvolvimento web. Adquiriu suas experiências anteriores ao iFood fundando a primeira empresa júnior da Universidade do Norte do Paraná (UENP) e trabalhando como desenvolvedor Java na rede de supermercados Condor e na empresa de contabilidade online Contabilizei. Foi bolsista do programa Ciências sem Fronteiras, estudando Ciência da Computação na Universidade de Adelaide, Austrália Meridional, Austrália por 16 meses. É graduado em Sistemas de Informação na UENP. É apaixonado por empreendedorismo, resolução de problemas e música. ', NULL, NULL, 'roberto-elero.png'),
(3, 'Elielson Barbosa de Souza', 'Sistemas de Informação', 2014, NULL, 'TRT 15ª Região', 'Analista de TIC', 'É Bacharel em Sistemas de Informação e Licenciado em Computação pela Universidade Estadual do Norte do Paraná - Campus Luiz Meneghel, tem especialização (Lato Sensu) em Redes de Computadores pela Escola Superior Aberta do Brasil. Possui certificação ITIL® Foundation. Atualmente é Técnico Judiciário no Tribunal Regional do Trabalho da 15o Região atuando na Seção de Operações de Infraestrutura de TIC e graduando em Ciências Contábeis pelo Centro Universitário Estácio de Ribeirão Preto.', NULL, NULL, 'elielson-barbosa.png'),
(4, 'André Luiz de Oliveira', 'Sistemas de Informação', 2007, 'Mestrado em Ciência da Computação, Programa de Pós Graduação em Ciência da Computação, UFSCar, São Carlos, São Paulo. Ano de conclusão: 2010.	Doutorado em Ciência da Computação, Instituto de Ciências Matemáticas e de Computação da Universidade de São Paulo, São Carlos, São Paulo. Ano de conclusão: 2016.', 'UFJF', 'Docente e Pesquisador', 'Atualmente é Professor Adjunto do Departamento de Ciência da Computação da Universidade Federal de Juiz de Fora. Doutor em Ciência da Computação pelo Programa de Pós-Graduação em Ciência da Computação e Matemática Computacional do Instituto de Ciências Matemáticas e de Computação da Universidade de São Paulo (ICMC-USP São Carlos). Realizou pesquisa de pós-doutorado no Programa de Pós-Graduação em Ciência da Computação do ICMC-USP no período de Julho de 2016 à Agosto de 2017. Realizou estágio de doutorado sanduíche no Departamento de Ciência da Computação da University of York, no Reino Unido, no período de Maio de 2013 a Março de 2014, sob a supervisão do Prof. Timothy Patrick Kelly. Participou do projeto de pesquisa Instituto Nacional Ciência e Tecnologia em Sistemas Embarcados Críticos (INCT-SEC), de Março de 2011 à Março de 2014, resultando no trabalho de tese de doutorado sobre a proposta de uma abordagem de apoio ao reuso de artefatos de engenharia de confiabilidade aplicada à certificação de segurança de sistemas críticos. Participou do projeto de pesquisa: Infraestrutura de Apoio ao Reuso e Gerenciamento de Famílias de Frameworks Transversais, financiado pelo CNPq no período de Novembro de 2010 à Agosto de 2011. Mestre em Ciência da Computação pelo Programa de Pós-Graduação em Ciência da Computação da Universidade Federal de São Carlos, São Carlos-SP. Bacharel em Informática pela Universidade Estadual do Norte do Paraná (UENP), campus Luiz Meneghel, Bandeirantes-PR. Os seus interesses de pesquisa incluem: reuso e Engenharia de Linhas de Produtos de Software, gerenciamento de variabilidades, sistemas embarcados críticos, certificação de sistemas computacionais complexos, Desenvolvimento Dirigido a Modelos, Engenharia de Confiabilidade, tolerância a falhas, análise de propriedades de safety e security de sistemas computacionais, design optimization e Engenharia de Software Experimental. Possui colaborações com pesquisadores da Universidade de São Paulo, UNICAMP, MDH University/Suécia, Universidad Rey Juan Carlos/Espanha e das Universidades de York e de Hull, no Reino Unido, atuando no projeto Digital Dependability Identities (DEIS).', 'andre.oliveira@ice.ufjf.br', NULL, 'andre-luiz.png'),
(5, 'Guilherme Corredato Guerino', 'Sistemas de Informação', 2018, 'Mestrado em Informática - UFPR (Cursando)', 'UFPR', 'Mestrando', 'Formado em Sistemas de Informação/Licenciatura em Computação pela UENP em 2018, atualmente cursa mestrado em Informática pela UFPR, com foco em Interação Humano-Computador. Possui interesse na área de pesquisa em computação, com foco em Usabilidade, User eXperience e Interfaces Naturais de Usuário. Participa do grupo de pesquisa intitulado “Design de Interação para a inclusão e o desenvolvimento social”. ', NULL, NULL, 'guilherme-guerino.png'),
(6, 'Jéssica Aguiar', 'Sistemas de Informação', 2013, NULL, 'PwC Brasil', 'Auditoria', 'É graduada em Sistemas de Informação na UENP. Atualmente é Consultora Sênior da área de Riscos e Controles na PwC Brasil, atuando em trabalhos de auditoria e consultoria em gestão de riscos e controles internos em grandes empresas de diversos segmentos, incluindo a avaliação de controles internos para compliance com a lei SOx.', NULL, NULL, 'jessica-aguiar.png'),
(7, 'Estevan Braz Brandt Costa', 'Sistemas de Informação', 2010, 'Mestrado em Ciência da Computação na UEL', 'IFPR', 'Professor', 'Formado em 2010, comecei a trabalhar como docente na UENP em 2010, logo depois de me formar. Após 5 anos trabalhando na universidade, passei em um concurso no IFPR, onde ministro diversas disciplinas relacionadas a desenvolvimento de sistemas, além de ser coordenador do curso de informática por 3 anos.', NULL, NULL, 'estevan-braz.png'),
(8, 'Larissa Albano Lopes', 'Sistemas de Informação', 2015, 'Mestrado em Ciência da Computação (UFSCar)', 'PagSeguro/UOL', 'UX Design', 'Larissa Albano Lopes, 26 anos. Graduada em Sistemas de Informação pela UENP. É mestre em Ciência da Computação pela UFSCar. Passou pelas empresas Gympass e Accenture. Atualmente atua como UX Researcher e UX Designer na empresa PagSeguro UOL.', NULL, NULL, 'larissa-albano.png');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipo_oficina`
--

CREATE TABLE `tipo_oficina` (
  `id` int(11) NOT NULL,
  `descricao` varchar(50) NOT NULL,
  `vagas_limitadas` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tipo_oficina`
--

INSERT INTO `tipo_oficina` (`id`, `descricao`, `vagas_limitadas`) VALUES
(1, 'Palestra', 0),
(2, 'Minicurso', 1),
(3, 'Workshop', 1),
(4, 'Hands-On', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `oficina`
--
ALTER TABLE `oficina`
  ADD PRIMARY KEY (`id`),
  ADD KEY `participante_id` (`participante_id`),
  ADD KEY `tipo_oficina_id` (`tipo_oficina_id`);

--
-- Indexes for table `participante`
--
ALTER TABLE `participante`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tipo_oficina`
--
ALTER TABLE `tipo_oficina`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `oficina`
--
ALTER TABLE `oficina`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `participante`
--
ALTER TABLE `participante`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tipo_oficina`
--
ALTER TABLE `tipo_oficina`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `oficina`
--
ALTER TABLE `oficina`
  ADD CONSTRAINT `fk_participante_oficina` FOREIGN KEY (`participante_id`) REFERENCES `participante` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tipo_oficina` FOREIGN KEY (`tipo_oficina_id`) REFERENCES `tipo_oficina` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
