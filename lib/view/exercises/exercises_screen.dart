import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ExercisesScreen extends StatefulWidget {
  const ExercisesScreen({super.key});

  @override
  State<ExercisesScreen> createState() => _ExercisesScreenState();
}

class _ExercisesScreenState extends State<ExercisesScreen> {
  late final YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();

    const url = "https://youtu.be/9MIFX0w7At8?feature=shared";
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(url) ?? "",
      flags: const YoutubePlayerFlags(
        autoPlay: false,
      ),
    );
  }

  @override
  void deactivate() {
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  final List<YoutubePlayerController> _controllers = [
    'https://youtu.be/9MIFX0w7At8?feature=shared',
    'https://youtu.be/Ez2GeaMa4c8?si=GmW5Ik4ctU9U9JZu',
    'https://youtu.be/EqHcDCYRdZU?feature=shared',
  ]
      .map<YoutubePlayerController>(
        (videoId) => YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(videoId)!,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
      ),
    ),
  )
      .toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: SvgPicture.asset("assets/icons/arrow_right_ic.svg"),
        ),
        title: const Text("Exercises"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: ListView.builder(
          itemCount: _controllers.length,
          padding: const EdgeInsets.symmetric(vertical: 8),
          physics: const ClampingScrollPhysics(),
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: const BoxDecoration(
                    color: Color(0xffFEFEFE),
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      "Flex the hands",
                      style: TextStyle(
                        color: Color(0xff596992),
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  child: YoutubePlayerBuilder(
                    player: YoutubePlayer(
                      showVideoProgressIndicator: true,
                      controller: _controller,
                    ),
                    builder: (context, player) => player,
                  ),
                ),
                const Text(
                  "Extend the right and left arms forward, interlock them together, and extend them forward until you feel a slight stretch for 15 to 30 seconds.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xff9BA1B2),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
