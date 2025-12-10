import 'package:flutter/foundation.dart';

class AgentProvider extends ChangeNotifier {
  bool _isAgentActive = true;

  bool get isAgentActive => _isAgentActive;

  void toggleAgent() {
    _isAgentActive = !_isAgentActive;
    notifyListeners();
  }

  void stopAgent() {
    _isAgentActive = false;
    notifyListeners();
  }

  void startAgent() {
    _isAgentActive = true;
    notifyListeners();
  }
}

