// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:flutter/material.dart';
// import 'package:svg_flutter/svg.dart';

// class OnBoards {
//   final String image, title, description;
//   OnBoards({
//     required this.description,
//     required this.image,
//     required this.title,
//   });
// }

// final List<OnBoards> demo = [
//   OnBoards(
//       title:
//           "Spice up your convos with emojis, gifs, and more! It's a chat party!",
//       description:
//           "Ping! Your friends are waiting. Stay tuned and keep chatting.",
//       image: 'assets/images/right-arrow-svgrepo-com.svg'),
//   OnBoards(
//       title: "Chat, connect, and cheer! Spread good vibes in every message.",
//       description: "Tap, type, talk! Let the chatting adventures begin. Ready?",
//       image: 'assets/images/right-arrow-svgrepo-com.svg'),
//   OnBoards(
//       title:
//           "Congratulations! You're now part of the EchoChat community. Happy chatting!",
//       description:
//           "Your secrets are safe with us. EchoChat - where privacy meets peace of mind.",
//       image: 'assets/images/right-arrow-svgrepo-com.svg'),
//   OnBoards(
//       title: "Greetings! Welcome to EchoChat, where your words find a home.",
//       description:
//           "High five! You're officially a ChatBuddy. Happy chatting, pal!",
//       image: 'assets/images/right-arrow-svgrepo-com.svg'),
// ];

// class MyOnBoard extends StatefulWidget {
//   const MyOnBoard({super.key});

//   @override
//   State<MyOnBoard> createState() => _MyOnBoardState();
// }

// class _MyOnBoardState extends State<MyOnBoard> {
//   late PageController pageController;

//   int pageindex = 0;

//   @override
//   void initState() {
//     pageController = PageController(initialPage: 0);
//     super.initState();
//   }

//   @override
//   void dispose() {
//     pageController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             children: [
//               Expanded(
//                 child: PageView.builder(
//                   controller: pageController,
//                   itemCount: demo.length,
//                   onPageChanged: (value) {
//                     setState(() {
//                       pageindex = value;
//                     });
//                   },
//                   itemBuilder: (context, index) => OnBoard(
//                       image: demo[index].image,
//                       description: demo[index].description,
//                       title: demo[index].title),
//                 ),
//               ),
//               Row(
//                 children: [
//                   ...List.generate(
//                     demo.length,
//                     (index) => Padding(
//                       padding: const EdgeInsets.only(right: 4),
//                       child: DontIndicator(isActive: index == pageindex),
//                     ),
//                   ),
//                   const Spacer(),
//                   SizedBox(
//                     height: 60,
//                     width: 60,
//                     child: ElevatedButton(
//                       onPressed: () {
//                         pageController.nextPage(
//                             duration: const Duration(milliseconds: 300),
//                             curve: Curves.ease);
//                       },
//                       style:
//                           ElevatedButton.styleFrom(shape: const CircleBorder()),
//                       child: SvgPicture.asset(
//                           'assets/images/right-arrow-svgrepo-com.svg'),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class DontIndicator extends StatelessWidget {
//   const DontIndicator({
//     this.isActive = false,
//     super.key,
//   });

//   final bool isActive;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: isActive ? 12 : 4,
//       width: 4,
//       decoration: const BoxDecoration(
//           color: Colors.red,
//           borderRadius: BorderRadius.all(Radius.circular(20))),
//     );
//   }
// }

// class OnBoard extends StatelessWidget {
//   final String image, title, description;
//   const OnBoard({
//     Key? key,
//     required this.description,
//     required this.image,
//     required this.title,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         const Spacer(),
//         Image.asset(
//           image,
//           height: 250,
//         ),
//         const Spacer(),
//         Text(
//           title,
//           style: Theme.of(context)
//               .textTheme
//               .headlineMedium
//               ?.copyWith(fontWeight: FontWeight.w500),
//           textAlign: TextAlign.center,
//         ),
//         const SizedBox(height: 16),
//         Text(
//           description,
//           textAlign: TextAlign.center,
//         ),
//         const Spacer(),
//       ],
//     );
//   }
// }
