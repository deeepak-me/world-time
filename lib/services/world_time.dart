import 'package:http/http.dart' as http;
import 'dart:convert';

class WorldTime {
  String?location; //location name for the UI
  String?time; // the time in that location
  String?flag; // url ti an asset flag icon
  String?url; // location url for api endpoint

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {

    try {
      var api = Uri.parse('http://worldtimeapi.org/api/timezone/$url');
      http.Response response = await http.get(api);

      // Process the response
      Map data = jsonDecode(response.body);
      //print(data);

      //get properties from data

      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);
      //print(datetime);
      //print(offset);

      //create datetime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      time = now.toString();//set the time property

    } catch (e) {
      print('Error: $e');
    }

  }

}


