//
//  MainSpinnerViewModel.swift
//  image-spinner
//
//  Created by Michael Rollins on 7/24/23.
//

import Foundation
import SwiftUI

class MainSpinnerViewModel: ObservableObject {
    @Published var viewModels: [SpinnerViewModel] = [
        PulseViewModel(imageName: "squareLogo"),
        RotateViewModel(imageName: "dragonFull"),
        IntermittentRotateViewModel(imageName: "dragon")
    ]
}
