//
//  OptionView.swift
//  Tool2Day
//
//  Created by Damien Chailloleau on 17/02/2021.
//

import SwiftUI

struct OptionView: View {
    
    let imageText: String
    
    var body: some View {
        Image(imageText)
            .resizable()
            .aspectRatio(1, contentMode: .fit)
            .frame(width: 150, height: 150)
            .cornerRadius(25.0)
            .shadow(color: Color.white, radius: 25)
            .padding()
    }
}

struct OptionView_Previews: PreviewProvider {
    static var previews: some View {
        OptionView(imageText: "bmi")
            .previewLayout(.sizeThatFits)
    }
}
