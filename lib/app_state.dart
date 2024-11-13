import 'package:flutter/material.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      if (prefs.containsKey('ff_currentChat')) {
        try {
          _currentChat = jsonDecode(prefs.getString('ff_currentChat') ?? '');
        } catch (e) {
          print("Can't decode persisted json. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _conversations = prefs.getStringList('ff_conversations')?.map((x) {
            try {
              return jsonDecode(x);
            } catch (e) {
              print("Can't decode persisted json. Error: $e.");
              return {};
            }
          }).toList() ??
          _conversations;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  dynamic _currentChat;
  dynamic get currentChat => _currentChat;
  set currentChat(dynamic value) {
    _currentChat = value;
    prefs.setString('ff_currentChat', jsonEncode(value));
  }

  List<dynamic> _conversations = [];
  List<dynamic> get conversations => _conversations;
  set conversations(List<dynamic> value) {
    _conversations = value;
    prefs.setStringList(
        'ff_conversations', value.map((x) => jsonEncode(x)).toList());
  }

  void addToConversations(dynamic value) {
    conversations.add(value);
    prefs.setStringList(
        'ff_conversations', _conversations.map((x) => jsonEncode(x)).toList());
  }

  void removeFromConversations(dynamic value) {
    conversations.remove(value);
    prefs.setStringList(
        'ff_conversations', _conversations.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromConversations(int index) {
    conversations.removeAt(index);
    prefs.setStringList(
        'ff_conversations', _conversations.map((x) => jsonEncode(x)).toList());
  }

  void updateConversationsAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    conversations[index] = updateFn(_conversations[index]);
    prefs.setStringList(
        'ff_conversations', _conversations.map((x) => jsonEncode(x)).toList());
  }

  void insertAtIndexInConversations(int index, dynamic value) {
    conversations.insert(index, value);
    prefs.setStringList(
        'ff_conversations', _conversations.map((x) => jsonEncode(x)).toList());
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
