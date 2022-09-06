//
//  RootView.swift
//  MC_assignmet_1
//
//  Created by k2rth1k on 9/3/22.
//

import SwiftUI

struct RootView: View {


    @StateObject var appState: AppState

    var body: some View {
        switch appState.route {
        case routesType.camera:
            CustomCameraPhotoView(appState: appState)
        case routesType.sender:
            SenderView(appState: appState)
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView(appState: AppState())
    }
}
