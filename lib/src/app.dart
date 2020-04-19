// import flutter helper library
import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;

import 'dart:convert';

import 'models/image_model.dart';
import 'widgets/image_list.dart';

// Create a class that will be our custom widget
// This class must extend the 'StatelessWidget' base class
// class App extends StatelessWidget {
//   // Must define a 'build' method that returns
//   // the widgets that *this* widget will show
//   Widget build(context) {
//     return MaterialApp(
//       home: Scaffold(
//         floatingActionButton: FloatingActionButton(
//           child: Icon(Icons.add),
//           onPressed: () {
//             print('Hi There!');
//           },
//         ),
//         appBar: AppBar(
//           title: Text('Lets see some images!'),
//         ),
//       ),
//     );
//   }
// }


// Adding Stateful Widget and Widget's State
class App extends StatefulWidget {
  // implement createState method
  createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  int counter = 0; // instance variable that will change
  List<ImageModel> images = [];
  void fetchImage() async {
    counter++;
    var response = await get('http://jsonplaceholder.typicode.com/photos/$counter');
    var imageModel = ImageModel.fromJson(json.decode(response.body));
    
    setState(() {
      images.add(imageModel);
    });
  }

  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: fetchImage,
        ),
        appBar: AppBar(
          title: Text('Lets see some images!'),
        ),
        body: ImageList(images),
      ),
    );
  }
}
