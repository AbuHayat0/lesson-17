import 'package:http/http.dart' as http;

class HomeControler {
  Future<http.Response> CountData() async {
    http.Response respons;
    String Url = "https://jsonplaceholder.typicode.com/posts";
    respons = await http.get(Uri.parse(Url));

    return respons;
  }
}
