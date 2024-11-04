//
//  ExchangeInfo.swift
//  LOTRConverter
//
//  Created by Teodor Brankovic on 01.11.24.
//

import SwiftUI

struct ExchangeInfo: View {
    private var infoString = "Here at the Prancing Pony, we are happy to offer you a place where you can exchange all the known currencies in the entire world except one. We used to take Brandy Bucks, but after finding out that it was a person instead of a piece of paper, we realized it had no value to us. Below is a simple guide to our currency exchange rates:"
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            
            // MARK: Background
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            
            VStack () {
                
                // MARK: Title
                Text("Exchange Rates")
                    .font(.largeTitle)
                    .tracking(3)
                
                // MARK: Info
                Text(infoString)
                    .font(.title2)
                    .padding()
                
                // MARK: Coverter HStacks
                HorizontalConverterView(image: .goldpiece, text: "1 Gold Piece = 4 Gold Pennies", image2: .goldpenny)
                HorizontalConverterView(image: .goldpenny, text: "1 Gold Penny = 4 Silver Pieces", image2: .silverpiece)
                HorizontalConverterView(image: .silverpiece, text: "1 Silver Piece = 4 Silver Pennies", image2: .silverpenny)
                HorizontalConverterView(image: .silverpenny, text: "1 Silver Penny = 100 Copper Pennies", image2: .copperpenny)
                
                // MARK: Done Button
                Button("Done") {
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
                .tint(.brown)
                .font(.largeTitle)
                .padding()
                .foregroundStyle(.white)
                
            }
            .foregroundStyle(.black)
        }
        
    }
}

#Preview {
    ExchangeInfo()
}

struct HorizontalConverterView: View {
    var image: ImageResource
    var text: String
    var image2: ImageResource
    
    var body: some View {
        HStack {
            Image(image)
                .resizable()
                .scaledToFit()
                .frame(width: 33)
            
            Text(text)
                .font(.title3)
            
            Image(image2)
                .resizable()
                .scaledToFit()
                .frame(width: 33)
        }
       
    }
}
