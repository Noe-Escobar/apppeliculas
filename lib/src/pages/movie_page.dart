import 'package:flutter/material.dart';
import 'package:tmdb_api/tmdb_api.dart';
import '../widgets/trending.dart';

class Pelis extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
      theme: ThemeData(brightness: Brightness.dark, primaryColor: Colors.white),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final String apikey = '94fbb49b89807e0ef90aaa98bfe9a3eb';
  final String readaccesstoken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5NGZiYjQ5Yjg5ODA3ZTBlZjkwYWFhOThiZmU5YTNlYiIsInN1YiI6IjY0ZTg0NDg5ZjJjZjI1MDBhZGYzMTQxMCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.FEHOyAai9G-bW0Nkl7IJcMSYEXFEYwg27Vm_ztSa5Vg';
  List trendingmovies = [];

  @override
  void initState() {
    super.initState();
    loadmovies();
  }

  loadmovies() async {
    TMDB tmdbWithCustomLogs = TMDB(
      ApiKeys(apikey, readaccesstoken),
      defaultLanguage: 'es-MX',
      logConfig: const ConfigLogger(
        showLogs: true,
        showErrorLogs: true,
      ),
    );

    Map trendingresult = await tmdbWithCustomLogs.v3.movies.getPopular();
    //print((trendingresult));
    setState(() {
      trendingmovies = trendingresult['results'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Text('App de Peliculas 🍿'),
          backgroundColor: Colors.transparent,
        ),
        body: ListView(
          children: [
            TrendingMovies(
              trending: trendingmovies,
            ),
          ],
        ));
  }
}