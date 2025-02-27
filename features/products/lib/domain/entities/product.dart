import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';

@freezed
abstract class Product with _$Product {
  const factory Product({
    required String id,
    required String imageUrl,
    required String title,
  }) = _Product;

  factory Product.empty() => Product(id: '', imageUrl: '', title: '');
}
