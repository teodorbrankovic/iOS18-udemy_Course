//
//  SelectCurrency.swift
//  LOTRConverter
//
//  Created by Teodor Brankovic on 01.11.24.
//

import SwiftUI

struct SelectCurrency: View {
    @Environment(\.dismiss) var dismiss
    @Binding var topCurrency: Currency
    @Binding var bottomCurrency: Currency
    
    var body: some View {
        ZStack {
            
            // MARK: Background
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            
            VStack {
                
                // MARK: Select 1st Currency
                Text("Select the currency you are starting with:")
                    .bold()
                    .multilineTextAlignment(.center)
                
                // MARK: CurrencyIcon
                IconGrid(selectedCurrency: $topCurrency)
                
                // MARK: Select 2nd Currency
                Text("Select the currency you would like to convert to:")
                    .bold()
                    .multilineTextAlignment(.center)
                
                // MARK: CurrencyIcon
                IconGrid(selectedCurrency: $bottomCurrency)
                
                
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
            .padding()
        }
        
    }
}

#Preview {
    SelectCurrency(topCurrency: .constant(.copperPenny), bottomCurrency: .constant(.goldPiece))
}
