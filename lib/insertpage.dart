import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:unitech_b1/viewpage.dart';

class insertpage extends StatefulWidget {
  const insertpage({Key? key}) : super(key: key);


  @override
  State<insertpage> createState() => _insertpageState();
}

class _insertpageState extends State<insertpage> {
  TextEditingController tname = TextEditingController();
  TextEditingController tdescription = TextEditingController();
  TextEditingController tqty = TextEditingController();


  String gvalue = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Insert Page")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  height: 60,
                  width: double.infinity,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blueGrey.shade700,
                  ),
                  margin: EdgeInsets.all(10),
                  child: Text(
                    "ADD CATEGORY",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )),
              SizedBox(height: 5),
              Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(left: 12),
                  child: Text(
                    "Name",
                    textAlign: TextAlign.start,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  )),
              Padding(
                padding: const EdgeInsets.all(7.0),
                child: TextField(
                  controller: tname,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      fillColor: Colors.blueGrey.shade50,
                      filled: true),
                ),
              ),
              SizedBox(height: 5),
              Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(left: 12),
                  child: Text(
                    "Type",
                    textAlign: TextAlign.start,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  )),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Radio(
                      onChanged: (value) {
                        setState(() {
                          gvalue = value.toString();
                        });
                      },
                      value: "Vegatarian",
                      groupValue: gvalue,
                    ),
                    Text(
                      "Vegatarian",
                    ),
                    Radio(
                      onChanged: (value) {
                        setState(() {
                          gvalue = value.toString();
                        });
                      },
                      value: "Non-Vegatarian",
                      groupValue: gvalue,
                    ),
                    Text(
                      "Non-Vegatarian",
                    ),
                    Radio(
                      onChanged: (value) {
                        setState(() {
                          gvalue = value.toString();
                        });
                      },
                      value: "Eggatarian",
                      groupValue: gvalue,
                    ),
                    Text(
                      "Eggatarian",
                    ),
                    Radio(
                      onChanged: (value) {
                        setState(() {
                          gvalue = value.toString();
                        });
                      },
                      value: "Vegan",
                      groupValue: gvalue,
                    ),
                    Text(
                      "Vegan",
                    ),
                  ],
                ),
              ),
              Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(left: 12),
                  child: Text(
                    "Description",
                    textAlign: TextAlign.start,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  )),
              Padding(
                padding: const EdgeInsets.all(7.0),
                child: TextField(
                  controller: tdescription,
                  maxLines: 5,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      fillColor: Colors.blueGrey.shade50,
                      filled: true),
                ),
              ),
              Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(left: 12),
                  child: Text(
                    "Minimum Qty",
                    textAlign: TextAlign.start,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  )),
              Padding(
                padding: const EdgeInsets.all(7.0),
                child: Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(left: 5),
                  child: SizedBox(
                    height: 50,
                    width: 60,
                    child: TextField(
                      controller: tqty,
                      maxLines: 1,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          fillColor: Colors.blueGrey.shade50,
                          filled: true),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 60),
              SizedBox(
                height: 60,
                width: 190,
                child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.blueGrey.shade700),
                    ),
                    onPressed: () async {

                      String name = tname.text;
                      String description = tdescription.text;
                      String qty = tqty.text;
                      String _gvalue = gvalue;

                      Response response;
                      var dio = Dio();
                      response = await dio.get('http://workfordemo.in/bunch1/insert_category.php?cat_type=$_gvalue&cat_name=$name&cat_description=$description&cat_qty=$qty');
                      print(response.data.toString());

                      print(response.data);

                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                        Fluttertoast.showToast(
                            msg: "Save.....",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.black,
                            textColor: Colors.white,
                            fontSize: 16.0
                        );
                        return viewpage();
                      },));
                    },
                    child: Text(
                      "Submit",
                      style: TextStyle(fontSize: 20),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}

