import 'package:flutter/material.dart';
import 'package:plant_app_project/Widgets/bottom_nav.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(height: 25,),
          Text("Let\`s plant with us",style: TextStyle(
            fontSize: 22.0,
            letterSpacing: 1.8,
            fontWeight: FontWeight.w900
          ),),
          SizedBox(height: 5,),
          Text("Bring nature home",style: TextStyle(
              fontSize: 16,
              letterSpacing: 1.5,
              color: Colors.grey,
              fontWeight: FontWeight.w600
          ),),
          SizedBox(
            height: 450,
            width: 450,
            child: Image.asset("assets/images/Asset1.png"),
          ),
          SizedBox(height: 25,),
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNav(),));
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 80,
                vertical: 12.0
              ),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(10.0)
              ),
              child: Text("Sing In",style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w600
              ),),
            ),
          ),
          TextButton(onPressed: () {},
            child: Text("Create an account",style: TextStyle(
              fontSize: 16,
              letterSpacing: 1,
              color: Colors.black.withOpacity(.7),
              fontWeight: FontWeight.w500
          ),),),
          TextButton(onPressed: () {},
            child: Text("Forget Password?",style: TextStyle(
                fontSize: 14,
                letterSpacing: 1,
                color: Colors.black.withOpacity(.5),
                fontWeight: FontWeight.w500
            ),),)
        ],
      ),
    );
  }
}
