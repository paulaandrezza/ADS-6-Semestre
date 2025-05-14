import 'package:lafyuu/models/favorite_product.dart';

final List<FavoriteProduct> favoriteProductsMock = [
  FavoriteProduct(
    id: 1,
    imageUrl:
        'https://static.netshoes.com.br/produtos/tenis-nike-air-max-excee-feminino/14/2IC-1864-014/2IC-1864-014_zoom1.jpg?ts=1747080745&ims=1088x',
    title: 'Nike Air Max',
    price: 120.0,
    oldPrice: 150.0,
    discountPercent: 20,
    rating: 4,
    showDeleteIcon: true,
    onDelete: () {
      print('Produto removido dos favoritos');
    },
  ),
  FavoriteProduct(
    id: 2,
    imageUrl: 'https://m.media-amazon.com/images/I/51206EEfBIL._AC_SY500_.jpg',
    title: 'Adidas Ultraboost',
    price: 140.0,
    oldPrice: 200.0,
    discountPercent: 30,
    rating: 5,
    showDeleteIcon: true,
    onDelete: () {
      print('Produto removido dos favoritos');
    },
  ),
];
