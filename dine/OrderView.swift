//
//  OrderView.swift
//  dine
//
//  Created by Anup Gupta on 15/02/23.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var order : Order
    var body: some View {
        NavigationStack{
            List{
                Section{
                    ForEach(order.items){ item in
                        HStack {
                            Text(item.name)
                            Spacer()
                            Text("$\(item.price)")
                        }
                    }.onDelete(perform: deleteItems)
                }
                Section{
                    NavigationLink("Please Order"){
                        
                        CheckoutView()
                        
                    }
                }
                .disabled(order.items.isEmpty)
                
            }.navigationTitle("Order")
                .toolbar(){
                    EditButton()
                        .disabled(order.items.isEmpty)
                }
        }
    }
    
    func deleteItems(at offsets: IndexSet){
        order.items.remove(atOffsets: offsets)
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
            .environmentObject(Order())
    }
}
