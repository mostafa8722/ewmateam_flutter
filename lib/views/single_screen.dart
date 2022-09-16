
import 'dart:convert';
import 'dart:html';
import 'dart:ui';


import 'package:ewmateam/models/genre2.dart';
import 'package:ewmateam/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/film_controller.dart';

class SingleScreen extends StatelessWidget {

  final  FilmController controller =  Get.find();

  List<String>  genres2 = [] ;
  @override
  Widget build(BuildContext context) {
    var id = Get.arguments;
    controller.fetchFilm(id);
    controller.fetchCredits(id);

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Obx((){
          var film = controller.film ;
         // print("ttt");
          print(film);
          return Text(film.length>0?film[0].title.toString():"");
        }),
      ),
      body:
      Column(
        children: [
          Expanded(
            child: Obx((){
              var film = controller.film ;
              var castList = controller.castList ;

              var  width = controller.width;



              String belongs_to_collection = jsonEncode(film[0].belongs_to_collection);
              var genres_string = jsonEncode(film[0].genres);





              print(castList);


             var maps = json.decode(genres_string);

              List<String>  genres = [] ;


               for(int i=0;i<=List<dynamic>.from(maps).length-1;i++ ){

                 genres.add( List<dynamic>.from(maps)[i]["name"]);
                 genres2.add( List<dynamic>.from(maps)[i]["name"]);

               }





              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
               
                    width>50 ?
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                      headerImage(width>500?450:250,width>500?300:200, jsonDecode(belongs_to_collection)["poster_path"]),
                      Expanded(


                          child:

                    Container(
                      child:   Padding(
                          padding: EdgeInsets.only(top: 30,left:10,right: 10 ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              rowItem("Budget", "\$\ ${film[0].budget}"),
                              SizedBox(height: 10,),
                              rowItem("Revenue", "\$\ ${film[0].revenue}"),
                              SizedBox(height: 10,),
                              rowItem("Release Date", " ${film[0].release_date}"),
                              SizedBox(height: 10,),
                              rowItem(" Runtime", " ${film[0].runtime}"),
                              SizedBox(height: 10,),
                              rowItem("Score", " ${film[0].vote_average}(${film[0].vote_count}) votes"),
                              SizedBox(height: 10,),
                              rowItem("Genres", genres),
                              SizedBox(height: 10,),
                              rowItem("IMDB Link", " ${film[0].release_date}"),
                              SizedBox(height: 10,),
                              rowItem("Homepage Link", " ${film[0].release_date}"),
                            ],
                          )
                      ),
                    )
                      ),])

                    :headerImage(250,200, jsonDecode(belongs_to_collection)["poster_path"]),
                   Container(
                     margin : EdgeInsets.only(top: 20,left:10,right: 10 ),
                     child:  Text(film[0].overview.toString()),
                   ),
                    GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 1.0,
                        mainAxisSpacing: 1.0,
                      ),
                      itemCount: controller.castList.length,
                      itemBuilder: (context, index) {
                        var cast = controller.castList[index];

                        return
                        Container(
                          height: 20,
                          color: Colors.red,
                          child:  Text(cast.name.toString(),style: TextStyle(color: Color(0xff898989)),),
                        );
                      },
                    ),

                  ],
                ),

              );
            }),
          )
        ],
      )
      ,
    );

  }

  Widget headerImage (height,width,img){

    return Container(
      height: height,
         width: width,
      margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
          boxShadow:  [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
          image: DecorationImage(image: NetworkImage("https://image.tmdb.org/t/p/original${img}"),
              fit: BoxFit.cover)
      ),

    );
  }
  Widget rowItem (title , value){


var lk = [];
    if(title=="Genres"){

      for(int i=0;i<=genres2.length-1;i++){
        lk.add(i==0?"${genres2[i]}":",${genres2[i]}");
      }

    }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title ,style: TextStyle(color: Color(0xff454545),fontWeight: FontWeight.bold),),

        title=="Genres"?Row(children: lk.map((e) => Text("${e}")).toList(),):
        (title=="IMDB Link" ||  title=="Homepage Link")?InkWell(child:Text("Link",style: TextStyle(color:Colors.blueAccent),),onTap: (){print("click");},)
        :
        Text(value),
      ],
    );
  }
}