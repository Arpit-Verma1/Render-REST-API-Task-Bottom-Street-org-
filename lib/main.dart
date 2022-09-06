import 'dart:async';

import 'package:flutter/material.dart';
import 'package:project3/remoteservice.dart';
import 'package:project3/remoteservice2.dart';
import 'package:project3/test.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:project3/test1.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Welcome>?welcome;
  var isload =false;
  int a=0;

  late Future<Welcome1> welcome12;
  late Timer timer;
  @override
  @override
  void initState() {
    super.initState();
    if(false==isload){
      getdata();
    timer = Timer.periodic(Duration(seconds: 2), (Timer t) => getdata());}
    welcome12 = fetchAlbum();
  }
  getdata()async{
    welcome=await remote().get();
    welcome12 = fetchAlbum();
    if(welcome!=null){
    setState((){
      isload=true;
    });
    }
  }@override
  void dispose() {

    timer?.cancel();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

      ),
      body: Container(
        padding: EdgeInsets.all(10),child:
      Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
        Text("Overview",style: TextStyle(color: Color.fromARGB(255,14,60,110),fontSize: 20),),
        Divider(color: Colors.grey),
        Container(
          child:
          FutureBuilder<Welcome1>(
            future:welcome12,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return
                    Row(crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Expanded(child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [ Text("Security"),
                            Text("Sector"),
                            Text("Industry"),
                            Text("Industry Slug"),
                            Text("Market Cap."),
                            Text("Security Slug"),
                            Text("Book Nav Share"),
                            Text("Page Ratio"),
                            Text("TTME"),
                            Text("Year End"),
                            Text("TTM Year End"),
                            Text("Welcome Yeild")],
                        )),
                        Expanded(child:
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [ Text(snapshot.data!.security),
                            Text(snapshot.data!.sector),
                            Text(snapshot.data!.industry),
                            Text(snapshot.data!.industrySlug),
                            Text(snapshot.data!.mcap.toString()),
                            Text(snapshot.data!.securitySlug),
                            Text(snapshot.data!.bookNavPerShare.toString()),
                            Text(snapshot.data!.pegRatio.toString()),
                            Text(snapshot.data!.ttmpe.toString()),
                            Text(snapshot.data!.yearEnd.toString()),
                            Text(snapshot.data!.ttmYearEnd.toString()),
                            Text(snapshot.data!.welcome1Yield.toString()),],
                        ))





                      ],);

              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),),
        SizedBox(height: 10,),
        Text("Performance",style: TextStyle(color: Color.fromARGB(255,14,60,110),fontSize: 20),),
        Divider(color: Colors.grey),
        Visibility(visible: isload,
          child: ListView.builder(itemCount: welcome?.length,
            shrinkWrap: true,
            itemBuilder:(context, index) => Column(
            children: [
              Row(
                children: [Container(child: Text(welcome![index].label),width:MediaQuery.of(context).size.width*0.2,)
                  ,
                  LinearPercentIndicator( //leaner progress bar
                      width: 150, //width for progress bar
                      //animation to show progress at first
                      animationDuration: 1000,
                      lineHeight: 30.0, //height of progress bar

                      percent: a>welcome![index].changePercent?-1*welcome![index].changePercent/welcome![7].changePercent:welcome![index].changePercent/welcome![7].changePercent, // 30/100 = 0.3
                      barRadius: const Radius.circular(5),


                      progressColor: a>welcome![index].changePercent?Colors.red:Colors.green , //percentage progress bar color
                      backgroundColor:  Colors.grey.shade300  //background progressbar color
                  ),
                Text("${double.parse("${welcome![index].changePercent}").toStringAsFixed(1)}",style: TextStyle(color:a>welcome![index].changePercent?Colors.red:Colors.green),),
                Icon(a>welcome![index].changePercent?Icons.arrow_drop_down:Icons.arrow_drop_up,color: a>welcome![index].changePercent?Colors.red:Colors.green,)
                ],
              ),SizedBox(height: 10,)

            ],
          ),),
        ),

        ]

      )
      )
    );
  }
}
