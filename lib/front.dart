import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webapp/home.dart';

class Front extends StatefulWidget {
  const Front({ Key? key }) : super(key: key);

  @override
  _FrontState createState() => _FrontState();
}

class _FrontState extends State<Front> {
  var myController = TextEditingController();
  bool isLoading = true;
  @override
  void dispose(){
    myController.clear();
    myController.dispose();
    
    super.dispose();
  }
  late Future<Album> futureAlbum;
  late String examble; 

  Future<void>refresh()async{
   
   await Future.delayed(const Duration(seconds: 2));
   
   setState(() {
     isLoading=true;
     dispose();
   });
  }
 FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0C78F4),
        title: Text("Movie Club",
        style: GoogleFonts.robotoSlab(
          textStyle: const TextStyle(
            color: Colors.white,
            fontSize:25,
            fontWeight: FontWeight.bold,
          ),
        ),
        ),
        centerTitle: true,
        elevation: 20,
      ),
      backgroundColor: Colors.white,
      body: RefreshIndicator(
        onRefresh: refresh,
        color: Colors.blue,
        
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(25, 17, 0, 0),
            child: SingleChildScrollView(
              child:Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  Text(
                    "Hello",
                   style: GoogleFonts.robotoSlab(
                     textStyle:const TextStyle(
                     color: Colors.black,
                     fontSize: 25,
                     fontWeight: FontWeight.w600,
                   ),
                   )
                  ),
                   Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 15, 20, 35),
                    child: Card(
                      
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      color: const Color(0xFF0C78F4),
                      elevation: 26,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:const EdgeInsetsDirectional.fromSTEB(15, 15, 0, 15),
                            child: Text('Enter The Movie Name',
                            textAlign: TextAlign.start,
                            style: GoogleFonts.robotoSlab(
                              textStyle: const TextStyle(
                                color: Color(0xFFFAFAFA),
                                fontSize: 20,
                                fontWeight: FontWeight.w600
                              )
                            ),
                            ),
                          
                            ),
                            Padding(
                              padding:
                                  const EdgeInsetsDirectional.fromSTEB(10, 0, 13, 10),
                              child: TextFormField(
                                focusNode: focusNode,
                                cursorColor: Colors.white,
                                cursorWidth: 2.5,
                                controller: myController,
                                obscureText: false,
                                decoration: InputDecoration(
                                  
                                  hintText:'Type Movie Name',
                                  hintStyle: GoogleFonts.robotoSlab(
                                    color: Colors.white38,
                                    fontSize: 16,
                                  ),
                                  enabledBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                  focusedBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                  prefixIcon: const Icon(
                                    Icons.local_movies_outlined,
                                    color: Colors.red
                                  ),
                                ),
                                style: GoogleFonts.robotoSlab(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                                textAlign: TextAlign.start,
                                
                                )
                            ),
                            Center(
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 10),
                                child: MaterialButton(
                                  
                                  onPressed:(){
                                    if(myController.text.isEmpty){
                                      showDialog(context: context,
                                       builder: (context){
                                         return const AlertDialog(
                                           content: Text("Enter the Movie Name"),
                                         );
                                       });
                                    }
                                    else{
                                      FocusScope.of(context).unfocus();
                                    setState(() {
                                      isLoading=false;
                                    
                                    });
                                   
                            
                                    }
                                    // Navigator.push(context,
                                    //  MaterialPageRoute(builder: (context)=>const Display())
                                    //  );
                                  },
                                    child: Text("GO",
                                    style: GoogleFonts.robotoSlab(
                                     textStyle: const TextStyle(
                                       color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                     )
                                    ),
                                    ),
                                    color: Colors.lightBlueAccent[400],
                                    
                                    ),
                              ),
                            )
                        ],
                      
                      ),
                    ),
                    ),
        
                   isLoading?const Center(
                    
                   )
                   :
                    Center(
                        child: Display(nam: myController.text),
                    
                       
                     ),
                ],
              )
            ),
            ),
            ),
      ),
    );
  }
}

