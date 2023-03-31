import 'package:flutter/material.dart';
import 'package:af_trial_project/entity/movie.dart';

class MovieCardMobile extends StatelessWidget {
  const MovieCardMobile({super.key, required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        AspectRatio(
          aspectRatio: 163 / 215,
          child: Image.network(
            movie.poster,
            fit: BoxFit.fill,
          ),
        ),
        const Spacer(),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 2),
              child: Icon(
                Icons.star_outlined,
                size: 16,
                color: Color(0xFFE98D4B),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 4),
              child: Text(movie.imdbRating.toString().replaceAll(".", ","),
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w500)),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 4),
              child: Text('/10',
                  style: TextStyle(color: Color(0xFFE2E2E2), fontSize: 14)),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text('${movie.title}\n',
            maxLines: 2, style: Theme.of(context).textTheme.titleSmall),
      ]),
    );
  }
}
