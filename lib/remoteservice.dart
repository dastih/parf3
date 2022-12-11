import 'weather.dart';
import 'package:http/http.dart' as http;

class RemoteService{

  Future<Weather?> getWeather() async{
    var client = http.Client();
    var uri = Uri.parse('https://api.open-meteo.com/v1/forecast?latitude=49.84&longitude=24.02&hourly=temperature_2m');
    var response = await client.get(uri);
    if (response.statusCode == 200){
      var json =response.body;
      return weatherFromJson(json);
    }
  }
}