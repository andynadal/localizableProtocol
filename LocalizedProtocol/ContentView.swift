//
//  ContentView.swift
//  LocalizedProtocol
//
//  Created by Andy Nadal on 1/11/21.
//

import SwiftUI

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

protocol Localizable: Identifiable, CaseIterable, RawRepresentable where RawValue: StringProtocol {}

extension Localizable {
    
    var localized: String {
        NSLocalizedString(String(rawValue), comment: "")
    }
    
    var id: String {
        String(self.rawValue)
    }
}

struct ContentView: View {
    var body: some View {
        VStack {
            ForEach(Language.allCases) { language in
                Text(language.localized)
            }
            ForEach(Country.allCases) { language in
                Text(language.localized)
            }
        }
    }
}

enum Language: String, Localizable {
    case english = "ENGLISH"
    case spanish = "SPANISH"
    case french = "FRENCH"
    case italian = "ITALIAN"
}

enum Country: String, Localizable {
    case america = "AMERICA"
    case france = "FRANCE"
    case spain = "SPAIN"
    case mexico = "MEXICO"
    case unitedKingdom = "UNITED_KINGDOM"
}
