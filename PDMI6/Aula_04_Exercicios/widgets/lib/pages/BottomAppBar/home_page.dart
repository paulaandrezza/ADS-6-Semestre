import 'package:flutter/material.dart';
import 'fab_bottom_app_bar.dart';
import 'fab_with_icons.dart';
import 'layout.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  String _lastSelected = 'TAB: 0';
  bool _showFabOverlay = false;

  void _selectedTab(int index) {
    setState(() {
      _lastSelected = 'TAB: $index';
    });
  }

  void _selectedFab(int index) {
    setState(() {
      _lastSelected = 'FAB: $index';
      _showFabOverlay = false;
    });
  }

  void _toggleFabOverlay() {
    setState(() {
      _showFabOverlay = !_showFabOverlay;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BottomAppBar com FAB')),
      body: Center(
        child: Text(_lastSelected, style: TextStyle(fontSize: 32.0)),
      ),
      bottomNavigationBar: FABBottomAppBar(
        centerItemText: 'A',
        color: Colors.grey,
        selectedColor: Colors.red,
        notchedShape: CircularNotchedRectangle(),
        onTabSelected: _selectedTab,
        items: [
          FABBottomAppBarItem(iconData: Icons.menu, text: 'This'),
          FABBottomAppBarItem(iconData: Icons.layers, text: 'Is'),
          FABBottomAppBarItem(iconData: Icons.dashboard, text: 'Bottom'),
          FABBottomAppBarItem(iconData: Icons.info, text: 'Bar'),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _buildFab(context),
    );
  }

  Widget _buildFab(BuildContext context) {
    final icons = [Icons.sms, Icons.mail, Icons.phone];
    return AnchoredOverlay(
      showOverlay: _showFabOverlay,
      overlayBuilder: (context, offset) {
        return CenterAbout(
          position: Offset(offset.dx, offset.dy - icons.length * 35.0),
          child: FabWithIcons(icons: icons, onIconTapped: _selectedFab),
        );
      },
      child: FloatingActionButton(
        onPressed: _toggleFabOverlay,
        tooltip: 'Increment',
        child: Icon(Icons.add),
        elevation: 2.0,
      ),
    );
  }
}
