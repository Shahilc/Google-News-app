import 'package:flutter/material.dart';

import '../../../model/modelClass.dart';
import '../../detailsPage/detailsPage.dart';
class TodayWidget extends StatelessWidget {
  final List<Article> toDayData;
  const TodayWidget({super.key, required this.toDayData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10,left: 25,right: 25),
      child: Column(
        children:toDayData.getRange(5, toDayData.length).map((e){
          var imageUrl=e.urlToImage;
          return Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: InkWell(
              onTap: (){
                showDialog(context: context, builder: (context) =>  DetailsPage(article: e),);
              },
              child: SizedBox(
                height: 300,
                //color: Colors.grey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                              image: DecorationImage(
                                image: NetworkImage('$imageUrl'),
                                fit: BoxFit.fill,
                                onError: (exception, stackTrace) {
                                  imageUrl="https://www.shutterstock.com/image-vector/error-500-page-empty-symbol-260nw-1711106146.jpg";
                                },
                              )),
                        )),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
                        color: Color.fromARGB(255, 43, 45, 70),
                      ),
                      child:Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('${e.title}',style: TextStyle(
                            color: Colors.white,fontWeight: FontWeight.bold, fontSize: 20,overflow: TextOverflow.clip),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
