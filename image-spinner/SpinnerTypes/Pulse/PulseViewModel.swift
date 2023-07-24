//
//  PulseViewModel.swift
//  image-spinner
//
//  Created by Michael Rollins on 7/21/23.
//

import Foundation

class PulseViewModel: SpinnerViewModel, ObservableObject {
    @Published var imageName: String
    @Published var width: CGFloat
    @Published var minWidth: CGFloat
    @Published var speed: Double
    
    init(imageName: String, width: CGFloat = 100, minWidth: CGFloat = 25, speed: Double = 0.25) {
        self.imageName = imageName
        self.width = width
        self.minWidth = minWidth
        self.speed = speed
    }

    func getCode() -> String {
        var code = ""
        
        code =
"""
Image(viewModel.imageName)
    .resizable()
    .aspectRatio(contentMode: .fit)
    .frame(width: viewModel.width, height: viewModel.width)
    .onAppear {
        withAnimation(.easeInOut.repeatForever(autoreverses: true).speed(viewModel.speed)) {
            viewModel.width = viewModel.minWidth
        }
    }
"""
        
        return code
    }
}
