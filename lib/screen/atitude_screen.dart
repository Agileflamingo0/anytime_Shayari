import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controller/DataController.dart';
import '../Controller/detail.dart';

class Atitude extends StatefulWidget {
  const Atitude({Key? key}) : super(key: key);

  @override
  _AtitudeState createState() => _AtitudeState();
}

class _AtitudeState extends State<Atitude> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("एटीट्यूड_शायरी"),
        backgroundColor: Colors.lightBlue,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
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
                      future: Value.getData("एटीट्यूड_शायरी"),
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
                                  padding: const EdgeInsets.all(8.0),
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
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Center(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              constraints: const BoxConstraints(
                                                  maxWidth: 300),
                                              child: Text(
                                                snapshot.data[index]
                                                    .data()['title'],
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Container(
                                              alignment: Alignment.center,
                                              constraints: const BoxConstraints(
                                                  maxWidth: 300),
                                              child: SelectableText(
                                                snapshot.data[index]
                                                    .data()['description'],
                                                style: const TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 36, 35, 35),
                                                    fontSize: 15),
                                              ),
                                            ),
                                            Container(
                                              child: bottomMenu(),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        }
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget bottomMenu() {
    return Container(
      margin: const EdgeInsets.all(2),
      width: double.maxFinite,
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
      ),
    );
  }
}
