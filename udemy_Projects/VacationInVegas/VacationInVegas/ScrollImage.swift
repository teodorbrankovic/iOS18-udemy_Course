//
//  ScrollImage.swift
//  VacationInVegas
//
//  Created by Teodor Brankovic on 31.10.24.
//

import SwiftUI

struct ScrollImage: View {
    let image: ImageResource // if not .image then we need to take string
    
    var body: some View {
        
        Image(image)
            .resizable()
            .scaledToFit()
            .clipShape(.rect(cornerRadius: 20))
            .scrollTransition { content, phase in
                content
                    .scaleEffect(phase.isIdentity ? 1 : 0.5) // if in center the normale size else half size
                    .opacity(phase.isIdentity ? 1 : 0.5) // same with opacity
            }
        
    }
}

#Preview {
    ScrollImage(image: .bellagio)
}
