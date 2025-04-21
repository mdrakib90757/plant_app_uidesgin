import 'package:flutter/material.dart';
import 'package:plant_app_project/Pages/details_page.dart';
import 'package:plant_app_project/Pages/home_page.dart';
import 'package:plant_app_project/data/plant_data.dart';

import '../data/bottom_menu.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  PageController pageController=PageController();
  int selectIndex=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: pageController,
        itemCount: child.length,
          onPageChanged: (value) => setState(() => selectIndex=value),
          itemBuilder: (itemBuilder, index){
          return Container(
            child: child[index],
          );
          }
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        child: SizedBox(
          height: 60.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              for(int i=0; bottomMenu.length>i;i++)
              GestureDetector(
                onTap: () {
                  pageController.jumpToPage(i);
                  selectIndex=i;
                },
                child: Image.asset(bottomMenu[i].imagePath,
                  color: selectIndex==i?Colors.green:Colors.grey.withOpacity(0.5),),
              )
            ],
          ),
        )
      ),
    );
  }
}

List<Widget>child=[
  HomePage(),
  Container(color: Colors.white,),
  Container(color: Colors.white,),
  Container(color: Colors.white,),

];
