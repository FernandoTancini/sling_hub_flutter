import 'package:flutter/material.dart';

class Startup {
  String id, name, description, sector, imgUrl;
  int foundationYear;
  bool wantsinvestment, wantsToHire;
  Startup(this.id, this.name, this.description, this.sector, this.imgUrl,
      this.foundationYear, this.wantsinvestment, this.wantsToHire);
  static final IconData iconData = Icons.store;
}

List<Startup> startups = [
  Startup(
      '1234',
      'Nubank',
      'Você finalmente no controle do seu dinheiro. Controle total do cartão de crédito e da Nuconta 100% digital.',
      'Fintech',
      'https://api.slinghub.com.br/media/actor/b01646.png',
      2013,
      false,
      true),
  Startup(
      '1235',
      'Quinto Andar',
      'QuintoAndar is a Brazilian technology company that was created to simplify the lives of those looking for a new home. We are changing the real estate market with a pioneering business model in the world. We have a lot of talented people working to ensure that thousands of people around Brazil live better. Our team already has over a thousand people and we have offices in São Paulo and Campinas. Our product is now available in more than 20 Brazilian cities.',
      'Real Estate',
      'https://api.slinghub.com.br/media/actor/0_15.png',
      2012,
      true,
      true),
  Startup(
      '1236',
      'Loft',
      'A Loft é uma plataforma de compra e venda de imóveis residenciais usados, que garante liquidez imediata a proprietários e oferece a compradores espaços reformados de alta qualidade e prontos para se morar. A empresa alavanca tecnologia para avaliar os ativos de forma transparente, gerar propostas de compra justas e adquiri-los dos vendedores. A partir daí a Loft cria, executa o projeto de reforma e revende os imóveis com agilidade e eficiência.',
      'Real Estate',
      'https://api.slinghub.com.br/media/actor/b00123.png',
      2018,
      false,
      true),
  Startup(
      '1237',
      'iFood',
      'O iFood é a foodtech líder da América Latina! Com 8 anos de atuação, tem o propósito de revolucionar o universo da alimentação por uma vida mais prática e prazerosa. São milhões de pedidos por mês em verdadeiras Black Fridays semanais, em um ambiente tecnológico inovador e o desafio do forte crescimento com nossos parceiros entregadores, restaurantes e clientes. O iFood conta com a participação da Movile - líder global em marketplaces móveis - e da Just Eat.',
      'Foodtech',
      'https://api.slinghub.com.br/media/actor/ifoodlogonova.png',
      2011,
      true,
      false),
];

Startup getStartup(String id) {
  final filterResult = startups.where((s) => s.id == id);
  return filterResult.first;
}

class News {
  String id, relatedStartupId, title, body, url;
  bool notification;
  News(this.id, this.relatedStartupId, this.title, this.body, this.url,
      this.notification);
}

List<News> news = [
  News(
      '1',
      '1234',
      'Foi dada a largada: Nubank recebe aval do BC para comprar Easynvest',
      'Agora vai. O Nubank recebeu ontem (4) o sinal verde do Banco Central (BC) para compra da Easynvest, corretora digital com mais de 1,5 milhão de clientes e R\$26 bilhões de  ativos sob custódia, que tinha sido anunciada em setembro de 2020 [...]',
      'https://finsiders.com.br/2021/05/05/nubank-recebe-aprovacao-do-bc-para-comprar-easynvest/',
      true),
  News(
      '2',
      '1237',
      'iFood aposta em lojas de conveniência e \"banco de restaurantes\" para acelerar expansão',
      'SOPA Images/Getty Images Atualmente, o iFood presta serviços de pagamentos para cerca de 100 mil dos 250 mil restaurantes que atende \r\n O  iFood  está ampliando a aposta em lojas de conveniência e numa prateleira reforçada de serviços financeiros para restaurantes, tentando  capitalizar  novas oportunidades de negócios surgidas desde o ano passado com os efeitos da Covid-19. \r\n A ofensiva acontece cerca de um ano após o maior aplicativo de entrega de refeições do país ter iniciado entrega de itens de supermercado, uma vez que as medidas de isolamento tomadas para conter a pandemia impulsionaram o comércio digital no país. \r\n VEJA TAMBÉM: Cade proíbe iFood de fechar contratos de exclusividade com restaurantes \r\n Diante disso, o iFood entrou logo depois no segmento de  conveniência , plano que estava inicialmente previsto para este ano. Agora, com cerca de 5 mil pequenos mercados e lojas de conveniência distribuídos em 300 cidades, a companhia prevê multiplicar esse número por oito nos próximos 12 meses [...]',
      'https://forbes.com.br/forbes-money/2021/04/ifood-aposta-em-lojas-de-conveniencia-e-banco-de-restaurantes-para-acelerar-expansao/',
      true),
  News(
      '3',
      '1236',
      'Mexicana Casai chega ao Brasil para brigar com Housi, da Vitacon, e Nomah, da Loft',
      'O termo Casai surgiu como uma abreviação em espanhol para “casa inteligente”. Foi o nome que a proptech mexicana criou para definir sua proposta de oferecer uma plataforma digital de aluguel de apartamentos modernos com serviços de hotel, mas com aconchego. \r\n A ideia tem dado certo na Cidade do México, onde a empresa já tem 300 unidades disponíveis. E agora vai desembarcar também no Brasil. A startup lança sua operação local nesta terça-feira e escolheu São Paulo como o seu primeiro destino no País. \r\n O pontapé na operação será dado com 100 apartamentos inteligentes disponíveis para hospedagem. Antes da inauguração oficial, a empresa fez um período de testes com alguns clientes, que teve início no fim de 2020. \r\n “Nós surgimos no México, mas desde os primeiros dias sabíamos que logo iríamos para São Paulo”, conta o cofundador e CEO da Casai, Nico Barawid, ao  NeoFeed . “A cidade tem uma mistura importante de turismo e negócios que combina com a nossa proposta.” \r\n Antes de fundar a startup, Barawid trabalhou como head de negócios internacionais na fintech Nova Credit [...]',
      'https://neofeed.com.br/blog/home/mexicana-casai-chega-ao-brasil-para-brigar-com-housi-da-vitacon-e-nomah-da-loft/',
      true)
];
