import 'dart:convert';

import 'package:http/http.dart' as http;

import 'model/NewsResponse.dart';
import 'model/SourcesResponse.dart';
class ApiManager{
  static String baseurl = "newsapi.org";
  // https://newsapi.org/v2/top-headlines/sources?apiKey=3d5981da86bc49f181e6cf5dd008572a
  static Future<SourcesResponse> fetchdata (String categid)async {

    var url = Uri.https(baseurl, "/v2/top-headlines/sources", {
      'apiKey': 'd2106eec27864c32a8ddeeb300c00962',
      'category':categid
    });
    try {
      var response = await http.get(url);
      var bodystring = response.body;
      var json = jsonDecode(bodystring);
      var SourcesResp = SourcesResponse.fromJson(json);
      return SourcesResp;
    } catch (e) {
      throw e;
    }
  }
  static Future<NewsResponse> news_data({String? source,String? searchword,int? pagenum})async {
    var url = Uri.https(baseurl, '/v2/everything', {
      'apiKey': 'd2106eec27864c32a8ddeeb300c00962',
      'sources': source,
      'pageSize':'10',
      'page':'$pagenum'
    });
    try {
      var response = await http.get(url);
      var bodystring = response.body;
      var json = jsonDecode(bodystring);
      var nresp = NewsResponse.fromJson(json);
      return nresp;
    }catch(e){
      throw e;
    }
  }
  static Future<NewsResponse> searchnews(String? searchword)async{
    String name='newsapi.org'; 
    var url= Uri.https(name,'/v2/everything',{
      'apiKey':"d2106eec27864c32a8ddeeb300c00962",
      'q':searchword

    });
    try {
      var response = await http.get(url);
      String body = response.body;
      var json = jsonDecode(body);
      var newsresp = NewsResponse.fromJson(json);
      return newsresp;
    }catch(e){
      throw e;
    }
  
  }
  }