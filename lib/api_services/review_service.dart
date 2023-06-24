import 'package:http/http.dart' as http;

class ReviewsApiService {
  static const String baseUrl = 'https://test.wishesimg.com/api/user/review';


  static Future<void> addReview(String doctorId, stars,reviewText,token) async {
    final url = Uri.parse(baseUrl);
    final headers = {'Authorization': 'Bearer $token'};
    final body = {
      'doctor_id': doctorId,
      'stars': stars,
      'review_text': reviewText,
    };

    final response = await http.post(url, headers: headers, body: body);
    if (response.statusCode == 200) {

      print('Review added successfully');
    } else {

      print('Failed to add review');
    }
  }

  static Future<void> editReview(String token,String stars, String reviewText, reviewId,) async {
    final url = Uri.parse('$baseUrl/edit/$reviewId');
    final headers = {'Authorization': 'Bearer $token'};
    final body = {
      'stars': stars,
      'review_text': reviewText,
    };

    final response = await http.post(url, headers: headers, body: body);
    if (response.statusCode == 200) {

      print('Review edited successfully');
    } else {

      print('Failed to edit review');
    }
  }
}
