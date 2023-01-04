import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../provider/homeprovider.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  HomeProvider? providertrue;
  HomeProvider? providerfalse;

  @override
  Widget build(BuildContext context) {
    providertrue = Provider.of<HomeProvider>(context, listen: true);
    providerfalse = Provider.of<HomeProvider>(context, listen: false);

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: 55,
              width: double.infinity,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Colors.lightBlueAccent,
                    Colors.greenAccent,
                  ],
                ),
              ),
              child: Text(
                "  Edit Your Profile",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  Stepper(
                    steps: [
                      Step(
                        isActive: true,
                        title: Text("Profile Picture"),
                        content: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                (providertrue!.path == null)
                                    ? CircleAvatar(
                                        radius: 60,
                                        backgroundImage: AssetImage(
                                            "assets/image/profile.png"),
                                      )
                                    : CircleAvatar(
                                        radius: 60,
                                        backgroundImage: FileImage(
                                            File("${providertrue!.path}")),
                                      ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      showModalBottomSheet(
                                          context: context,
                                          builder: (context) {
                                            return Container(
                                              height: 150,
                                              alignment: Alignment.centerLeft,
                                              padding:
                                                  EdgeInsets.only(left: 20),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Text("Choose a photo from"),
                                                  Row(
                                                    children: [
                                                      Column(
                                                        children: [
                                                          SizedBox(height: 20),
                                                          FloatingActionButton(
                                                            onPressed:
                                                                () async {
                                                              ImagePicker
                                                                  picker =
                                                                  ImagePicker();
                                                              XFile? img = await picker
                                                                  .pickImage(
                                                                      source: ImageSource
                                                                          .camera);
                                                              providerfalse!
                                                                  .changeimage(
                                                                      img!.path);
                                                            },
                                                            child: Icon(
                                                              Icons
                                                                  .camera_alt_rounded,
                                                            ),
                                                            backgroundColor:
                                                                Colors.blue
                                                                    .shade400,
                                                          ),
                                                          SizedBox(
                                                            height: 5,
                                                          ),
                                                          Text(
                                                            "Camera",
                                                            style: TextStyle(
                                                                fontSize: 20),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        width: 25,
                                                      ),
                                                      Column(
                                                        children: [
                                                          SizedBox(
                                                            height: 20,
                                                          ),
                                                          FloatingActionButton(
                                                            onPressed:
                                                                () async {
                                                              ImagePicker
                                                                  picker =
                                                                  ImagePicker();
                                                              XFile? img = await picker
                                                                  .pickImage(
                                                                      source: ImageSource
                                                                          .gallery);
                                                              providerfalse!
                                                                  .changeimage(
                                                                      img!.path);
                                                            },
                                                            child: Icon(
                                                                Icons.photo),
                                                            backgroundColor:
                                                                Colors.blue
                                                                    .shade400,
                                                          ),
                                                          SizedBox(
                                                            height: 5,
                                                          ),
                                                          Text(
                                                            "Gallary",
                                                            style: TextStyle(
                                                                fontSize: 20),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            );
                                          });
                                    });
                                  },
                                  child: Container(
                                    height: 45,
                                    width: 45,
                                    decoration: BoxDecoration(
                                        color: Colors.grey.shade800,
                                        shape: BoxShape.circle),
                                    child: Icon(
                                      Icons.camera_alt_rounded,
                                      size: 25,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Step(
                        isActive: true,
                        title: Text("Name"),
                        content: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextField(
                              controller: providertrue!.txtName,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                hintText: "Full Name",
                                prefixIcon: Icon(Icons.edit),
                                border: UnderlineInputBorder(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Step(
                        isActive: true,
                        title: Text("phone"),
                        content: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextField(
                              controller: providertrue!.txtphone,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                hintText: "Contact",
                                prefixIcon: Icon(Icons.call),
                                border: UnderlineInputBorder(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Step(
                        isActive: true,
                        title: Text("Email"),
                        content: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextField(
                              controller: providertrue!.txtid,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                hintText: "Email",
                                prefixIcon: Icon(Icons.email_outlined),
                                border: UnderlineInputBorder(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Step(
                        isActive: true,
                        title: Text("Date of birth"),
                        content: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextField(
                              controller: providertrue!.txtbirth,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                hintText: "DD MM YYYY",
                                prefixIcon: Icon(Icons.cake),
                                border: UnderlineInputBorder(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Step(
                        isActive: true,
                        title: Text("Gender"),
                        content: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Radio(
                                  activeColor: Colors.blue.shade400,
                                  value: "Male",
                                  groupValue: providertrue!.gender,
                                  onChanged: (value) {
                                    providerfalse!.choosegender(value);
                                  },
                                ),
                                Text("Male"),
                                Radio(
                                  activeColor: Colors.blue.shade400,
                                  value: "Female",
                                  groupValue: providertrue!.gender,
                                  onChanged: (value) {
                                    providerfalse!.choosegender(value);
                                  },
                                ),
                                Text("Female"),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Step(
                        isActive: true,
                        title: Text("Current Location"),
                        content: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextField(
                              controller: providertrue!.txtlocation,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                hintText: "",
                                prefixIcon: Icon(Icons.location_on_rounded),
                                border: UnderlineInputBorder(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                    onStepContinue: () {
                      providerfalse!
                          .changeStepIndex(providerfalse!.StepIndex + 1);
                      if (providertrue!.StepIndex == 7) {
                        providerfalse!.passdata();
                        Navigator.pushNamed(context, 'final');
                        providertrue!.StepIndex=0;
                      }
                    },
                    onStepCancel: () {
                      if (providerfalse!.StepIndex > 0) {
                        providertrue!
                            .changeStepIndex(providertrue!.StepIndex - 1);
                      }
                    },
                    onStepTapped: (index) =>
                        providertrue!.changeStepIndex(index),
                    currentStep: providertrue!.StepIndex,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
