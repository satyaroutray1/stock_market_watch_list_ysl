import 'package:stock_market_watch_list/data/repositories/market_index_json.dart';

import 'watch_list_json.dart';

class Repo{

  Future getApiData() async{
    return watchlistJson;
  }

  Future getApiData1() async{
    return marketJson;
  }
}