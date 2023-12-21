//
//  CMCells.swift
//  OnCampApp
//
//  Created by Michael Washington on 10/19/23.
//

import SwiftUI

struct CMCells: View {
    let message: Message
    var body: some View {
        VStack {
            MessageCell(message: message)
            
            Divider()
            
            
            
        }
        .padding(.horizontal,43)
    }
}

struct CMCells_Previews: PreviewProvider {
    static var previews: some View {
        CMCells(message:  Message(senderId: "sender", content: "Sample Content", timestamp: Date(), read: false))
    }
}

