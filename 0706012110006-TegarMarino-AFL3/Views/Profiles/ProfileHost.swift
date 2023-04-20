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
                
//                Menambahkan button untuk cancel edit
                if editMode?.wrappedValue == .active {
                    Button("Cancel", role: .cancel) {
                        draftProfile = modelData.profile
                        editMode?.animation().wrappedValue = .inactive
                    }
                }
                
                Spacer()
                EditButton()
            }

//            Baca data profil pengguna dari environenment untuk meneruskan kontrol data ke host profil.
            if editMode?.wrappedValue == .inactive {
//                Tambahkan kondisi yang menampilkan profil statis atau tampilan untuk mode Edit.
                ProfileSummary(profile: modelData.profile)
            } else {
                
//                tambahkan onApper dan onDisappear untuk mengisi editor dengan data profil yang benar dan memperbarui profil persisten saat pengguna mengetuk tombol Selesai.
                ProfileEditor(profile: $draftProfile)
                    .onAppear {
                        draftProfile = modelData.profile
                    }
                    .onDisappear {
                        modelData.profile = draftProfile
                }
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
