import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_assignment/data_model.dart';
import 'package:flutter_assignment/remote_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Product? products;
  var isLoaded = false;
  RemoteData remoteData = RemoteData();
  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    products = await remoteData.getProducts();
    if (products != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Center(child: Text("Products"))),
        body: isLoaded
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 15,
                            crossAxisSpacing: 15),
                    itemCount: products!.categorysReponse.length,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0)),
                        child: Column(children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              backgroundColor: Colors.transparent,
                              foregroundImage: products?.categorysReponse[index]
                                          .categoryImage !=
                                      null
                                  ? NetworkImage(products!
                                      .categorysReponse[index].categoryImage!)
                                  : const NetworkImage(""),
                              radius: 60,
                            ),
                          ),
                          Align(
                            heightFactor: 0,
                              alignment: Alignment.center,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                        '${products!.categorysReponse[index].categoryId}.'),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Flexible(
                                      child: Text(products!
                                          .categorysReponse[index]
                                          .categoryName),
                                    ),
                                  ],
                                ),
                              ))
                        ]),
                      );
                    }),
              )
            : const Center(child: CircularProgressIndicator()));
  }
}
