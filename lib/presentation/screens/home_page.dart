import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_market_watch_list/presentation/screens/news_screen.dart';
import 'package:stock_market_watch_list/presentation/screens/search_screen.dart';
import 'package:stock_market_watch_list/presentation/screens/us_market_screen.dart';

import '../../bloc/market_bloc/market_bloc.dart';
import '../../bloc/market_bloc/market_event.dart';
import '../../bloc/market_bloc/market_state.dart';
import '../../bloc/watch_list_bloc/watch_list_bloc.dart';
import '../../bloc/watch_list_bloc/watch_list_event.dart';
import '../../bloc/watch_list_bloc/watch_list_state.dart';
import 'portfolio_screen.dart';



class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin{
  TabController? _myDataTabController;
  List<Widget> list = const [
    Tab(
      text: 'Market',
    ),
    Tab(
      text: 'US Market',
    ),
    Tab(
      text: 'Latest News',
    ),
    Tab(
      text: 'Search',
    ),
  ];
  @override
  void initState() {
    _myDataTabController =
        TabController(length: list.length, vsync: this, initialIndex: 0/*default 0 if tabName is null*/);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: TabBarView(
        controller: _myDataTabController,
        children: const [
          PortfolioScreen(),
          USMarketScreen(),
          News(),
          SearchScreen(),

        ],
      )
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}