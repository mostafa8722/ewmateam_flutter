
import 'package:ewmateam/controllers/film_controller.dart';
import 'package:ewmateam/services/remote_service.dart';
import 'package:ewmateam/views/single_screen.dart';
import 'package:ewmateam/views/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomeScreen extends StatelessWidget {

  final  FilmController controller =  Get.put(FilmController());


  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body:
       Column(

         children: [
           Expanded(child:
           Obx((){
             if(controller.isLoading.isTrue)
               return Center(child: CircularProgressIndicator(),);
             else
               return
                 Padding(padding: EdgeInsets.all(5),

                 child:
                 GridView.builder(
                   physics: NeverScrollableScrollPhysics(),
                   shrinkWrap: true,
                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                     crossAxisCount: 2,
                     crossAxisSpacing: 5.0,
                     mainAxisSpacing: 5.0,
                   ),
                   itemCount: controller.filmList.length,
                   itemBuilder: (context, index) {
                     var film = controller.filmList[index];
                     var  ids =film.genre_ids.toString()
                         .replaceAll("[", "")
                         .replaceAll("]", "").split(",");

                     return
                       InkWell(
                         child: Container(


                           height: 250,
                           decoration: BoxDecoration(

                               borderRadius: BorderRadius.circular(5.0),
                               color: Color(0xfff1f1f1)
                           ),
                           child: Row(
                             children: [

                               Container(
                                 height: 250,
                                 width: 100,
                                 decoration: BoxDecoration(
                                     image: DecorationImage(image: NetworkImage("https://image.tmdb.org/t/p/original${film.backdrop_path}"),
                                         fit: BoxFit.cover)
                                 ),

                               ),
                               Column(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 children: [
                                   Text(film.title.toString(),style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xff454545)),),
                                   Column(
                                     children: [
                                       Row(
                                         children: [
                                           Icon(Icons.calendar_today_sharp,color: Color(0xff787878),),
                                           SizedBox(width:5),
                                           Text(film.release_date.toString(),style: TextStyle(color: Color(0xff787878)))],
                                       ),
                                       Row(
                                         children:  ids.map((element) =>
                                             Container(
                                               padding: EdgeInsets.symmetric(vertical: 5.0,horizontal: 10.0),
                                               margin: EdgeInsets.only(left: 10,top: 5),
                                               decoration: BoxDecoration(
                                                 color: Colors.lightBlue,
                                                 borderRadius: BorderRadius.circular(10),

                                               ),
                                               child:
                                               Text(getData(element),style: TextStyle(color: Colors.white),),
                                             )
                                         ).toList(),
                                       ),
                                     ],
                                   )
                                 ],
                               )
                             ],
                           ),
                         ),
                         onTap: (){print("dd");
                          Get.to(SingleScreen(),arguments:film.id);
                         print(GetPlatform.isAndroid);
                         print(GetPlatform.isMacOS);
                         print(GetPlatform.isWindows);

                         },
                       );
                   },
                 ),
                 );
           })
           )
         ],

        ),

    );
  }

  String getData(id){
    var genrs =  controller.genreList;
    var index = 0;

    for (int i = 0; i < genrs.length; i++) {

      if(id.toString().trim()==genrs[i].id.toString().trim())
        index = i;
    }

    return genrs[index].name.toString();
  }

}

