import 'package:datn/services/api_endpoint.dart';
import 'package:http/http.dart' as http;

class FirebaseService {
  Future<double> fetchData({String? endPoint}) async {
    try {
      final response = await http.get(
        Uri.parse('${ApiEndPoint.baseUrl}$endPoint'),
      );

      if (response.statusCode == 200) {
        return double.tryParse(response.body) ?? 0.0;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (error) {
      print('Error: $error');
      return 0.0; // or any default value as per your requirement
    }
  }
}
