import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../model/modelClass.dart';
import 'componets/detailsWidget.dart';
class DetailsPage extends StatelessWidget {
  final Article article;
  const DetailsPage({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child:DetailsWidget(article: article) ,
      ),
    );
  }
}
