//
//  ContentView.swift
//  tipCalculatorApp
//
//  Created by Arturo on 7/24/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var checkAmount = ""
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 2
    @FocusState private var isInputActive: Bool
    
    private let tipPercentages = [10,15,20,25,0]
    
    private var subTotal: Double
    {
        Double(checkAmount) ?? 0
    }
    
    private var subTotalPerPerson: Double
    {
        let peopleCount = Double(numberOfPeople)
        let orderAmount = Double(checkAmount) ?? 0
        
        return orderAmount / peopleCount
    }
    
    private var tipValue: Double
    {
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        
        return orderAmount / 100 * tipSelection
    }
    
    private var tipValuePerPerson: Double
    {
        tipValue / Double(numberOfPeople)
    }
    
    private var totalAmountWithTip: Double
    {
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        
        return grandTotal
    }
    
    private var totaPerPerson: Double
    {
        let peopleCount = Double(numberOfPeople)
        let amoutPerPerson = totalAmountWithTip / peopleCount
        
        return amoutPerPerson
    }
    
    init()
    {
        UISegmentedControl.appearance()
            .selectedSegmentTintColor = UIColor(.orange)
    }
    
    var body: some View {

        GeometryReader
        {
            geo in
            VStack(alignment: .center, spacing: 20)
            {
                CardView(cardLabelText: "PER PERSON", totalAmount: totaPerPerson, subTotalAmout: subTotalPerPerson, tipAmount: tipValuePerPerson)
                    .frame(width: geo.size.width, height: 100)
                
                CardView(cardLabelText: "TOTAL", totalAmount: totalAmountWithTip, subTotalAmout: subTotal, tipAmount: tipValue)
                    .frame(width: geo.size.width, height: 100)
                
                Picker("Tip Percentage", selection: $tipPercentage)
                {
                    ForEach(0..<tipPercentages.count)
                    {
                        Text("\(self.tipPercentages[$0])%")
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            
                TitleView(title: "BILL AMOUNT")
                
                HStack
                {
                    Text("$")
                        .foregroundColor(.primary)
                        .font(.system(size: 60, weight: .black, design: .rounded))
                    TextField("Amount", text: $checkAmount)
                        .foregroundColor(.primary)
                        .font(.system(size: 60, weight: .black, design: .rounded))
                        .keyboardType(.decimalPad)
                        .focused($isInputActive)
                        .toolbar
                        {
                            ToolbarItemGroup(placement: .keyboard)
                            {
                                Spacer()
                                Button("Done")
                                {
                                    isInputActive = false
                                }
                            }
                        }
                }
                TitleView(title: "Split")
                GuestCountView(guestCount: $numberOfPeople)
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
            
    }
}

struct TitleView: View {
    var title: String
    
    var body: some View {
        HStack
        {
            Text(title)
                .foregroundColor(.orange)
                .fontWeight(.black)
            Spacer()
        }
    }
}
