import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:mmusuperapp/food/models/food.dart';
import 'package:mmusuperapp/food/models/restaurant.dart';
import 'package:mmusuperapp/food/pages/food_page.dart';
import 'dart:math';
import 'package:mmusuperapp/food/widget/bigtext.dart';
import 'package:mmusuperapp/food/widget/iconandtext.dart';
import 'package:mmusuperapp/food/widget/smalltext.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key});

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = 320;

  

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
        
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          //color: Colors.redAccent,
          height: 320,
          child: PageView.builder(
            controller: pageController,
            itemCount: 5,
            itemBuilder: (context, position) {
              return _buildPageItem(position);
            }
          ),
        ),
        DotsIndicator(
        dotsCount: 5,
        position: _currPageValue,
        decorator: DotsDecorator(
          activeColor: Colors.black,
          size: const Size.square(9.0),
          activeSize: const Size(18.0, 9.0),
          activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        ),
      ),
      
          ],
        );
      
  }
  Widget _buildPageItem(int index) {
    Food foodItem = Restaurant().menu[index % Restaurant().menu.length];
    Matrix4 matrix = Matrix4.identity();
    if(index==_currPageValue.floor()) {
      var currScale = 1-(_currPageValue-index)*(1-_scaleFactor);
      var currTrans = _height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);

    } else if (index == _currPageValue.floor()+1) {
      var currScale = _scaleFactor+(_currPageValue-index+1)*(1-_scaleFactor);
      var currTrans = _height*(1-currScale)/2; 
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);

    } else if (index == _currPageValue.floor()-1) {
      var currScale = 1-(_currPageValue-index)*(1-_scaleFactor);
      var currTrans = _height*(1-currScale)/2; 
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);

    } else{
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, _height*(1-_scaleFactor)/2, 1);
    }
    return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => FoodPage(food: foodItem)),
      );
    },
    child: Transform(
      transform: matrix,
    child:Stack(
      children: [
        Container(
          height:  220,
          margin: EdgeInsets.only(left: 10, right: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: index.isEven?Color.fromARGB(255, 166, 175, 177): Color(0xFF9294cc),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                foodItem.imagePath
                

              )
            )
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
          height:  120,
          margin: EdgeInsets.only(left: 30, right: 30, bottom: 30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Color(0xFFe8e8e8),
                blurRadius: 5.0,
                offset: Offset(0, 5)
              ),
              BoxShadow(
                color: Colors.white,
                offset: Offset(-5, 0),
              ),
              BoxShadow(
                color: Colors.white,
                offset: Offset(5, 0),
              ),
            ]
            ),
            child: Container(
              padding: EdgeInsets.only(top: 15, left: 15, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BigText(text: foodItem.name),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Wrap(
                        children: List.generate(5, (index) {return Icon(Icons.star, color:Color(0xFF89dad0), size: 15,);}),
                      ),
                      SizedBox(width: 10,),
                      SmallText(text: "4.5"),
                      SizedBox(width: 10,),
                      SmallText(text: "1287"),
                      SizedBox(width: 10,),
                      SmallText(text: "comments")
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconAndTextWidget(icon: Icons.circle_sharp, 
                      iconColor: Color(0xFFffd28d), 
                      text: "Normal"),
                      IconAndTextWidget(icon: Icons.location_on, 
                      iconColor: Color(0xFFffd28d), 
                      text: "1.7km"),
                      IconAndTextWidget(icon: Icons.access_time_rounded, 
                      iconColor: Color(0xFFfcab88), 
                      text: "32min"),
                    ],
                  )
                ],
              ),
            ),
          ),
        )
      ],
    )));
  }
}