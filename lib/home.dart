import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:webapp/result.dart';



 Future<Album> fetchAlbum(String name) async {
  final response = await http.get(Uri.parse('https://imdb-internet-movie-database-unofficial.p.rapidapi.com/film/'+name),
  headers: {
    "access-control-allow-origin": "*",
    'x-rapidapi-host': 'imdb-internet-movie-database-unofficial.p.rapidapi.com',
    'x-rapidapi-key': 'token'
  });
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    
    return Album.fromJson(jsonDecode(response.body));
    
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class Album {
  final String title;
  final String year;
  final String length;
  final String rating;
  final String poster;
  final String plot;
  final String trailer;
  final String cast;
  final String cast1;
  final String cast2;
  final String cast3;
  final String castChar;
  final String cast1Char;
  final String cast2Char;
  final String cast3Char;


  Album({
    required this.title,
    required this.year,
    required this.length,
    required this.rating,
    required this.poster,
    required this.plot,
    required this.trailer,
    required this.cast,
    required this.cast1,
    required this.cast2,
    required this.cast3,
    required this.castChar,
    required this.cast1Char,
    required this.cast2Char,
    required this.cast3Char,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      title: json['title'],
      year: json['year'],
      length: json['length'],
      rating: json['rating'],
      poster: json['poster'],
      plot: json['plot'],
      trailer:json['trailer']['link'],
      cast:json['cast'][0]['actor'],
      cast1:json['cast'][1]['actor'],
      cast2:json['cast'][2]['actor'],
      cast3:json['cast'][3]['actor'],
      castChar:json['cast'][0]['character'],
      cast1Char:json['cast'][1]['character'],
      cast2Char:json['cast'][2]['character'],
      cast3Char:json['cast'][3]['character'],
      
    );
  }
}

class Display extends StatefulWidget {
  String nam;
  

    Display({Key? key, required this.nam }) : super(key: key);

  @override
  _DisplayState createState() => _DisplayState();
}

class _DisplayState extends State<Display> {
 
 late Future<Album> futureAlbum;
    @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum(widget.nam);
  }
   

  @override
  Widget build(BuildContext context) {
    return
       FutureBuilder<Album>(
          future: futureAlbum,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
             
              return Hero(
                tag: 'poster',
                  child:Material(
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context,PageRouteBuilder(
                          transitionDuration: const Duration(seconds: 3),
                          pageBuilder: (_,__,___)=>Result(length: snapshot.data!.length, plot: snapshot.data!.plot,
                         poster: snapshot.data!.poster, title: snapshot.data!.title, year: snapshot.data!.year,
                          rating: snapshot.data!.rating,trailer: snapshot.data!.trailer,cast: snapshot.data!.cast,
                          cast1: snapshot.data!.cast1,cast2: snapshot.data!.cast2,cast3: snapshot.data!.cast3,castChar: snapshot.data!.castChar,
                          cast1Char: snapshot.data!.cast1Char,cast2Char: snapshot.data!.cast2Char,cast3Char: snapshot.data!.cast3Char),
                        )
                        );
                      },
                      child: Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: Colors.white,
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                          child: Image.network(
                            snapshot.data!.poster,
                            // snapshot.data!.poster,
                            width: MediaQuery.of(context).size.width * 0.78,
                            height: MediaQuery.of(context).size.height * 0.70,
                            fit: BoxFit.fill,
                          loadingBuilder: (context, child, loadingProgress) {
                                          if (loadingProgress == null) return child;
                                         return const Center(child: SpinKitSpinningLines(color: Colors.blue,));
                                
                                  },
                                  errorBuilder: (context, error, stackTrace) =>
                                      const Text('Some error occurred!'),
                          ),
                                  ),
                                  
                    ),
                  )
                    
                  );
              // Text(snapshot.data!.title);
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            // By default, show a loading spinner.
            return const SpinKitSpinningLines(
              color: Colors.blue,

              );
          },
                );
    
  }
}
