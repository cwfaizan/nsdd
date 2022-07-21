import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nsdd/models/country.dart';

import '../networks/api_service.dart';
import '../networks/network_client.dart';

class CountryProvider with ChangeNotifier {
  ApiService apiService =
      ApiService(networkClient: NetworkClient('http://10.5.6.55:8000/'));
  // List<Country> countries = [];
  List<DropdownMenuItem<Country>> _countries = [];

  get countries {
    return _countries;
  }

  Future<void> getCountriesFromAPI() async {
    final res = await apiService.getCountriesFromAPI();
    Map<String, dynamic> mp = jsonDecode(res.toString());

    _countries = (mp['data'] as List).map((e) {
      Country country = Country.fromJson(e);
      return DropdownMenuItem<Country>(
        value: country,
        child: Text(country.name),
      );
    }).toList();
    notifyListeners();
  }
}
