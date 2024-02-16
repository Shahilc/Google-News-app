import 'package:flutter/material.dart';
class CategoriesWidget extends StatelessWidget {
  final List categories;
  const CategoriesWidget({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(top: 20),
      child: SizedBox(
          height: 50,
          // color: Colors.grey,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return
                Padding(
                  padding: const EdgeInsets.only(top: 5,bottom: 5,left: 5,right: 5),
                  child: Container(
                    padding: const EdgeInsets.only(left: 15,right: 15,bottom: 3,top: 3),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: Colors.white24),
                    child: Center(
                        child: Text('${categories[index]}',style: const TextStyle(color: Colors.white,fontSize: 13),)),
                  ),
                );
            },
          )
      ),
    );
  }
}
