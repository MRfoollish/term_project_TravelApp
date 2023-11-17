import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:term_project/cubit/app_cubit.dart';
import 'package:term_project/widgets/app_large_text.dart';
import 'package:term_project/widgets/app_text.dart';
import 'package:term_project/widgets/responsive_button.dart';

import '../misc/colors.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List image = [
    "mountain_three.jpg",
    "mountain_two.jpg",
    "mountain_four.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: image.length,
          itemBuilder: (_, index){
          return Container(
            width: double.maxFinite,
            height: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    "img/"+image[index]
                  ),
                fit: BoxFit.cover
              )
            ),
            child: Container(
              margin: const EdgeInsets.only(top: 150, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppLargeText(text: "App พาเที่ยว"),
                      AppText(text: "บนหุบเขา", size: 30,),
                      SizedBox(height: 20,),
                      Container(
                        width: 250,
                        child: AppText(
                          text: "สัมผัสประสบการณ์การเบุกป่าฝ่าดงในหุบเขาที่มีความอิสระและสวยงามด้วยแอพพาเที่ยวของเรา!",
                          color: AppColors.textColor2,
                          size: 14,
                        ),
                      ),
                      SizedBox(height: 40,),
                      GestureDetector(
                        onTap: (){
                          BlocProvider.of<AppCubits>(context).getData();
                        },
                        child: Container(
                            width: 200,
                            child: Row(children: [ResponsiveButton(width: 120,)])),
                      )
                    ],
                  ),
                  Column(
                    children: List.generate(3, (indexDots){
                      return Container(
                        margin: const EdgeInsets.only(bottom: 2),
                        width: 8,
                        height: index==indexDots?25:8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: index==indexDots?AppColors.mainColor:AppColors.mainColor.withOpacity(0.3)
                        ),
                      );
                    }),
                  )
                ],
              )
            ),
          );
      }),
    );
  }
}
