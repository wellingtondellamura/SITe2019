-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 01-Ago-2019 às 05:18
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
-- Estrutura da tabela `inscricao`
--

CREATE TABLE `inscricao` (
  `id` int(11) NOT NULL,
  `nome` varchar(200) NOT NULL,
  `apelido` varchar(50) DEFAULT NULL,
  `cpf` varchar(14) NOT NULL,
  `email` varchar(200) NOT NULL,
  `data_nascimento` date NOT NULL,
  `telefone` varchar(25) NOT NULL,
  `endereco` varchar(500) NOT NULL,
  `bairro` varchar(100) NOT NULL,
  `complemento` varchar(100) NOT NULL,
  `cidade` varchar(200) NOT NULL,
  `estado` varchar(2) NOT NULL,
  `cep` varchar(10) NOT NULL,
  `perfil_id` int(11) NOT NULL,
  `curso_id` int(11) NOT NULL,
  `instituicao` varchar(500) NOT NULL,
  `data_inscricao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip_origem` varchar(50) DEFAULT NULL,
  `pago` tinyint(1) NOT NULL DEFAULT '0',
  `isento` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `inscricao_oficina`
--

CREATE TABLE `inscricao_oficina` (
  `id` int(11) NOT NULL,
  `inscricao_id` int(11) NOT NULL,
  `oficina_id` int(11) NOT NULL,
  `data_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `confirmado` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `local`
--

CREATE TABLE `local` (
  `id` int(11) NOT NULL COMMENT 'id',
  `descricao` varchar(150) NOT NULL COMMENT 'descrição',
  `capacidade` int(11) NOT NULL DEFAULT '0' COMMENT 'capacidade',
  `endereco` varchar(300) DEFAULT NULL COMMENT 'endereço',
  `foto` varchar(500) DEFAULT NULL COMMENT 'foto',
  `localizacao` varchar(500) DEFAULT NULL COMMENT 'localização'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Locais em que as oficinas serão realizadas';

--
-- Extraindo dados da tabela `local`
--

INSERT INTO `local` (`id`, `descricao`, `capacidade`, `endereco`, `foto`, `localizacao`) VALUES
(1, 'Auditório Tomaz Nicoletti', 1000, 'Rodovia BR 369, s/n Km 54. UENP. Vila Maria. Bandeirantes-PR', NULL, '-23.107871, -50.358918'),
(2, 'Laboratório de Informática 1 - CLM/UENP', 25, 'Prédio Central - UENP Campus Luiz Meneghel', NULL, '-23.1066007,-50.360525'),
(3, 'Laboratório de Informática 2 - CLM/UENP', 25, 'Prédio Central - UENP Campus Luiz Meneghel', NULL, '-23.1066007,-50.360525'),
(4, 'Laboratório de Informática 3 - CLM/UENP', 35, 'Prédio Central - UENP Campus Luiz Meneghel', NULL, '-23.1066007,-50.360525'),
(5, 'Laboratório de Informática 4 - CLM/UENP', 30, 'Prédio Central - UENP Campus Luiz Meneghel', NULL, '-23.1066007,-50.360525');

-- --------------------------------------------------------

--
-- Estrutura da tabela `oficina`
--

CREATE TABLE `oficina` (
  `id` int(11) NOT NULL,
  `titulo` varchar(500) NOT NULL,
  `descricao` varchar(5000) DEFAULT NULL,
  `foto` varchar(500) DEFAULT NULL,
  `participante_id` int(11) NOT NULL,
  `tipo_oficina_id` int(11) NOT NULL,
  `vagas` int(11) NOT NULL DEFAULT '20',
  `prerequisitos` varchar(1000) NOT NULL DEFAULT 'Nenhum',
  `carga_horaria` int(11) NOT NULL DEFAULT '4'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `oficina`
--

INSERT INTO `oficina` (`id`, `titulo`, `descricao`, `foto`, `participante_id`, `tipo_oficina_id`, `vagas`, `prerequisitos`, `carga_horaria`) VALUES
(1, 'Fundamentos e desafios do blockchain 3.0', 'A tecnologia blockchain é um tópico que vem sendo muito explorado nos últimos anos, devido ao crescimento das criptomoedas, tal como Bitcoin, Ether, Ripple e outras. Desde seu surgimento o blockchain passou por diversas transformações, inicialmente apenas registrando transações financeiras (blockchain 1.0), posteriormente adicionado inteligência as transações por meio de contratos inteligentes (blockchain 2.0) e atualmente pode ser aplicado em diversos cenários (blockchain 3.0). Desse modo, esta palestra tem o objetivo de apresentar e discutir sobre os conceitos básicos do blockchain, protocolos de consenso, desafios da área, tecnologias para implementação e possíveis ambientes de aplicação.', 'palestra.jpg', 1, 1, 0, '', 4),
(2, 'Migrando microsserviços legados com segurança', 'Nesta palestra eu apresentarei uma experiência de migração de um microsserviço legado que se tornava cada vez menos eficaz para uma versão nova mais performática e de fácil manutenção, e como testes de integração e orientação a eventos me auxiliaram a alcançar meu objetivo de forma segura.', 'palestra.jpg', 2, 1, 0, '', 4),
(3, 'Docker: Administrando Containers', 'Este curso irá abordar a famosa tecnologia de containers, já adotada por grandes empresas como Paypal, Visa, Spotify, Netflix, entre outras. O docker é uma plataforma de software que permite a criação, o teste e a implantação de aplicações rapidamente, ele cria pacotes de software em unidades padronizadas chamadas de contêineres que têm tudo o que o software precisa para ser executado, inclusive bibliotecas, ferramentas de sistema, código e runtime. Ao usar o docker, é possível implantar e escalar rapidamente aplicações em qualquer ambiente e ter a certeza de que o seu código será executado. Fundamentos, práticas e ferramentas serão expostas com o objetivo do aluno ser capaz de: entender o funcionamento do docker, executar deploy de aplicações em containers, criar e gerenciar containers, criar e gerenciar imagens, criar e gerenciar clusters de docker e criar sistemas de arquivos de rede escalável.', 'docker.png', 3, 2, 20, 'Nenhum', 4),
(4, 'Simplificando testes de integração com Docker', 'Neste minicurso eu procuro apresentar como testes de integração podem ser mais simples usando o Docker, criando um ecossistema de aplicações que representa bem o ambiente de produção durante a construção do projeto.', 'docker-plus-maven.png', 2, 2, 20, 'Nenhum', 4),
(5, 'Engenharia de Linha de Produtos de Software e Modelagem de Features', 'A Engenharia de Linha de Produtos de Software (LPS) fornece uma solução para o problema de reuso sistemático e em larga-escala de artefatos como requisitos, design e código fonte. Neste minicurso será apresentada uma introdução ao processo de Engenharia de LPS, modelagem de domínio utilizando o modelo de features, que é uma forma de modelagem de variabilidade de software. Será apresentada uma demonstração da utilidade de modelos de features na resolução de problemas de reuso e como melhorar o reuso de artefatos de design como fragmentos de um diagrama de classes UML com o apoio de um modelo de features. A demonstração dos conceitos de modelagem e gerenciamento de variabilidades será realizada com o apoio de Base Variability Resolution (BVR). BVR é uma ferramenta de apoio à engenharia de LPS de código aberto e baseada na plataforma Eclipse. Os conceitos de modelagem e gerenciamento de variabilidades também são aplicáveis ao reuso de outros artefatos como requisitos, casos de teste e código fonte.', 'product-line.jpg', 4, 2, 20, 'Nenhum', 4),
(6, 'Revisão e Mapeamento Sistemático da Literatura em Ciência Computação.', 'Todo bom trabalho acadêmico necessita de uma boa revisão de literatura. Historicamente, há diversas formas para se realizar essa revisão, e a Revisão Sistemática da Literatura (RSL), nos últimos anos, tem se mostrado um dos melhores processos em termos de estrutura, confiabilidade e redução de viés. A RSL é um tipo de estudo secundário, cujo processo de pesquisa segue um conjunto de passos metodologicamente bem definidos de acordo com um protocolo prévio e cuja adoção procura reduzir o viés inerente a uma revisão informal. O objetivo deste minicurso é explicar um tipo de RSL (Mapeamento Sistemático) e exemplificar o seu processo por completo. Serão abordados tópicos em Ciência da Computação que serão utilizados para seguir todo o processo. Ao final do minicurso, espera-se que os ouvintes compreendam o processo de uma RSL e que possam realizá-la em suas pesquisas acadêmicas. ', 'research.jpg', 5, 2, 20, 'Nenhum', 4),
(7, 'Auditoria: uma alternativa de carreira para profissionais de TI', 'Nesta palestra você vai entender o que é auditoria, qual sua importância na sociedade e como profissionais de TI podem se destacar nesta área de atuação.', 'palestra.jpg', 6, 1, 0, '', 4),
(8, 'De estudante a professor – UENP ajudando a criar feras', 'Esta palestra é totalmente direcionada para os alunos que estão cursando Sistemas de Informação e, como eu um dia, perguntam “será que essa disciplina de psicologia vai me ajudar algum dia?”. Quais as vantagens e dificuldades de ser um professor de informática.', 'palestra.jpg', 7, 1, 0, '', 4),
(9, 'UX Design: como inserir no processo de desenvolvimento e como começar nessa carreira', 'UX (User Experience – Experiência do Usuário) Design trata-se de projetar experiências de uso colocando o usuário no centro do desenvolvimento. Assim, garantindo utilidade, facilidade de uso e prazer no uso de um produto. Mas como fazer isso? Quais técnicas utilizar? Como começar? Falaremos um pouco sobre isso e sobre a carreira de um UX Design.', 'palestra.jpg', 8, 1, 0, '', 4),
(10, 'Service Design: criando um serviço do zero a partir de um desafio', 'Service Design trabalha para entender o perfil dos consumidores, seus desejos e suas necessidades a fim de garantir que determinado serviço seja competitivo para o mercado e relevante para quem o usa.\r\n\r\n“Quando você tem duas cafeterias, uma ao lado da outra, e elas vendem exatamente o mesmo café, exatamente ao mesmo preço, Design de Serviços é o que faz você entrar em uma e não na outra.”\r\n\r\nNesse curso abordaremos: \r\n- O conceito de design de serviço e design centro no ser humano; \r\n- Como iniciar um projeto de service design;\r\n- Visão geral de pesquisa com usuário;\r\n- Mapeamento da jornada do usuário;\r\n- Prototipação.\r\n', 'service-design.jpg', 8, 2, 20, 'Nenhum', 4),
(11, 'Construindo contratos inteligentes com o Hyperledger Fabric', 'A tecnologia blockchain é um tópico que vem ganhando grande atenção nos últimos anos, devido as suas características que podem prover maior segurança, audibilidade e imutabilidade dos dados em sistemas computacionais. As criptomoedas, como Bitcoin, Ether, e a mais nova Facebook Libra, também contribuem para o grande sucesso dessa tecnologia. Desse modo, as grandes empresas como IBM, estão investindo nessa tecnologia, para facilitar o processo de construção de redes baseadas em blockchain e contratos inteligentes. Logo este minicurso tem o objetivo de apresentar de maneira introdutória a plataforma IBM Hyperledger Fabric, que auxilia no processo de construção de contratos inteligentes. Discutindo e apresentando o passo a passo de implementação de uma rede blockchain, no qual espera-se como produto final uma aplicação rodando a partir da própria rede blockchain dos alunos.', 'hyperledger.jpg', 1, 2, 20, 'Nenhum', 4),
(12, 'Softskills: habilidades que você precisa ter para se destacar', 'as habilidades socioemocionais e profissionais consideradas indispensáveis estão cada vez mais amplas em um mercado que cresce e evolui constantemente. Somente competências técnicas não são mais suficientes para você crescer e se destacar. Atualmente, tanto empresas tradicionais quanto startups empregam seus esforços para encontrar profissionais com habilidades diferenciadas e que contribuam para o sucesso mútuo. Nesta palestra você vai saber quais são essas competências, entender um pouco mais sobre elas e como fazer para torná-las parte do seu dia a dia.', 'palestra.jpg', 9, 1, 0, '', 4),
(13, 'Reconhecimento e Sumarização de Emoções em Vídeo', 'Apresentar diferentes abordagens para o reconhecimento de emoções em vídeo tendo foco principal em expressões faciais. Além do reconhecimento de emoções, a palestra irá apresentar o estado da arte em relação a métodos de sumarização de vídeo com base em informação emocional, além de tendências e desafios que podem ser explorados nesse contexto.', 'palestra.jpg', 10, 1, 0, '', 4),
(14, 'Bate papo sobre a PwC, Auditoria de Sistemas e Processos', 'No ambiente de negócios atual, as áreas de TI e relatórios financeiros estão se tornando mais complexas e as empresas dependem cada vez mais das informações produzidas por esses sistemas e processos. Além disso, novos regulamentos nacionais têm dado mais ênfase aos controles internos e, muitas vezes, exigem uma asseguração independente da sua eficácia.\r\nO design, a documentação e a operação dos controles precisam receber uma atenção especial para garantir a precisão e a tempestividade das informações usadas nos relatórios financeiros e nas decisões da administração.', 'palestra.jpg', 11, 1, 0, '', 4),
(15, 'Business Intelligence na pratica', 'O Power BI é a solução de Business Intelligence (BI)) da Microsoft. Uma ferramenta que permite compartilhar dados, dashboards e relatórios em toda sua companhia de uma maneira simples. Uma de suas grandes vantagens é que consegue se conectar com quase todas as fontes de dados existentes. O minicurso trará algumas informações a respeito da ferramenta e como aplicá-la no geral e na construção de dashboards.', 'power-bi.png', 12, 2, 20, 'Nenhum', 4),
(16, 'Inteligência Artificial e Mineração de dados Educacionais – Perspectivas sobre o e-learning e ferramentas.', 'Com o crescente uso de Ambientes Virtuais de Aprendizagem (AVA) na Web e outras tecnologias para apoio ao processo de ensino e aprendizagem, um grande volume de dados tem sido gerado a partir das diferentes modalidades de interação no sistema envolvendo principalmente estudantes e professores. Entretanto, boa parte desses dados não têm sido analisados, o que se constitui numa lacuna importante, dada a quantidade de informação valiosa que se pode potencialmente extrair de tais dados. Por exemplo, em busca de melhor compreender o comportamento dos estudantes e a forma como eles aprendem, o trabalho realizado por pesquisadores em Mineração de Dados Educacionais tem investido no uso e na melhoria de conhecidas técnicas de mineração de dados para obter conhecimentos relevantes a partir desses dados. Tais conhecimentos podem servir de subsídio para a melhoria das práticas em educação a distância ou presencial, além de ser uma importante ferramenta para viabilizar a personalização do ensino.', 'palestra.jpg', 13, 1, 0, 'Nenhum', 4),
(17, 'Visão geral sobre Analytics e suas capacidades', 'O objetivo do minicurso é apresentar uma visão geral sobre Analytics e seus os principais conceitos, dentre eles destacam-se Business Intelligence, Self-Service Analytics, Data Science e Artificial Intelligence.\r\n\r\nQuestões sobre a evolução desses conceitos serão abordadas, demonstrando o estado atual e as perspectivas de um futuro próximo para as tecnologias envolvidas.\r\n\r\nTambém será apresentada a ferramenta Power BI, uma das mais conceituadas no seguimento de Data Visualization. A ideia é explorar suas principais funcionalidades junto com os alunos do minicurso.\r\n\r\nAo final deste processo interativo, os alunos estarão aptos a criar dashboards intuitivos e dinâmicos, adquirindo habilidades para utilizar diversos componentes como gráficos, indicadores, mapas, tabelas e segmentações.    \r\n\r\n', 'analytics.png', 14, 2, 20, 'Não é necessário, mas noções básicas de Business Intelligence podem ajudar ao longo do minicurso.\r\n', 8),
(18, 'Git, Github e como montar um portfólio', 'TBA', 'git-github.png', 15, 2, 20, 'Basta ter um contato prévio com qualquer linguagem de programação', 8),
(19, 'Programador “Full Stack”', 'TBA', 'full-stack.png', 7, 2, 20, 'Nenhum', 8),
(20, 'Java Server Faces com Primefaces e Hibernate', 'TBA', 'jsf-pf.png', 7, 2, 20, 'Nenhum', 8),
(21, 'Criação de Games utilizando Construct 3', 'TBA', 'construct.png', 7, 2, 20, 'Nenhum', 8),
(22, 'Programação para Maratona de Programação', 'TBA', 'maratona.png', 7, 2, 20, 'Nenhum', 4);

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
(8, 'Larissa Albano Lopes', 'Sistemas de Informação', 2015, 'Mestrado em Ciência da Computação (UFSCar)', 'PagSeguro/UOL', 'UX Design', 'Larissa Albano Lopes, 26 anos. Graduada em Sistemas de Informação pela UENP. É mestre em Ciência da Computação pela UFSCar. Passou pelas empresas Gympass e Accenture. Atualmente atua como UX Researcher e UX Designer na empresa PagSeguro UOL.', NULL, NULL, 'larissa-albano.png'),
(9, 'Valmir Luiz Marques', 'Sistemas de Informação', 2005, 'Mestre em computação aplicada – UTFPR - 2018', 'Softplan', 'Desenvolvimento de Sistemas para gestão pública', 'Graduado em Sistemas de informação pela UENP, com especialização em Tecnologia Java pela UTFPR e mestrado em computação aplicada pela UTFPR. Profissional com mais de 14 anos de experiência no mercado de tecnologia da informação participando e gerenciando grandes equipes de desenvolvimento em projetos para o setor financeiro e setor público. Atualmente é Gerente de desenvolvimento na Softplan, onde dirige um time de 140 profissionais que atuam em diversos projetos com foco em transformação digital para o setor público.\r\n', NULL, NULL, 'valmir-marques.png'),
(10, 'André Roberto Ortoncelli', 'Sistemas de Informação', 2009, 'Mestrado em Ciência da Computação (UEM) e Doutorado em Informática (em andamento na UFPR-Curitiba)\r\n', 'UTFPR', 'Professor Universitário', 'Possui graduação em Sistemas de Informação e Licenciatura em Computação pela Universidade Estadual do Norte do Paraná (2009), especialização em Engenharia de Software e Banco de Dados pela Universidade Estadual de Londrina (2011), mestrado em Ciência da Computação, pela Universidade Estadual de Maringá (2013). Atualmente trabalha como professor na Universidade Tecnológica Federal do Paraná (Câmpus Dois Vizinhos), é doutorando em Informática pela Universidade Federal do Paraná e é professor na especialização em Tecnologia Java ofertado pelo Câmpus Cornélio Procópio da UTFPR. A linha de pesquisa principal é visão computacional, mas também têm desenvolvido projetos relacionados a melhoria de processo em empresa de desenvolvimento de software.', NULL, NULL, 'andre-ortoncelli.png'),
(11, 'Amanda Alves Pinheiro Negendank', 'Sistemas de Informação', 2007, NULL, 'PwC', 'Auditoria e Consultoria', 'Amanda é Senior Manager da área de Riscos e Controles Internos na PwC Brasil, com 11 anos de experiência em serviços de Auditoria Interna, Consultoria e Suporte a Auditoria Externa em governança e gestão de riscos e controles internos. \r\nGraduada em Sistemas de Informação pela Universidade Estadual do Norte do Paraná (UENP) e pós-graduada em redes de computadores pela Faculdade Estácio de Sá.\r\nPossui intensa atividade em mapeamento de riscos e controles nos processos organizacionais, na avaliação de controles e riscos em ambientes de TI, bem como riscos de acessos críticos e segregação de funções.\r\nPossui experiência em auditoria de sistemas de informação, com foco em boas práticas de mercado: COSO, Cobit e ITIL.\r\nParticipa e gerencia projetos de avaliação de controles automáticos e de configuração no SAP com foco em controles de TI.\r\nTambém participa de projetos de consultoria em revisão e redesenho de perfis de acesso, com foco em minimizar a necessidade de controles compensatórios, buscando as alternativas necessárias para eliminar os conflitos de segregação de funções e acessos críticos.\r\nNa PwC a Amanda é Instrutora de treinamentos, incluindo o treinamento SAP ITGC (auditoria de controles de TI no ERP SAP).\r\n', NULL, NULL, 'amanda-alves.png'),
(12, 'Ítalo Ruy Fernandes', 'Sistemas de Informação', 2013, 'Mestrado em Agronomia (UENP)', 'AITEC/UENP', 'Business Intelligence', 'Graduado na UENP, 30 anos, participei de projetos na Petrobras, Caixa Econômica Federal, no ano de 2017 acompanhei a implementação de um projeto de BI envolvendo 6 países da América Latina por meio da empresa ATOS localizada em Londrina.\r\nPrezo por um bom livro e a pratica de esportes.', NULL, NULL, 'italo-fernandes.png'),
(13, 'Vanessa Faria de Souza', 'Sistemas de Informação', 2011, 'Mestrado: MESTRADO EM INFORMÁTICA ÁREA DE CONCENTRAÇÃO COMPUTAÇÃO APLICADA PELO PPGI – UTFPR/CAMPUS CORNÉLIO PROCÓPIO\r\nDoutorado: DOUTORADO EM ANDAMENTO PELO PPGIE (PROGRAMA DE PÓS-GRADUAÇÃO EM INFORMÁTICA NA EDUCAÇÃO) – UFRGS (UNIVERSIDADE FEDERAL DO RIO GRANDE DO SUL)', 'IFRS', 'Docente', 'Mestre em Informática pelo PPGI (Programa de Pós-Graduação em Informática) da Universidade Tecnológica Federal do Paraná (UTFPR), na área de Computação Aplicada, e ênfase em Engenharia de Software. Possuo especialização em Educação Especial Inclusiva, com ênfase em Tecnologia Assistiva. Sou graduada em Sistemas de Informação pela Universidade Estadual do Norte do Paraná (2011). Completei a Licenciatura em Matemática, pela UTFPR. Estou cursando o Doutorado no Programa de Pós Graduação em Informática na Educação pela Universidade Federal do Rio Grande do Sul (UFRGS)\r\nAtualmente sou professora dedicação exclusiva no Instituto Federal do Rio Grande do Sul, Campus Ibirubá nos Cursos de Ciência da Computação, Especialização em Linguagens e suas Tecnologias e no Técnico em Informática Integrado do Ensino Médio o qual estou atualmente como Coordenadora.\r\n\r\nTambém já atuei como Professora do Magistério Superior na Universidade Estadual do Norte do Paraná(UENP) nos cursos de Graduação Ciência da Computação e Sistemas de informação, nas disciplinas de Sistemas Digitais, Projeto e Análise de Algoritmo, Tópicos Avançados em Computação, Computação Simbólica e Numérica, Metodologia Científica. Assim como na UTFPR. Também já atuei como professora de Matemática no Ensino Básico.', NULL, NULL, 'vanessa-faria.png'),
(14, 'Thiago Muzardo dos Santos', 'Sistemas de Informação', 2010, 'Especialização em Tecnologia Java (UTFPR – Universidade Tecnológica Federal do Paraná)', 'TO Brasil', 'Consultor Analytics/EPM', 'Com aproximadamente 10 anos de experiência no mercado, combino experiências em Soluções de Negócios e Tecnologia da Informação. Tive a oportunidade de atuar em projetos de diversos segmentos como óleo e gás, finanças, transportes, varejo, instituições de ensino, entre outros. Neste período, participei de atividades relacionadas à fábrica de software e pude me especializar na consultoria e desenvolvimento de projetos de Analytics e EPM.', NULL, NULL, 'thiago-muzardo.png'),
(15, 'Wellington Della Mura', 'Sistemas de Informação', 2007, 'Mestrado em Ciência da Computação', 'UENP', 'Professor', 'Bacharel em Sistemas de Informação e Licenciado em Computação pela Universidade Estadual do Norte do Paraná (2007), Especialista em Tecnologia Java pela Universidade Tecnológica Federal do Paraná (2009) e Mestre em Ciência da Computação pela Universidade Estadual de Londrina (2016). Atualmente é professor colaborador no Centro de Ciências Tecnológicas da Universidade Estadual do Norte do Paraná. Tem experiência nas áreas de Sistemas de Informação e Ciência da Computação, com ênfase em Linguagem Formais e Autômatos, Teoria da Computação e Desenvolvimento de Sistemas, atuando principalmente nos seguintes temas: Verificação formal, Teste baseado em modelos e Contratos Eletrônicos. ', NULL, NULL, 'wellington-della-mura.png');

-- --------------------------------------------------------

--
-- Estrutura da tabela `programacao`
--

CREATE TABLE `programacao` (
  `id` int(11) NOT NULL,
  `descricao` varchar(100) NOT NULL,
  `oficina_id` int(11) DEFAULT NULL,
  `data` datetime NOT NULL,
  `duracao` int(11) NOT NULL DEFAULT '60'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `programacao`
--

INSERT INTO `programacao` (`id`, `descricao`, `oficina_id`, `data`, `duracao`) VALUES
(1, 'Parte 1', 3, '2019-08-22 08:00:00', 240),
(2, 'Parte 2', 3, '2019-08-22 13:00:00', 240),
(3, 'Parte 3', 3, '2019-08-23 08:00:00', 240),
(4, 'Parte 4', 3, '2019-08-23 13:00:00', 240),
(5, 'Parte 1', 11, '2019-08-19 19:00:00', 220),
(6, 'Parte 2', 11, '2019-08-20 19:00:00', 220),
(7, 'Parte 1', 18, '2019-08-19 19:00:00', 220),
(8, 'Parte 2', 18, '2019-08-20 19:00:00', 220),
(9, 'Parte 1', 17, '2019-08-21 08:00:00', 240),
(10, 'Parte 1', 19, '2019-08-21 08:00:00', 240),
(11, 'Parte 2', 17, '2019-08-21 14:00:00', 240),
(12, 'Parte 2', 19, '2019-08-21 14:00:00', 240),
(13, 'Parte 1', 20, '2019-08-22 08:00:00', 240),
(14, 'Parte 2', 20, '2019-08-22 14:00:00', 240),
(15, '', 6, '2019-08-23 08:00:00', 240),
(16, 'Parte 1', 21, '2019-08-23 08:00:00', 240),
(17, 'Parte 2', 21, '2019-08-23 14:00:00', 240),
(18, '', 15, '2019-08-23 14:00:00', 240),
(19, '', 22, '2019-08-24 08:00:00', 240),
(20, '', 4, '2019-08-24 08:00:00', 240),
(21, '', 10, '2019-08-24 08:00:00', 240),
(22, '', 5, '2019-08-24 08:00:00', 240);

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
(4, 'Hands-On', 0),
(5, 'Programação', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `inscricao`
--
ALTER TABLE `inscricao`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cpf` (`cpf`);

--
-- Indexes for table `inscricao_oficina`
--
ALTER TABLE `inscricao_oficina`
  ADD PRIMARY KEY (`id`),
  ADD KEY `inscricao_id` (`inscricao_id`),
  ADD KEY `oficina_id` (`oficina_id`);

--
-- Indexes for table `local`
--
ALTER TABLE `local`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `programacao`
--
ALTER TABLE `programacao`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oficina_id` (`oficina_id`);

--
-- Indexes for table `tipo_oficina`
--
ALTER TABLE `tipo_oficina`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `inscricao`
--
ALTER TABLE `inscricao`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inscricao_oficina`
--
ALTER TABLE `inscricao_oficina`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `local`
--
ALTER TABLE `local`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id', AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `oficina`
--
ALTER TABLE `oficina`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `participante`
--
ALTER TABLE `participante`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `programacao`
--
ALTER TABLE `programacao`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `tipo_oficina`
--
ALTER TABLE `tipo_oficina`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `inscricao_oficina`
--
ALTER TABLE `inscricao_oficina`
  ADD CONSTRAINT `inscricao_oficina_ibfk_1` FOREIGN KEY (`inscricao_id`) REFERENCES `inscricao` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `inscricao_oficina_ibfk_2` FOREIGN KEY (`oficina_id`) REFERENCES `oficina` (`id`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `oficina`
--
ALTER TABLE `oficina`
  ADD CONSTRAINT `fk_participante_oficina` FOREIGN KEY (`participante_id`) REFERENCES `participante` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tipo_oficina` FOREIGN KEY (`tipo_oficina_id`) REFERENCES `tipo_oficina` (`id`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `programacao`
--
ALTER TABLE `programacao`
  ADD CONSTRAINT `programacao_ibfk_1` FOREIGN KEY (`oficina_id`) REFERENCES `oficina` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
