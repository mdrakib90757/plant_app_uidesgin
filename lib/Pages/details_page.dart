import 'package:flutter/material.dart';
import 'package:plant_app_project/data/plant_data.dart';

import '../data/plant_model.dart';

class DetailsPage extends StatefulWidget {
  final Plants plant;
  const DetailsPage({super.key, required this.plant});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}


class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: height/2,
                    decoration: BoxDecoration(
                      color: Colors.lightGreen.shade100,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.green.withOpacity(0.2),
                          blurRadius: 15,
                          offset: Offset(0, 5)
                        )
                      ],
                     // border: Border.all(color: Colors.green,width: 2),
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(30.0),
                          bottomLeft: Radius.circular(30.0)
                      ),
                      image: DecorationImage(
                        image: AssetImage(widget.plant.imagePath),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(text: TextSpan(
                              children: [
                                TextSpan(
                                  text:widget.plant.name,
                                  style: TextStyle(
                                    color: Colors.black.withOpacity(0.7),
                                    fontWeight:FontWeight.bold,
                                    fontSize: 16.0
                                  )
                                ),
                                TextSpan(
                                    text:(" ${widget.plant.category} Plant"),
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.5),
                                        fontWeight:FontWeight.bold,
                                        fontSize: 18.0
                                    )
                                )
                              ]
                            )),
                            Container(
                              padding: EdgeInsets.all(8.0),
                            height: 30.0,
                              width: 30.0,
                              decoration: BoxDecoration(
                                color: Colors.green,

                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.green.withOpacity(0.2),
                                      blurRadius: 15,
                                      offset: Offset(0, 5)
                                  )
                                ],
                                // border: Border.all(color: Colors.green,width: 2),
                                borderRadius: BorderRadius.circular(10.0)
                              ),
                              child: Image.asset("assets/icons/heart.png",
                              color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.0,),
                        RichText(
                            text: TextSpan(
                                children: [
                                  TextSpan(
                                      text: widget.plant.description,
                                      style: TextStyle(
                                          color: Colors.black.withOpacity(0.6),
                                          fontSize: 15.0,
                                          height: 1.4,
                                          letterSpacing: 0.5
                                      )
                                  )]
                            ),
                        ),
                        SizedBox(height: 20.0,),
                        Text("Treatment",style: TextStyle(
                          color: Colors.black.withOpacity(0.9),
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                          height: 1.4,
                          letterSpacing: 0.5,
                        ),),
                        SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Image.asset("assets/icons/sun.png",
                              color: Colors.black,height: 24.0,),
                            Image.asset("assets/icons/drop.png",
                              color: Colors.black,height: 24.0,),
                            Image.asset("assets/icons/temperature.png",
                              color: Colors.black,height: 24.0,),
                            Image.asset("assets/icons/up_arrow.png",
                              color: Colors.black,height: 24.0,),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(onPressed: () {
                    Navigator.pop(context);
                  }, icon: Icon(Icons.arrow_back)),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Image.asset("assets/icons/cart.png",
                      color: Colors.black,height: 24.0,),
                  )
                ],
              ),
              Align(alignment: Alignment.bottomRight,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal:50.0,vertical: 15.0 ),
                decoration: BoxDecoration(
                  color: Colors.green,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.green.withOpacity(0.2),
                        blurRadius: 15,
                        offset: Offset(0, 5)
                    )
                  ],
                  // border: Border.all(color: Colors.green,width: 2),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60)
                  ),
                ),
                child: Text(
                  "Buy ${widget.plant.price.toStringAsFixed(0)}",
                  style: TextStyle(
                  color: Colors.white.withOpacity(0.9),
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                  height: 1.4,
                  letterSpacing: 0.5,
                ),),
              ),
              )
            ],
            

          )
      ),
    );
  }
}


