import 'package:flutter/material.dart';
import 'package:weather_app1/screens/place_screen.dart';
import 'package:weather_app1/utilities/constants.dart';
import 'package:weather_app1/services/weather.dart';
import 'package:intl/intl.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({this.locationWeatherInfo});
  final locationWeatherInfo;
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherHelper weatherHelper = WeatherHelper();
  int currentTemperature = 0;
  int todayHighTemp = 0;
  int todayLowTemp = 0;
  String tempMessage = '';
  String conditionCode = '';
  String condition = '';
  String city = '';
  String nullMessage = '';
  String convertedTime = '';
  var dailyForecast;

  @override
  void initState() {
    super.initState();
    changesUI(widget.locationWeatherInfo);
  }

  void changesUI(dynamic weatherInfo) {
    setState(() {
      if (weatherInfo == null) {
        convertedTime = 'Error';
        currentTemperature = 0;
        todayHighTemp = 0;
        todayLowTemp = 0;
        tempMessage = '';
        conditionCode = 'Error';
        condition = 'Error';
        nullMessage = 'Unable to Fetch Data.';
        city = 'Error';
        return;
      }
      double currentTemp = weatherInfo['current']['temp_c'];
      double todayHigh =
          weatherInfo["forecast"]["forecastday"][0]["day"]["maxtemp_c"];
      double todayLow =
          weatherInfo["forecast"]["forecastday"][0]["day"]["mintemp_c"];
      String now = weatherInfo["location"]["localtime"];
      DateTime dateTime = DateFormat("yyyy-MM-dd HH:mm").parse(now);
      dailyForecast = weatherInfo["forecast"]["forecastday"][0]["date"];
      convertedTime = DateFormat("yyyy-MM-dd HH:mm").format(dateTime);
      currentTemperature = currentTemp.toInt();
      todayHighTemp = todayHigh.toInt();
      todayLowTemp = todayLow.toInt();
      tempMessage = weatherHelper.WeatherMessage(currentTemperature);
      conditionCode = weatherHelper.WeatherIcon(
          weatherInfo['current']['condition']['code'],
          weatherInfo['current']['is_day']);
      condition = weatherInfo["current"]["condition"]["text"];
      city = weatherInfo['location']['name'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.light(),
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image:
                  AssetImage('images_and_icons/location_night_background.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          constraints: BoxConstraints.expand(),
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
                        size: 30.0,
                        color: Colors.white,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.location_on_outlined,
                          size: 20.0,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          children: <Widget>[
                            Text(
                              '$city',
                              style: kMessageTextStyle,
                            ),
                            Text(
                              '$convertedTime',
                              style: kSubHeaderStyle,
                            ),
                          ],
                        ),
                      ],
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
                        Icons.search,
                        size: 30.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                        0,
                        20.0,
                        0,
                        10.0,
                      ),
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image(
                                image: AssetImage(
                                  '$conditionCode',
                                ),
                              ),
                              SizedBox(
                                width: 50.0,
                              ),
                              Text(
                                '$currentTemperature°',
                                style: kTempTextStyle,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                '$condition°',
                                style: kConditionTextStyle,
                              ),
                              SizedBox(
                                width: 30.0,
                              ),
                              Icon(
                                Icons.arrow_upward,
                                size: 20.0,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Text(
                                '$todayHighTemp°',
                                style: kConditionTextStyle,
                              ),
                              SizedBox(
                                width: 30.0,
                              ),
                              Icon(
                                Icons.arrow_downward,
                                size: 20.0,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Text(
                                '$todayLowTemp°',
                                style: kConditionTextStyle,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: Colors.white,
                      thickness: 0.1,
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                      child: Column(
                        children: <Widget>[
                          Text(
                            'DAILY FORECAST',
                            style: kForeCastHeaderStyle,
                          ),
                          Text(
                            '$dailyForecast',
                            style: kSubHeaderStyle,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 10.0),
                  child: Column(
                    children: <Widget>[
                      Image.network(
                        'https://cdn.weatherapi.com/v4/images/weatherapi_logo.png',
                        width: MediaQuery.of(context).size.width * 0.20,
                      ),
                      SizedBox(
                        height: 5,
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
