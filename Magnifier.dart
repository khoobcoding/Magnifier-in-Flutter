import 'package:flutter/material.dart';

class MagnifierApp extends StatefulWidget {
  const MagnifierApp({super.key});

  @override
  State<MagnifierApp> createState() => MagnifierAppState();
}

class MagnifierAppState extends State<MagnifierApp> {
  Offset draggestureposition=const Offset(50, 50);
  double magnifyscale=2;
  bool isvisible=false;
  String data =
      '''Flutter has developed an all-new feature RawMagnifier(). What this deals with is that it makes the text appear bigger only in the part where we want it to increase the size. It works on the same concept as we used a magnifier glass on a small text-sized encyclopedia.  

What else does it provide? We can arrange the shape of the magnifier according to our wish with many presets available and even the option to customize it ourselves. It not only helps to zoom in on the selectable text but also to zoom the UI elements of any webpage or PDF.''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 81, 163, 153),
          title: const Text(
            'Magnifier App',
            style: TextStyle(fontSize: 33, fontWeight: FontWeight.bold),
          ),
        ),
        body: GestureDetector(
          onPanUpdate:(details) {
          isvisible?  draggestureposition=details.localPosition:0;
            setState(() {
              print('Postion - $draggestureposition');
            });
          },
          child: SizedBox(
            height: 600,
            width: 300,
            child: Stack(children: [
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(10.0),
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 15),
                    child: Text(
                      data,
                    ),
                  ),
                  const CircleAvatar(
                      radius: 135,
                      backgroundImage: AssetImage(
                        "assets/img1.png",
                      )),
                ],
              ),
            isvisible?  Positioned(
                left:draggestureposition.dx-200/2,// 50,size of magnifier
                top:draggestureposition.dy-200/2,// 50 ,size of magnifier
                child:  RawMagnifier(size: const Size(200, 200),
                magnificationScale: magnifyscale,
                child: const Icon(Icons.zoom_in),
                decoration: const MagnifierDecoration(
                  shape: 
                  // RoundedRectangleBorder(
                  //   side: BorderSide(color: Colors.black,width: 3,),
                  //   borderRadius: BorderRadius.circular(50)
                  // )
                  CircleBorder( side: BorderSide(color: Colors.black,width: 3,),)
                  // StarBorder( side: BorderSide(color: Colors.black,width: 3,),)
                ),),
              ):SizedBox(),
              Align(
                alignment: Alignment.bottomCenter,
                heightFactor: 10.5,
                child: FloatingActionButton.extended(onPressed: (){
                  isvisible=!isvisible;
                  setState(() {
                    
                  });
                }, label: Text('Zoom'),
                backgroundColor: Colors.cyan,icon: Icon(
                 isvisible?Icons.visibility_off: Icons.visibility),),
              )
            ]),
          ),
        ),
        floatingActionButton:
        isvisible? Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FloatingActionButton(
              onPressed: () {
                magnifyscale+=0.3;
                setState(() {
                  
                });
              },
              backgroundColor: Colors.red,
              child: const Icon(Icons.add),
            ),
            const SizedBox(
              height: 20,
            ),
            FloatingActionButton(
              onPressed: () {
                if(magnifyscale>1){
                  magnifyscale-=0.3;
                  setState(() {
                    
                  });
                }
              },
              backgroundColor: Colors.teal,
              child: const Icon(Icons.remove),
            ),
          ],
        ):null);
  }
}
