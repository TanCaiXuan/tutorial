import 'package:flutter/material.dart';
import 'story_brain.dart';


//Create a new storyBrain object from the StoryBrain class.
StoryBrain storyBrain = StoryBrain();

void main() => runApp(AdventureGame());

class AdventureGame extends StatelessWidget {
  const AdventureGame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(), // we are using the dark theme
      home: StoryPage(),
    );
  }
}


class StoryPage extends StatefulWidget {
  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //Find a background image, add the background image into the images directory, then add the background image to this Container
        decoration: BoxDecoration(image: DecorationImage(image:AssetImage('images/background_image.jpg'),fit: BoxFit.cover),),
        padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        constraints: BoxConstraints.expand(),
        child: SafeArea(

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,

            children: [

              Expanded(
                flex: 12,
                child: Center(
                  child: Text(
                    //use the storyBrain to get the first story title and display it in this Text Widget.
                    storyBrain.getStory(),
                    style: TextStyle(
                      fontSize: 25.0,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: TextButton(
                  onPressed: () {
                    // Choice 1 made by user
                    //Call the nextStory() method from storyBrain and pass the number 1 as the choice made by the user.
                    setState(() {
                      storyBrain.nextStory(1);
                    });

                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith(
                            (states) => Colors.red),
                    foregroundColor: MaterialStateProperty.resolveWith(
                            (states) => Colors.white),
                    shape: MaterialStateProperty.resolveWith(
                            (states) => BeveledRectangleBorder()),
                  ),
                  child: Text(
                    //Use the storyBrain to get the text for choice 1.
                    storyBrain.getChoice1(),
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Expanded(
                flex: 2,
                //Use a Flutter Visibility Widget to wrap this TextButton.
                child: Visibility(
                  visible: storyBrain.buttonShouldBeVisible(),
                  //Set the "visible" property of the Visibility Widget to equal the output from the buttonShouldBeVisible() method in the storyBrain.
                    child: TextButton(
                      onPressed: () {
                        //Choice 2 made by user
                        //Call the nextStory() method from storyBrain and pass the number 2 as the choice made by the user.

                        setState(() {
                          storyBrain.nextStory(2);
                        });
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith(
                                (states) => Colors.blue),
                        foregroundColor: MaterialStateProperty.resolveWith(
                                (states) => Colors.white),
                        shape: MaterialStateProperty.resolveWith(
                                (states) => BeveledRectangleBorder()),
                      ),
                      child: Text(
                        //Use the storyBrain to get the text for choice 2.
                        storyBrain.getChoice2(),
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ),

                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

