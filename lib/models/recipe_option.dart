import 'package:equatable/equatable.dart';

class RecipeOption extends Equatable {
  final String id;
  final String title;
  final int price;

  RecipeOption(this.id, this.title, this.price);

  @override
  List<Object> get props => [title, price];
}

final List<RecipeOption> breadOptions = [
  RecipeOption('b0', '빵없음(샐러드)', 1000),
  RecipeOption('b1', '허니오트', 1000),
  RecipeOption('b2', '하티', 1000),
  RecipeOption('b3', '위트', 1000),
  RecipeOption('b4', '파마산 오레가노', 1000),
  RecipeOption('b5', '화이트', 1000),
  RecipeOption('b6', '플랫브레드', 1000),
];

final List<RecipeOption> meatOptions = [
  RecipeOption('m1', '햄', 1000),
  RecipeOption('m2', '페퍼로니', 1000),
  RecipeOption('m3', '살라미', 1000),
  RecipeOption('m4', '베이컨', 1000),
];

final List<RecipeOption> cheeseOptions = [
  RecipeOption('c1', '아메리칸 치즈', 1000),
  RecipeOption('c2', '슈레드 치즈', 1000),
  RecipeOption('c3', '모짜렐라 치즈', 1000),
];

final List<RecipeOption> vegetableOptions = [
  RecipeOption('v1', '양상추', 1000),
  RecipeOption('v2', '토마토', 1000),
  RecipeOption('v3', '오이', 1000),
  RecipeOption('v4', '피망', 1000),
  RecipeOption('v5', '양파', 1000),
  RecipeOption('v6', '피클', 1000),
  RecipeOption('v7', '올리브', 1000),
  RecipeOption('v8', '할라피뇨', 1000),
  RecipeOption('v9', '아보카도', 1000),
];

final List<RecipeOption> sauceOptions = [
  RecipeOption('s1', '와사비마요', 1000),
  RecipeOption('s2', '렌치드레싱', 1000),
  RecipeOption('s3', '마요네즈', 1000),
  RecipeOption('s4', '스위트어니언', 1000),
  RecipeOption('s5', '허니머스타드', 1000),
  RecipeOption('s6', '스위트칠리', 1000),
  RecipeOption('s7', '핫 칠리', 1000),
  RecipeOption('s8', '사우스웨스트', 1000),
  RecipeOption('s9', '머스타드', 1000),
  RecipeOption('s10', '홀스래디쉬', 1000),
  RecipeOption('s11', '올리브오일', 1000),
  RecipeOption('s12', '레드와인식초', 1000),
  RecipeOption('s13', '소금', 1000),
  RecipeOption('s14', '후추', 1000),
  RecipeOption('s15', '스모크바비큐', 1000),
];
