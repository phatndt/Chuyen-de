import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:on_boarding/data/api.dart';
import 'package:on_boarding/utils/introduction_mapper.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const IntroductionsScreen(),
                    ),
                  );
                },
                child: const Text("Introduction"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ReservationScreen(),
                    ),
                  );
                },
                child: const Text("Reservations"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class IntroductionsScreen extends ConsumerWidget {
  const IntroductionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
        body: ref.watch(getIntroductions).when(
              data: (data) => IntroductionScreen(
                pages: data.map((e) => e.mapper()).toList(),
                next: const Text(
                  "Next",
                ),
                skip: const Text(
                  "Skip",
                ),
                done: const Text(
                  "Done",
                ),
                showDoneButton: true,
                showNextButton: true,
                showSkipButton: true,
                onDone: () {
                  Navigator.pop(context);
                },
              ),
              error: (error, stack) => Center(
                child: Text(
                  error.toString(),
                ),
              ),
              loading: () => const CircularProgressIndicator(),
            ),
      ),
    );
  }
}

class ReservationScreen extends ConsumerWidget {
  const ReservationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
        body: ref.watch(getReservations).when(
              data: (data) => IntroductionScreen(
                controlsPadding: const EdgeInsets.all(0),
                pages: data.map((e) => e.mapper()).toList(),
                next: const Text(
                  "Next",
                ),
                skip: const Text(
                  "Skip",
                ),
                done: const Text(
                  "Done",
                ),
                showDoneButton: true,
                showNextButton: true,
                showSkipButton: true,
                onDone: () {
                  Navigator.pop(context);
                },
              ),
              error: (error, stack) => Center(
                child: Text(
                  error.toString(),
                ),
              ),
              loading: () => const CircularProgressIndicator(),
            ),
      ),
    );
  }
}
