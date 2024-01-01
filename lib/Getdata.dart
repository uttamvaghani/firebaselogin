import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'Model.dart';

class Getdatra extends StatefulWidget {
  const Getdatra({Key? key}) : super(key: key);

  @override
  State<Getdatra> createState() => _GetdatraState();
}

Future<Model> getdata() async {
  final data = await http.get(Uri.parse("https://dummyjson.com/products"));

  return modelFromJson(data.body);
}

class _GetdatraState extends State<Getdatra> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getdata(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.products.length,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                        image: NetworkImage(
                            snapshot.data!.products[index].thumbnail)),
                    Text(snapshot.data!.products[index].title),
                    Text(snapshot.data!.products[index].category),
                  ],
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text("hasError");
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
