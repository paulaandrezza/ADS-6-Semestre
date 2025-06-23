import 'package:flutter/material.dart';
import 'package:lafyuu/presentation/models/menu_item_data.dart';
import 'package:lafyuu/widgets/menu/menu_item.dart';

class MenuList extends StatelessWidget {
  final List<MenuItemData> items;
  final int selectedIndex;

  const MenuList({Key? key, required this.items, this.selectedIndex = -1})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(items.length, (index) {
        final item = items[index];
        return MenuItem(item: item);
      }),
    );
  }
}
