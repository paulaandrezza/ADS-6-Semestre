class Camera {
  int _id;
  String _brand;
  String _color;
  double _price;

  Camera(this._id, this._brand, this._color, this._price);

  int get id => _id;
  String get brand => _brand;
  String get color => _color;
  double get price => _price;

  set id(int id) => _id = id;
  set brand(String brand) => _brand = brand;
  set color(String color) => _color = color;
  set price(double price) => _price = price;

  void showDetails() {
    print('ID: $_id');
    print('Marca: $_brand');
    print('Cor: $_color');
    print('Preço: R\$ ${_price.toStringAsFixed(2)}');
    print('-------------------------');
  }
}

void main() {
  Camera camera1 = Camera(1, 'Canon', 'Preta', 2500.00);
  Camera camera2 = Camera(2, 'Nikon', 'Prata', 3200.50);
  Camera camera3 = Camera(3, 'Sony', 'Preta', 4100.75);

  camera1.showDetails();
  camera2.showDetails();
  camera3.showDetails();
}
