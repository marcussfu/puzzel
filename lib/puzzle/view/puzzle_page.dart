import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puzzel/puzzle/puzzle.dart';

class PuzzlePage extends StatelessWidget {
  /// {@macro puzzle_page}
  const PuzzlePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // BlocProvider(
        //   create: (_) => DashatarThemeBloc(
        //     themes: const [
        //       BlueDashatarTheme(),
        //       GreenDashatarTheme(),
        //       YellowDashatarTheme()
        //     ],
        //   ),
        // ),
        BlocProvider(
          create: (_) => DashatarPuzzleBloc(
            secondsToBegin: 3,
            ticker: const Ticker(),
          ),
        ),
        BlocProvider(
          create: (context) => ThemeBloc(
            initialThemes: [
              const SimpleTheme(),
              context.read<DashatarThemeBloc>().state.theme,
            ],
          ),
        ),
        BlocProvider(
          create: (_) => TimerBloc(
            ticker: const Ticker(),
          ),
        ),
        BlocProvider(
          create: (_) => AudioControlBloc(),
        ),
      ],
      child: const PuzzleView(),
    );
  }
}
