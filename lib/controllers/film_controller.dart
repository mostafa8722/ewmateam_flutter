import 'package:ewmateam/models/cast.dart';
import 'package:ewmateam/models/film.dart';
import 'package:ewmateam/models/genre.dart';
import 'package:get/get.dart';
import '../services/remote_service.dart';
class FilmController extends GetxController{


  var isLoading = true.obs;
  var filmList  = <Film>[].obs;
  var genreList  = <Genre>[].obs;
   var film = <Film>[].obs;
   var castList = <Cast>[].obs;
   var width = Get.width;

  @override
  void onInit() {

    fetchFilms();
    fetchGenre();

    super.onInit();

  }

  void fetchFilms() async {
    try{
      isLoading(true);

       var films  =await RemoteServices.fetchFilms()  ;



      if(films !=null)
        filmList.value =  films as List<Film> ;


    }catch(e){

    }finally{
     isLoading(false);
    }
  }
  void fetchFilm(id) async {
    try{


      var cfilm =await RemoteServices.fetchFilm(id)  ;



      if(cfilm !=null)
        film.value  =  [cfilm] as List<Film>    ;





    }catch(e){

    }finally{

    }
  }

  void fetchCredits(id) async {
    try{


      var cfilm =await RemoteServices.fetchCredits(id)  ;

      if(cfilm !=null)
        castList.value  =  cfilm as List<Cast>    ;




    }catch(e){

    }finally{

    }
  }
  void fetchGenre() async {
    try{
      isLoading(true);
      var genres  =await RemoteServices.fetchGenre()  ;


      if(genres !=null)
        genreList.value =  genres as List<Genre> ;


    }catch(e){

    }finally{
      isLoading(false);
    }
  }
}