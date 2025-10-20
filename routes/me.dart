import 'dart:async';
import 'dart:io';

import 'package:dart_frog/dart_frog.dart';

import '../models/config.dart';
import '../repo/fact.dart';

Future<Response> onRequest(RequestContext context) async {
  final config = AppConfig.instance;

  // Handle only GET requests
  if (context.request.method != HttpMethod.get) {
    return Response.json(
      statusCode: 405,
      body: {'status': 'error', 'message': 'Method not allowed'},
    );
  }

  final result = await context.read<FactRepository>().fetchCatFact();

  final catFact = result.fact;

  dynamic body;

  if (catFact != null) {
    body = {
      'status': 'success',
      'user': {
        'email': config.email,
        'name': config.name,
        'stack': config.stack,
      },
      'timestamp': DateTime.now().toUtc().toIso8601String(),
      'fact': catFact,
    };
  } else {
    body = {
      'status': 'error',
      'message': result.message,
    };
  }

  return Response.json(
    body: body,
    statusCode: catFact == null ? HttpStatus.badRequest : HttpStatus.ok,
    headers: {
      'Content-Type': 'application/json',
      'Access-Control-Allow-Origin': '*',
    },
  );
}
