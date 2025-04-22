import 'package:flutter/material.dart';

class ResponsivePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
      appBar: AppBar(title: Text('Responsive Layouts')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Flex(
          direction: isLandscape ? Axis.horizontal : Axis.vertical,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment:
              isLandscape ? MainAxisAlignment.center : MainAxisAlignment.start,
          children: [
            Flexible(
              fit: FlexFit.loose,
              child: Container(
                padding: const EdgeInsets.all(16),
                color: Colors.grey.shade200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Chetah Coding',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16),
                    Flex(
                      direction: isLandscape ? Axis.vertical : Axis.horizontal,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 100,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text('Button 1'),
                          ),
                        ),
                        SizedBox(
                          width: isLandscape ? 0 : 16,
                          height: isLandscape ? 16 : 0,
                        ),
                        SizedBox(
                          width: 100,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text('Button 2'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: isLandscape ? 24 : 0, height: isLandscape ? 0 : 24),
            Expanded(child: LanguageList()),
          ],
        ),
      ),
    );
  }
}

class LanguageList extends StatelessWidget {
  LanguageList({super.key});
  final List<String> languages = ['Dart', 'JavaScript', 'PHP', 'C++'];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: ListView.separated(
        itemCount: languages.length,
        itemBuilder: (context, index) {
          return ListTile(title: Text(languages[index]));
        },
        separatorBuilder: (context, index) {
          return Divider(height: 1, color: Colors.grey.shade400);
        },
      ),
    );
  }
}
