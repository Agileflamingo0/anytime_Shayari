import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Controller/DataController.dart';

class Painfull extends StatefulWidget {
  const Painfull({Key? key}) : super(key: key);

  @override
  _PainfullState createState() => _PainfullState();
}

class _PainfullState extends State<Painfull> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("दर्द शायरी")),
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 650,
                width: 400,
                child: GetBuilder<DataController>(
                  init: DataController(),
                  builder: (Value) {
                    return FutureBuilder(
                        future: Value.getData('दर्द शायरी'),
                        builder: (context, AsyncSnapshot snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(
                              child: CircularProgressIndicator(
                                backgroundColor: Colors.black,
                              ),
                            );
                          } else {
                            return ListView.builder(
                                scrollDirection: Axis.vertical,
                                itemCount: snapshot.data!.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return GestureDetector(
                                    onTap: () {},
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.grey[300],
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey[500]!,
                                              offset: Offset(4, 4),
                                              blurRadius: 15,
                                              spreadRadius: 1,
                                            ),
                                          ],

                                          borderRadius:
                                          BorderRadius.circular(5),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                constraints: BoxConstraints(
                                                    maxWidth: 200),
                                                child: Text(
                                                  snapshot.data[index]
                                                      .data()['title'],
                                                  style: const TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 18,fontWeight: FontWeight.bold),
                                                ),
                                              ),
                                              Container(
                                                constraints: BoxConstraints(
                                                    maxWidth: 200),
                                                child: Text(
                                                  snapshot.data[index]
                                                      .data()['description'],
                                                  style: TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 36, 35, 35),
                                                      fontSize: 15),
                                                ),
                                              ),
                                              Container(child: bottomMenu(index),)
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                });
                          }
                        });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget bottomMenu(int index) {
    return Container(
      margin: EdgeInsets.all(2),
      width: double.maxFinite,
      child: Container(
          child: Padding(
            padding: EdgeInsets.only(left: 30, right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                InkWell(
                    onTap: () {},
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.content_copy),
                    )),
                InkWell(
                    onTap: () {
                      //Share.share(_listQuote[position].qoute);
                    },
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.share),
                    )),
              ],
            ),
          )),
    );
  }
}
