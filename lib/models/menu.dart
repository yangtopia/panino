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
