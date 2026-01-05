import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';

/// A service class that manages network connectivity status
///
/// This class provides a simple interface to monitor internet connectivity
/// and exposes only two essential methods: init() and isInternetAvailable
class ConnectivityService {
  static final ConnectivityService _instance =
      ConnectivityService._internal();

  factory ConnectivityService() => _instance;

  ConnectivityService._internal();

  final Connectivity _connectivity = Connectivity();

  /// Stream controller for connectivity status
  late StreamController<bool> _connectivityController;

  /// Current connectivity status
  bool _isConnected = false;

  /// Subscription to connectivity changes
  StreamSubscription<List<ConnectivityResult>>? _connectivitySubscription;

  /// Whether the service has been initialized
  bool _isInitialized = false;

  /// Initialize the network connectivity service
  ///
  /// This method sets up the connectivity monitoring and should be called
  /// once during app initialization
  Future<void> init() async {
    if (_isInitialized) {
      debugPrint('ConnectivityService is already initialized');
      return;
    }

    _connectivityController = StreamController<bool>.broadcast();

    try {
      // Check initial connectivity status
      await _checkInitialConnectivity();

      // Listen to connectivity changes
      _connectivitySubscription = _connectivity.onConnectivityChanged.listen(
        _onConnectivityChanged,
        onError: (error) {
          debugPrint('Connectivity listener error: $error');
        },
      );

      _isInitialized = true;
      debugPrint('ConnectivityService initialized successfully');
    } catch (e) {
      debugPrint('Failed to initialize ConnectivityService: $e');
      rethrow;
    }
  }

  /// Get current internet availability status
  ///
  /// Returns true if internet is available, false otherwise
  bool get isInternetAvailable => _isConnected;

  /// Stream of connectivity status changes
  ///
  /// Emits true when internet becomes available, false when it becomes unavailable
  Stream<bool> get connectivityStream => _connectivityController.stream;

  /// Check initial connectivity status
  Future<void> _checkInitialConnectivity() async {
    try {
      final connectivityResults = await _connectivity.checkConnectivity();
      await _onConnectivityChanged(connectivityResults);
    } catch (e) {
      debugPrint('Error checking initial connectivity: $e');
      _updateConnectivityStatus(false);
    }
  }

  /// Handle connectivity changes
  Future<void> _onConnectivityChanged(List<ConnectivityResult> results) async {
    // Check if any of the results indicate a valid connection
    final hasConnection = results.any(
      (result) => result != ConnectivityResult.none,
    );

    if (hasConnection) {
      // Verify actual internet connectivity with a ping test
      final hasInternet = await _verifyInternetAccess();
      _updateConnectivityStatus(hasInternet);
    } else {
      _updateConnectivityStatus(false);
    }
  }

  /// Verify actual internet access by attempting to reach a reliable host
  Future<bool> _verifyInternetAccess() async {
    try {
      // Use Google's DNS as it's highly reliable and fast
      final result = await InternetAddress.lookup(
        'google.com',
      ).timeout(const Duration(seconds: 5));

      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } catch (e) {
      debugPrint('Internet verification failed: $e');
      return false;
    }
  }

  /// Update connectivity status and notify listeners
  void _updateConnectivityStatus(bool isConnected) {
    if (_isConnected != isConnected) {
      _isConnected = isConnected;

      if (!_connectivityController.isClosed) {
        _connectivityController.add(_isConnected);
      }

      debugPrint(
        'Network connectivity status changed: ${_isConnected ? "Connected" : "Disconnected"}',
      );
    }
  }

  /// Dispose of resources
  ///
  /// This method should be called when the service is no longer needed
  /// (typically during app disposal)
  Future<void> dispose() async {
    await _connectivitySubscription?.cancel();
    _connectivitySubscription = null;

    if (!_connectivityController.isClosed) {
      await _connectivityController.close();
    }

    _isInitialized = false;
    debugPrint('ConnectivityService disposed');
  }

  /// Force refresh connectivity status
  ///
  /// Manually triggers a connectivity check
  Future<void> refreshConnectivityStatus() async {
    if (!_isInitialized) {
      debugPrint('ConnectivityService not initialized');
      return;
    }

    try {
      final connectivityResults = await _connectivity.checkConnectivity();
      await _onConnectivityChanged(connectivityResults);
    } catch (e) {
      debugPrint('Error refreshing connectivity status: $e');
    }
  }
}

// Export the singleton instance and essential methods
final ConnectivityService _networkService = ConnectivityService();

/// Initialize the network connectivity service
///
/// Call this method once during app initialization
Future<void> init() => _networkService.init();

/// Check if internet is currently available
///
/// Returns true if internet is available, false otherwise
bool get isInternetAvailable => _networkService.isInternetAvailable;

/// Stream of connectivity status changes (optional for advanced usage)
Stream<bool> get connectivityStream => _networkService.connectivityStream;

/// Refresh connectivity status manually (optional for advanced usage)
Future<void> refreshConnectivityStatus() =>
    _networkService.refreshConnectivityStatus();