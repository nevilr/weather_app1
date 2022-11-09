import 'package:flutter/material.dart';
import 'package:weather_app1/screens/place_screen.dart';
import 'package:weather_app1/utilities/constants.dart';
import 'package:weather_app1/services/weather.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({this.locationWeatherInfo});
  final locationWeatherInfo;
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherHelper weatherHelper = WeatherHelper();
  int currentTemperature = 0;
  String tempMessage = '';
  String conditionCode = '';
  String city = '';
  String nullMessage = '';
  @override
  void initState() {
    super.initState();
    changesUI(widget.locationWeatherInfo);
  }

  void changesUI(dynamic weatherInfo) {
    setState(() {
      if (weatherInfo == null) {
        currentTemperature = 0;
        conditionCode = 'Error';
        nullMessage = 'Unable to Fetch Data.';
        tempMessage = '';
        return;
      }
      double currentTemp = weatherInfo['current']['temp_c'];
      currentTemperature = currentTemp.toInt();
      tempMessage = weatherHelper.WeatherMessage(currentTemperature);
      conditionCode = weatherHelper.WeatherIcon(
          weatherInfo['current']['condition']['code'],
          weatherInfo['current']['is_day']);
      city = weatherInfo['location']['name'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.light(),
      child: Scaffold(
        body: Container(
          // decoration: BoxDecoration(
          //   image: DecorationImage(
          //     image: AssetImage('gifs/location_background.gif'),
          //     fit: BoxFit.cover,
          //     colorFilter: ColorFilter.mode(
          //         Colors.white.withOpacity(0), BlendMode.dstATop),
          //   ),
          // ),
          // constraints: BoxConstraints.expand(),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    TextButton(
                      onPressed: () async {
                        var weatherInfo = await weatherHelper.locationFunc();
                        changesUI(weatherInfo);
                      },
                      child: Icon(
                        Icons.near_me,
                        size: 40.0,
                        color: Colors.blueGrey,
                      ),
                    ),
                    TextButton(
                      onPressed: () async {
                        var placeName = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return PlaceScreen();
                            },
                          ),
                        );
                        if (placeName != null) {
                          var weatherInfo =
                              await weatherHelper.placeFunc(placeName);
                          changesUI(weatherInfo);
                        }
                      },
                      child: Icon(
                        Icons.location_city,
                        size: 40.0,
                        color: Colors.blueGrey,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        '$currentTemperature°',
                        style: kTempTextStyle,
                      ),
                      Image(
                        image: AssetImage('$conditionCode'),
                        // style: kConditionTextStyle,
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.near_me),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      '$city',
                      style: kMessageTextStyle,
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 10.0),
                  child: Column(
                    children: <Widget>[
                      Image.network(
                        'https://cdn.weatherapi.com/v4/images/weatherapi_logo.png',
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Powered by WeatherAPI.com',
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
