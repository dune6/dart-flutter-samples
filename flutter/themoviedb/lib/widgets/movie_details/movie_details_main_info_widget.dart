import 'package:flutter/material.dart';
import 'package:themoviedb/resources/resources.dart';

class MovieDetailsMainInfoWidget extends StatelessWidget {
  const MovieDetailsMainInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        _TopPoster(),
        Padding(
          padding: EdgeInsets.all(20.0),
          child: _MovieNameWidget(),
        ),
        _ScoreWidget(),
        _SummeryWidget(),
        Padding(
          padding: EdgeInsets.all(10.0),
          child: _OverviewWidget(),
        ),
        Padding(
          padding: EdgeInsets.all(10.0),
          child: _DescriptionWidget(),
        ),
        Padding(
          padding: EdgeInsets.all(30.0),
          child: _PeopleWidget(),
        ),
      ],
    );
  }
}

class _ScoreWidget extends StatelessWidget {
  const _ScoreWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children:  [
        TextButton(onPressed: () {}, child: Row(
          children: const [
            CircularProgressIndicator(
              value: 0.93,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.orangeAccent),
              backgroundColor: Colors.black12,
              semanticsLabel: 'Rating',
            ),
            SizedBox(width: 10,),
            Text('User Score'),
          ],
        )),
        Container(width: 1, height: 15, color: Colors.grey,),
        TextButton(onPressed: () {}, child: Row(
          children: const [
            Icon(Icons.play_arrow),
            Text('Play Trailer'),
          ],
        )),
      ],
    );
  }
}


class _DescriptionWidget extends StatelessWidget {
  const _DescriptionWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Text displayed in a RichText widget must be explicitly styled. When picking which style to use, consider using DefaultTextStyle.of the current BuildContext to provide defaults. For more details on how to style text in a RichText widget, see the documentation for TextStyle.',
      style: TextStyle(color: Colors.white, fontSize: 16),
    );
  }
}

class _OverviewWidget extends StatelessWidget {
  const _OverviewWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Overview',
      style: TextStyle(
          color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
    );
  }
}

class _TopPoster extends StatelessWidget {
  const _TopPoster({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const [
        Image(image: AssetImage(Images.topheader)),
        Padding(
          padding: EdgeInsets.all(10.0),
          child: Image(
            image: AssetImage(Images.dune),
            width: 101,
          ),
        )
      ],
    );
  }
}

class _MovieNameWidget extends StatelessWidget {
  const _MovieNameWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      maxLines: 3,
      text: const TextSpan(
        children: <TextSpan>[
          TextSpan(
              text: 'The Dune',
              style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20.85)),
          TextSpan(
              text: ' (2021)',
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16)),
        ],
      ),
    );
  }
}

class _SummeryWidget extends StatelessWidget {
  const _SummeryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ColoredBox(
      color: Color.fromRGBO(22, 21, 25, 1),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 70),
        child: Text(
          'R 04/29/2021 (US) 2h45m Action, Fantastic, Thriller, War',
          maxLines: 3,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}

class _PeopleWidget extends StatelessWidget {
  const _PeopleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Ilya Voznesensky',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                Text(
                  'Director',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Ilya Voznesensky',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                Text(
                  'Main actor',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Ilya Voznesensky',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                Text(
                  'Director',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Ilya Voznesensky',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                Text(
                  'Main actor',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
