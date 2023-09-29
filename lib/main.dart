import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: OrientationDemo(),
    );
  }
}

class OrientationDemo extends StatefulWidget {
  @override
  _OrientationDemoState createState() => _OrientationDemoState();
}

class _OrientationDemoState extends State<OrientationDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return orientation == Orientation.portrait
              ? PortraitLayout()
              : LandscapeLayout();
        },
      ),
    );
  }
}

class PortraitLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // Profile Picture
          CircleAvatar(
            radius: 200.0,
            backgroundImage: NetworkImage(
                'https://www.nousngo.eu/wp-content/uploads/2019/05/photographer-website-design-91250317.jpg'), // Replace with your image URL
          ),
          SizedBox(height: 05.0),

          // Text below Profile Picture
          Text(
            'PIXELSHUT', // Replace with your name or any text you want
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16.0),

          // Small Pictures in Two Rows
          Text(
            'Small Pictures',
            style: TextStyle(fontSize: 20.0),
          ),
          SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SmallPicture(
                imageUrl: 'https://example.com/small_image1.jpg',
              ),
              SmallPicture(
                imageUrl: 'https://example.com/small_image2.jpg',
              ),
              SmallPicture(
                imageUrl: 'https://example.com/small_image3.jpg',
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SmallPicture(
                imageUrl: 'https://example.com/small_image4.jpg',
              ),
              SmallPicture(
                imageUrl: 'https://example.com/small_image5.jpg',
              ),
              SmallPicture(
                imageUrl: 'https://example.com/small_image6.jpg',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class LandscapeLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // Profile Picture
          CircleAvatar(
            radius: 80.0,
            backgroundImage: NetworkImage(
                'https://example.com/profile_picture.jpg'), // Replace with your image URL
          ),
          SizedBox(width: 16.0),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Text below Profile Picture
              Text(
                'John Doe', // Replace with your name or any text you want
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.0),

              // Small Pictures in Two Columns
              Text(
                'Small Pictures',
                style: TextStyle(fontSize: 20.0),
              ),
              SizedBox(height: 8.0),
              Column(
                children: <Widget>[
                  SmallPicture(
                    imageUrl: 'https://example.com/small_image1.jpg',
                  ),
                  SmallPicture(
                    imageUrl: 'https://example.com/small_image2.jpg',
                  ),
                ],
              ),
              SizedBox(height: 8.0),
              Column(
                children: <Widget>[
                  SmallPicture(
                    imageUrl: 'https://example.com/small_image3.jpg',
                  ),
                  SmallPicture(
                    imageUrl: 'https://example.com/small_image4.jpg',
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SmallPicture extends StatelessWidget {
  final String imageUrl;

  SmallPicture({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CircleAvatar(
        radius: 30.0,
        backgroundImage: NetworkImage(imageUrl),
      ),
    );
  }
}
