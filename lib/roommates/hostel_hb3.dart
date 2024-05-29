import 'package:flutter/cupertino.dart';

class HostelHB3 extends StatelessWidget {
  const HostelHB3({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      theme: CupertinoThemeData(brightness: Brightness.light),
      home: HostelHB31(),
    );
  }
}

class HostelHB31 extends StatelessWidget {
  const HostelHB31({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('HB3'),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            CupertinoButton(
              onPressed: () {},
              child: const Text('Block A'),
            ),
            const SizedBox(height: 30),
            CupertinoButton.filled(
              onPressed: () {},
              child: const Text('Block B'),
            ),
            const SizedBox(height: 30),
            CupertinoButton.filled(
              onPressed: () {},
              child: const Text('Block C'),
            ),
          ],
        ),
      ),
    );
  }
}