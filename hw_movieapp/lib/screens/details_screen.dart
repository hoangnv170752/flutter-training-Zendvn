import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hw_movieapp/models/movie_details.dart';
import 'package:hw_movieapp/services/movie.dart';
import 'package:hw_movieapp/utils/constants.dart';
import 'package:hw_movieapp/widgets/custom_loading_spin_kit_ring.dart';
import 'package:sizer/sizer.dart';
import 'package:hw_movieapp/utils/star_calculator.dart' as starCalculator;
import 'package:hw_movieapp/utils/file_manager.dart' as file;
import 'package:hw_movieapp/utils/toast_alert.dart' as alert;

class DetailsScreen extends StatefulWidget {
  final String id;
  final Color themeColor;
  DetailsScreen({required this.id, required this.themeColor});
  @override
  _DetailsScreenState createState() => _DetailsScreenState();

  Future<MovieDetails> getMovieDetails() async {
    MovieModel movieModel = MovieModel();
    MovieDetails temp = await movieModel.getMovieDetails(movieID: id);
    return temp;
  }
}

class _DetailsScreenState extends State<DetailsScreen> {
  MovieDetails? movieDetails;
  List<Widget>? stars;
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    () async {
      MovieDetails temp = await widget.getMovieDetails();
      List<Widget> temp2 =
          starCalculator.getStars(rating: temp.rating, starSize: 15.sp);

      setState(() {
        isFavorite = temp.isFavorite;
        movieDetails = temp;
        stars = temp2;
      });
    }();
  }

  saveFavorite() async {
    if (await file.addFavorite(movieID: widget.id)) {
      alert.toastAlert(
        message: kFavoriteAddedText,
        themeColor: widget.themeColor,
      );
    }
    setState(() {
      isFavorite = true;
    });
  }

  removeFavorite() async {
    if (await file.removeFavorite(movieID: widget.id)) {
      alert.toastAlert(
        message: kFavoriteRemovedText,
        themeColor: widget.themeColor,
      );
    }
    setState(() {
      isFavorite = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (stars == null)
          ? CustomLoadingSpinKitRing(loadingColor: widget.themeColor)
          : CustomScrollView(
              slivers: [
                SliverAppBar(
                  shadowColor: Colors.transparent.withOpacity(0.1),
                  elevation: 0,
                  backgroundColor: kPrimaryColor,
                  leading: Padding(
                    padding: EdgeInsets.only(left: 3.w),
                    child: IconButton(
                      icon: Icon(Icons.arrow_back_ios),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  automaticallyImplyLeading: false,
                  pinned: true,
                  snap: false,
                  floating: false,
                  expandedHeight: 22.0.h,
                  actions: [
                    Padding(
                      padding: EdgeInsets.only(right: 3.w),
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            (!isFavorite) ? saveFavorite() : removeFavorite();
                          });
                        },
                        icon: Icon((isFavorite)
                            ? Icons.bookmark_sharp
                            : Icons.bookmark_border_sharp),
                      ),
                    ),
                  ],
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    title: Text(kDetailsScreenTitleText),
                    background: SafeArea(
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        placeholder: (context, url) => SafeArea(
                          child: Container(
                            height: 22.h,
                            child: CustomLoadingSpinKitRing(
                                loadingColor: widget.themeColor),
                          ),
                        ),
                        imageUrl: movieDetails!.backgroundURL,
                        errorWidget: (context, url, error) => SafeArea(
                          child: Container(
                            height: 22.h,
                            child: CustomLoadingSpinKitRing(
                                loadingColor: widget.themeColor),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SliverFillRemaining(
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 4.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4.h),
                            child: Wrap(
                              children: [
                                Text(
                                  "${movieDetails!.title} ",
                                  style: kDetailScreenBoldTitle,
                                ),
                                Text(
                                  (movieDetails!.year == "")
                                      ? ""
                                      : "(${movieDetails!.year})",
                                  style: kDetailScreenRegularTitle,
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 1.h),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4.h),
                            child: Row(children: stars!),
                          ),
                          SizedBox(height: 3.h),
                          SingleChildScrollView(
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 3.h),
                              child: Row(
                                  children:
                                      movieDetails!.getGenresList(context)),
                            ),
                          ),
                          SizedBox(height: 1.h),
                        ],
                      ),
                      if (movieDetails!.overview != "")
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 3.h, vertical: 3.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                    right: 1.h,
                                    left: 1.h,
                                    bottom: 1.h,
                                  ),
                                  child: Container(
                                    child: Text(kStoryLineTitleText,
                                        style: kSmallTitleTextStyle),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        right: 1.h,
                                        left: 1.h,
                                        top: 1.h,
                                        bottom: 4.h),
                                    child: Text(
                                      movieDetails!.overview,
                                      style: TextStyle(
                                          fontSize: 16.sp,
                                          color: Color(0xFFC9C9C9)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
