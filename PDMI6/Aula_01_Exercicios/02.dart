class House {
  int id;
  String name;
  double price;

  House(this.id, this.name, this.price);

  void showDetails() {
    print('ID: $id');
    print('Nome: $name');
    print('Preço: R\$ ${price.toStringAsFixed(2)}');
    print('-------------------------');
  }
}

void main() {
  House house1 = House(1, 'Casa na Praia', 500000.00);
  House house2 = House(2, 'Apartamento no Centro', 350000.50);
  House house3 = House(3, 'Chácara com Piscina', 750000.75);

  List<House> houseList = [house1, house2, house3];

  for (var house in houseList) {
    house.showDetails();
  }
}
