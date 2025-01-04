import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:habitus/router/route_constants.dart';
import 'package:habitus/ui/core/themes/constants/padding_constants.dart';
import 'package:habitus/ui/onboard/cubit/onboard_cubit.dart';
import 'package:habitus/utils/managers/asset_manager.dart';

class _OnboardingScreenModel {
  _OnboardingScreenModel({
    required this.title,
    required this.description,
    required this.imageAsset,
    this.bgColor = Colors.blue,
  });
  final String title;
  final String description;
  final String imageAsset;
  final Color bgColor;
  final Color textColor = Colors.white;
}

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<OnboardCubit>();
    final assetManager = AssetsManager.instance;
    return Scaffold(
      body: _OnboardingPagePresenter(
        onSkip: () async {
          await cubit.setOnboarded();

          // ignore: use_build_context_synchronously
          context.go(RouteConstants.home);
        },
        onFinish: () async {
          await cubit.setOnboarded();
          // ignore: use_build_context_synchronously
          context.go(RouteConstants.home);
        },
        pages: [
          _OnboardingScreenModel(
            title: 'Create Custom Routines',
            description:
                '''Easily create and customize your own routines to fit your lifestyle.''',
            imageAsset: assetManager.createRoutineImage,
            bgColor: Colors.indigo,
          ),
          _OnboardingScreenModel(
            title: 'Edit Existing Routines',
            description:
                '''Modify your routines anytime to keep them up-to-date with your goals.''',
            imageAsset: assetManager.editRoutineImage,
            bgColor: const Color(0xff1eb090),
          ),
          _OnboardingScreenModel(
            title: 'Track Your Progress',
            description:
                '''Monitor your progress with detailed graphs and analytics.''',
            imageAsset: assetManager.trackProgressImage,
            bgColor: const Color(0xfffeae4f),
          ),
        ],
      ),
    );
  }
}

class _OnboardingPagePresenter extends StatefulWidget {
  const _OnboardingPagePresenter({
    required this.pages,
    this.onSkip,
    this.onFinish,
  });
  final List<_OnboardingScreenModel> pages;
  final VoidCallback? onSkip;
  final VoidCallback? onFinish;

  @override
  State<_OnboardingPagePresenter> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<_OnboardingPagePresenter> {
  // Store the currently visible page
  int _currentPage = 0;
  // Define a controller for the pageview
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        color: widget.pages[_currentPage].bgColor,
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                // Pageview to render each page
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: widget.pages.length,
                  onPageChanged: (idx) {
                    // Change current page when pageview changes
                    setState(() {
                      _currentPage = idx;
                    });
                  },
                  itemBuilder: (context, idx) {
                    final item = widget.pages[idx];
                    return Column(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Padding(
                            padding: PaddingConstants.custom(
                              all: 32,
                            ),
                            child: Image.asset(
                              item.imageAsset,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Padding(
                                padding: PaddingConstants.screenEdge,
                                child: Text(
                                  item.title,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge
                                      ?.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: item.textColor,
                                      ),
                                ),
                              ),
                              Container(
                                constraints:
                                    const BoxConstraints(maxWidth: 280),
                                padding: PaddingConstants.custom(
                                  horizontal: PaddingConstants.lg,
                                  vertical: PaddingConstants.sm,
                                ),
                                child: Text(
                                  item.description,
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                        color: item.textColor,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),

              // Current page indicator
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: widget.pages
                    .map(
                      (item) => AnimatedContainer(
                        duration: const Duration(milliseconds: 250),
                        width:
                            _currentPage == widget.pages.indexOf(item) ? 30 : 8,
                        height: 8,
                        margin: PaddingConstants.custom(
                          horizontal: PaddingConstants.xs,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    )
                    .toList(),
              ),

              // Bottom buttons
              SizedBox(
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      style: TextButton.styleFrom(
                        visualDensity: VisualDensity.comfortable,
                        foregroundColor: Colors.white,
                        textStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () {
                        widget.onSkip?.call();
                      },
                      child: const Text('Skip'),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        visualDensity: VisualDensity.comfortable,
                        foregroundColor: Colors.white,
                        textStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () {
                        if (_currentPage == widget.pages.length - 1) {
                          widget.onFinish?.call();
                        } else {
                          _pageController.animateToPage(
                            _currentPage + 1,
                            curve: Curves.easeInOutCubic,
                            duration: const Duration(milliseconds: 250),
                          );
                        }
                      },
                      child: Row(
                        children: [
                          Text(
                            _currentPage == widget.pages.length - 1
                                ? 'Finish'
                                : 'Next',
                          ),
                          const SizedBox(width: 8),
                          Icon(
                            _currentPage == widget.pages.length - 1
                                ? Icons.done
                                : Icons.arrow_forward,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
