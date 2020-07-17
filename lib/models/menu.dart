import 'package:equatable/equatable.dart';

class SandylabsMenu extends Equatable {
  final String id;
  final String name;
  final String desc;
  final int calorie;
  final double price;

  SandylabsMenu(this.id, this.name, this.desc, this.calorie, this.price);

  @override
  List<Object> get props => [id, name, desc, calorie, price];
}

final List<SandylabsMenu> menus = [
  SandylabsMenu(
      'm1',
      '샌드위치',
      '7시간 숙성된 페퍼로니, 살라미 그리고 햄이 만들어내는 최상의 조화! 전세계가 사랑하는 No.1 베스트셀러!',
      410,
      4500),
  SandylabsMenu(
      'm2', '랩', '친환경 인증 받은 농장에서 생산된 달걀과 고소한 마요네즈가 만나 더 부드러운 스테디셀러', 520, 4500),
  SandylabsMenu(
      'm3', '샐러드', '남녀노소 누구나 좋아하는 담백한 참치와 고소한 마요네즈의 완벽한 조화', 200, 3000),
];