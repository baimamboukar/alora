import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grnagain/src/logic/weather_cubit.dart';

class AppBlocsBase extends StatelessWidget {
  final Widget child;
  const AppBlocsBase({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => WeatherCubit(),
        ),
        // BlocProvider(
        //   create: (context) => SubjectBloc(),
        // ),
      ],
      child: child,
    );
  }
}
