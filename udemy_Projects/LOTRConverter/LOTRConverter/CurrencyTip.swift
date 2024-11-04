//
//  CurrencyTip.swift
//  LOTRConverter
//
//  Created by Teodor Brankovic on 04.11.24.
//

import Foundation
import TipKit

struct CurrencyTip: Tip {
    var title = Text("Change Currency")
    
    var message: Text? = Text("You can tap the left or tight currency to bring up Select Currency Screen")
}
