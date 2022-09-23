import 'package:dondstein/Model/SizeConfig.dart';
import 'package:flutter/material.dart';


class Single_address extends StatelessWidget {

  final String name;
  final String addres;

  const Single_address({Key? key,required this.name,required this.addres}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return SafeArea(
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.tealAccent, Colors.orange])),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              title: Text("Single  Page"),
              backgroundColor: Colors.teal,
            ),
            body: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      SizedBox(
                        height: SizeConfig.screenHeight! * 0.02,
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Name:${name}",style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Address:${addres}",style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),

          ),
        ));
  }
}
