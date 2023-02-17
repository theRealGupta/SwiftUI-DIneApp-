//
//  CheckoutView.swift
//  dine
//
//  Created by Anup Gupta on 15/02/23.
//

import SwiftUI

struct CheckoutView: View {
    @EnvironmentObject var order : Order
    
    @State private var paymentType = "cash"
    @State private var addLoyaltyDetails = false
    @State private var loyaltyNumber = ""
    
    let tipAmounts = [10,15,20,25,0]
    @State private var tipAmount = 10
    @State private var isPaymentAlertShown = false
    
    var totalPrice: String {
        let total = Double(order.total)
        let tipValue = total / 100 * Double(tipAmount)
        return (total+tipValue).formatted(.currency(code: "USD"))
    }
    
    
    let paymentTypes = ["Cash", "UPI" , "Debit Card" ,"Credit Card" , "Dine Point"]
    var body: some View {
        Form{
            Section{
                Picker("How do you want to pay?", selection: $paymentType){
                    ForEach(paymentTypes, id:\.self){
                        Text($0)
                    }
                }
                
                Toggle("Add Dine Loyalty Card", isOn: $addLoyaltyDetails.animation())
                if addLoyaltyDetails{
                    TextField("Enter your Dine ID", text: $loyaltyNumber)
                }
               
            }
            
            Section("Add a tip?"){
                Picker("Percentage:", selection: $tipAmount){
                    ForEach( tipAmounts, id:\.self){
                        Text("\($0)%")
                    }
                    
                }.pickerStyle(.segmented)
            }
            Section("Total:\(totalPrice)"){
                Button("Confirm Order") {
                    isPaymentAlertShown = true
                }
                
            }
            
        }
        .navigationTitle("Payment")
        .navigationBarTitleDisplayMode(.inline)
        .alert("Order Confirmed", isPresented: $isPaymentAlertShown){
            // Add button Here
            Button("Done"){
                
            }
         }message: {
            Text("your Total value was \(totalPrice) using \(paymentType) - thank you")
        }
        
        
    }
    
    
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            CheckoutView()
                .environmentObject(Order())
        }
    }
}
