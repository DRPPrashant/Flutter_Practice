import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

//we know that every thing in flutter is a widget

class MyApp extends StatelessWidget {
  //MyApp is a widget running to the top level of the app
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
// Every widget defines a build() method that's automatically called every time
// the widget's circumstances change so that the widget is always up to date.

    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      //specifies that a new instance of MyAppState should be created and
      //provided to the widget tree.

      child: MaterialApp(
        //MaterialApp is a widget that configures the overall visual structure
        //of the app. It's part of the material design package and provides
        //functionality like navigation, theming, etc.
        title: 'Namer App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
              seedColor: Color.fromARGB(255, 76, 175, 127)),
        ),
        home: MyHomePage(),
      ),
    );
  }
}
// "state" generally refers to the data that can change over time

// ChangeNotifier is part of Flutter's state management system. It's a simple
// way to manage and notify listeners about changes in your app's state.
// By extending ChangeNotifier, your MyAppState class gains the ability to
// notify any listening widgets when its state changes.\

// It's placed at the root of the widget tree to make the state accessible to
//all parts of the app.
class MyAppState extends ChangeNotifier {
  // The state class extends ChangeNotifier, which means that it can notify
  // others about its own changes.
  // For example, if the current word pair changes, some widgets in the app need
  // to know.
  // The ChangeNotifier is part of Flutter's state management system.
  var current = WordPair.random();

// The new getNext() method reassigns current with a new random WordPair.
// It also calls notifyListeners()(a method of ChangeNotifier)that ensures
// that anyone watching MyAppState is notified.

// All that remains is to call the getNext method from the button's callback.
  void getNext() {
    current = WordPair.random();
    notifyListeners();
  }

  var favorites = <WordPair>[];
  // This line declares a list called "favorites" that will hold WordPair objects.

  void toggleFavorite() {
    // Check if the current WordPair is already in the favorites list.
    if (favorites.contains(current)) {
      // If it's in the list, remove it.
      favorites.remove(current);
    } else {
      // If it's not in the list, add it.
      favorites.add(current);
    }
    // Notify listeners that the state has changed.
    notifyListeners();
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = GeneratorPage();
        break;
      case 1:
        page = FavoritesPage();
        break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    return Scaffold(
      body: Row(
        children: [
          SafeArea(
            child: NavigationRail(
              //The NavigationRail widget provides a navigation rail with two
              //destinations: "Home" and "Favorites."
              extended: false,
              destinations: [
                NavigationRailDestination(
                  icon: Icon(Icons.home),
                  label: Text('Home'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.favorite),
                  label: Text('Favorites'),
                ),
              ],
              selectedIndex: selectedIndex,
              //The selectedIndex keeps track of the currently selected destination.
              onDestinationSelected: (value) {
                selectedIndex = value;
                setState(() {
                  selectedIndex = value;
                  if (selectedIndex == 1) {}
                });
              },
            ),
          ),
          Expanded(
            child: Container(
              color: Theme.of(context).colorScheme.primaryContainer,
              child: page,
            ),
          ),
        ],
      ),
    );
  }
}

class GeneratorPage extends StatelessWidget {
  //GeneratorPage is responsible for displaying the current WordPair and
  //providing buttons to like and navigate to the next pair.

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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
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

    //The toggleFavorite method is called when the like button is pressed,
    //and getNext is called when the next button is pressed.
  }
}

// Having separate widgets for separate logical parts of your UI is an important
// way of managing complexity in Flutter

class BigCard extends StatelessWidget {
  const BigCard({
    super.key,
    required this.pair,
  });

  //The BigCard widget displays the current pair along with like and next buttons.

  final WordPair pair;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(
        context); //the code requests the app's current theme with Theme.of(context).
    var style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
    );
    return Card(
      color: theme.colorScheme.primary,
      // Then, the code defines the card's color to be the same as the theme's
      // colorScheme property. The color scheme contains many colors, and
      // primary is the most prominent, defining color of the app.
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(
          pair.asLowerCase,
          style: style,
          semanticsLabel: pair.asUpperCase,
        ),
      ),
    );
  }
}

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    if (appState.favorites.isEmpty) {
      return Center(
        child: Text('No favorites yet.'),
      );
    }

    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text('You have '
              '${appState.favorites.length} favorites:'),
        ),
        for (var pair in appState.favorites)
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text(pair.asLowerCase),
          ),
      ],
    );
  }
}
