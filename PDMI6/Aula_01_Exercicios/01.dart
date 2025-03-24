class Laptop {
  int id;
  String name;
  int ram;

  Laptop(this.id, this.name, this.ram);

  void showDetails() {
    print('ID: $id');
    print('Nome: $name');
    print('RAM: ${ram}GB');
    print('-------------------------');
  }
}

void main() {
  Laptop laptop1 = Laptop(1, 'Dell XPS 13', 16);
  Laptop laptop2 = Laptop(2, 'MacBook Pro', 32);
  Laptop laptop3 = Laptop(3, 'Lenovo ThinkPad', 8);

  laptop1.showDetails();
  laptop2.showDetails();
  laptop3.showDetails();
}
