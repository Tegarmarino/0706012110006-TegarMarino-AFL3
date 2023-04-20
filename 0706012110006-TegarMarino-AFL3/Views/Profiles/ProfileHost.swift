//
//  ProfileHost.swift
//  0706012110006-TegarMarino-AFL3
//
//  Created by Tegar Marino on 20/04/23.
//

import SwiftUI

struct ProfileHost: View {
//    MARK: - PROPERTY
//    Menambahkan envirenment value \.editMode yang ada dari swiftUI
    @Environment(\.editMode) var editMode
    @EnvironmentObject var modelData: ModelData
    @State private var draftProfile = Profile.default
    
//    MARK: BODY
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                Spacer()
                EditButton()
            }

//            Baca data profil pengguna dari environenment untuk meneruskan kontrol data ke host profil.
            if editMode?.wrappedValue == .inactive {
//                Tambahkan kondisi yang menampilkan profil statis atau tampilan untuk mode Edit.
                ProfileSummary(profile: modelData.profile)
            } else {
                ProfileEditor(profile: $draftProfile)
            }
        }
        .padding()
    }
}

struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost()
            .environmentObject(ModelData())
    }
}
