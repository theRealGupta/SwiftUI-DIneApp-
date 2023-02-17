//
//  ItemRow.swift
//  dine
//
//  Created by Anup Gupta on 15/02/23.
//

import SwiftUI

struct ItemRow: View {
    static let colors: [String:Color] = ["D":.purple, "G":.black, "N":.red,"S":.blue,"V":.green]
    var item : MenuItem
    var body: some View {
        NavigationLink(destination: ItemDetail(item: item)) {
            HStack{
                Image(item.thumbnailImage)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.gray,lineWidth: 2))
                VStack(alignment: .leading){
                    Text(item.name)
                        .font(.headline)
                    Text("$\(item.price)")
                }
    //            .layoutPriority(1)
                Spacer()
                ForEach(item.restrictions , id: \.self) {
                    restrictions in
                    Text(restrictions)
                        .font(.caption)
                        .fontWeight(.black)
                        .padding(5)
                        .background(Self.colors[restrictions, default: .black])
                        .clipShape(Circle())
                        .foregroundColor(.white)
                }
            }
        }
        
    }
}

struct ItemRow_Previews: PreviewProvider {
    static var previews: some View {
        ItemRow(item: MenuItem.example)
    }
}
