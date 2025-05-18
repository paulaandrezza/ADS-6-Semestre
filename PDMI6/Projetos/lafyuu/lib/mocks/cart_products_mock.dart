import 'package:lafyuu/models/cart_product.dart';

final List<CartProduct> cartProductsMock = [
  CartProduct(
    id: 1,
    imageUrl:
        'https://static.netshoes.com.br/produtos/tenis-nike-air-max-excee-feminino/14/2IC-1864-014/2IC-1864-014_zoom1.jpg',
    title: 'Nike Air Max Excee',
    price: 299.43,
    oldPrice: 350.00,
    discountPercent: 15,
    rating: 4,
    quantity: 1,
    isFavorite: true,
  ),
  CartProduct(
    id: 2,
    imageUrl: 'https://m.media-amazon.com/images/I/51206EEfBIL._AC_SY500_.jpg',
    title: 'Adidas Ultraboost 22',
    price: 289.99,
    oldPrice: 320.00,
    discountPercent: 10,
    rating: 5,
    quantity: 2,
    isFavorite: false,
  ),
  CartProduct(
    id: 3,
    imageUrl:
        'https://images.puma.com/image/upload/f_auto,q_auto,b_rgb:fafafa,w_450,h_450/global/376646/01/sv01/fnd/PNA/fmt/png',
    title: 'Puma Softride',
    price: 199.99,
    oldPrice: 250.00,
    discountPercent: 20,
    rating: 3,
    quantity: 1,
    isFavorite: true,
  ),
  CartProduct(
    id: 4,
    imageUrl:
        'https://static.netshoes.com.br/produtos/tenis-olympikus-voa-2-unissex/06/2I2-8236-006/2I2-8236-006_zoom1.jpg?ts=1699527640&ims=1088x',
    title: 'Olympikus Via Masculino',
    price: 179.90,
    oldPrice: 210.00,
    discountPercent: 15,
    rating: 4,
    quantity: 1,
    isFavorite: false,
  ),
];
