import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

void main() async {
  try {
    var data = await fetch(10);

    for (var item in data) {
      var firstName = item['first_name'];
      var lastName = item['last_name'];
      var id = item['uid'];
      print(
          "\x1B[35mFirst Name: \x1B[0m$firstName\x1B[33m ||\x1B[0m \x1B[34mLast Name: \x1B[0m$lastName\x1B[33m ||\x1B[0m \x1B[36mID:\x1B[0m $id");
    }
  } catch (e) {
    print("Error: $e");
  }
}

// Fetch function
fetch(numUsers) async {
  var url = "https://random-data-api.com/api/v2/users?size=$numUsers";
  var uri = Uri.parse(url);

  var response = await http.get(uri);
  if (response.statusCode != 200) {
    throw Exception("Error: ${response.statusCode}");
  }
  var body = response.body;
  var data = convert.jsonDecode(body);

  return data.cast<Map<String, dynamic>>();
}
