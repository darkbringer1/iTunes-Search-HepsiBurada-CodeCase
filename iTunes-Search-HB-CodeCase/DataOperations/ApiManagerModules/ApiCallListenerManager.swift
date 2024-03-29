//
//  ApiCallListenerManager.swift
//  iTunes-Search-HB-CodeCase
//
//  Created by DarkBringer on 30.10.2021.
//

import Foundation
import DefaultNetworkOperationPackage

class ApiCallListenerManager: ApiCallListener {
    
    private let animationManager: LottieManagerProtocol
    
    init(animationManager: LottieManagerProtocol) {
        self.animationManager = animationManager
    }
    
    func onPreExecute() {
        animationManager.onPreExecute()
    }
    
    func onPostExecute() {
        animationManager.onPostExecute()
    }
    
}
