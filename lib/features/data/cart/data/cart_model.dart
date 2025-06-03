// features/cart/data/cart_model.dart
import 'package:hive_flutter/adapters.dart';

part 'cart_model.g.dart';


@HiveType(typeId: 0)
class CartModel extends HiveObject {
  CartModel({
    this.id,
    this.name,
    this.description,
    this.price,
    this.categoryId,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.productcount
  });
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? name;
  @HiveField(2)
  String? description;
  @HiveField(3)
  String? price;
  @HiveField(4)
  String? image;
  @HiveField(5)
  int? categoryId;
  @HiveField(6)
  String? createdAt;
  @HiveField(7)
  String? updatedAt;
   @HiveField(8)
  int? productcount;
}
