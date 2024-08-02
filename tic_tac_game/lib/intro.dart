import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

import 'game_screen.dart';
class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown,
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 80),
                child: ClipRRect(
                  child:SizedBox(
                    width: 200,
                    height: 200,
                    child: Image.asset('Assets/ttt.png',
                    fit:BoxFit.cover,
                    ),
                  )
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Text("Tic   Tac   Toe",
              style: GoogleFonts.acme(textStyle: const TextStyle(fontSize: 40,color:Colors.white)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.brown.shade800),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Game_screen(),));
              },
              child: Text("Play Game!!",
                style: GoogleFonts.abel(textStyle: const TextStyle(fontSize: 30,color: Colors.white)),
              ),
            ),
          ),
          ],
      ),
    );
  }
}
