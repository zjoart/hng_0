import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/config.dart';

class FactRepository {
  /// [fetchCatFact] fecthes cat facts from the cat fact api
  Future<({String? fact, String message})> fetchCatFact() async {
    try {
      final response = await http
          .get(Uri.parse(AppConfig.instance.catFactApi))
          .timeout(const Duration(seconds: 5));

      if (response.statusCode == 200) {
        if (jsonDecode(response.body)
            case {
              'fact': final String fact,
            }) {
          return (fact: fact, message: 'Success');
        }

        return (
          fact: null,
          message:
              'Oops!, unable to fetch cat fact at the moment.\nPlease try again'
        );
      }

      return (
        fact: null,
        message: 'Oops!, unable to fetch cat fact at the moment.'
      );
    } on TimeoutException {
      return (fact: null, message: 'Cat fact service request timed out');
    } catch (e) {
      return (fact: null, message: 'An error occurred fetching cat fact');
    }
  }
}
