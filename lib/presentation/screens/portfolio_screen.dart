import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/market_bloc/market_bloc.dart';
import '../../bloc/market_bloc/market_event.dart';
import '../../bloc/market_bloc/market_state.dart';
import '../../bloc/theme/theme_bloc.dart';
import '../../bloc/theme/theme_event.dart';
import '../../bloc/watch_list_bloc/watch_list_bloc.dart';
import '../../bloc/watch_list_bloc/watch_list_event.dart';
import '../../bloc/watch_list_bloc/watch_list_state.dart';
import '../widgets/appbar.dart';

class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({super.key});

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  @override
  void initState() {

    context.read<WatchListBloc>().add(GetWatchlistEvent());
    context.read<MarketBloc>().add(GetMarketEvent());

    super.initState();
  }
  bool? isSwitched;

  bool s = true;
  void toggleSwitch(bool value) {

    if(isSwitched == false) {
      // setState(() {
      //   isSwitched = true;
      //   s = true;
      //
      // });
        isSwitched = true;
        s = true;
    } else {

        isSwitched = false;
        s= false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppBarName(
          title: 'Portfolio',
          subTitle: 'July 7',
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions : [
          BlocBuilder<ThemeBloc, ThemeData>(
            builder: (context, state) {
              return Switch(
                onChanged: (bool val) {
                  context.read<ThemeBloc>().add(ThemeChangeEvent());
                },
                value: state == ThemeData.dark(),
                activeColor: Colors.blue,
                inactiveThumbColor: Colors.grey,
                );
          },
        )],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: BlocBuilder<MarketBloc, MarketState>(
              builder: (BuildContext context, state) {
                if(state is MarketInitial){
                  return const Text('Loading...');
                }else if(state is MarketLoadedState){
                  return ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: state.data['data'].length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(state.data['data'][index]['symbol'],
                                style: const TextStyle(
                                    fontSize: 18
                                ),),
                              Text((double.parse(state.data['data'][index]['close']).round()).toString()),

                              Container(
                                  width: 80,
                                  color: double.parse(state.data['data'][index]['chg']) > 0 ? Colors.green : Colors.red,
                                  padding: const EdgeInsets.only(left: 10, right: 10,top: 1, bottom: 1),
                                  child: Text(state.data['data'][index]['chg'], textAlign: TextAlign.right,)),


                            ],
                          ),
                        ),
                      );
                    },);
                }
                return Container();
              },
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            flex: 6,
            child: BlocBuilder<WatchListBloc, WatchListState>(
              builder: (BuildContext context, state) {
                if(state is WatchListInitial){
                  return const Text('Loading...');
                }else if(state is LoadedState){
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.data['data'].length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(state.data['data'][index]['symbol'],
                                    style: const TextStyle(
                                        fontSize: 18
                                    ),),
                                  Container(
                                      width: 80,
                                      color: double.parse(state.data['data'][index]['yPC']) > 0 ? Colors.green : Colors.red,
                                      padding: const EdgeInsets.only(left: 10, right: 10,top: 1, bottom: 1),
                                      child: Text(state.data['data'][index]['yPC'], textAlign: TextAlign.right,)),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(state.data['data'][index]['ss'],
                                    style: const TextStyle(
                                        fontSize: 12
                                    ),),
                                  Text(state.data['data'][index]['previousClose']),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },);
                }
                return Container();
              },
            ),
          ),
        ],
      ),
    );
  }
}
