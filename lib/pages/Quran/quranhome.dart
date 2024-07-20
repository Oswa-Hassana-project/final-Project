import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../model/quran_repository.dart';
import '../../shared/cubit/quran_cubit.dart';
import 'quranPage.dart'; // Assuming this is where Quransurahs is defined

class QuranPage1 extends StatelessWidget {
  const QuranPage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuranCubit(QuranRepository()),
      child: Quransurahs(),
    );
  }
}

// class LogoLoadingPage extends StatefulWidget {
//   @override
//   _LogoLoadingPageState createState() => _LogoLoadingPageState();
// }
//
// class _LogoLoadingPageState extends State<LogoLoadingPage>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _animation;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       duration: const Duration(seconds: 2),
//       vsync: this,
//     );
//
//     _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
//
//     _controller.addStatusListener((status) {
//       if (status == AnimationStatus.completed) {
//         // Navigate to Quransurahs page
//         Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Quransurahs()));
//       }
//     });
//
//     // Start animation
//     _controller.forward();
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blue,
//       body: Center(
//         child: FadeTransition(
//           opacity: _animation,
//           child: Image.asset(
//             'assets/logo/اسوه حسنه1.png', // Replace with your logo path
//             width: 100,
//             height: 100,
//           ),
//         ),
//       ),
//     );
//   }
// }