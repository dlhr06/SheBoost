import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/auth/supabase_auth/auth_util.dart';

dynamic updateChatHistory(
  dynamic chatHistory,
  dynamic newChat,
) {
  if (chatHistory is List) {
    chatHistory.add(newChat);
    return chatHistory;
  } else {
    return [newChat];
  }
}

dynamic convertPromptToJSON(
  String prompt,
  String? fileUri,
) {
  dynamic promptObj = {
    "role": "user",
    "parts": [
      {"text": prompt}
    ]
  };

  if (fileUri != null && fileUri.isNotEmpty && fileUri.trim().isNotEmpty) {
    promptObj["parts"] = [
      {"text": prompt},
      {
        "file_data": {"file_uri": fileUri, "mime_type": "application/pdf"}
      }
    ];
  }

  return promptObj;
  // return json.decode('{"role": "user", "parts":[{"text": "$prompt"}]}');
}

dynamic convertResponseToJSON(String response) {
  //return ({"role": "system", "content": response});
  return ({
    "role": "model",
    "parts": [
      {"text": response}
    ]
  });
}

dynamic updateContext(
  dynamic chatHistory,
  dynamic newChat,
) {
  if (chatHistory is List) {
    chatHistory.add(newChat);
    return chatHistory;
  } else {
    return [newChat];
  }
}

dynamic chatContext(dynamic history) {
  dynamic body = {
    "system_instruction": {
      "parts": {
        "text": '''
        You are a assistant that helps users to improve their profesional profile, 
        you provide advice, tips and suggestions in topics about Career, Resume, Interview jobs.
        The conversation is only restricted to profesional profile avoid to talk about other topics,
        inform the user that you are not able to change the conversation topic. 
        When a file is provided, check if is a resume or a CV, if is not please respond ONLY with the following message: "unable to enhance" 
        for example: 
        - user : path/to/uri/file_not_resume 
        - model: unable to enhance
        Otherwise improve the resume and give feedback, tips and advice. Take into consideration 
        the context of the chat when improving in the case that exists a context. 
        Your responses should be friendly, like talking to a friend. Do not make up information and be precise.
      '''
      }
    },
    "contents": []
  };

  if (history is List) {
    body["contents"] = history;
  } else {
    body["contents"] = [history];
  }
  return body;
}
