import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:google_fonts/google_fonts.dart';
class Game_screen extends StatefulWidget {
  const Game_screen({super.key});

  @override
  State<Game_screen> createState() => _Game_screenState();
}

class _Game_screenState extends State<Game_screen> {
  int fillboxes=0;
  int O_score=0;
  int X_score=0;
  bool F_Turn=true;
  List<String> OX =['','','','','','','','','',];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown,
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Scoreboard",style: GoogleFonts.abrilFatface(color: Colors.white,fontSize: 20),)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Player 0 score",style: GoogleFonts.acme(color: Colors.white,fontSize: 20),),
                            Text("$O_score",style: TextStyle(color: Colors.white,fontSize: 20),)
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Player X score",style: GoogleFonts.acme(color: Colors.white,fontSize: 20),),
                            Text("$X_score",style: TextStyle(color: Colors.white,fontSize: 20),)
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: GridView.builder(
              itemCount: 9,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                itemBuilder: (BuildContext context,int index) {
                  return GestureDetector(
                    onTap: (){
                      dispOX(index);
                    },
                    child: Container(
                      child: Center(
                          child: Text(OX[index],
                            style: TextStyle(fontSize: 30,
                                color: Colors.white
                            ),
                          )
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                      ),
                    ),
                  );
                },),
          ),
        ],
      ),
    );
  }
  void Draw_dialogue(){
    AwesomeDialog(
      dismissOnTouchOutside: false,
      context: context,
      dialogType: DialogType.info,
      animType: AnimType.rightSlide,
      title: 'Draw',
      desc: "Nobody wins",
      btnOkText: "Play Again",
      btnOkOnPress: (){
        play_ag();
      },
    ).show();
  }
  void play_ag(){
    setState((){
      for(int i=0;i<9;i++) {
        OX[i] = '';
      }
      fillboxes=0;
    });
  }
  void reset(){
    setState(() {
      for(int i=0;i<9;i++){
        OX[i]='';
      }
      fillboxes=0;
      O_score=0;
      X_score=0;
    });
  }
  void win_alert(String winner){
    AwesomeDialog(
      dismissOnTouchOutside: false,
        context: context,
        dialogType: DialogType.success,
        animType: AnimType.rightSlide,
        title: 'Winner',
        desc: 'Winner is : $winner',
    btnCancelText: "Reset",
    btnCancelOnPress: (){
          reset();
    },
    btnOkText: "Play Again",
    btnOkOnPress: () {
    play_ag();
          },
    ).show();
    if(winner=='o'){
      O_score++;
    } else if(winner == 'x'){
      X_score++;
    }
  }
  void winner(){
    if(OX[0] == OX[1] && OX[0] == OX[2] && OX[0]!='') {
      win_alert(OX[0]);
    }
      if(OX[3] == OX[4] && OX[3] == OX[5] && OX[3]!='') {
        win_alert(OX[3]);
      }
        if(OX[6] == OX[7] && OX[6] == OX[8] && OX[6]!='') {
          win_alert(OX[6]);
        }
          if(OX[0] == OX[3] && OX[0] == OX[6] && OX[0]!='') {
            win_alert(OX[0]);
          }
            if(OX[1] == OX[4] && OX[1] == OX[7] && OX[1]!='') {
              win_alert(OX[1]);
            }
              if(OX[2] == OX[5] && OX[2] == OX[8] && OX[2]!='') {
                win_alert(OX[2]);
              }
                if(OX[0] == OX[4] && OX[0] == OX[8] && OX[0]!='') {
                  win_alert(OX[0]);
                }
                  if(OX[6] == OX[4] && OX[6] == OX[2] && OX[6]!='') {
                    win_alert(OX[6]);
                  }
                  else if(fillboxes==9 && winner!='o' && winner!='x'){
                    Draw_dialogue();
                  }
    }
  void dispOX(int index){
    setState(() {
      if(F_Turn && OX[index]=='') {
        OX[index] = 'o';
        fillboxes++;
      }else if(!F_Turn && OX[index]==''){
        OX[index]='x';
        fillboxes++;
      }
      F_Turn=!F_Turn;
      winner();
    });
  }
}
