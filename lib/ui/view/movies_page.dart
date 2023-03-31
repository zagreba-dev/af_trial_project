import 'package:af_trial_project/api_clients/api_client.dart';
import 'package:af_trial_project/bloc/movie_bloc.dart';
import 'package:af_trial_project/ui/widgets/home_indicator_widget.dart';
import 'package:af_trial_project/ui/widgets/movie_card_mobile.dart';
import 'package:af_trial_project/ui/widgets/error_screen.dart';
import 'package:af_trial_project/ui/widgets/movie_card_skeleton_loader.dart';
import 'package:af_trial_project/ui/view/movie_details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoviesPage extends StatelessWidget {
  const MoviesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => MovieBloc(httpClient: ApiClient())..add(MovieFetched()),
        child: const MoviesScreen(),
      ),
    );
  }
}

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBloc, MovieState>(
      buildWhen: (previousState, state) => previousState.status != state.status,
      builder: (context, state) {
        switch (state.status) {
          case MovieStatus.failure:
            return const ErrorScreenWidget();
          case MovieStatus.success:
            return const _MoviesListWidget();
          case MovieStatus.initial:
            return const _MovieInitialWidget();
        }
      },
    );
  }
}

class _MoviesListWidget extends StatefulWidget {
  const _MoviesListWidget({super.key});

  @override
  State<_MoviesListWidget> createState() => _MoviesListState();
}

class _MoviesListState extends State<_MoviesListWidget> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBloc, MovieState>(builder: (context, state) {
      return Stack(alignment: AlignmentDirectional.topCenter, children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 56, 18, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: const TextSpan(
                  text: 'Popular ',
                  style: TextStyle(
                      fontFamily: 'Rubik',
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      height: 28 / 24),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'series',
                        style: TextStyle(
                          color: Color(0xFFDA1617),
                        )),
                  ],
                ),
              ),
              const SizedBox(height: 21),
              Expanded(
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 16,
                    shrinkWrap: true,
                    childAspectRatio: 163 / 298,
                    controller: _scrollController,
                    children: List.generate(state.movies.length, (index) {
                      return InkWell(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  MovieDetailsPage(movie: state.movies[index])),
                        ),
                        child: MovieCardMobile(
                          movie: state.movies[index],
                        ),
                      );
                    }),
                  ),
                ),
              ),
            ],
          ),
        ),
        const Positioned(bottom: 8, child: HomeIndicatorWidget())
      ]);
    });
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) context.read<MovieBloc>().add(MovieFetched());
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.8);
  }
}

class _MovieInitialWidget extends StatelessWidget {
  const _MovieInitialWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
        fit: StackFit.expand,
        alignment: AlignmentDirectional.topCenter,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 60, 16, 0),
            child: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 16,
                shrinkWrap: true,
                childAspectRatio: 164 / 298,
                children: List.generate(4, (index) {
                  return const MovieCardSkeletonLoader();
                }),
              ),
            ),
          ),
          const Positioned(bottom: 8, child: HomeIndicatorWidget()),
        ]);
  }
}
