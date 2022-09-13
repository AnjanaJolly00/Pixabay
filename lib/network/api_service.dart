import 'package:dio/dio.dart';

import '../data/api_response.dart';

class ApiService {
  final client = Dio();
  ApiResponse clientResponse = ApiResponse();
  String apiKey = "29904813-8efba42ced7d32d42af3e2851";

  Future<ApiResponse> getSearchResults(searchValue, int pageNum) async {
    try {
      Options options = Options();
      options.method = "GET";
      var response = await client.getUri(
          Uri.parse(
              "https://pixabay.com/api/?key=$apiKey&q=$searchValue&image_type=photo&page=$pageNum&per_page=20"),
          options: options);

      clientResponse.code = response.statusCode;
      clientResponse.isSuccessful = true;
      clientResponse.rawResponse = response.data;
      //

    } on DioError catch (e) {
      clientResponse.errorMsg = e.response!.statusMessage;
      clientResponse.code = e.response!.statusCode;
      clientResponse.isSuccessful = false;
      clientResponse.rawResponse = e.response!.data;
    } catch (e) {
      clientResponse.errorMsg = e.toString();
    }
    return clientResponse;
  }
}
