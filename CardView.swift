//
//  SwiftUIView.swift
//  tipCalculatorApp
//
//  Created by Arturo on 7/24/22.
//

import SwiftUI

struct CardView: View {
    
    var cardLabelText = ""
    var totalAmount = 48.85
    var subTotalAmout = 42.48
    var tipAmount = 6.37
    
    var body: some View
    {
        VStack(alignment: .leading, spacing: 0)
        {
            Text(cardLabelText)
                .foregroundColor(.orange)
                .fontWeight(.bold)
            
            ZStack
            {
                Rectangle()
                    .foregroundColor(.gray)
                    .cornerRadius(20)
                HStack
                {
                    Spacer()
                    Text("$ \(totalAmount, specifier: "%.2f")")
                        .foregroundColor(.white)
                        .font(.system(size: 40, weight: .black, design: .monospaced))
                        .fontWeight(.black)
                    
                    Spacer()
                    
                    Rectangle()
                        .foregroundColor(Color(red: 128/255, green: 128/255, blue: 128/255))
                        .frame(width: 1, height: 70)

                    Spacer()
                    
                    VStack(alignment: .leading, spacing: 10)
                    {
                        VStack(alignment: .leading)
                        {
                            Text("SUBTOTAL")
                                .font(.system(.caption, design: .rounded))
                                .fontWeight(.light)

                            Text("$ \(subTotalAmout, specifier: "%.2f")")
                                .font(.system(.body, design: .monospaced))
                                .fontWeight(.black)
                        }
                        VStack(alignment: .leading)
                        {
                            Text("TIP")
                                .font(.system(.caption,design: .rounded))
                                .fontWeight(.light)
                            Text("$ \(tipAmount, specifier: "%.2f")")
                                .font(.system(.body, design: .monospaced))
                                .fontWeight(.black)
                        }
                    }
                    .foregroundColor(.white)
                    Spacer()
                }
                .padding(5)
            }
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(cardLabelText: "Per Person")
            .frame(width: 300, height: 150)
    }
}
