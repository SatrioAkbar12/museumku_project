// home screen contents
import 'package:app/src/config/image_constants.dart';

import 'package:app/src/utils/app_state_notifier.dart';
import 'package:app/src/widgets/cache_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:shared/main.dart';
import 'package:app/src/config/string_constants.dart' as string_constants;

class HomeScreen extends StatelessWidget {
  // ignore: close_sinks
  final AuthenticationBloc authenticationBloc =
      AuthenticationBlocController().authenticationBloc;

  @override
  Widget build(BuildContext context) {
    authenticationBloc.add(GetUserData());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          string_constants.app_bar_title,
          style: Theme.of(context).appBarTheme.textTheme.bodyText1,
        ),
        actions: [
          // IconButton(
          //     icon: Icon(Icons.logout),
          //     onPressed: () {
          //       authenticationBloc.add(UserLogOut());
          //     }),
        ],
      ),
      body: ListMuseum(),
      drawer: Drawer(
          // child: ListView(
          //   padding: EdgeInsets.zero,
          //   children: <Widget>[
          //     DrawerHeader(
          //       child: Column(
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: [
          //           Row(
          //             mainAxisAlignment:
          //                 MainAxisAlignment.spaceBetween,
          //             crossAxisAlignment: CrossAxisAlignment.start,
          //             children: [
          //               Container(
          //                 decoration: BoxDecoration(
          //                     borderRadius: BorderRadius.circular(50),
          //                     color: Colors.white),
          //                 child: CachedImage(
          //                   imageUrl:
          //                       state.currentUserData.data.avatar,
          //                   fit: BoxFit.fitWidth,
          //                   errorWidget: Image.network(
          //                     AllImages().kDefaultImage,
          //                   ),
          //                   width: 80,
          //                   height: 80,
          //                   placeholder: CircularProgressIndicator(),
          //                 ),
          //               ),
          //               Switch(
          //                 value:
          //                     Provider.of<AppStateNotifier>(context)
          //                         .isDarkMode,
          //                 onChanged: (value) {
          //                   Provider.of<AppStateNotifier>(context,
          //                           listen: false)
          //                       .updateTheme(value);
          //                 },
          //               ),
          //             ],
          //           )
          //         ],
          //       ),
          //       decoration: BoxDecoration(
          //         color: Theme.of(context).dividerColor,
          //       ),
          //     ),
          //     ListTile(
          //       title: Text(
          //           '${state.currentUserData.data.firstName} ${state.currentUserData.data.lastName}',
          //           style: Theme.of(context).textTheme.bodyText2),
          //     ),
          //     ListTile(
          //       title: Text(state.currentUserData.data.email,
          //           style: Theme.of(context).textTheme.bodyText2),
          //     ),
          //     ListTile(
          //       title: Text(state.currentUserData.ad.company,
          //           style: Theme.of(context).textTheme.bodyText2),
          //     ),
          //   ],
          // ),
          ),
    );
  }
}

class ListMuseum extends StatefulWidget {
  @override
  _ListMuseumState createState() => _ListMuseumState();
}

class _ListMuseumState extends State<ListMuseum> {
  final List<String> namaMuseum = <String>[
    'Museum A',
    'Museum B',
    'Museum C',
    'Museum D',
  ];

  final List<String> lokasiMuseum = <String>[
    'Surakarta',
    'Jakarta',
    'Malang',
    'Surabaya'
  ];

  Widget _buildMuseum(int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [Container(
        margin: EdgeInsets.only(top: 10),
        height: 30,
        color: Colors.white,
        child: 
          TextButton(
            onPressed: (){},
            child: Text(namaMuseum[index]+'\n'+lokasiMuseum[index])
          ),
      )],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(250, 250, 250, 1),
      body: ListView.builder(
          itemCount: namaMuseum.length + 1,
          itemBuilder: (context, int index) {
            if (index == 0) {
              return Center(
                child: Container(
                  height: 30,
                  // color: Colors.blue,
                  child: Text('List Museum'),
                ),
              );
            }
            return _buildMuseum(index-1);
          }
        ),
    );
  }
}
