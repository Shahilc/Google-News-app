import 'package:flutter/material.dart';
import 'package:googlenewsapi/view/detailsPage/detailsPage.dart';
import 'package:googlenewsapi/view/homePage/componets/popularWigget.dart';
import 'package:lottie/lottie.dart';

import '../../controller/getServiceController.dart';
import '../../utils/app_str.dart';
import '../../utils/app_toastPrint.dart';
import '../../model/modelClass.dart';
import 'componets/categoriesWidget.dart';
import 'componets/toDayWidget.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GetNewsDataModel? getNewsDataModel;
  List categories=[];
  List<Article> popular=[];
  bool loading=true;

  _getData() async {
    ApiController apiController = ApiController();
    try {
      await apiController.getNews().then((value) {
        getNewsDataModel = value;
        getNewsDataModel?.articles.forEach((element) {
          categories.add(element.source?.name);
        });
        getNewsDataModel?.articles.forEach((element) {
          popular.add(element);
        });
      });
      setState(() {
        loading=false;
      });
    } catch (e) {
      ToastController.flutterToastController('Failed to load data');
    }
  }

  @override
  void initState() {
    _getData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 10, 15, 34),
      body: loading? Center(child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset('images/animation.json',height: 100),
        ],
      )):ListView(
        children: [
          SafeArea(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 15,top: 20,bottom: 10),
                  child: Row(
                    children: [
                      Text(AppStrings.popular,style: TextStyle(color: Color.fromARGB(255, 113, 101, 201),fontSize: 20,fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
                //popular Widget
                PopularWidget(popular:popular),
                //today Text
                const Padding(
                  padding: EdgeInsets.only(left: 25,top: 20),
                  child: Row(
                    children: [
                      Text(AppStrings.today,style: TextStyle(color: Color.fromARGB(255, 113, 101, 201),fontSize: 20,fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
                //today Widget
                TodayWidget(toDayData: popular),
               //empty space
               const SizedBox(height: 20,)

              ],
            ),
          ),
        ],
      ),
    );
  }
}
