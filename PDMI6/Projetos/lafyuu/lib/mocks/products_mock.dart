import 'package:lafyuu/models/product.dart';

final List<Product> productsMock = [
  Product(
    id: '1',
    imageUrl:
        'https://static.netshoes.com.br/produtos/tenis-nike-air-max-excee-feminino/14/2IC-1864-014/2IC-1864-014_zoom1.jpg',
    name: 'Nike Air Max Excee',
    description: 'Um tênis confortável e estiloso para o dia a dia.',
    price: 299.43,
    discount: 0.15,
    rating: 4,
    isFavorite: true,
  ),
  Product(
    id: '2',
    imageUrl: 'https://m.media-amazon.com/images/I/51206EEfBIL._AC_SY500_.jpg',
    name: 'Adidas Ultraboost 22',
    description: 'Um tênis confortável e estiloso para o dia a dia.',
    price: 289.99,
    discount: 0.1,
    rating: 5,
    isFavorite: false,
  ),
  Product(
    id: '3',
    imageUrl:
        'https://images.puma.com/image/upload/f_auto,q_auto,b_rgb:fafafa,w_450,h_450/global/376646/01/sv01/fnd/PNA/fmt/png',
    name: 'Puma Softride',
    description: 'Um tênis confortável e estiloso para o dia a dia.',
    price: 199.99,
    discount: 0.2,
    rating: 3,
    isFavorite: true,
  ),
  Product(
    id: '4',
    imageUrl:
        'https://static.netshoes.com.br/produtos/tenis-olympikus-voa-2-unissex/06/2I2-8236-006/2I2-8236-006_zoom1.jpg?ts=1699527640&ims=1088x',
    name: 'Olympikus Via Masculino',
    description: 'Um tênis confortável e estiloso para o dia a dia.',
    price: 179.90,
    discount: 0.15,
    rating: 4,
    isFavorite: false,
  ),
];
