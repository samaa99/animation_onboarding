import 'dart:async';

import 'package:animation_onboarding/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  
  int _contentIndex = 0;
  bool _isOut = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: context.height * 0.6,
              width: context.width,
              child: AnimatedScale(
                scale: _isOut ? 0 : 1,
                duration: const Duration(milliseconds: 300),
                child: Image.asset(onBoardingContentList[_contentIndex].image),
              ),
            ),

            Expanded(
              child: Stack(
                children: [
                  AnimatedPositioned(
                    left: _isOut ? context.width + 100 : context.width * 0.35,
                    duration: const Duration(milliseconds: 300),
                    child: Text(
                      onBoardingContentList[_contentIndex].title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.amber, fontSize: 22),
                    ),
                  )
                ],
              ),
            ),

            Expanded(
              child: Stack(
                children: [
                  AnimatedPositioned(
                    left: 20,
                    right: _isOut ? context.width + 20 : context.width * 0.01,
                    duration: const Duration(milliseconds: 300),
                    child: Text(
                      onBoardingContentList[_contentIndex].description,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AnimatedOpacity(
                    opacity: _contentIndex < 1 ? 0 : 1,
                    duration: const Duration(milliseconds: 200),
                    child: FloatingActionButton.extended(
                      onPressed: _contentIndex < 1 ? () {} : () {
                        setState(() {
                          _contentIndex-=1;
                        });
                      },
                      backgroundColor: Colors.amber,
                      label: const Text(
                        'Back',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  FloatingActionButton.extended(
                    backgroundColor: const Color(0xff385a65),
                    onPressed: _contentIndex > 1 ? () {} : () {
                      setState(() {
                        _contentIndex+=1;
                        _isOut = !_isOut;
                      });
                      Timer(const Duration(milliseconds: 300), () {
                        setState(() {
                          _isOut = !_isOut;
                        });
                      });

                    },
                    label: Text(
                      _contentIndex > 1 ? 'Register' : 'Next',
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }
}
