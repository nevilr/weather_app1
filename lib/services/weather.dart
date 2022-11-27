import 'package:weather_app1/services/location.dart';
import 'package:weather_app1/services/networking.dart';

const key = '89dad2fb3cc746d383c184944223008';
const weatherapiURL = 'https://api.weatherapi.com/v1/forecast.json';

class WeatherHelper {
  Future<dynamic> placeFunc(String placeName) async {
    HelpNetwork helpNetwork =
        HelpNetwork('$weatherapiURL?key=$key&q=$placeName&days=7&aqi=no');

    var weatherInfo = await helpNetwork.info();
    return weatherInfo;
  }

  Future<dynamic> locationFunc() async {
    Location location = Location();
    await location.currentLocation();

    HelpNetwork helpNetwork = HelpNetwork(
        '$weatherapiURL?key=$key&q=${location.latitude},${location.longitude}&aqi=no');

    var weatherInfo = await helpNetwork.info();

    // weatherInfo["forecast"]["forecastday"].map((item) => print(item["date"]));

    return weatherInfo;
  }

  WeatherIcon(int condition, int isDay) {
    const imageUrlDay = 'images_and_icons/weather/64x64/day';
    const imageUrlNight = 'images_and_icons/weather/64x64/night';
    if (condition == 1000 && isDay == 1) {
      return '$imageUrlDay/113.png';
    } else if (condition == 1000 && isDay == 0) {
      return '$imageUrlNight/113.png';
    } else if (condition == 1003 && isDay == 1) {
      return '$imageUrlDay/116.png';
    } else if (condition == 1003 && isDay == 0) {
      return '$imageUrlNight/116.png';
    } else if (condition == 1006 && isDay == 1) {
      return '$imageUrlDay/119.png';
    } else if (condition == 1006 && isDay == 0) {
      return '$imageUrlNight/119.png';
    } else if (condition == 1009 && isDay == 1) {
      return '$imageUrlDay/122.png';
    } else if (condition == 1009 && isDay == 0) {
      return '$imageUrlNight/122.png';
    } else if (condition == 1030 && isDay == 1) {
      return '$imageUrlDay/143.png';
    } else if (condition == 1030 && isDay == 0) {
      return '$imageUrlNight/143.png';
    } else if (condition == 1063 && isDay == 1) {
      return '$imageUrlDay/176.png';
    } else if (condition == 1063 && isDay == 0) {
      return '$imageUrlNight/176.png';
    } else if (condition == 1066 && isDay == 1) {
      return '$imageUrlDay/179.png';
    } else if (condition == 1066 && isDay == 0) {
      return '$imageUrlNight/179.png';
    } else if (condition == 1069 && isDay == 1) {
      return '$imageUrlDay/182.png';
    } else if (condition == 1069 && isDay == 0) {
      return '$imageUrlNight/182.png';
    } else if (condition == 1072 && isDay == 1) {
      return '$imageUrlDay/185.png';
    } else if (condition == 1072 && isDay == 0) {
      return '$imageUrlNight/185.png';
    } else if (condition == 1087 && isDay == 1) {
      return '$imageUrlDay/200.png';
    } else if (condition == 1087 && isDay == 0) {
      return '$imageUrlNight/200.png';
    } else if (condition == 1114 && isDay == 1) {
      return '$imageUrlDay/227.png';
    } else if (condition == 1114 && isDay == 0) {
      return '$imageUrlNight/227.png';
    } else if (condition == 1117 && isDay == 1) {
      return '$imageUrlDay/230.png';
    } else if (condition == 1117 && isDay == 0) {
      return '$imageUrlNight/230.png';
    } else if (condition == 1135 && isDay == 1) {
      return '$imageUrlDay/248.png';
    } else if (condition == 1135 && isDay == 0) {
      return '$imageUrlNight/248.png';
    } else if (condition == 1147 && isDay == 1) {
      return '$imageUrlDay/260.png';
    } else if (condition == 1147 && isDay == 0) {
      return '$imageUrlNight/260.png';
    } else if (condition == 1150 && isDay == 1) {
      return '$imageUrlDay/263.png';
    } else if (condition == 1150 && isDay == 0) {
      return '$imageUrlNight/263.png';
    } else if (condition == 1153 && isDay == 1) {
      return '$imageUrlDay/266.png';
    } else if (condition == 1153 && isDay == 0) {
      return '$imageUrlNight/263.png';
    } else if (condition == 1168 && isDay == 1) {
      return '$imageUrlDay/281.png';
    } else if (condition == 1168 && isDay == 0) {
      return '$imageUrlNight/281.png';
    } else if (condition == 1171 && isDay == 1) {
      return '$imageUrlDay/284.png';
    } else if (condition == 1171 && isDay == 0) {
      return '$imageUrlNight/284.png';
    } else if (condition == 1180 && isDay == 1) {
      return '$imageUrlDay/293.png';
    } else if (condition == 1180 && isDay == 0) {
      return '$imageUrlNight/293.png';
    } else if (condition == 1183 && isDay == 1) {
      return '$imageUrlDay/296.png';
    } else if (condition == 1183 && isDay == 0) {
      return '$imageUrlNight/296.png';
    } else if (condition == 1186 && isDay == 1) {
      return '$imageUrlDay/299.png';
    } else if (condition == 1186 && isDay == 0) {
      return '$imageUrlNight/299.png';
    } else if (condition == 1189 && isDay == 1) {
      return '$imageUrlDay/302.png';
    } else if (condition == 1189 && isDay == 0) {
      return '$imageUrlNight/302.png';
    } else if (condition == 1192 && isDay == 1) {
      return '$imageUrlDay/305.png';
    } else if (condition == 1192 && isDay == 0) {
      return '$imageUrlNight/305.png';
    } else if (condition == 1195 && isDay == 1) {
      return '$imageUrlDay/308.png';
    } else if (condition == 1195 && isDay == 0) {
      return '$imageUrlNight/308.png';
    } else if (condition == 1198 && isDay == 1) {
      return '$imageUrlDay/311.png';
    } else if (condition == 1198 && isDay == 0) {
      return '$imageUrlNight/311.png';
    } else if (condition == 1201 && isDay == 1) {
      return '$imageUrlDay/314.png';
    } else if (condition == 1201 && isDay == 0) {
      return '$imageUrlNight/314.png';
    } else if (condition == 1204 && isDay == 1) {
      return '$imageUrlDay/317.png';
    } else if (condition == 1204 && isDay == 0) {
      return '$imageUrlNight/317.png';
    } else if (condition == 1207 && isDay == 1) {
      return '$imageUrlDay/320.png';
    } else if (condition == 1207 && isDay == 0) {
      return '$imageUrlNight/320.png';
    } else if (condition == 1210 && isDay == 1) {
      return '$imageUrlDay/323.png';
    } else if (condition == 1210 && isDay == 0) {
      return '$imageUrlNight/323.png';
    } else if (condition == 1213 && isDay == 1) {
      return '$imageUrlDay/326.png';
    } else if (condition == 1213 && isDay == 0) {
      return '$imageUrlNight/326.png';
    } else if (condition == 1216 && isDay == 1) {
      return '$imageUrlDay/329.png';
    } else if (condition == 1216 && isDay == 0) {
      return '$imageUrlNight/329.png';
    } else if (condition == 1219 && isDay == 1) {
      return '$imageUrlDay/332.png';
    } else if (condition == 1219 && isDay == 0) {
      return '$imageUrlNight/332.png';
    } else if (condition == 1222 && isDay == 1) {
      return '$imageUrlDay/335.png';
    } else if (condition == 1222 && isDay == 0) {
      return '$imageUrlNight/335.png';
    } else if (condition == 1225 && isDay == 1) {
      return '$imageUrlDay/338.png';
    } else if (condition == 1225 && isDay == 0) {
      return '$imageUrlNight/338.png';
    } else if (condition == 1237 && isDay == 1) {
      return '$imageUrlDay/350.png';
    } else if (condition == 1237 && isDay == 0) {
      return '$imageUrlNight/350.png';
    } else if (condition == 1240 && isDay == 1) {
      return '$imageUrlDay/353.png';
    } else if (condition == 1240 && isDay == 0) {
      return '$imageUrlNight/353.png';
    } else if (condition == 1243 && isDay == 1) {
      return '$imageUrlDay/356.png';
    } else if (condition == 1243 && isDay == 0) {
      return '$imageUrlNight/356.png';
    } else if (condition == 1246 && isDay == 1) {
      return '$imageUrlDay/359.png';
    } else if (condition == 1246 && isDay == 0) {
      return '$imageUrlNight/359.png';
    } else if (condition == 1249 && isDay == 1) {
      return '$imageUrlDay/362.png';
    } else if (condition == 1249 && isDay == 0) {
      return '$imageUrlNight/362.png';
    } else if (condition == 1252 && isDay == 1) {
      return '$imageUrlDay/365.png';
    } else if (condition == 1252 && isDay == 0) {
      return '$imageUrlNight/365.png';
    } else if (condition == 1255 && isDay == 1) {
      return '$imageUrlDay/368.png';
    } else if (condition == 1255 && isDay == 0) {
      return '$imageUrlNight/368.png';
    } else if (condition == 1258 && isDay == 1) {
      return '$imageUrlDay/371.png';
    } else if (condition == 1258 && isDay == 0) {
      return '$imageUrlNight/371.png';
    } else if (condition == 1261 && isDay == 1) {
      return '$imageUrlDay/374.png';
    } else if (condition == 1261 && isDay == 0) {
      return '$imageUrlNight/374.png';
    } else if (condition == 1264 && isDay == 1) {
      return '$imageUrlDay/377.png';
    } else if (condition == 1264 && isDay == 0) {
      return '$imageUrlNight/377.png';
    } else if (condition == 1273 && isDay == 1) {
      return '$imageUrlDay/386.png';
    } else if (condition == 1273 && isDay == 0) {
      return '$imageUrlNight/386.png';
    } else if (condition == 1276 && isDay == 1) {
      return '$imageUrlDay/389.png';
    } else if (condition == 1276 && isDay == 0) {
      return '$imageUrlNight/389.png';
    } else if (condition == 1279 && isDay == 1) {
      return '$imageUrlDay/392.png';
    } else if (condition == 1279 && isDay == 0) {
      return '$imageUrlNight/392.png';
    } else if (condition == 1282 && isDay == 1) {
      return '$imageUrlDay/395.png';
    } else if (condition == 1282 && isDay == 0) {
      return '$imageUrlNight/395.png';
    } else {
      return 'Error';
    }
  }

  String WeatherMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
