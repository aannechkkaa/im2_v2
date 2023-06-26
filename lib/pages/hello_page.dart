import 'package:flutter/material.dart';
import 'package:flutter_gifimage/flutter_gifimage.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:im2/pages/first_page.dart';


class hello_page extends StatefulWidget {
  const hello_page({super.key});

  @override
  State<hello_page> createState() => _hello_pageState();
}

class _hello_pageState extends State<hello_page> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => First_p()),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image.asset("assets/lolgo.gif",
                  width: 200,
                  height: 200,),
              ),
              Center(
                child: SvgPicture.asset(
                  'assets/hello_page_name.svg',
                  // Укажите размер изображения
                  width: 130,
                  height: 130,
                ),

              )
            ],
          )
        
    );
  }
}
