//
//  ProfileEditor.swift
//  0706012110006-TegarMarino-AFL3
//
//  Created by Tegar Marino on 20/04/23.
//

import SwiftUI

struct ProfileEditor: View {
//    MARK: - PROPERTY
//    Menambahkan Binding untuk mengikat salinan draf profil pengguna.
    @Binding var profile: Profile
    
    
//    menaambahkan DatePicker di bawah season selector untuk membuat tanggal sasaran kunjungan landmark dapat dimodifikasi.
    var dateRange: ClosedRange<Date> {
        let min = Calendar.current.date(byAdding: .year, value: -1, to: profile.goalDate)!
        let max = Calendar.current.date(byAdding: .year, value: 1, to: profile.goalDate)!
        return min...max
    }
    
    var body: some View {
        List {
            HStack {
                Text("Username").bold()
                Divider()
                TextField("Username", text: $profile.username)
            }
            
//            Tambahkan toggle yang sesuai dengan preferensi pengguna untuk menerima notifikasi tentang acara terkait landmark.
            Toggle(isOn: $profile.prefersNotifications) {
                Text("Enable Notifications").bold()
            }
            
            
//            Tempatkan kontrol Picker dan labelnya di VStack untuk membuat foto tengara memiliki musim pilihan yang dapat dipilih.
            VStack(alignment: .leading, spacing: 20) {
                Text("Seasonal Photo").bold()
                            
                Picker("Seasonal Photo", selection: $profile.seasonalPhoto) {
                    ForEach(Profile.Season.allCases) { season in
                        Text(season.rawValue).tag(season)
                    }
                }
                .pickerStyle(.segmented)
            }
        }
    }
}

struct ProfileEditor_Previews: PreviewProvider {
    static var previews: some View {
        ProfileEditor(profile: .constant(.default))
    }
}
