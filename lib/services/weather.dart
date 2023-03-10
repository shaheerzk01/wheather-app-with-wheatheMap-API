import 'package:climate/services/location.dart';
import 'package:climate/services/networking.dart';

const apikey = '9d413fc80d3a80466d1757f5e3065a3c';
const weatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

class weathermodel{

  Future<dynamic> cityWeatherData(String cityName) async{
    Networkhelper networkhelper = Networkhelper('$weatherMapURL?q=$cityName&appid=$apikey&units=metric');
    var weatherData = await networkhelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async{
    Location location = Location();
    await location.getCurrentLocation();

    Networkhelper networkhelper = Networkhelper('$weatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apikey&units=metric');

    var weatherData = await networkhelper.getData();
    return weatherData;
  }
  String getweatherIcon(int condition){
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp){
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}