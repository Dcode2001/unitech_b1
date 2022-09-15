/*
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:unitech_b1/InsertPage.dart';
import 'package:unitech_b1/UpdatePage.dart';

class ViewPage extends StatefulWidget {
  const ViewPage({Key? key}) : super(key: key);

  @override
  State<ViewPage> createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  Map<String, dynamic> m = {};
  bool status = false;
  dummy? d;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    try {
      var response =
      await Dio().get('http://workfordemo.in/bunch1/get_category.php');
      print(response);
      m = jsonDecode(response.data);
      print("*****");
      print(m);
      d = dummy.fromJson(m);
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
        title: Text("ALL CATEGORY"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) {
              return insertpage();
            },
          ));
        },
        child: Text("ADD"),
      ),
      body: status
          ? ListView.builder(
        itemCount: d!.categoryList!.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 5,
            child: InkWell(
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) {
                    return UpdatePage(d, index);
                  },
                ));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Cat id: ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text("${d!.categoryList![index].catId}")
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Name: ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text("${d!.categoryList![index].catName}")
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Type: ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text("Vegan")
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Description: ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text("${d!.categoryList![index].catDescription}")
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Minimum Qty: ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text("${d!.categoryList![index].catQty}")
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      )
          : Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

class dummy {
  int? success;
  List<CategoryList>? categoryList;

  dummy({this.success, this.categoryList});

  dummy.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['category_list'] != null) {
      categoryList = <CategoryList>[];
      json['category_list'].forEach((v) {
        categoryList!.add(new CategoryList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.categoryList != null) {
      data['category_list'] =
          this.categoryList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CategoryList {
  String? catId;
  String? catName;
  String? catQty;
  String? catDescription;
  String? catCreated;

  CategoryList(
      {this.catId,
        this.catName,
        this.catQty,
        this.catDescription,
        this.catCreated});

  CategoryList.fromJson(Map<String, dynamic> json) {
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
*/




import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:unitech_b1/insertpage.dart';

import 'UpdatePage.dart';

class viewpage extends StatefulWidget {
  const viewpage({Key? key}) : super(key: key);

  @override
  State<viewpage> createState() => _viewpageState();
}

class _viewpageState extends State<viewpage> {
  List l = [];
Map<String, dynamic> m = {};
  bool status = false;
  Acess? d;
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
      m = jsonDecode(response.data);
      print("*****");
      print(m);
      d = Acess.fromJson(m);
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
        centerTitle: true,
      ),
      body: status
          ? ListView.builder(
        shrinkWrap: true,

        itemCount: l.length,
        itemBuilder: (context, index) {

          Acess m = Acess.fromJson(l[index]);

          return Card(
            elevation: 5,
            child: ListTile(

              onTap: () {

                Navigator.pushReplacement(context,
                    MaterialPageRoute(
                      builder: (context) {
                        return UpdatePage(d, index);
                      },
                    ));
              },
              leading: CircleAvatar(child: Text("${index+1}"),),
              title: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Cat id: ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text("${d!.categoryList![index].catId}")
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Name: ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text("${d!.categoryList![index].catName}")
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Type: ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text("Vegan")
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Description: ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text("${d!.categoryList![index].catDescription}")
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Minimum Qty: ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text("${d!.categoryList![index].catQty}")
                    ],
                  ),
/*
                  Text("Name : ${m.catName}"),
                  Text("Minimum Qty : ${m.catQty}"),
                  Text("catId : ${m.catId}"),
                  Text("Description : ${m.catDescription}"),
                  Text("catCreated : ${m.catCreated}"),*/

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
  int? success;
  List<CategoryList>? categoryList;

  Acess({this.success, this.categoryList});

  Acess.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['category_list'] != null) {
      categoryList = <CategoryList>[];
      json['category_list'].forEach((v) {
        categoryList!.add(new CategoryList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.categoryList != null) {
      data['category_list'] =
          this.categoryList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CategoryList {
  String? catId;
  String? catName;
  String? catQty;
  String? catDescription;
  String? catCreated;

  CategoryList(
      {this.catId,
        this.catName,
        this.catQty,
        this.catDescription,
        this.catCreated});

  CategoryList.fromJson(Map<String, dynamic> json) {
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


