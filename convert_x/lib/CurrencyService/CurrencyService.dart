import 'dart:convert';


import 'package:http/http.dart' as http;

import '../model/CurrencyModel.dart';

class CurrencyService {
  CurrencyModel? model;

  Future<CurrencyModel?> getCurrencyData(
      String from, String to, double amount) async {
    Uri url = Uri.parse(
        "https://api.exchangerate.host/convert?from=$from&to=$to&amount=$amount&places=2");
    http.Response response = await http.get(url);
    Map<String, dynamic> data = jsonDecode(response.body);
    // print(data);

    model = CurrencyModel.fromJson(data);

    // print('Rate is $rate and result is $result');

    return model;
  }
}
