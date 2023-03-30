import 'package:af_trial_project/bloc/movie_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ErrorScreenWidget extends StatelessWidget {
  const ErrorScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Spacer(flex: 255),
          Column(
            children: [
              Image.asset(
                'assets/images/ufo_illustration_255x255.png',
                width: 255,
                height: 255,
              ),
              const SizedBox(height: 12),
              const Text(
                'Ooops..',
                style: TextStyle(
                    fontFamily: 'Krona One', fontSize: 28, height: 35 / 28),
              ),
              const SizedBox(height: 4),
              const Text('Something went wrong!',
                  style: TextStyle(
                      color: Color(0xFFE2E2E2), fontSize: 16, height: 19 / 16)),
            ],
          ),
          const Spacer(flex: 120),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFDA1617),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2)),
              ),
              onPressed: () {
                context.read<MovieBloc>()
                  ..add(MovieRetried())
                  ..add(MovieFetched());
              },
              child: const Padding(
                padding: EdgeInsets.fromLTRB(70, 16, 70, 15),
                child: Text('Retry',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        height: 17 / 14)),
              )),
          const Spacer(flex: 51),
          Container(
            width: 134,
            height: 5,
            decoration: BoxDecoration(
                color: const Color(0xFFFFFFFF),
                borderRadius: BorderRadius.circular(100)),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
