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

    final title = movie.title;
    final releaseYear = '(${movie.releaseYear})';
    final description = movie.description;

    final genres = movie.genres.map((genre) => genre.title).toList().join(', ');
    final mpaRating = movie.mpaRating;
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
    final imdbRating = movie.imdbRating;

    return Column(
      children: [
        Expanded(
          child: Stack(
            children: <Widget>[
              Image.network(
                  height: bgPictureHeigh,
                  movie.bgPicture,
                  fit: BoxFit.fitHeight),
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
                          _PaddingMovieDatailsWidget(
                              paddingMovieDatails: paddingMovieDatails),
                          _TitleLineWidget(title: title),
                          const SizedBox(height: 4),
                          _ReleaseYearLineWidget(releaseYear: releaseYear),
                          const SizedBox(height: 24),
                          _DescriptionLineWidget(description: description),
                          const SizedBox(height: 24),
                          _GenresLineWidget(
                              genres: genres,
                              mpaRating: mpaRating,
                              duration: durationData),
                          const SizedBox(height: 24),
                          _DirectorLineWidget(directors: directors),
                          const SizedBox(height: 8),
                          _WritersLineWidget(writers: writers),
                          const SizedBox(height: 8),
                          _StarsLineWidget(stars: stars),
                          const SizedBox(height: 24)
                        ]),
                  ),
                ),
              ),
              const _IconButtonArrowBackWidget(),
            ],
          ),
        ),
        _BottomBarWidget(imdbRating: imdbRating),
      ],
    );
  }
}

class _BottomBarWidget extends StatelessWidget {
  const _BottomBarWidget({
    Key? key,
    required this.imdbRating,
  }) : super(key: key);

  final double imdbRating;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                    const Text('IBDb rating',
                        style: TextStyle(
                            color: Color(0xFFE2E2E2),
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            height: 1.2)),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Padding(
                            padding: EdgeInsets.only(bottom: 4),
                            child: Icon(
                              Icons.star_outlined,
                              size: 20,
                              color: Color(0xFFE98D4B),
                            )),
                        Padding(
                            padding: const EdgeInsets.only(left: 7),
                            child: Text(
                                imdbRating.toString().replaceAll(".", ","),
                                style: const TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.w500,
                                    height: 0.5))),
                        const Padding(
                            padding: EdgeInsets.only(left: 2),
                            child: Text('/10',
                                style: TextStyle(
                                    color: Color(0xFFE2E2E2), fontSize: 16))),
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
                          borderRadius: BorderRadius.circular(2))),
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
    );
  }
}

class _IconButtonArrowBackWidget extends StatelessWidget {
  const _IconButtonArrowBackWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 10,
      top: 54,
      child: IconButton(
          onPressed: Navigator.of(context).pop,
          icon: const Icon(Icons.arrow_back_ios,
              size: 20.34, color: Color(0xFFFFFFFF))),
    );
  }
}

class _StarsLineWidget extends StatelessWidget {
  const _StarsLineWidget({
    Key? key,
    required this.stars,
  }) : super(key: key);

  final String stars;

  @override
  Widget build(BuildContext context) {
    return RichText(
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
                  fontWeight: FontWeight.w500, color: Color(0xFFFFFFFF))),
        ],
      ),
    );
  }
}

class _WritersLineWidget extends StatelessWidget {
  const _WritersLineWidget({
    Key? key,
    required this.writers,
  }) : super(key: key);

  final String writers;

  @override
  Widget build(BuildContext context) {
    return RichText(
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
                  fontWeight: FontWeight.w500, color: Color(0xFFFFFFFF))),
        ],
      ),
    );
  }
}

class _DirectorLineWidget extends StatelessWidget {
  const _DirectorLineWidget({
    Key? key,
    required this.directors,
  }) : super(key: key);

  final String directors;

  @override
  Widget build(BuildContext context) {
    return RichText(
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
                  fontWeight: FontWeight.w500, color: Color(0xFFFFFFFF))),
        ],
      ),
    );
  }
}

class _GenresLineWidget extends StatelessWidget {
  const _GenresLineWidget({
    Key? key,
    required this.genres,
    required this.mpaRating,
    required this.duration,
  }) : super(key: key);

  final String genres;
  final String mpaRating;
  final String duration;

  @override
  Widget build(BuildContext context) {
    return Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 12,
        children: [
          Text(genres,
              style: const TextStyle(
                  fontSize: 16, fontWeight: FontWeight.w500, height: 1.4)),
          Container(
              margin: const EdgeInsets.only(top: 3),
              height: 10,
              width: 0.1,
              decoration: BoxDecoration(
                  border:
                      Border.all(color: const Color(0xFFA6A6A6), width: 0.5))),
          Text(mpaRating,
              style: const TextStyle(
                  fontSize: 16, fontWeight: FontWeight.w500, height: 1.4)),
          Container(
              margin: const EdgeInsets.only(top: 3),
              height: 10,
              width: 0.1,
              decoration: BoxDecoration(
                  border:
                      Border.all(color: const Color(0xFFA6A6A6), width: 0.5))),
          Text(duration,
              style: const TextStyle(
                  fontSize: 16, fontWeight: FontWeight.w500, height: 1.4))
        ]);
  }
}

class _DescriptionLineWidget extends StatelessWidget {
  const _DescriptionLineWidget({
    Key? key,
    required this.description,
  }) : super(key: key);

  final String description;

  @override
  Widget build(BuildContext context) {
    return Text(description, style: const TextStyle(fontSize: 16, height: 1.4));
  }
}

class _ReleaseYearLineWidget extends StatelessWidget {
  const _ReleaseYearLineWidget({
    Key? key,
    required this.releaseYear,
  }) : super(key: key);

  final String releaseYear;

  @override
  Widget build(BuildContext context) {
    return Text(releaseYear,
        style: const TextStyle(
            fontSize: 18, fontWeight: FontWeight.w700, height: 1.4));
  }
}

class _TitleLineWidget extends StatelessWidget {
  const _TitleLineWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(title,
        style: const TextStyle(
            fontFamily: 'Krona One', fontSize: 28, height: 35 / 28));
  }
}

class _PaddingMovieDatailsWidget extends StatelessWidget {
  const _PaddingMovieDatailsWidget({
    Key? key,
    required this.paddingMovieDatails,
  }) : super(key: key);

  final double paddingMovieDatails;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: paddingMovieDatails,
    );
  }
}
