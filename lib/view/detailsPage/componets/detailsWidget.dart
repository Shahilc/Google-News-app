import 'package:flutter/material.dart';

import '../../../model/modelClass.dart';
class DetailsWidget extends StatelessWidget {
  final Article article;
  const DetailsWidget({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeData theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          const SizedBox(height: 10,),
          Text(
            '${article.title}',
            style: theme.textTheme.headlineSmall,
          ),
          const SizedBox(height: 15,),
          Container(
            height: size.height/3.5,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: NetworkImage('${article.urlToImage}'),
                  fit: BoxFit.fill,
                )),
          ),
          const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '${article.description}',
              style: theme.textTheme.bodyLarge,
            ),
          ),
        ],
      ),
    );
  }
}
