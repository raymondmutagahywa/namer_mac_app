import 'package:flutter/material.dart';
import 'package:namer_mac_app/main.dart';
import 'package:provider/provider.dart';

class FavoritesListbuilderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  var appState = context.watch<MyAppState>();
          return Scaffold(
              appBar: AppBar(title: const Text('Learning List builder')),
              body:  ListView.builder(
                  itemCount: appState.all.length,
                  itemBuilder: (BuildContext context, int index){
                    var word = appState.all[index].asLowerCase;
                    return getCard(context, word,index);
                  })
          );
}
Card getCard(BuildContext context, String word, int index){
  var appState = context.watch<MyAppState>();
  return Card(
    child: ListTile(
      leading: CircleAvatar(child: Text(word[0].toUpperCase()),),
      title: Text(' $word '),
      subtitle: Text('# $index'),
      trailing: Icon(Icons.favorite),
      dense: true,
      enabled: true,
      onTap: (){
        print('You on tapped $word');
        appState.toggleFavorite(index);
      }
      )
  );
}

}