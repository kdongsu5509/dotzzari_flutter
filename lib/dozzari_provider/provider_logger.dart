import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProviderLogger extends ProviderObserver {
  @override
  void didUpdateProvider(
    ProviderBase provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    print("""
    
    [PROVIDER IS UPDATED] Provider: ${provider.name ?? provider.runtimeType} || Previous Value: $previousValue || New Value: $newValue
    """);
  }

  @override
  void didAddProvider(
    ProviderBase provider,
    Object? value,
    ProviderContainer container,
  ) {
    debugPrint('''
    {
      "provider:" "${provider.name ?? provider.runtimeType}",
      "value": "$value"
    }
    ''');
  }
}
