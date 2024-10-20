import 'package:chatbot/pallete.dart';
import 'package:flutter/material.dart';

class FeatureBox extends StatelessWidget {
  final Color color; //The color is taken from this constructor because color of the boxes on the suggestions are different
  final String headerText;// This will be for the header on the bot suggestion section
  final String descriptionText;
  const FeatureBox({
    super.key,
    required this.color,
    required this.headerText,
    required this.descriptionText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical:10.0).copyWith(
          left: 15,
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                headerText,
                style: const TextStyle(
                fontFamily:'Chivo' ,
                color: Pallete.whiteColor,
                fontSize: 18.5,
                fontWeight: FontWeight.bold,
              ),
              ),
            ),
            const SizedBox(height: 3),//This creates space between the suggestion boxes
           Padding(
             padding: const EdgeInsets.only(right: 20),
             child: Text(
                descriptionText,
                style: const TextStyle(
                fontFamily:'Chivo' ,
                color: Pallete.whiteColor,
              ),
                       ),
           ),
          ],
        ),
      ),
    );
  }
}
