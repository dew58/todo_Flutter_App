import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:todo/presentation/screens/loginUI.dart';
import 'package:todo/presentation/screens/home/mainHome.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFF121212),
      appBar: AppBar(
        backgroundColor: const Color(0XFF121212),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.white,
        ),
      ),
      // body: BlocBuilder<AuthBloc, AuthState>(
      //   builder: (context, state) {
      //     if (AuthState is AuthFaild) {
      //       //faild try again
      //       return Container();
      //     }
      //     if (AuthState is AuthLoading) {
      //       return const Center(child: CircularProgressIndicator());
      //     }
      //     if (AuthState is AuthLoggedIn) {
      //       Navigator.push(
      //         context,
      //         MaterialPageRoute(builder: (context) => const HomePage()),
      //       );
      //     }
      //     return Container(
      //       padding: const EdgeInsets.only(left: 20),
      //       child: Column(
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         children:[
      //           Container(
      //             child: const Text(
      //               "Register",
      //               style: TextStyle(color: Colors.white, fontSize: 40),
      //             ),
      //           ),
      //           SizedBox(
      //             height: MediaQuery.sizeOf(context).height * 0.06,
      //           ),
      //           const Text("Username", style: TextStyle(color: Colors.white)),
      //           TextField(
      //             controller: _emailController,
      //           ),
      //           SizedBox(
      //             height: MediaQuery.sizeOf(context).height * 0.02,
      //           ),
      //           const Text('Password', style: TextStyle(color: Colors.white)),
      //           TextField(
      //             controller: _passwordController,
      //           ),
      //           SizedBox(
      //             height: MediaQuery.sizeOf(context).height * 0.02,
      //           ),
      //           const Text('Confirm Password',
      //               style: TextStyle(color: Colors.white)),
      //           TextField(
      //             controller: _passwordController,
      //           ),
      //           SizedBox(
      //             height: MediaQuery.sizeOf(context).height * 0.05,
      //           ),
      //           Center(
      //             child: InkWell(
      //                 onTap: () {
      //                   context.read<AuthBloc>().add(
      //                         AuthRegisting(
      //                           _emailController.text,
      //                           _passwordController.text,
      //                         )
      //                       );
      //                 },
      //                 child: Container(
      //                   width: MediaQuery.sizeOf(context).width * 0.8,
      //                   height: MediaQuery.sizeOf(context).height * 0.07,
      //                   decoration: const BoxDecoration(
      //                     color: Color(0xff8687E7),
      //                     borderRadius: BorderRadius.all(
      //                       Radius.circular(4),
      //                     ),
      //                   ),
      //                   child: const Center(
      //                     child: Text(
      //                       "Register",
      //                       style: TextStyle(color: Colors.white),
      //                     ),
      //                   ),
      //                 )),
      //           ),
      //           SizedBox(
      //             height: MediaQuery.sizeOf(context).height * 0.02,
      //           ),
      //           Center(
      //             child: Container(
      //               child: const Row(
      //                 children: [
      //                   Expanded(
      //                     child: Divider(
      //                       color: Colors.white,
      //                       thickness: 1,
      //                       endIndent: 10,
      //                       indent: 40,
      //                     ),
      //                   ),
      //                   Text("or", style: TextStyle(color: Colors.white)),
      //                   Expanded(
      //                     child: Divider(
      //                       color: Colors.white,
      //                       thickness: 1,
      //                       endIndent: 40,
      //                       indent: 10,
      //                     ),
      //                   )
      //                 ],
      //               ),
      //             ),
      //           ),
      //           SizedBox(
      //             height: MediaQuery.sizeOf(context).height * 0.02,
      //           ),
      //           Center(
      //             child: InkWell(
      //               onTap: () {
      //                 context.read<AuthBloc>().add(
      //                       GoogleSignInRequested(),
      //                     );
      //               },
      //               child: Container(
      //                 width: MediaQuery.sizeOf(context).width * 0.8,
      //                 height: MediaQuery.sizeOf(context).height * 0.07,
      //                 decoration: BoxDecoration(
      //                   border: Border.all(
      //                     color: const Color(0xff8875FF),
      //                   ),
      //                   borderRadius: const BorderRadius.all(
      //                     Radius.circular(4),
      //                   ),
      //                 ),
      //                 child: Center(
      //                   child: Row(
      //                     mainAxisAlignment: MainAxisAlignment.center,
      //                     children: [
      //                       Image.asset("assets//auth/google(1).png"),
      //                       const SizedBox(
      //                         width: 15,
      //                       ),
      //                       const Text(
      //                         "Register with Google",
      //                         style: TextStyle(color: Colors.white),
      //                       )
      //                     ],
      //                   ),
      //                 ),
      //               ),
      //             ),
      //           ),
      //           SizedBox(
      //             height: MediaQuery.sizeOf(context).height * 0.07,
      //           ),
      //           Center(
      //             child: SizedBox(
      //               width: MediaQuery.sizeOf(context).width * 0.8,
      //               height: MediaQuery.sizeOf(context).height * 0.07,
      //               child: Center(
      //                 child: Row(
      //                   children: [
      //                     const Text(
      //                       "Already have an account?",
      //                       style: TextStyle(color: Colors.grey),
      //                     ),
      //                     InkWell(
      //                       onTap: () {
      //                         Navigator.push(
      //                           context,
      //                           MaterialPageRoute(
      //                               builder: (context) => const Loginui()),
      //                         );
      //                       },
      //                       child: const InkWell(
      //                         child: Text(
      //                           "Login",
      //                           style: TextStyle(color: Colors.white),
      //                         ),
      //                       ),
      //                     )
      //                   ],
      //                 ),
      //               ),
      //             ),
      //           )
      //         ],
      //       ),
      //     );
      //   },
      // ),
    );
  }
}
