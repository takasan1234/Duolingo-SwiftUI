//
//  ComponentButton.swift
//  Duolingo
//
//  Created by 辻孝弥 on 2024/09/23.
//

import Foundation

import SwiftUI

struct ComponentButton: View  {
    var buttonType: String
    var isActive: Bool
    var baseColor: Color = Color(.lightGray)
    
    var body: some View {
        ZStack {
            if isActive {
                Ellipse()
                    .aspectRatio(1.2, contentMode: .fit)
                    .frame(width: 100)
                    .foregroundStyle(baseColor)
                    .grayscale(0.60)
                Ellipse()
                    .aspectRatio(1.2, contentMode: .fit)
                    .frame(width: 100)
                    .offset(CGSize(width: 0, height: -10.0))
                    .foregroundStyle(baseColor)
            } else {
                Ellipse()
                    .aspectRatio(1.2, contentMode: .fit)
                    .frame(width: 100)
                    .foregroundStyle(.gray)
                Ellipse()
                    .aspectRatio(1.2, contentMode: .fit)
                    .frame(width: 100)
                    .offset(CGSize(width: 0, height: -10.0))
                    .foregroundStyle(Color(.lightGray))
            }
            Image(systemName: "\(buttonType).fill")
                .foregroundStyle(.white)
                .font(.system(size: 40))
                .offset(CGSize(width: 0.0, height: -10.0))
            
        }
    }
    
    
}


struct ComponentButton_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            // アクティブな状態のプレビュー
            var isActive1 = true
            ComponentButton(buttonType: "star", isActive: true, baseColor: .blue)
                .previewDisplayName("Active State")
            
            // 非アクティブな状態のプレビュー
            var isActive2 = false
            ComponentButton(buttonType: "star", isActive: isActive2)
                .previewDisplayName("Inactive State")
        }
    }
}
