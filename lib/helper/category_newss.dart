import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/article_model.dart';

class CategoryNewss {
  String apiKey = '0c18538ea3ba48379219c53f1d294e6d';
  List<AritcleModel> news = [];

  Future<void> getNews(String category) async {
    String url =
        'https://newsapi.org/v2/top-headlines?category=$category&country=in&apiKey=$apiKey';

    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body) as Map<String, dynamic>;

    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((element) {
        if (element['urlToImage'] != null &&
            element['description'] != null &&
            element['author'] != null &&
            element['content'] != null) {
            news.add(AritcleModel(
            element['author'],
            element['title'],
            element['description'],
            element['url'],
            element['urlToImage'],
            element['content'],
            DateTime.parse(element['publishedAt']),
          ));
        }
      });
    } else {
      throw Exception('could not load content');
    }
  }
}
