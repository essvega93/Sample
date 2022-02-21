import '../api/api_service.dart';

class HomeProvider {
  HomeProvider({required this.api});

  ApiService api;

  Map<String, dynamic> get defaultParams => {
        "key": api.env.apiKey, // all
      };
}
