import 'package:flutter/material.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

/// A builder function that returns a list of widgets to be displayed in a page.

/*
 * ╔══════════════════════════════════════╗
 * ║                                      ║
 * ║          // Example usage:           ║
 * ║                                      ║
 * ╚══════════════════════════════════════╝
 */

// void showSinglePageModal(BuildContext context) {
//   WoltModalManager.showSinglePage(
//     context: context,
//     page: WoltModalPage(
//       title: 'Profile Details',
//       contentBuilder: (context) => [
//         const ListTile(
//           leading: CircleAvatar(child: Icon(Icons.person)),
//           title: Text('John Doe'),
//           subtitle: Text('john.doe@example.com'),
//         ),
//         const Padding(
//           padding: EdgeInsets.all(16),
//           child: Text('Account details and other information...'),
//         ),
//       ],
//       actions: ElevatedButton(
//         onPressed: () => Navigator.pop(context),
//         child: const Text('Close'),
//       ),
//     ),
//   );
// }

// void showMultiPageModal(BuildContext context) {
//   WoltModalManager.showMultiPage(
//     context: context,
//     pages: [
//       WoltModalPage(
//         title: 'Step 1: Personal Info',
//         heroImage: Image.network(
//           'https://example.com/header.jpg',
//           fit: BoxFit.cover,
//         ),
//         contentBuilder: (context) => [
//           const TextField(
//             decoration: InputDecoration(labelText: 'Full Name'),
//           ),
//           const SizedBox(height: 16),
//           const TextField(
//             decoration: InputDecoration(labelText: 'Email'),
//           ),
//         ],
//         actions: Row(
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: [
//             ElevatedButton(
//               onPressed: () {},
//               child: const Text('Next'),
//             ),
//           ],
//         ),
//       ),
//       WoltModalPage(
//         title: 'Step 2: Preferences',
//         contentBuilder: (context) => [
//           CheckboxListTile(
//             title: const Text('Enable notifications'),
//             value: true,
//             onChanged: (_) {},
//           ),
//           CheckboxListTile(
//             title: const Text('Dark mode'),
//             value: false,
//             onChanged: (_) {},
//           ),
//         ],
//         actions: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             TextButton(
//               onPressed: () {},
//               child: const Text('Back'),
//             ),
//             ElevatedButton(
//               onPressed: () {},
//               child: const Text('Finish'),
//             ),
//           ],
//         ),
//       ),
//     ],
//   );
// }

typedef WoltPageContentBuilder = List<Widget> Function(BuildContext context);

class WoltModalConfig {
  static const double pageBreakpoint = 768;
  static const double defaultMinHeight = 0.4;
  static const double defaultMaxHeight = 0.9;
  static const EdgeInsets contentPadding = EdgeInsets.all(16);
}

class WoltModalPage {
  const WoltModalPage({
    required this.contentBuilder,
    this.title,
    this.actions,
    this.heroImage,
  });
  final String? title;
  final WoltPageContentBuilder contentBuilder;
  final Widget? actions;
  final Widget? heroImage;
}

class WoltModalManager {
  static Future<T?> showSinglePage<T>({
    required BuildContext context,
    required WoltModalPage page,
    double minPageHeight = WoltModalConfig.defaultMinHeight,
    double maxPageHeight = WoltModalConfig.defaultMaxHeight,
    bool useRootNavigator = true,
  }) {
    return WoltModalSheet.show<T>(
      context: context,
      pageListBuilder: (modalContext) => [
        _buildPage(
          modalContext: modalContext,
          page: page,
          isLastPage: true,
        ),
      ],
      modalTypeBuilder: _buildModalType,
      useRootNavigator: useRootNavigator,
    );
  }

  static Future<T?> showMultiPage<T>({
    required BuildContext context,
    required List<WoltModalPage> pages,
    double minPageHeight = WoltModalConfig.defaultMinHeight,
    double maxPageHeight = WoltModalConfig.defaultMaxHeight,
    bool useRootNavigator = true,
    ValueNotifier<int>? pageIndexNotifier,
  }) {
    final controller = pageIndexNotifier ?? ValueNotifier(0);

    return WoltModalSheet.show<T>(
      context: context,
      pageListBuilder: (modalContext) => pages.asMap().entries.map(
        (entry) {
          final index = entry.key;
          final page = entry.value;
          final isLastPage = index == pages.length - 1;

          return _buildPage(
            modalContext: modalContext,
            page: page,
            index: index,
            totalPages: pages.length,
            isLastPage: isLastPage,
          );
        },
      ).toList(),
      modalTypeBuilder: _buildModalType,
      useRootNavigator: useRootNavigator,
      pageIndexNotifier: controller,
    );
  }

  static SliverWoltModalSheetPage _buildPage({
    required BuildContext modalContext,
    required WoltModalPage page,
    int index = 0,
    int totalPages = 1,
    bool isLastPage = false,
  }) {
    return SliverWoltModalSheetPage(
      topBarTitle: page.title != null ? Text(page.title!) : null,
      isTopBarLayerAlwaysVisible: true,
      heroImage: page.heroImage,
      leadingNavBarWidget: index > 0
          ? IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => WoltModalSheet.of(modalContext).showPrevious(),
            )
          : null,
      trailingNavBarWidget: IconButton(
        icon: const Icon(Icons.close),
        onPressed: () => Navigator.of(modalContext).pop(),
      ),
      mainContentSliversBuilder: (context) => [
        SliverPadding(
          padding: WoltModalConfig.contentPadding,
          sliver: SliverList(
            delegate: SliverChildListDelegate(
              page.contentBuilder(context),
            ),
          ),
        ),
      ],
      stickyActionBar: page.actions != null
          ? Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (index > 0)
                    TextButton(
                      onPressed: () =>
                          WoltModalSheet.of(modalContext).showPrevious(),
                      child: const Text('Back'),
                    ),
                  if (!isLastPage)
                    ElevatedButton(
                      onPressed: () =>
                          WoltModalSheet.of(modalContext).showNext(),
                      child: const Text('Next'),
                    ),
                ],
              ),
            )
          : null,
    );
  }

  static WoltModalType _buildModalType(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    return size < WoltModalConfig.pageBreakpoint
        ? WoltModalType.bottomSheet()
        : WoltModalType.dialog();
  }
}
