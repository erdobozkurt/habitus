import 'package:flutter/material.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

class ModalPageData {
  ModalPageData({
    required this.title,
    required this.contentBuilder,
    this.bottomWidget,
    this.heroImage,
    this.leading,
  });
  final String title;
  final List<Widget> Function(BuildContext) contentBuilder;
  final Widget? bottomWidget;
  final Widget? heroImage;
  final Widget? leading;
}

class ModalLayout {
  static const double _pageBreakpoint = 768;

  static SliverWoltModalSheetPage buildPage({
    required ModalPageData pageData,
    required BuildContext context,
    Widget? trailing,
    bool isTopBarLayerAlwaysVisible = true,
    EdgeInsets contentPadding = const EdgeInsets.all(16),
  }) {
    return SliverWoltModalSheetPage(
      useSafeArea: true,
      heroImage: pageData.heroImage,
      topBarTitle: Text(pageData.title),
      isTopBarLayerAlwaysVisible: isTopBarLayerAlwaysVisible,
      leadingNavBarWidget: pageData.leading,
      trailingNavBarWidget: trailing ?? const CloseButton(),
      mainContentSliversBuilder: (context) => [
        SliverPadding(
          padding: contentPadding,
          sliver: SliverList(
            delegate: SliverChildListDelegate(pageData.contentBuilder(context)),
          ),
        ),
        if (pageData.bottomWidget != null)
          SliverToBoxAdapter(
            child: pageData.bottomWidget,
          ),
      ],
    );
  }

  static WoltModalType _buildModalType(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    return size < _pageBreakpoint
        ? WoltModalType.bottomSheet()
        : WoltModalType.dialog();
  }

  // Helper methods for showing modals
  static Future<T?> show<T>({
    required BuildContext context,
    required ModalPageData pageData,
    bool useRootNavigator = true,
  }) {
    return WoltModalSheet.show<T>(
      context: context,
      pageListBuilder: (modalContext) => [
        buildPage(
          pageData: pageData,
          context: modalContext,
        ),
      ],
      modalTypeBuilder: _buildModalType,
      useRootNavigator: useRootNavigator,
    );
  }

  static Future<T?> showMultiPage<T>({
    required BuildContext context,
    required List<ModalPageData> pages,
    bool useRootNavigator = true,
    ValueNotifier<int>? pageIndexNotifier,
  }) {
    return WoltModalSheet.show<T>(
      context: context,
      pageListBuilder: (modalContext) => pages
          .map(
            (page) => buildPage(
              pageData: page,
              context: modalContext,
            ),
          )
          .toList(),
      modalTypeBuilder: _buildModalType,
      useRootNavigator: useRootNavigator,
      pageIndexNotifier: pageIndexNotifier,
    );
  }
}
