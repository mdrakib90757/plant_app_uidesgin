

import 'package:flutter/material.dart';
import 'package:plant_app_project/Pages/details_page.dart';
import 'package:plant_app_project/data/category_model.dart';
import 'package:plant_app_project/data/plant_data.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState()=> _HomePageState();
}

class _HomePageState extends State<HomePage> {

  PageController controller = PageController();
  int selectid = 0;
  int activePage = 0;
  @override
  void initState() {
    super.initState();
    controller=PageController(viewportFraction: 0.6,initialPage: 0);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leadingWidth:50 ,
        automaticallyImplyLeading: false,
        leading: TextButton(onPressed: () {
        }, child: Image.asset("assets/icons/menu.png")),
        actions: [
          Container(
            height: 40,
            width: 40,
            margin: EdgeInsets.only(right: 20,top: 10,bottom: 5),
            decoration: BoxDecoration(
              color: Colors.green,
              boxShadow: [
                BoxShadow(
                  color: Colors.green.withOpacity(.5),
                  blurRadius: 10,
                  offset: Offset(0, 0)
                ),
              ],
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(image: AssetImage("assets/images/pro.png"))
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 45.0,
                    width: 300.0,
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.green),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.green.withOpacity(0.5),
                          blurRadius: 10,
                          offset: Offset(0, 0),
                        )
                      ],
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          height: 45.0,
                          width: 250,
                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Search"
                            ),
                          ),
                        ),
                        Image.asset("assets/icons/search.png",
                          height: 25,)
                      ],
                    ),
                  ),

                  Container(
                    height: 45.0,
                    width: 45.0,
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.green.withOpacity(0.5),
                          blurRadius: 10,
                          offset: Offset(0, 0),
                        )
                      ],
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Image.asset("assets/icons/adjust.png",
                      height: 25,color: Colors.white,),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 35.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  for(int i=0; i< categories.length;i++)
                  GestureDetector(
                    onTap: () {
                      setState(()=>selectid=categories[i].id);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(categories[i].name,style: TextStyle(
                          color: selectid==i?Colors.green:
                          Colors.black.withOpacity(.7),
                          fontSize: 16.0
                        ),),
                        if(selectid==i)
                          CircleAvatar(
                            radius: 3,
                            backgroundColor: Colors.green,
                          )
                      ],
                    ),
                  )
                ],
              ),
            ),

            SizedBox(
              height: 320.0,
              child: PageView.builder(
                controller: controller,
                itemCount: plants.length,
                  physics: BouncingScrollPhysics(),
                  padEnds: false,
                  pageSnapping: true,
                  onPageChanged: (value) => setState(()=>activePage=value),
                  itemBuilder: (context, index) {
                  bool active= index == activePage;
                  return Slider(active, index);
                  },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Popular",style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0
                  ),),
                  Image.asset("assets/icons/more.png",
                    color: Colors.green,
                    height: 20,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 130.0,
              child: ListView.builder(
                padding: EdgeInsets.only(left: 20.0,top: 10),
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: populerPlants.length,
                itemBuilder: (context, index) {
                return Container(
                  width: 200.0,
                  margin: EdgeInsets.only(right: 20, bottom: 10),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.green.withOpacity(0.1),
                        blurRadius: 10.0,
                        offset: Offset(0, 5)
                      )],
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Stack(
                    alignment: Alignment.centerLeft,
                    children: [
                      Row(
                        children: [
                          Image.asset(populerPlants[index].imagePath,
                          height: 70,
                            width: 70,
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(populerPlants[index].name,style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w800,
                                //fontSize: 18.0
                              ),),
                              Text("\$${populerPlants[index].price.toStringAsFixed(0)}",
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.4),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12.0
                                ),),

                            ],)
                        ],),
                      Positioned(
                        right: 18,
                        bottom: 18,
                        child: CircleAvatar(
                          child: Image.asset("assets/icons/add.png",
                            color: Colors.white,
                            height: 15,
                          ),
                          backgroundColor: Colors.green,
                          radius: 15,
                        ),
                      ),

                    ],),

                );
              },),
            )
            

          ],
        ),
      )
    );
  }
  AnimatedContainer Slider(active,index){
    double margin=active?20:20;
    return AnimatedContainer(duration: Duration(
        milliseconds: 500
    ),
    curve: Curves.easeInOutCubic,
      margin: EdgeInsets.all(margin),
      child: mainPlantCard(index),


    );

  }
  Widget mainPlantCard(index){
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (builder)=>
            DetailsPage(plant: plants[index])));
      },
      child: Container(
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
         border: Border.all(color: Colors.green,width: 2),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 15,
              offset: Offset(5, 5),
            )
          ],
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Stack(
          children: [
        Container(
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          //border: Border.all(color: Colors.green,width: 2),
          color: Colors.lightGreen,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 15,
              offset: Offset(5, 5),
            )
          ],
          borderRadius: BorderRadius.circular(25.0),
          image: DecorationImage(image: AssetImage(plants[index].imagePath),
              fit: BoxFit.cover)
        ),
        ),
            Positioned(
              top: 8,
                right: 8,
                child: CircleAvatar(
                  child: Image.asset("assets/icons/add.png",
                    color: Colors.white,
                    height: 15,
                  ),
              backgroundColor: Colors.green,
                  radius: 15,
            ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                  padding: EdgeInsets.only(bottom: 5),
              child: Text(
                "${plants[index].name}-\$${plants[index].price.toStringAsFixed(0)}",
                style: TextStyle(
                color: Colors.black.withOpacity(0.7),
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0
              ),
              ),

              ),
            )
          ],
        ),
      ),
    );
  }
}
