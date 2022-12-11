import 'package:flutter/material.dart';
import 'remoteservice.dart';
import 'weather.dart';
import 'weatherpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}):super (key:key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  late int id;
  Weather? weather;
  var isLoaded = false;

  @override
  void initState(){
    super.initState();
    getData();
  }
  late List<String> date = weather!.hourly.time.map((e) => e.toString()).toList();
  late int selectedid = 0;
  late String selected = date[selectedid].toString();
  getData() async {
    weather = await RemoteService().getWeather();

    if(weather != null){
      setState(() {
        isLoaded = true;

      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Lviv weather"),
      ),
      body: Center(
        child: Column(

          children: [
            Container(
              margin: EdgeInsets.fromLTRB(100, 0, 75, 0),
              child: Text("Select date and time",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),),),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(250, 0, 75, 0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding: EdgeInsets.fromLTRB(50, 20, 50, 20),
                    ),
                    child: Text('Сьогодні'),
                    onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => WeatherPage(id: 12)));
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(100, 0, 75, 0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding: EdgeInsets.fromLTRB(50, 20, 50, 20),
                    ),
                    child: Text('Завтра'),
                    onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => WeatherPage(id: 36)));
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(100, 0, 75, 0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding: EdgeInsets.fromLTRB(50, 20, 50, 20),
                    ),
                    child: Text('Післязавтра'),
                    onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => WeatherPage(id: 60)));
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(100, 0, 75, 0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding: EdgeInsets.fromLTRB(50, 20, 50, 20),
                    ),
                    child: Text('Через 2 дні'),
                    onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => WeatherPage(id: 84)));
                    },
                  ),
                ),
              ],
            ),


          ],
        ),
      ),);}}
