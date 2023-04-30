import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:namer_app/main.dart';
import 'package:provider/provider.dart';

import '../providers/app_state.dart';

class FavouritesPage extends StatelessWidget {
  const FavouritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var favourites = appState.favorites;
    if (favourites.isEmpty) {
      return Center(
        child: Text('No favourites yet'),
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('You have ${favourites.length} favourites'),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: favourites.length,
            itemBuilder: (context, index) => ListTile(
              dense: true,
              leading: IconButton(
                  onPressed: () {
                    appState.removeItem(favourites[index]);
                  },
                  icon: Icon(
                    Icons.delete_rounded,
                    color: Colors.red,
                  )),
              title: Text(favourites[index].asPascalCase),
              //trailing: Text(favourites[index].asPascalCase),
            ),
          ),
        ),
      ],
    );
  }
}
