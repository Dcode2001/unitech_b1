import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:unitech_b1/insertpage.dart';

class viewpage extends StatefulWidget {
  const viewpage({Key? key}) : super(key: key);

  @override
  State<viewpage> createState() => _viewpageState();
}

class _viewpageState extends State<viewpage> {
  List l = [];
  bool status = false;

  @override
  void initState() {
    super.initState();

    getAllData();
  }

  getAllData() async {
    try {
      var response = await Dio().get('http://workfordemo.in/bunch1/get_category.php');
      print(response);
      l = jsonDecode(response.data)["category_list"];
      print("+++++++++++++++++++$l");
      setState(() {
        status = true;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("View Page"),
      ),
      body: status
          ? ListView.builder(
        shrinkWrap: true,

        itemCount: l.length,
        itemBuilder: (context, index) {

          Acess m = Acess.fromJson(l[index]);

          return Card(
            child: ListTile(
              onLongPress: () {

              },
              onTap: () {

              },
              leading: CircleAvatar(child: Text("${index+1}"),),
              title: Column(
                children: [

                  Text("Name : ${m.catName}"),
                  Text("Minimum Qty : ${m.catQty}"),
                  Text("catId : ${m.catId}"),
                  Text("Description : ${m.catDescription}"),
                  Text("catCreated : ${m.catCreated}"),

                ],
              ),),
          );
        },
      )
          : Center(
        child: CircularProgressIndicator(),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
          return insertpage();
        },));
      },child: Icon(Icons.add),),
    );
  }
}


class Acess {
  String? catId;
  String? catName;
  String? catQty;
  String? catDescription;
  String? catCreated;

  Acess(
      {this.catId,
        this.catName,
        this.catQty,
        this.catDescription,
        this.catCreated});

  Acess.fromJson(Map<String, dynamic> json) {
    catId = json['cat_id'];
    catName = json['cat_name'];
    catQty = json['cat_qty'];
    catDescription = json['cat_description'];
    catCreated = json['cat_created'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cat_id'] = this.catId;
    data['cat_name'] = this.catName;
    data['cat_qty'] = this.catQty;
    data['cat_description'] = this.catDescription;
    data['cat_created'] = this.catCreated;
    return data;
  }
}

