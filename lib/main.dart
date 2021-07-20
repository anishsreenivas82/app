import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Intro(),
  ));
}

class Intro extends StatefulWidget {
  const Intro({ Key? key }) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<Intro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SafeArea(
              child: Center(
          
                child: Column(
            children: [
              Hero(tag:'1',
              child: Image(image:AssetImage('assets/feedback_pic.jpg'),
              fit: BoxFit.fill,)),
              FloatingActionButton(onPressed:(){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
              },
              child: Text('Start'),)
            ],),
        ),
      )

      
    );
  }
}
class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  double count =0;
  double rating=1;
  int i =0;
  List <String> list  = ['text1','text2','text3','text4','text5','text6'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      centerTitle: true,
        title: Text(''),
      ),
      body: SafeArea(
              child: Padding(
          padding: EdgeInsets.all(20),
          child: Center(
                      child: Column(
              children: [if(i!=6)...[

                Hero(
                                tag: '1',
                                child: Image(
                    image: AssetImage('assets/feedback_pic.jpg')
                  ),
                ),
                
                
                Text(list[i]),
                Slider(value:rating, onChanged: (newRating)
                {
                  setState(() {
                    rating = newRating;
            
                  });
                  
                },
                min:1,
                max:5,
                divisions: 4,
                label: "$rating",),
                FloatingActionButton(
                  onPressed: (){
                    setState(() {
                      count = count + rating;
                      i++;
                      rating = 1;
                    });
            
                    

                  },
                  child: Text('Next'),
                )
                
                
              ]
              else...[

               if(0<=count&&count<=10)...[
                 Text('We are sorry for the inconvinience',
                 
                 style: TextStyle(
                   color: Colors.red
                 ) ),
                 TextButton(onPressed:(){setState(() {
                   i=0;
                   rating=1;
                   count=0;
                 });}, child: Text('Restart'))
               ]
               else if(11<=count&&count<=20)...[
                 Text('Hope we serve you better next time',
                 style: TextStyle(
                   color: Colors.yellow
                 ) ),
                 TextButton(onPressed:(){setState(() {
                   i=0;
                   rating=1;
                   count=0;
                 });}, child: Text('Restart'))
               ]
               else...[
                 Text('We hope you come back next time',
                 style: TextStyle(
                   color: Colors.green
                 ) ),
                 TextButton(onPressed:(){setState(() {
                   i=0;
                   rating=1;
                   count=0;
                   Navigator.pop(context);
                 });}, child: Text('Restart'))
               ]
              ]
              
              ]
            ),
          )

        ),
      ),

    
      

      



    );
      
    
  }
}


