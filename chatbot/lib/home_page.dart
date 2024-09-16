import 'package:chatbot/feature_box.dart';
import 'package:flutter/material.dart';
import 'package:chatbot/pallete.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final speechToText = SpeechToText();
  String lastWords = '';
  @override
  void initState() {
    super.initState();
    initSpeechToText();
  }

  Future<void> initSpeechToText() async {
    await speechToText.initialize();
    setState(() {});
  } //initializes the plugin

  Future<void> startListening() async {
    await speechToText.listen(onResult: onSpeechResult);
    setState(() {});
  } //this makes sure that it listens whenever the user clicks the mic , and the speechtotext converts the speech to text whenever the user speaks and runs the inresult function

  /// Manually stop the active speech recognition session
  /// Note that there are also timeouts that each platform enforces
  /// and the SpeechToText plugin supports setting timeouts on the
  /// listen method.
  Future<void> stopListening() async {
    await speechToText.stop();
    setState(() {});
  }

  /// This is the callback that the SpeechToText plugin calls when
  /// the platform returns recognized words.
  void onSpeechResult(SpeechRecognitionResult result) {
    //here ,
    setState(() {
      lastWords = result.recognizedWords;
    });
  }

  @override
  void dispose() {
 
    super.dispose();
    speechToText.stop(); //if the screen has been stopped
  }

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
        body: SingleChildScrollView(
          child: Column(
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
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(
                    18), //since alignment center left moves it too far to the left , this will create padding around the text
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Here are a few features',
                  style: TextStyle(
                    fontFamily: 'Chivo',
                    color: Pallete.borderColor,
                    fontSize: 16,
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
        ),
        floatingActionButton: Container(
          // Outer container to wrap the FloatingActionButton and apply custom decoration
          decoration: BoxDecoration(
            shape: BoxShape.circle, // Ensures the container is circular
            gradient: const LinearGradient(
              colors: [
                Color(0xFF7000FF), // Start of the gradient (purple)
                Color(0xFFFF00B8), // End of the gradient (pink)
              ],
              begin:
                  Alignment.topLeft, // Gradient begins from the top-left corner
              end: Alignment
                  .bottomRight, // Gradient ends at the bottom-right corner
            ),
            boxShadow: [
              BoxShadow(
                color: Color(0xFF7000FF)
                    .withOpacity(0.6), // Purple shadow with 60% opacity
                blurRadius:
                    20, // Amount of blur for the shadow (glowing effect)
                spreadRadius:
                    5, // How far the shadow spreads outward from the button
              ),
            ],
          ),
          padding: const EdgeInsets.all(
              3), // Padding between the gradient border and the button itself
          child: ClipOval(
            // Ensures the FloatingActionButton stays perfectly circular within the container
            child: FloatingActionButton(
              onPressed: () async {
                if (await speechToText.hasPermission &&
                    speechToText.isNotListening) {
                  await startListening();
                } else if (speechToText.isListening) {
                  await stopListening();
                } else {
                  initSpeechToText();
                }//this just means that if the button is clicked and the app has permission and the mic isnt already listening , it should start listening , and if its already listening it should stop else the function should be run 
              },
              backgroundColor:
                  Colors.black, // Set the button's background to black
              elevation:
                  0, // Removes the default FloatingActionButton shadow to avoid conflicts with custom shadow
              child: const Icon(
                Icons.mic, // Mic icon inside the button
                color: Colors.purple, // Set the mic icon color to purple
              ),
            ),
          ),
        ));
  }
}
