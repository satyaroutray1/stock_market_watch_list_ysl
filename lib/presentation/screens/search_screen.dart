import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/watch_list_bloc/watch_list_bloc.dart';
import '../../bloc/watch_list_bloc/watch_list_event.dart';
import '../../bloc/watch_list_bloc/watch_list_state.dart';
import '../widgets/appbar.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController text = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppBarName(
          title: 'Search',
          subTitle: 'Search Companies',
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: text,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'company name',
                    hintText: 'Enter company name',
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  context.read<WatchListBloc>().add(GetWatchlistEvent());
                  },
                child: Container(
                    margin: const EdgeInsets.all(5),
                    color: Colors.blue,
                    padding: const EdgeInsets.all(20),
                    child: const Icon(Icons.search)),
              )
            ],
          ),
          Expanded(
            child: BlocBuilder<WatchListBloc, WatchListState>(
              builder: (BuildContext context, state) {
                if(state is WatchListInitial){
                  return const Text('Loading...');
                }else if(state is LoadedState){
                  for (var i = 0; i < state.data['data'].length; i++) {
                    if(state.data['data'][i]['symbol'].toString().toLowerCase() == text.text.toLowerCase()) {
                      return Container(
                        padding: const EdgeInsets.all(10),
                        margin: EdgeInsets.only(top: 20),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(state.data['data'][i]['symbol'],
                                  style: const TextStyle(
                                      fontSize: 18
                                  ),),
                                Container(
                                    width: 80,
                                    color: double.parse(state.data['data'][i]['yPC']) > 0 ? Colors.green : Colors.red,
                                    padding: const EdgeInsets.only(left: 10, right: 10,top: 1, bottom: 1),
                                    child: Text(state.data['data'][i]['yPC'], textAlign: TextAlign.right,)),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(state.data['data'][i]['ss'],
                                  style: const TextStyle(
                                      fontSize: 12
                                  ),),
                                Text(state.data['data'][i]['previousClose']),
                              ],
                            ),
                          ],
                        ),
                      );
                    }else{
                      return Text('');
                    }
                  }
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
