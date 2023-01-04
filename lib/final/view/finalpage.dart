import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../home/provider/homeprovider.dart';

class Setdata extends StatefulWidget {
  const Setdata({Key? key}) : super(key: key);

  @override
  State<Setdata> createState() => _SetdataState();
}

class _SetdataState extends State<Setdata> {
  HomeProvider? providertrue;
  HomeProvider? providerfalse;

  @override
  Widget build(BuildContext context) {
    providertrue = Provider.of<HomeProvider>(context, listen: true);
    providerfalse = Provider.of<HomeProvider>(context, listen: false);

    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            Stack(
              children: [
                Container(
                  height: 130,
                  alignment: Alignment.centerLeft,
                  width: double.infinity,
                  color: Colors.blue.shade400,
                  padding: EdgeInsets.only(top: 45, left: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${providertrue!.name}".toUpperCase(),
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 22,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: MediaQuery.of(context).size.width-150, top: 30),
                  child: providertrue!.path == null
                      ? CircleAvatar(
                          radius: 65,
                          backgroundImage:
                              AssetImage("assets/image/profile.png"),
                        )
                      : CircleAvatar(
                          radius: 65,
                          backgroundImage: FileImage(File("${providertrue!.path}")),
                        ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      set("Contact me", Colors.blue.shade400, 18),
                      h(10),
                      set("Mobile", Colors.grey, 17),
                      h(3),
                      set("${providertrue!.phone}", Colors.black, 15),
                      h(3),
                      set("E-mail", Colors.grey, 17),
                      h(3),
                      set("${providertrue!.id}", Colors.black, 15),
                      h(3),
                      set("Birth-Date", Colors.grey, 17),
                      h(3),
                      set("${providertrue!.birth}", Colors.black, 15),h(3),
                      h(3),

                      set("Location", Colors.grey, 17),
                      h(3),
                      set("${providertrue!.location}", Colors.black, 15),
                      h(35),
                      set("gender", Colors.blue.shade400, 18),
                      h(3),
                      set("${providertrue!.gender}", Colors.black, 15)
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget w(double width) {
    return SizedBox(
      width: width,
    );
  }

  Widget h(double height) {
    return SizedBox(
      height: height,
    );
  }

  Widget set(dynamic list, color, double size) {
    return Text(
      "$list",
      style:
          TextStyle(color: color, fontSize: size, fontWeight: FontWeight.bold),
    );
  }
}
