//
//  CircularProfilePicture.swift
//  OnCampApp
//
//  Created by Michael Washington on 10/12/23.
//


import SwiftUI

struct CircularProfilePictureView: View {
    var body: some View {
        Image("spelhouse")
            .resizable()
            .scaledToFill()
           
            .clipShape(Circle())
    }
}

struct CircularProfilePictureView_Previews: PreviewProvider {
    static var previews: some View {
        CircularProfilePictureView()
    }
}
