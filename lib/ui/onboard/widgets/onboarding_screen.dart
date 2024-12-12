import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:habitus/router/route_constants.dart';
import 'package:habitus/ui/onboard/models/onboarding_screen_model.dart';
import 'package:habitus/utils/managers/asset_manager.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final assetManager = AssetsManager.instance;
    return Scaffold(
      body: _OnboardingPagePresenter(
        onSkip: () {
          context.push(RouteConstants.signIn);
        },
        onFinish: () {
          context.push(RouteConstants.signIn);
        },
        pages: [
          OnboardingScreenModel(
            title: 'Create Custom Routines',
            description:
                '''Easily create and customize your own routines to fit your lifestyle.''',
            imageAsset: assetManager.createRoutineImage,
            bgColor: Colors.indigo,
          ),
          OnboardingScreenModel(
            title: 'Edit Existing Routines',
            description:
                '''Modify your routines anytime to keep them up-to-date with your goals.''',
            imageAsset: assetManager.editRoutineImage,
            bgColor: const Color(0xff1eb090),
          ),
          OnboardingScreenModel(
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
  final List<OnboardingScreenModel> pages;
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
                            padding: const EdgeInsets.all(32),
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
                                padding: const EdgeInsets.all(16),
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
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 24,
                                  vertical: 8,
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
                        margin: const EdgeInsets.all(2),
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
