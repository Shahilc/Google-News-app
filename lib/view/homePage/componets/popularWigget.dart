import 'package:flutter/material.dart';

import '../../../model/modelClass.dart';
import '../../detailsPage/detailsPage.dart';
class PopularWidget extends StatelessWidget {
  final List<Article> popular;
  const PopularWidget({super.key, required this.popular});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 190,
      // color: Colors.grey,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          String? imageUrl=popular[index].urlToImage;
          return Padding(
            padding: const EdgeInsets.only(left: 20,),
            child: InkWell(
              onTap: ()async{
                await showDialog(context: context, builder: (context) {
                  return  DetailsPage(article: popular[index],);
                },);
              },
              child: SizedBox(
                width: 230,
                // color: Colors.indigo,
                child: Column(
                  children: [
                    Expanded(
                      flex: 6,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                            image: DecorationImage(
                                image: NetworkImage('$imageUrl'),
                                fit: BoxFit.cover
                            )
                        ),
                        child: const Row(
                          mainAxisAlignment:MainAxisAlignment.spaceBetween ,
                          children: [
                            Icon(Icons.arrow_back_ios_rounded,color: Colors.white,size: 20,),
                            RotatedBox(quarterTurns: 2,child:  Icon(Icons.arrow_back_ios_rounded,color: Colors.white,size: 20,))
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
                            color: Color.fromARGB(255, 43, 45, 70)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(13),
                          child: Text('${popular[index].title}',style: TextStyle(color: Colors.white),overflow: TextOverflow.ellipsis),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
