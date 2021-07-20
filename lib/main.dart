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
      
        
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                
              
            children: [
              Row(
                              children: [Hero(tag:'1',
                  child: Image(image:AssetImage('assets/feedback_pic.jpg'),
                  width:300
              
              )),],
                  mainAxisAlignment: MainAxisAlignment.center,
                  
              ),
              SizedBox(height: 30),
              FloatingActionButton(onPressed:(){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
                },
                child: Text('Start'),)
            ],),
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
  List <String> list  = ['How did you like our service','How did you appreciate the sanitation',
  'How was the sound quality','How was the lighting','How likely are you to recommend us to a friend','How likely are you to come back here'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
      centerTitle: true,
        title: Text('Feedback',),
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
                    image: AssetImage('assets/feedback_pic.jpg'),
                    height: 200,
                    width: 200,
                  ),
                ),
                SizedBox(height: 30),
                
                
                Text(list[i]
                ,style: TextStyle(
                  fontSize: 25,
                  color: Colors.blueGrey

                ),),
                SizedBox(height: 30),
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
                SizedBox(height: 30),
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
                   color: Colors.red,
                   fontSize: 15,
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
                   color: Colors.yellow,
                   fontSize: 15,
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
                   fontSize: 15,
                   color: Colors.green
                 ) ),
                 SizedBox(height: 20),
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


