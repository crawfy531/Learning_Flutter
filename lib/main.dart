import 'dart:math';

import 'package:flutter/material.dart';

// creates a stateful widget that will update and change
class Myapp extends StatefulWidget {
  const Myapp({Key? key}) : super(key: key);
  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  // initial position where the player starts
  int X = 2;
  int Y = 2;
  // sets the value of what the instruction text will display
  String Instructions = "Find the Treasure!";
  // sets the value of where the treasure is
  int TX = Random().nextInt(4);
  int TY = Random().nextInt(4);
  // sets what the game board looks like where x is an index and y is a row
  List row1 = ['O','O','O','O','O'];
  List row2 = ['O','O','O','O','O'];
  List row3 = ['O','O','X','O','O'];
  List row4 = ['O','O','O','O','O'];
  List row5 = ['O','O','O','O','O'];
  void Right(){
    // uses the move class while passing in a string
    Move('right');
  }
  void Left(){
    // uses the move class while passing in a string
    Move('left');
  }
  void Up(){
    // uses the move class while passing in a string
    Move('up');
  }
  void Down(){
    // uses the move class while passing in a string
    Move('down');
  }
  // moves the player position and updates the game board
  void Move(var direction) {
    List rows = [row1, row2, row3, row4, row5];
    if (direction == 'right') {
      setState(() {
        X += 1;
        if (X == 5) {
          X = 0;
        }
        rows[Y][X] = 'X';
        if (X != 0) {
          rows[Y][X - 1] = 'O';
        }
        else {
          rows[Y][4] = 'O';
        }
      });
    }
    if (direction == 'left') {
      setState(() {
        X -= 1;
        if (X == -1) {
          X = 4;
        }
        rows[Y][X] = 'X';
        if (X != 4) {
          rows[Y][X + 1] = 'O';
        }
        else {
          rows[Y][0] = 'O';
        }
      });
    }
    if (direction == 'up') {
      setState(() {
        Y -= 1;
        if (Y == -1) {
          Y = 4;
        }
        rows[Y][X] = 'X';
        if (Y != 4) {
          rows[Y + 1][X] = 'O';
        }
        else {
          rows[0][X] = 'O';
        }
      });
    }
    if (direction == 'down') {
      setState(() {
        Y += 1;
        if (Y == 5) {
          Y = 0;
        }
        rows[Y][X] = 'X';
        if (Y != 0) {
          rows[Y - 1][X] = 'O';
        }
        else {
          rows[4][X] = 'O';
        }
      });
    }
    // checks to see if the player position is equal to the treasure
    // displays if the player has won or keeps moving
  if (X == TX && Y == TY){
    setState(() {
      Instructions = "You Win!";
      return;
    });
  }
  else{
    setState(() {
      Instructions = "Find the Treasure!";
      return;
    });
  }
  }
    //----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

    //this constructs what the page will look like
  @override
  Widget build(BuildContext context) {
    return
      Container(
        //the background color is set to dark purple
      color: Colors.deepPurple.shade800,
      //everything is centered
      child: Center(
        //everything is within a column
        child: Column(
          //everything is centered within the column
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            // adds text
            Text("Hide and Seek",
              style: Theme.of(context).textTheme.headline1,
            ),
            // adds vertical spacing
            Padding(padding: EdgeInsets.symmetric(vertical: 10,horizontal:0)),
            // adds text
            Text('$Instructions',
              style: Theme.of(context).textTheme.headline2,
            ),
            // adds vertical spacing
            Padding(padding: EdgeInsets.symmetric(vertical: 10,horizontal:0)),
            // adds text based off of variable
            Text('$row1',
              style: Theme.of(context).textTheme.headline3,),
            // adds text based off of variable
            Text('$row2',
              style: Theme.of(context).textTheme.headline3,),
            // adds text based off of variable
            Text('$row3',
              style: Theme.of(context).textTheme.headline3,),
            // adds text based off of variable
            Text('$row4',
              style: Theme.of(context).textTheme.headline3,),
            // adds text based off of variable
            Text('$row5',
              style: Theme.of(context).textTheme.headline3,),
            // adds vertical spacing
            Padding(padding: EdgeInsets.symmetric(vertical: 10,horizontal:0)),
            // creates a button
            // when pressed the method Up is called
            TextButton(onPressed: Up,
                // text of the button
                child: Text(
                  'Up',
                  style: Theme.of(context).textTheme.headline2,)
            ),
            // adds vertical spacing
            Padding(padding: EdgeInsets.symmetric(vertical: 10,horizontal:0)),
            //creates elements in a row
            Row(
              // centers the row
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // creates a button
                // when pressed the method Left is called
                TextButton(onPressed: Left,
                    // text of the button
                    child: Text(
                      'Left',
                      style: Theme.of(context).textTheme.headline2,)
                ),
                // adds horizontal spacing
                Padding(padding: EdgeInsets.symmetric(vertical: 0,horizontal:10)),
                // creates a button
                // when pressed the method Right is called
                TextButton(onPressed: Right,
                    // text of the button
                    child: Text(
                      'Right',
                      style: Theme.of(context).textTheme.headline2,)
                ),
              ],
            ),
            // adds vertical spacing
            Padding(padding: EdgeInsets.symmetric(vertical: 10,horizontal:0)),
            TextButton(onPressed: Down,
                child: Text(
                  'Down',
                  style: Theme.of(context).textTheme.headline2,)
            ),

          ],
        )
      )

    );
  }
}
void main(){
  runApp(
    MaterialApp(
      // creates themes that will be used for all the text as well as buttons
      theme: ThemeData(
        textTheme: const TextTheme(
          headline1: TextStyle(
              fontSize: 60.0,
              color: Colors.blue,
              fontFamily: "Cambria",
              fontWeight: FontWeight.w800
          ),
            headline2: TextStyle(
                fontSize: 40.0,
                color: Colors.black,
                fontFamily: "Cambria",
                fontWeight: FontWeight.w500,
            ),
            headline3: TextStyle(
                fontSize: 40.0,
                color: Colors.blue,
                fontFamily: "Cambria",
                fontWeight: FontWeight.w500
            )
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.purple.shade700),
              fixedSize: MaterialStateProperty.all(Size.fromWidth(150))
          )
        )
      ),
      // constructs the app using the Myapp method
      home: const Myapp(),
    ),
  );
}