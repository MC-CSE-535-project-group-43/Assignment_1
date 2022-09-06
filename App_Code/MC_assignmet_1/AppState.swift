//
//  AppState.swift
//  MC_assignmet_1
//
//  Created by k2rth1k on 9/3/22.
//
import SwiftUI

class AppState: ObservableObject{
    @Published var route = routesType.camera
    @Published var capturePhoto: Image?
    @Published var uiCapturedPhoto: UIImage?
}
