import 'package:first_project/models/recommended_model.dart';
import 'package:flutter/material.dart';

import 'recommended_card.dart';

class RecommendedCarousel extends StatelessWidget {
  final List<Recommended> recommended;
  const RecommendedCarousel({
    Key? key,
    required this.recommended,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: recommended.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 5.0),
            child: RecommendedCard(recommended: recommended[index],),
          );
        },
      ),
    );
  }
}
