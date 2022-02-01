import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yaml/yaml.dart';

class AppVersion extends StatelessWidget {
  const AppVersion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
        future: rootBundle.loadString("pubspec.yaml"),
        builder: (context, snapshot) {
          String version = "Unknown";
          if (snapshot.hasData) {
            var yaml = loadYaml(snapshot.data as String);
            version = yaml["version"];
          }

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Text("v: $version", style: Theme.of(context).textTheme.caption!.copyWith(fontSize: 9)),
            ),
          );
        });
  }
}
