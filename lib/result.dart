import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';


class Result extends StatefulWidget {
  String length;
  String plot;
  String poster;
  String title;
  String year;
  String rating;
  String trailer;
  String cast;
  String cast1;
  String cast2;
  String cast3;
  String castChar;
  String cast1Char;
  String cast2Char;
  String cast3Char;
   Result({ Key? key,required this.length,required this.plot,required this.poster,
   required this.title,required this.year,required this.rating,required this.cast
   ,required this.cast1,required this.cast2,required this.cast3,required this.castChar,
   required this.cast1Char,required this.cast2Char,required this.cast3Char,required this.trailer}) : super(key: key);

  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
//  late Future<Album> futureAlbum;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0C78F4),
        automaticallyImplyLeading: true,
        title: Text(
          widget.title,
          style: GoogleFonts.robotoSlab(
            textStyle: const TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
            )
          )
        ),
        centerTitle: true,
        elevation: 20,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          scrollDirection: Axis.vertical,
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 25, 0, 0),
                  child: Hero(
                    tag: 'poster',
                    child: Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      color: Colors.white,
                      elevation: 25,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                     child:
                       Image.network(
                        widget.poster,
                        width: MediaQuery.of(context).size.width * 0.78,
                        height: MediaQuery.of(context).size.height * 0.70,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(25, 2, 28, 0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.80,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            const Icon(
                              Icons.star_outlined,
                              color: Color(0xFFFFDF00),
                              size: 28,
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(2, 0, 0, 0),
                              child: Text(
                                widget.rating,
                                style:GoogleFonts.robotoSlab(
                                  textStyle: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  )
                                )
                              ),
                            )
                          ],
                        ),
                        Text(
                          widget.year,
                          style: GoogleFonts.robotoSlab(
                                  textStyle: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold,
                                  )
                                )
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            const Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 2, 0),
                              child: Icon(
                                Icons.access_time_outlined,
                                color: Colors.blue,
                                size: 25,
                              ),
                            ),
                            Text(
                              widget.length,
                              style: GoogleFonts.robotoSlab(
                                  textStyle: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  )
                                )
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(10, 26, 10, 0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.80,
                    child: Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      color: const Color(0xFF0C78F4),
                      elevation: 22,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(13, 10, 10, 10),
                        child: Text(
                          widget.plot,
                          style: GoogleFonts.robotoSlab(
                                  textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold,
                                  )
                                )
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 35, 0, 10),
                  child: Material(
                    color: Colors.transparent,
                    elevation: 26,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.80,
                      decoration: const BoxDecoration(
                        color: Colors.white
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                                child: Icon(
                                  Icons.push_pin_rounded,
                                  color: Color(0xFFFE0213),
                                  size: 29,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                                child: Text(
                                  'CAST',
                                  style: GoogleFonts.robotoSlab(
                                textStyle: const TextStyle(
                                color: Colors.black,
                                fontSize: 21,
                                fontWeight: FontWeight.bold,
                                )
                              )
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding:
                                const EdgeInsetsDirectional.fromSTEB(5, 10, 5, 0),
                            child: cardview(widget.cast, widget.castChar,Colors.white,Colors.black)
                          ),
                          Padding(
                            padding:
                                const EdgeInsetsDirectional.fromSTEB(5, 10, 5, 10),
                            child: cardview(widget.cast1,widget.cast1Char,const Color(0xFF0C78F4),Colors.white),
                          ),
                           Padding(
                            padding:
                                const EdgeInsetsDirectional.fromSTEB(5, 10, 5, 0),
                            child: cardview(widget.cast2, widget.cast2Char,Colors.white,Colors.black)
                          ),
                          Padding(
                            padding:
                                const EdgeInsetsDirectional.fromSTEB(5, 10, 5, 40),
                            child: cardview(widget.cast3,widget.cast3Char,const Color(0xFF0C78F4),Colors.white),
                          ),
                          
                          Center(
                            child: InkWell(
                              onTap: () async {
                            var url = widget.trailer;
                            if (await canLaunch(url)) {
                              await launch(url, forceSafariVC: false);
                            } else {
                              throw 'Could not launch $url';
                            }
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                                children:  [
                                  const Icon(Icons.play_circle,size: 26,color: Colors.red,),
                                  Text("Play Trailer", style: GoogleFonts.robotoSlab(
                                textStyle:  const TextStyle(
                                color: Colors.blue,
                                decoration: TextDecoration.underline,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                )
                              ))
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 25,)
                        ],
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Card cardview(String actor,String character,Color cname,Color tcolor) {
    return Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            color: cname,
                            elevation: 12,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  10, 15, 10, 15),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                  actor,
                                    style:
                                    GoogleFonts.robotoSlab(
                              textStyle: TextStyle(
                              color: tcolor,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              )
                            )
                                  ),
                                  Text(
                                    character,
                                    style:GoogleFonts.robotoSlab(
                              textStyle:  TextStyle(
                              color: tcolor,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              )
                            )
                                  )
                                ],
                              ),
                            ),
                          );
  }
}