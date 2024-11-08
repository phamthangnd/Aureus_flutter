part of AureusTestingApp;

class ExplorationView extends StatefulWidget {
  @override
  _ExplorationViewState createState() => _ExplorationViewState();
}

class _ExplorationViewState extends State<ExplorationView> {
  List<ControllerTabObject> tabItems = [
    ControllerTabObject(
        tabController: AureusComponentsView(),
        tabTitle: "UI",
        accessibilityHint: "Shows you all of the UI Components in Aureus.",
        tabIcon: Assets.add),
    ControllerTabObject(
        tabController: ToolDetailView(
          parentTool: testingTool,
          onUseTool: () {},
        ),
        tabTitle: "Tools",
        accessibilityHint: "Shows you the tools",
        tabIcon: Assets.settings),
    ControllerTabObject(
        tabController: AureusDataDetailView(),
        tabTitle: "Data",
        accessibilityHint: "Shows you the tools.",
        tabIcon: Assets.pencil),
    /*
    ControllerTabObject(
        tabController: AureusSafetyView(),
        tabTitle: "Safety",
        accessibilityHint: "Shows you the safety features within Aurues",
        tabIcon: Assets.person),*/
    ControllerTabObject(
        tabController: AureusInteractionsView(),
        tabTitle: "Interact",
        accessibilityHint:
            "Lets you try the interactibility aspects of Aureus.",
        tabIcon: Assets.brain),
  ];

  @override
  Widget build(BuildContext context) {
    return VerticalSideNavBarComponent(
      shouldManageNotifications: true,
      tabItems: tabItems,
      altColor: palette.brightness() == Brightness.light
          ? palette.white()
          : palette.black(),
    );
  }
}
