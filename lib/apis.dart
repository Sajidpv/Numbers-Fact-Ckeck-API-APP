import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:web_functions/number_fact_resp/number_fact_resp.dart';

Future<NumberFactResp> getNumberFact({required String num}) async {
  final response = await http.get(Uri.parse('http://numbersapi.com/$num?json'));
  final bodyasJson = jsonDecode(response.body) as Map<String, dynamic>;
  final data = NumberFactResp.fromJson(bodyasJson);
  return data;
}
