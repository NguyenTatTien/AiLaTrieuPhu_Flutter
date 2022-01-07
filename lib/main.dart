import 'package:ailatrieuphu_flutter/DAO/cau_hoi_dao.dart';
import 'package:ailatrieuphu_flutter/DAO/linh_vuc_dao.dart';
import 'package:ailatrieuphu_flutter/Models/muc_do.dart';
import 'package:ailatrieuphu_flutter/Views/add_player.dart';
import 'package:ailatrieuphu_flutter/Views/score_view.dart';
import 'package:flutter/material.dart';

import 'Models/cau_hoi.dart';
import 'data.dart';
import 'Models/linh_vuc.dart';
import 'DAO/muc_do_dao.dart';
import 'Models/nguoi_choi.dart';
import 'Views/fisrt_view.dart';
import 'Views/player_view.dart';
import 'Views/game_view.dart';
import 'Views/menu_view.dart';
import 'Views/instructions_view.dart';
import 'Views/over_view.dart';
import 'dbhelper.dart';

void main() async {
  Data.DataGmae();
  runApp(MaterialApp(
    routes: {
      "/": (context) => FirstView(),
      "/Player": (context) => PlayerView(),
      "/AddPlayer": (context) => AddPlayer(),
      "/Instructions": (context) => InstructionsView()
    },
    onGenerateRoute: (settings) {
      if (settings.name == "/Menu") {
        final player = settings.arguments as NguoiChoi;
        return MaterialPageRoute(builder: (context) {
          return MenuView(player: player);
        });
      } else if (settings.name == "/Game") {
        final player = settings.arguments as NguoiChoi;
        return MaterialPageRoute(builder: (context) {
          return GameView(player: player);
        });
      } else if (settings.name == "/Over") {
        final score = settings.arguments as int;
        return MaterialPageRoute(builder: (context) {
          return OverView(score: score);
        });
      } else if (settings.name == "/Score") {
        final player = settings.arguments as NguoiChoi;
        return MaterialPageRoute(builder: (context) {
          return ScoreView(player: player);
        });
      }
    },
  ));
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
      home: Center(),
    );
  }
}
