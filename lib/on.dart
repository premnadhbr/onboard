// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class OnBoards {
  final String image, title, description;
  OnBoards({
    required this.description,
    required this.image,
    required this.title,
  });
}

final List<OnBoards> demo = [
  OnBoards(
      title:
          "Spice up your convos with emojis, gifs, and more! It's a chat party!",
      description:
          "Ping! Your friends are waiting. Stay tuned and keep chatting.",
      image: 'assets/images/chat_app.png'),
  OnBoards(
      title: "Chat, connect, and cheer! Spread good vibes in every message.",
      description: "Tap, type, talk! Let the chatting adventures begin. Ready?",
      image: 'assets/images/chat_app.png'),
  OnBoards(
      title:
          "Congratulations! You're now part of the EchoChat community. Happy chatting!",
      description:
          "Your secrets are safe with us. EchoChat - where privacy meets peace of mind.",
      image: 'assets/images/chat_app.png'),
  OnBoards(
      title: "Greetings! Welcome to EchoChat, where your words find a home.",
      description:
          "High five! You're officially a ChatBuddy. Happy chatting, pal!",
      image: 'assets/images/chat_app.png'),
];

class DontIndicator extends StatelessWidget {
  const DontIndicator({
    this.isActive = false,
    super.key,
  });

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: isActive ? 12 : 4,
      width: 4,
      decoration: const BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.all(Radius.circular(20))),
    );
  }
}

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({super.key});

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  late PageController pageController;

  int pageindex = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: pageController,
                  itemCount: demo.length,
                  onPageChanged: (index) {
                    setState(() {
                      pageindex = index;
                    });
                  },
                  itemBuilder: (context, index) => OnboardContent(
                    description: demo[index].description,
                    image: demo[index].image,
                    title: demo[index].title,
                  ),
                ),
              ),
              Row(
                children: [
                  ...List.generate(
                    demo.length,
                    (index) => Padding(
                      padding: const EdgeInsets.only(right: 4),
                      child: DontIndicator(isActive: index == pageindex),
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    height: 60,
                    width: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.ease);
                      },
                      style:
                          ElevatedButton.styleFrom(shape: const CircleBorder()),
                      child: SizedBox(
                        height: 40,
                        width: 40,
                        child: SvgPicture.asset(
                          'assets/images/right-arrow-svgrepo-com.svg',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class OnboardContent extends StatelessWidget {
  const OnboardContent({
    Key? key,
    required this.description,
    required this.image,
    required this.title,
  }) : super(key: key);

  final String image, title, description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Image.asset(
          image,
          height: 250,
        ),
        const Spacer(),
        Text(
          title,
          // ignore: deprecated_member_use
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              // ignore: deprecated_member_use
              .headline5
              ?.copyWith(fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          description,
          textAlign: TextAlign.center,
        ),
        const Spacer()
      ],
    );
  }
}
