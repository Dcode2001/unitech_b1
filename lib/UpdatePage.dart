import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:unitech_b1/viewpage.dart';

class UpdatePage extends StatefulWidget {
  Acess? d;
  int index;

  UpdatePage(this.d, this.index);

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  TextEditingController tname = TextEditingController();
  TextEditingController tdescription = TextEditingController();
  TextEditingController tqty = TextEditingController();
  String radio = "Vegan";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tname.text = widget.d!.categoryList![widget.index].catName!;
    tdescription.text = widget.d!.categoryList![widget.index].catDescription!;
    tqty.text = widget.d!.categoryList![widget.index].catQty!;
    //radio=widget.d!.categoryList![widget.index].catName!;
  }

  @override
  Widget build(BuildContext context) {
    double mwidth = MediaQuery.of(context).size.width;
    return WillPopScope(
        child: Scaffold(
          appBar: AppBar(title: Text("Update Page"),centerTitle: true,),
          resizeToAvoidBottomInset: true,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 50,
                    margin: EdgeInsets.all(10),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.black54,
                    ),
                    child: Text(
                      "ADD CATEGORY",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Text(
                      "Name",
                      style:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: TextField(
                        keyboardType: TextInputType.name,
                        controller: tname,
                        onTap: () {},
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            filled: true,
                            fillColor: Colors.grey.shade300)),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15, left: 10, right: 10),
                    child: Text(
                      "Type",
                      style:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Radio(
                            onChanged: (value) {
                              radio = value.toString();
                              setState(() {});
                            },
                            value: "Vegetarian",
                            groupValue: radio),
                        Text("Vegetarian"),
                        Radio(
                            onChanged: (value) {
                              radio = value.toString();
                              setState(() {});
                            },
                            value: "Non-vegetarian",
                            groupValue: radio),
                        Text("Non-vegetarian"),
                        Radio(
                            onChanged: (value) {
                              radio = value.toString();
                              setState(() {});
                            },
                            value: "Eggatarian",
                            groupValue: radio),
                        Text("Eggatarian"),
                        Radio(
                            onChanged: (value) {
                              radio = value.toString();
                              setState(() {});
                            },
                            value: "Vegan",
                            groupValue: radio),
                        Text("Vegan"),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Text(
                      "Description",
                      style:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: TextField(
                        keyboardType: TextInputType.text,
                        controller: tdescription,
                        onTap: () {},
                        maxLines: 6,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            filled: true,
                            fillColor: Colors.grey.shade300)),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Text(
                      "Minimum Qty",
                      style:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    height: 40,
                    width: 60,
                    child: TextField(
                        keyboardType: TextInputType.number,
                        controller: tqty,
                        onTap: () {},
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            filled: true,
                            fillColor: Colors.grey.shade300)),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 40,
                        width: mwidth * .5,
                        child: ElevatedButton(
                          onPressed: () async {
                            String cat_id =
                            widget.d!.categoryList![widget.index].catId!;
                            String name = tname.text;
                            String type = radio;
                            String description = tdescription.text;
                            String mqty = tqty.text;
                            var response = await Dio().get(
                                'http://workfordemo.in/bunch1/update_category.php?cat_id=$cat_id&cat_type=$type&cat_name=$name&cat_description=$description&cat_qty=$mqty');
                            print(response.data);
                            Map m = jsonDecode(response.data);
                            int success = m['success'];
                            if (success == 1) {
                              Fluttertoast.showToast(
                                  msg: "Updated Sucessfully...",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.black,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return viewpage();
                                    },
                                  ));
                            } else {
                              Fluttertoast.showToast(
                                  msg: "Category not Update",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.transparent,
                                  textColor: Colors.black,
                                  fontSize: 16.0);
                            }
                          },
                          child: Text("Submit"),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.black54,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        onWillPop: goback);
    ;
  }

  Future<bool> goback() {
    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) {
        return viewpage();
      },
    ));
    return Future.value();
  }
}
