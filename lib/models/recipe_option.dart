class RecipeOption {
  String title;
  double price;
}

class BreadOption implements RecipeOption {
  @override
  String title;

  @override
  double price;

  BreadOption(this.title, this.price);
}

class CheeseOption implements RecipeOption {
  @override
  String title;

  @override
  double price;

  CheeseOption(this.title, this.price);
}

class VegetableOption implements RecipeOption {
  @override
  double price;

  @override
  String title;

  VegetableOption(this.title, this.price);
}

class SauceOption implements RecipeOption {
  @override
  double price;

  @override
  String title;

  SauceOption(this.title, this.price);
}

final List<BreadOption> breadOptions = [
  BreadOption('허니오트', 1000),
  BreadOption('하티', 1000),
  BreadOption('위트', 1000),
  BreadOption('파마산 오레가노', 1000),
  BreadOption('화이트', 1000),
  BreadOption('플랫브레드', 1000),
];

final List<CheeseOption> cheeseOptions = [
  CheeseOption('아메리칸 치즈', 1000),
  CheeseOption('슈레드 치즈', 1000),
  CheeseOption('모짜렐라 치즈', 1000),
];

final List<VegetableOption> vegetableOptions = [
  VegetableOption('양상추', 1000),
  VegetableOption('토마토', 1000),
  VegetableOption('오이', 1000),
  VegetableOption('피망', 1000),
  VegetableOption('양파', 1000),
  VegetableOption('피클', 1000),
  VegetableOption('올리브', 1000),
  VegetableOption('할라피뇨', 1000),
  VegetableOption('아보카도', 1000),
];

final List<SauceOption> sauceOptions = [
  SauceOption('와사비마요', 1000),
  SauceOption('렌치드레싱', 1000),
  SauceOption('마요네즈', 1000),
  SauceOption('스위트어니언', 1000),
  SauceOption('허니머스타드', 1000),
  SauceOption('스위트칠리', 1000),
  SauceOption('핫 칠리', 1000),
  SauceOption('사우스웨스트', 1000),
  SauceOption('머스타드', 1000),
  SauceOption('홀스래디쉬', 1000),
  SauceOption('올리브오일', 1000),
  SauceOption('레드와인식초', 1000),
  SauceOption('소금', 1000),
  SauceOption('후추', 1000),
  SauceOption('스모크바비큐', 1000),
];
