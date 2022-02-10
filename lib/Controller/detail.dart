import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Detailscreen extends StatefulWidget {
  const Detailscreen({Key? key}) : super(key: key);

  @override
  _DetailscreenState createState() => _DetailscreenState();
}

class _DetailscreenState extends State<Detailscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                Get.arguments['title'],
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Container(
                  constraints: BoxConstraints(maxWidth: 200),
                  child: Text(
                    Get.arguments['description'],
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                child: bottomMenu(),
              )

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
        ),),
    );
  }
}
