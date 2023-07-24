//
//  RotateViewModel.swift
//  image-spinner
//
//  Created by Michael Rollins on 7/24/23.
//

import Foundation
import SwiftUI

class RotateViewModel: SpinnerViewModel, ObservableObject {
    @Published var imageName: String
    @Published var width: CGFloat
    @Published var speed: Double
    @Published var degrees: Double
    
    init(imageName: String, width: CGFloat = 200, speed: Double = 0.8, degrees: Double = 360) {
        self.imageName = imageName
        self.width = width
        self.speed = speed
        self.degrees = degrees 
    }
    
    func generateView() -> any View {
        return RotateView(viewModel: self)
    }
    
    func getCode() -> String {
        return
"""
Image(viewModel.imageName)
    .resizable()
    .aspectRatio(contentMode: .fit)
    .rotationEffect(Angle.degrees(viewModel.degrees), anchor: .center)
    .frame(width: viewModel.width, height: viewModel.width)
    .onAppear {
        withAnimation(.linear(duration: viewModel.speed).repeatForever(autoreverses: false)) {
            viewModel.degrees = 1.truncatingRemainder(dividingBy: 360)
        }
    }
"""
    }
}
