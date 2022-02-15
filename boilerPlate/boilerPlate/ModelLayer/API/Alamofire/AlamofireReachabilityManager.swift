//
//  AlamofireReachabilityManager.swift
//  boilerPlate
//
//  Created by John Edwin Guerrero Ayala on 14/02/22.
//

import Foundation
import Alamofire

/// Manager in charge of connection availability handling
class AlamofireReachabilityManager {

    var reachabilityManager: NetworkReachabilityManager!
    var onReachableClosure: (() -> Void)?
    var onNotReachableClosure: (() -> Void)?

    /// Manager initializer
    init() {
        reachabilityManager = NetworkReachabilityManager(host: "www.google.com")
        startNetworkMonitoring()
    }

    /// Tasks to be perform upon networking monitoring started
    func startNetworkMonitoring() {
        reachabilityManager?.startListening { [weak self] status in
            DispatchQueue.main.async {
                switch status {
                case .notReachable:
                    self?.onNotReachableClosure?()
                case .reachable(.cellular), .reachable(.ethernetOrWiFi):
                    self?.onReachableClosure?()
                case .unknown:
                    print("Unknown network state")
                }
            }
        }
    }

    /// Set handlers for the connection states
    /// - Parameters:
    ///   - onReachableClosure: What to do if internet connection is available
    ///   - onNotReachableClosure: What to do if there is no connection available
    func setStatusListeners(
        onReachableClosure: (() -> Void)?,
        onNotReachableClosure: (() -> Void)?
    ) {
        self.onReachableClosure = onReachableClosure
        self.onNotReachableClosure = onNotReachableClosure
    }

    /// On deinit stop listening to reachability manager
    deinit {
        reachabilityManager.stopListening()
    }
}
