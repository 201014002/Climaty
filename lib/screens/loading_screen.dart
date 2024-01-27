import 'package:flutter/material.dart';
import 'package:climaty/services/location.dart';
import 'package:http/http.dart' as http;
const apiKey='936009a6cab55986fd627a26b2bb0808';
class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    print(location.latitude);
    print(location.longitude);
  }

  void getData() async {
    http.Response response =await http.get(Uri.parse("https://samples.openweathermap.org/data/2.5/weather?lat=51.5098&lon=-0.1180&appid=936009a6cab55986fd627a26b2bb0808"));
    if(response.statusCode==200){
      String data=response.body;
      print(data);
    }else{
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold();
  }
}
