class TabControlService {
  static final TabControlService _tabControlServices =
      TabControlService._internal();

  factory TabControlService() {
    return _tabControlServices;
  }

  TabControlService._internal();

  int _currentTab = 0;

  int get currentTab => _currentTab;

  void changeTab(int value) {
    if (value != _currentTab) _currentTab = value;
  }
}
