import 'dart:typed_data';

import 'package:flutter/material.dart';

class ImageCacher {
  final int maxSize;
  final Map<String, Uint8List> _cache = {};
  int _currentSize = 0;

  ImageCacher({this.maxSize = 100 * 1024 * 1024}); // Default max size: 100 MB

  void put(String key, Uint8List imageData) {
    if (imageData.length > maxSize) {
      debugPrint('Image too large to cache');
      return;
    }

    // Remove old entries if needed
    while (_currentSize + imageData.length > maxSize && _cache.isNotEmpty) {
      String oldestKey = _cache.keys.first;
      _currentSize -= _cache[oldestKey]!.length;
      _cache.remove(oldestKey);
    }

    _cache[key] = imageData;
    _currentSize += imageData.length;
  }

  Uint8List? get(String key) {
    final imageData = _cache[key];
    if (imageData != null) {
      // Move accessed item to the end to keep track of LRU
      _cache.remove(key);
      _cache[key] = imageData;
    }
    return imageData;
  }

  void clear() {
    _cache.clear();
    _currentSize = 0;
  }

  bool contains(String key) {
    return _cache.containsKey(key);
  }

  int get size => _currentSize;

  int get count => _cache.length;
}
