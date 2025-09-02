//
//  VolumeVisualizerView.swift
//  professions-challenge
//
//  Created by Rafael Venetikides on 02/09/25.
//

import SwiftUI

struct VolumeVisualizerView: View {
    let power: Float
    
    var normalizedPower: CGFloat {
        max(0, CGFloat((power + 60) / 60))
    }
    
    var body: some View {
        HStack(spacing: 4) {
            ForEach(0..<20, id: \.self) { i in
                    Capsule()
                        .fill(Color.black)
                        .frame(width: 4, height: self.barHeight(at: i))
            }
        }
        .animation(.linear(duration: 0.05), value: power)
    }
    
    func barHeight(at index: Int) -> CGFloat {
        let maxHeight: CGFloat = 60
        let offset = abs(CGFloat(index) - 10) / 10
        let scale = 1.0 - offset
        return normalizedPower * maxHeight * scale
    }
}
