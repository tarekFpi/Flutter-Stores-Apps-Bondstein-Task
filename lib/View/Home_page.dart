
import 'package:dondstein/Model/SizeConfig.dart';
import 'package:dondstein/Model/stores_showModel.dart';
import 'package:dondstein/View/Single_Information.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'dart:convert' as convert;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class HomePagae extends StatefulWidget {
  const HomePagae({Key? key}) : super(key: key);

  @override
  State<HomePagae> createState() => _HomePagaeState();
}

class _HomePagaeState extends State<HomePagae> {

  Future<StoresShowModel> Show_Stores() async{

    final response = await http.get(Uri.parse("http://128.199.215.102:4040/api/stores?page=1"));

    var data = convert.jsonDecode(response.body.toString());

    if (response.statusCode == 200) {

      return StoresShowModel.fromJson(data);
    }else {

      return StoresShowModel.fromJson(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(child: Scaffold(
        appBar: AppBar(title: Text("Show Stores"),backgroundColor: Colors.teal,),

        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: FutureBuilder<StoresShowModel>(
                  future: Show_Stores(),
                  builder: (BuildContext context, snapshot) {
                    if (snapshot.hasData) {

                        return ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: snapshot.data!.data!.length,
                            itemBuilder: (context, index) {

                              return InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder:(context)=>Single_address(name: "${snapshot.data!.data![index].name}",addres: "${snapshot.data!.data![index].address}",)));
                                },
                                child: AnimationLimiter(
                                    child: AnimationConfiguration.staggeredList(
                                      position: index,
                                      duration: const Duration(milliseconds: 375),
                                      child: SlideAnimation(
                                        verticalOffset: 50.0,
                                        child: FadeInAnimation(
                                          child: Card(
                                            elevation: 4,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(10),
                                              side: BorderSide(
                                                  width: 1, color: Colors.teal),
                                            ),
                                            margin: EdgeInsets.only(
                                                top: 10, left: 5, right: 5),
                                            child: ConstrainedBox(
                                              constraints: BoxConstraints(
                                                minHeight:
                                                SizeConfig.screenHeight! * 0.20,
                                              ),
                                              child: Column(
                                                mainAxisAlignment:MainAxisAlignment.spaceAround,

                                                children: [
                                                  Padding(
                                                    padding:
                                                    const EdgeInsets.all(4),
                                                    child: Row(
                                                      mainAxisAlignment:MainAxisAlignment.spaceBetween,

                                                      crossAxisAlignment:CrossAxisAlignment.start,

                                                      children: [
                                                        Expanded(
                                                          child: Padding(
                                                            padding: const EdgeInsets.only(left: 5),
                                                            child: Text(
                                                              "ID:" +snapshot.data!.data![index].id.toString(),
                                                              style: TextStyle(
                                                                  fontSize: 15,
                                                                  color: Colors
                                                                      .redAccent),
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Align(
                                                            alignment:
                                                            Alignment.topRight,
                                                            child: Padding(
                                                              padding: const EdgeInsets.only(right: 5),
                                                              child: Text(
                                                                "Name :${snapshot.data!.data![index].name.toString()}",
                                                                textAlign:
                                                                TextAlign.right,
                                                                style: TextStyle(
                                                                    fontSize: 15,
                                                                    color:
                                                                    Colors.black),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Divider(
                                                    height:
                                                    SizeConfig.screenHeight! *
                                                        0.02,
                                                    color: Colors.teal,
                                                  ),

                                                  Padding(
                                                    padding:
                                                    const EdgeInsets.all(4),
                                                    child: Row(
                                                      mainAxisAlignment:MainAxisAlignment.spaceBetween,

                                                      crossAxisAlignment:CrossAxisAlignment.start,

                                                      children: [
                                                        Expanded(
                                                          child: Text(
                                                            "Address:" +snapshot.data!.data![index].address.toString(),
                                                            style: TextStyle(
                                                                fontSize: 15,
                                                                color:
                                                                Colors.black),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Align(
                                                            alignment:
                                                            Alignment.topRight,
                                                            child: Padding(
                                                              padding: const EdgeInsets.only(right: 5),
                                                              child: Text(
                                                                "Method :",
                                                                textAlign:
                                                                TextAlign.right,
                                                                style: TextStyle(
                                                                    fontSize: 15,
                                                                    color:
                                                                    Colors.black),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),


                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )

                                ),
                              );
                            });
                      }else if (snapshot.hasError) {
                      return Center(
                        child: Text("Data Not Found: ${snapshot.error}"),
                      );
                    }

                    return Center(
                    child: CircularProgressIndicator(),
                    );

                  }),
            ),
          ],
        )));
  }
}
