import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/market_bloc/market_bloc.dart';
import '../../bloc/market_bloc/market_event.dart';
import '../../bloc/market_bloc/market_state.dart';
import '../../bloc/watch_list_bloc/watch_list_bloc.dart';
import '../../bloc/watch_list_bloc/watch_list_event.dart';
import '../../bloc/watch_list_bloc/watch_list_state.dart';
import '../widgets/appbar.dart';

class USMarketScreen extends StatefulWidget {
  const USMarketScreen({super.key});

  @override
  State<USMarketScreen> createState() => _USMarketScreenState();
}

class _USMarketScreenState extends State<USMarketScreen> {
  @override
  void initState() {

    context.read<WatchListBloc>().add(GetWatchlistEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppBarName(
          title: 'U S Market',
          subTitle: 'Sector Performance',
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [

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
