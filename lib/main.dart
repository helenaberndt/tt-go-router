import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/foundation.dart';

void main() {
  FlutterError.onError = (details) {
    FlutterError.presentError(details);
    if (kReleaseMode) exit(1);
  };
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        name: 'home',
        path: '/',
        builder: (context, state) => HomePage(),
      ),
      GoRoute(
        name: 'first',
        path: '/first',
        builder: (context, state) => FirstPage(),
      ),
      GoRoute(
        name: 'first_one',
        path: '/first/first-one',
        builder: (context, state) => FirstOnePage(),
      ),
      GoRoute(
          name: 'second',
        path: '/second',
        builder: (context, state) => SecondPage(),
        routes: [
          GoRoute(
            name: 'second_one',
            path: 'second-one',
            builder: (context, state) => SecondOnePage(),
          ),
          GoRoute(
            name: 'second_two',
            path: 'second-two',
            builder: (context, state) => SecondTwoPage(),
          )
        ]
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => context.goNamed('first'),
              child: Text('Go to page 1'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => context.goNamed('second'),
              child: Text('Go to page 2'),
            ),
          ],
        ),
      ),
    );
  }
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 1'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => context.goNamed('first_one'),
              child: Text('Go to page 1.1'),
            ),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () => context.goNamed('home'),
              child: Text('Go back to Home'),
            ),
          ],
        ),
      ),
    );
  }
}

class FirstOnePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 1.1'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => context.goNamed('first'),
              child: Text('Go back to page 1'),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => context.goNamed('second_one'),
              child: Text('Go to page 2.1'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => context.go('/second/second-two'),
              child: Text('Go to page 2.2'),
            ),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () => context.goNamed('home'),
              child: Text('Go back to Home'),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondOnePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 2.1'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => context.goNamed('second'),
              child: Text('Go back to page 2'),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondTwoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 2.2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => context.goNamed('second'),
              child: Text('Go back to page 2'),
            ),
          ],
        ),
      ),
    );
  }
}