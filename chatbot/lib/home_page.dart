import 'package:chatbot/feature_box.dart';
import 'package:flutter/material.dart';
import 'package:chatbot/pallete.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('pie'), // This is the title on the top of the app
        leading: const Icon(Icons.menu), // Creates a menu
        iconTheme: const IconThemeData(color: Colors.white), // Icon color
        titleTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontFamily: 'Comfortaa'), // Text color
        centerTitle: true,
      ),
      body: Column(
        children: [
          //Bot picture
          Center(
            child: Container(
              height: 120,
              width: 120,
              margin: const EdgeInsets.only(top: 20), // Keeps the margin
              decoration: const BoxDecoration(
                shape: BoxShape.circle, // Makes the container circular
                image: DecorationImage(
                  image: AssetImage('assets/images/Alien01.png'),
                ),
              ),
            ),
          ),
          //Chat bubble
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal:
                  30, // Adds padding to the left and right of the text inside the text container
              vertical:
                  20, // Adds padding to the top and bottom of the text inside the text container
            ),
            margin: const EdgeInsets.symmetric(horizontal: 40).copyWith(
              top: 30,
            ), // Keeps the margin
            decoration: BoxDecoration(
              border: Border.all(
                color: Pallete.borderColor,
              ),
              borderRadius: BorderRadius.circular(20).copyWith(
                topLeft: Radius
                    .zero, //This makes every edge of the box circular apart from the top left
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                'Good morning , what task can I do for you?',
                style: TextStyle(
                  fontFamily: 'Chivo',
                  color: Pallete.whiteColor,
                  fontSize: 25,
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(
                20), //since alignment center left moves it too far to the left , this will create padding around the text
            alignment: Alignment.centerLeft,
            child: const Text(
              'Here are a few features',
              style: TextStyle(
                fontFamily: 'Chivo',
                color: Pallete.borderColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          //Bot suggestions
          Column(
            children: const [
              FeatureBox(
                color: Pallete.mainFontColor,
                headerText: 'ChatGPT',
                descriptionText:
                    'A faster way to go around find answers to every question with ChatGPT',
              ),
              FeatureBox(
                color: Pallete.firstSuggestionBoxColor,
                headerText: 'Dall-E',
                descriptionText:
                    'Get Inspired & stay creative with your personal assistant powered by Dall-E',
              ),
              FeatureBox(
                color: Pallete.thirdSuggestionBoxColor,
                headerText: 'Smart Voice Assistant',
                descriptionText:
                    'Get the best of both worlds with a voice assistant powered by Dall-E & ChatGPT ',
              ),
            ],
          )
        ],
      ),
    );
  }
}
