import 'package:json_annotation/json_annotation.dart';

part 'home_model.g.dart';

@JsonSerializable()
class HomeModel {
  final int id;
  final String name;
  final double price;
  final String image;

  HomeModel({required this.id, required this.name, required this.price, required this.image});

  factory HomeModel.fromJson(Map<String, dynamic> json) => _$HomeModelFromJson(json);

  Map<String, dynamic> toJson() => _$HomeModelToJson(this);
}
