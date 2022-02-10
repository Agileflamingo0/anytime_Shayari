import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controller/DataController.dart';

import '../Controller/detail.dart';


class Heart extends StatefulWidget {
  const Heart({Key? key}) : super(key: key);

  @override
  _HeartState createState() => _HeartState();
}

class _HeartState extends State<Heart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("दिल शायरी")),
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
                        future: Value.getData("दिल शायरी"),
                        builder: (context, AsyncSnapshot snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
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
                                    onTap: () {
                                      Get.to(const Detailscreen(),
                                          transition: Transition.leftToRight,
                                          arguments: snapshot.data[index]);
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.grey[300],
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey[500]!,
                                              offset: Offset(4, 4),
                                              blurRadius: 10,
                                              spreadRadius: 1,
                                            ),
                                          ],

                                          borderRadius:
                                          BorderRadius.circular(5),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                constraints: const BoxConstraints(
                                                    maxWidth: 200),
                                                child: Text(
                                                  snapshot.data[index]
                                                      .data()['title'],
                                                  style: const TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 18,fontWeight: FontWeight.bold),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 2,
                                              ),
                                              Container(
                                                constraints: const BoxConstraints(
                                                    maxWidth: 200),
                                                child: Text(
                                                  snapshot.data[index]
                                                      .data()['description'],
                                                  style: const TextStyle(
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
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey[500]!,
                        offset: Offset(4, 4),
                        blurRadius: 5,
                        spreadRadius: 2,
                      ),
                    ],
                    borderRadius:
                    BorderRadius.circular(50),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.content_copy),
                  ),
                )),
            InkWell(
                onTap: () {
                  //Share.share(_listQuote[position].qoute);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey[500]!,
                        offset: Offset(4, 4),
                        blurRadius: 5,
                        spreadRadius: 2,
                      ),
                    ],
                    borderRadius:
                    BorderRadius.circular(50),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.share),
                  ),
                )),
          ],
        ),
      )),
    );
  }
}
