import 'package:flutter/material.dart';
import 'package:weather_app1/screens/location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_app1/services/weather.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    locationInfo();
  }

  void locationInfo() async {
    WeatherHelper weatherHelper = WeatherHelper();
    var weatherInfo = await weatherHelper.locationFunc();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return LocationScreen(
            locationWeatherInfo: weatherInfo,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(55, 0, 0, 85),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
              child: Image(
            image: AssetImage('images_and_icons/loading_background.png'),
            width: MediaQuery.of(context).size.width * 0.65,
            height: MediaQuery.of(context).size.height * 0.50,
          )),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Text(
              'Current Weather',
              style: TextStyle(
                fontSize: 30,
                letterSpacing: 2,
              ),
            ),
          )
        ],
      ),
    );
  }
}
// SpinKitFadingCube(
// color: Colors.blueGrey,
// size: 40.0,
// ),
