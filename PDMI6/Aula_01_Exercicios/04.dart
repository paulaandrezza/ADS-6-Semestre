class Animal {
  int id;
  String name;
  String color;

  Animal(this.id, this.name, this.color);

  void showDetails() {
    print('ID: $id');
    print('Nome: $name');
    print('Cor: $color');
  }
}

class Cat extends Animal {
  String sound;

  Cat(int id, String name, String color, this.sound) : super(id, name, color);

  @override
  void showDetails() {
    super.showDetails();
    print('Som: $sound');
    print('-------------------------');
  }
}

void main() {
  Cat cat = Cat(1, 'Mingau', 'Branco', 'Miau');

  cat.showDetails();
}
