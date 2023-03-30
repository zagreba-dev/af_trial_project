import 'package:af_trial_project/entity/movie.dart';
import 'package:flutter/material.dart';

class MovieDetailsPage extends StatelessWidget {
  const MovieDetailsPage({super.key, required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MovieDetails(movie: movie),
    );
  }
}

class MovieDetails extends StatelessWidget {
  const MovieDetails({super.key, required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    final duration = Duration(minutes: movie.duration);
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);
    final durationData = hours > 0 ? '${hours}h ${minutes}m' : '${minutes}m';
    final paddingMovieDatails = MediaQuery.of(context).size.height * 380 / 812;
    final bgPictureHeigh = MediaQuery.of(context).size.height * 500 / 812;

    final genres = movie.genres.map((genre) => genre.title).toList().join(', ');

    final directors = movie.directors
        .map((person) => '${person.firstName} ${person.lastName}')
        .toList()
        .join(', ');

    final writers = movie.writers
        .map((person) => '${person.firstName} ${person.lastName}')
        .toList()
        .join(', ');

    final stars = movie.stars
        .map((person) => '${person.firstName} ${person.lastName}')
        .toList()
        .join(', ');

    return Column(
      children: [
        Expanded(
          child: Stack(
            children: <Widget>[
              Image.network(
                height: bgPictureHeigh,
                movie.bgPicture,
                fit: BoxFit.fitHeight,
              ),
              SingleChildScrollView(
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: <Color>[
                        Color(0xFF161616),
                        Colors.transparent,
                      ],
                      stops: <double>[0.40, 1.0],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: paddingMovieDatails,
                          ),
                          Text(
                            movie.title,
                            style: const TextStyle(
                                fontFamily: 'Krona One',
                                fontSize: 28,
                                height: 35 / 28),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '(${movie.releaseYear})',
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                height: 1.4),
                          ),
                          const SizedBox(height: 24),
                          Text(
                            movie.description,
                            style: const TextStyle(fontSize: 16, height: 1.4),
                          ),
                          const SizedBox(height: 24),
                          Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              spacing: 12,
                              children: [
                                Text(
                                  genres,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      height: 1.4),
                                ),
                                Container(
                                    margin: const EdgeInsets.only(top: 3),
                                    height: 10,
                                    width: 0.1,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: const Color(0xFFA6A6A6),
                                            width: 0.5))),
                                Text(
                                  movie.mpaRating,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      height: 1.4),
                                ),
                                Container(
                                    margin: const EdgeInsets.only(top: 3),
                                    height: 10,
                                    width: 0,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: const Color(0xFFA6A6A6),
                                            width: 0.5))),
                                Text(
                                  durationData,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      height: 1.4),
                                )
                              ]),
                          const SizedBox(height: 24),
                          RichText(
                            text: TextSpan(
                              text: 'Director: ',
                              style: const TextStyle(
                                  fontFamily: 'Rubik',
                                  color: Color(0xFFE2E2E2),
                                  fontSize: 16,
                                  height: 1.4),
                              children: <TextSpan>[
                                TextSpan(
                                    text: directors,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFFFFFFFF),
                                    )),
                              ],
                            ),
                          ),
                          const SizedBox(height: 8),
                          RichText(
                            text: TextSpan(
                              text: 'Writers: ',
                              style: const TextStyle(
                                  fontFamily: 'Rubik',
                                  color: Color(0xFFE2E2E2),
                                  fontSize: 16,
                                  height: 1.4),
                              children: <TextSpan>[
                                TextSpan(
                                    text: writers,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFFFFFFFF),
                                    )),
                              ],
                            ),
                          ),
                          const SizedBox(height: 8),
                          RichText(
                            text: TextSpan(
                              text: 'Stars: ',
                              style: const TextStyle(
                                  fontFamily: 'Rubik',
                                  color: Color(0xFFE2E2E2),
                                  fontSize: 16,
                                  height: 1.4),
                              children: <TextSpan>[
                                TextSpan(
                                    text: stars,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFFFFFFFF),
                                    )),
                              ],
                            ),
                          ),
                          const SizedBox(height: 24)
                        ]),
                  ),
                ),
              ),
              Positioned(
                left: 10,
                top: 54,
                child: IconButton(
                    style: IconButton.styleFrom(hoverColor: Colors.red),
                    onPressed: Navigator.of(context).pop,
                    icon: const Icon(Icons.arrow_back_ios,
                        size: 20.34, color: Color(0xFFFFFFFF))),
              ),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          height: 120,
          color: const Color(0xFF161616),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 12, 24, 54),
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'IBDb rating',
                          style: TextStyle(
                              color: Color(0xFFE2E2E2),
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              height: 1.2),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(bottom: 4),
                              child: Icon(
                                Icons.star_outlined,
                                size: 20,
                                color: Color(0xFFE98D4B),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 7),
                              child: Text(
                                movie.imdbRating
                                    .toString()
                                    .replaceAll(".", ","),
                                style: const TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.w500,
                                    height: 0.5),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 2),
                              child: Text('/10',
                                  style: TextStyle(
                                      color: Color(0xFFE2E2E2), fontSize: 16)),
                            ),
                          ],
                        ),
                      ]),
                  ElevatedButton.icon(
                      icon: const Icon(
                        Icons.play_arrow_rounded,
                        size: 16,
                      ),
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(180, 48),
                        backgroundColor: const Color(0xFFDA1617),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2)),
                      ),
                      onPressed: () {},
                      label: const Text('Watch trailer',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              height: 17 / 14))),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
