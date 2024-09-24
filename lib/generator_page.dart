import 'package:flutter/material.dart';
import 'package:namer_mac_app/main.dart';
import 'package:provider/provider.dart';

class GeneratorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var pair = appState.current;

    IconData icon;
    if (appState.favorites.contains(pair)) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }

    return Center(
      child: ListView(
        /* child: Column(
          mainAxisAlignment: MainAxisAlignment.center,*/
          children: [
            Text('Full'),
              for (var item in appState.all)
                  ListTile(
                    leading: Icon(Icons.favorite_outline),
                    title: Text(item.asLowerCase)
                  ),
            SizedBox(height: 20),
            BigCard(pair: pair),
            SizedBox(height: 10),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    appState.toggleFavorite();
                  },
                  icon: Icon(icon),
                  label: Text('Like'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    appState.getNext();
                  },
                  child: Text('Next'),
                ),
              ],
            ),
          ],
        ),
    );
//    );
  }
}
