import 'package:flutter/material.dart';
import 'asset.dart';

void main() => runApp(MaterialApp(
  title: 'SearchView',
  home: MainPage(),
  theme: ThemeData.light()
));

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: ()=>showSearch(context: context, delegate: SearchBarDelegate()),
          )
        ],
      ),
      body: Center(
        child: Text('Search Page', style: TextStyle(fontSize: 50.0)),
      ),
    );
  }
}


class SearchBarDelegate extends SearchDelegate<String>{
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () => query = '',
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.navigate_before),
      onPressed: ()=>close(context,null)
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Text(query, style: TextStyle(fontSize: 50.0)),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestList = query.isEmpty ? OriginalMap
      : SearchMap.where((current) => current.startsWith(query)).toList();
    return ListView.builder(
      itemCount: suggestList.length,
      itemBuilder: (context, index){
        return ListTile(
          title: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: suggestList[index].substring(0,query.length),
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)
                ),
                TextSpan(
                  text: suggestList[index].substring(query.length),
                  style: TextStyle(color: Colors.grey)
                )
              ]
            ),
          ),
        );
      }
    );
  }

}