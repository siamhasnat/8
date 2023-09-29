import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> imageUrls = List.generate(
    10,
        (index) => "https://via.placeholder.com/150",
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Feed'),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return (orientation == Orientation.portrait)
              ? _buildPortraitLayout()
              : _buildLandscapeLayout();
        },
      ),
    );
  }

  Widget _buildPortraitLayout() {
    return ListView.builder(
      itemCount: imageUrls.length,
      itemBuilder: (context, index) {
        return Card(
          child: Container(
            padding: EdgeInsets.all(8.0),
            child: Image.network(imageUrls[index]),
          ),
        );
      },
    );
  }

  Widget _buildLandscapeLayout() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: imageUrls.length,
      itemBuilder: (context, index) {
        return Card(
          child: Container(
            padding: EdgeInsets.all(8.0),
            child: Image.network(imageUrls[index]),
          ),
        );
      },
    );
  }
}
