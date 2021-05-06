import 'package:flutter/material.dart';

class Startup {
  String id, name, description, sector;
  int foundationYear;
  bool wantsinvestment, wantsToHire;
  Startup(this.id, this.name, this.description, this.sector,
      this.foundationYear, this.wantsinvestment, this.wantsToHire);
  static final IconData iconData = Icons.store;
}

List<Startup> startupList = [
  Startup(
      '1234',
      'Nubank',
      'Você finalmente no controle do seu dinheiro. Controle total do cartão de crédito e da Nuconta 100% digital.',
      'Fintech',
      2013,
      false,
      true),
  Startup(
      '1235',
      'Quinto Andar',
      'QuintoAndar is a Brazilian technology company that was created to simplify the lives of those looking for a new home. We are changing the real estate market with a pioneering business model in the world. We have a lot of talented people working to ensure that thousands of people around Brazil live better. Our team already has over a thousand people and we have offices in São Paulo and Campinas. Our product is now available in more than 20 Brazilian cities.',
      'Real Estate',
      2012,
      true,
      true),
  Startup(
      '1236',
      'Loft',
      'A Loft é uma plataforma de compra e venda de imóveis residenciais usados, que garante liquidez imediata a proprietários e oferece a compradores espaços reformados de alta qualidade e prontos para se morar. A empresa alavanca tecnologia para avaliar os ativos de forma transparente, gerar propostas de compra justas e adquiri-los dos vendedores. A partir daí a Loft cria, executa o projeto de reforma e revende os imóveis com agilidade e eficiência.',
      'Real Estate',
      2018,
      false,
      true),
  Startup(
      '1237',
      'iFood',
      'O iFood é a foodtech líder da América Latina! Com 8 anos de atuação, tem o propósito de revolucionar o universo da alimentação por uma vida mais prática e prazerosa. São milhões de pedidos por mês em verdadeiras Black Fridays semanais, em um ambiente tecnológico inovador e o desafio do forte crescimento com nossos parceiros entregadores, restaurantes e clientes. O iFood conta com a participação da Movile - líder global em marketplaces móveis - e da Just Eat.',
      'Foodtech',
      2011,
      true,
      false),
];

Startup getStartup(String id) {
  final filterResult = startupList.where((s) => s.id == id);
  return filterResult.first;
}
