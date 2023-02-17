//
//  dineApp.swift
//  dine
//
//  Created by Anup Gupta on 15/02/23.
//

import SwiftUI

@main
struct dineApp: App {
    @StateObject var order = Order()
    var body: some Scene {
        WindowGroup {
            MainView().environmentObject(order)
        }
    }
}
