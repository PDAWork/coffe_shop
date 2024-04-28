enum Coffee {
  americano(price: 275, name: 'Американо', iconPath: 'images/americano.svg'),
  latte(price: 330, name: 'Латте', iconPath: 'images/latte.svg'),
  espresso(price: 150, name: 'Эспрессо', iconPath: 'images/espresso.svg'),
  macchiato(price: 365, name: 'Макиато', iconPath: 'images/macchiato.svg'),
  lungo(price: 350, name: 'Лунго', iconPath: 'images/lungo.svg'),
  corretto(price: 365, name: 'Корретто', iconPath: 'images/corretto.svg'),
  espressoRomano(
      price: 200,
      name: 'Эспрессо Романо',
      iconPath: 'images/espresso_romano.svg'),
  galao(price: 330, name: 'Галан', iconPath: 'images/galao.svg');

  const Coffee({
    required this.price,
    required this.name,
    required this.iconPath,
  });

  final int price;
  final String name;
  final String iconPath;
}
