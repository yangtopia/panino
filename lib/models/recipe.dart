import 'package:equatable/equatable.dart';

class Recipe extends Equatable {
  final String name;
  final int price;
  final String desc;
  final String imgUrl;
  final String breadOptionId;
  final List<String> cheeseOptionIds;
  final List<String> vegetableOptionIds;
  final List<String> sauceOptionIds;

  Recipe(
    this.name,
    this.price, {
    this.desc,
    this.imgUrl,
    this.breadOptionId,
    this.cheeseOptionIds,
    this.vegetableOptionIds,
    this.sauceOptionIds,
  });

  @override
  List<Object> get props => [name, price];

  bool get isSalad => breadOptionId == null;
}

List<Recipe> privateMenuOptions = [
  Recipe('나의 샌드위치1', 4000, breadOptionId: 'b1'),
  Recipe('나의 샐러드1', 4000, breadOptionId: 'b0'),
];

List<Recipe> sandwichMenuOptions = [
  Recipe(
    '이탈리안 B.M.T',
    4000,
    desc: '7시간 숙성된 페퍼로니, 살라미 그리고 햄이 만들어내는 최상의 조화! 전세계가 사랑하는 No.1 베스트셀러!',
    breadOptionId: 'b1',
  ),
  Recipe(
    '비엘티',
    4000,
    desc: '오리지널 아메리칸 베이컨의 풍미와 바삭함 그대로~',
    breadOptionId: 'b1',
  ),
];

List<Recipe> saladMenuOptions = [
  Recipe(
    '로티세리 치킨 샐러드',
    5000,
    desc: '촉촉한 바비큐 치킨의 풍미가득. 손으로 찢어 더욱 부드러운 치킨이 찹 샐러드에 쏙',
    breadOptionId: 'b0'
  ),
  Recipe(
    '로스트 치킨 샐러드',
    5000,
    desc: '오븐에 구워 담백한 저칼로리 닭가슴살의 건강한 풍미',
    breadOptionId: 'b0'
  ),
];
