//
//  ListView.swift
//  UDTW
//
//  Created by RainYang on 2023/8/30.
//

import SwiftUI

let intColor = ["#444444", "#9bc4e4", "#00a0f1", "#0062f5", "#2de161", "#1cac5d", "#ffbd2b", "#ff992b", "#fa5151", "#f4440d", "#ff000d", "#c20007", "#fd2fc2"]

struct ListView: View {
    @EnvironmentObject var network: Network

    var body: some View {
        ScrollView {
            
            HStack() {
                Text(network.users.first?.no0.magnitude ?? "error")
                    .font(.largeTitle)
                    .fontWeight(.black)
                VStack(alignment: .leading, spacing: 5) {
                    Text(network.users.first?.no0.time ?? "error")
                            .foregroundColor(.secondary)
                            .fixedSize(horizontal: false, vertical: true)
                    Text(network.users.first?.no0.location ?? "error")
                            .font(.title2)
                            .fontWeight(.black)
                }
            }
            
            HStack() {
                Text(network.users.first?.no2.magnitude ?? "error")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                VStack(alignment: .leading, spacing: 5) {
                    Text(network.users.first?.no2.time ?? "error")
                            .foregroundColor(.secondary)
                            .fixedSize(horizontal: false, vertical: true)
                    Text(network.users.first?.no2.location ?? "error")
                            .fontWeight(.black)
                }
            }
            
            HStack() {
                            Text(network.users.first?.no2.magnitude ?? "error")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                            VStack(alignment: .leading, spacing: 5) {
                                Text(network.users.first?.no2.time ?? "error")
                                        .foregroundColor(.secondary)
                                        .fixedSize(horizontal: false, vertical: true)
                                Text(network.users.first?.no2.location ?? "error")
                                        .fontWeight(.black)
                            }
                        }
            HStack() {
                            Text(network.users.first?.no3.magnitude ?? "error")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                            VStack(alignment: .leading, spacing: 5) {
                                Text(network.users.first?.no3.time ?? "error")
                                        .foregroundColor(.secondary)
                                        .fixedSize(horizontal: false, vertical: true)
                                Text(network.users.first?.no3.location ?? "error")
                                        .fontWeight(.black)
                            }
                        }
            
            HStack() {
                            Text(network.users.first?.no4.magnitude ?? "error")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                            VStack(alignment: .leading, spacing: 5) {
                                Text(network.users.first?.no4.time ?? "error")
                                        .foregroundColor(.secondary)
                                        .fixedSize(horizontal: false, vertical: true)
                                Text(network.users.first?.no4.location ?? "error")
                                        .fontWeight(.black)
                            }
                        }
            
            HStack() {
                            Text(network.users.first?.no5.magnitude ?? "error")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                            VStack(alignment: .leading, spacing: 5) {
                                Text(network.users.first?.no5.time ?? "error")
                                        .foregroundColor(.secondary)
                                        .fixedSize(horizontal: false, vertical: true)
                                Text(network.users.first?.no5.location ?? "error")
                                        .fontWeight(.black)
                            }
                        }
            
            HStack() {
                            Text(network.users.first?.no6.magnitude ?? "error")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                            VStack(alignment: .leading, spacing: 5) {
                                Text(network.users.first?.no6.time ?? "error")
                                        .foregroundColor(.secondary)
                                        .fixedSize(horizontal: false, vertical: true)
                                Text(network.users.first?.no6.location ?? "error")
                                        .fontWeight(.black)
                            }
                        }
            
            HStack() {
                            Text(network.users.first?.no7.magnitude ?? "error")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                            VStack(alignment: .leading, spacing: 5) {
                                Text(network.users.first?.no7.time ?? "error")
                                        .foregroundColor(.secondary)
                                        .fixedSize(horizontal: false, vertical: true)
                                Text(network.users.first?.no7.location ?? "error")
                                        .fontWeight(.black)
                            }
                        }
            
            HStack() {
                            Text(network.users.first?.no8.magnitude ?? "error")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                            VStack(alignment: .leading, spacing: 5) {
                                Text(network.users.first?.no8.time ?? "error")
                                        .foregroundColor(.secondary)
                                        .fixedSize(horizontal: false, vertical: true)
                                Text(network.users.first?.no8.location ?? "error")
                                        .fontWeight(.black)
                            }
                        }
            
            HStack() {
                            Text(network.users.first?.no9.magnitude ?? "error")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                            VStack(alignment: .leading, spacing: 5) {
                                Text(network.users.first?.no9.time ?? "error")
                                        .foregroundColor(.secondary)
                                        .fixedSize(horizontal: false, vertical: true)
                                Text(network.users.first?.no9.location ?? "error")
                                        .fontWeight(.black)
                            }
                        }
            
            HStack() {
                            Text(network.users.first?.no10.magnitude ?? "error")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                            VStack(alignment: .leading, spacing: 5) {
                                Text(network.users.first?.no10.time ?? "error")
                                        .foregroundColor(.secondary)
                                        .fixedSize(horizontal: false, vertical: true)
                                Text(network.users.first?.no10.location ?? "error")
                                        .fontWeight(.black)
                            }
                        }
            
            HStack() {
                            Text(network.users.first?.no11.magnitude ?? "error")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                            VStack(alignment: .leading, spacing: 5) {
                                Text(network.users.first?.no11.time ?? "error")
                                        .foregroundColor(.secondary)
                                        .fixedSize(horizontal: false, vertical: true)
                                Text(network.users.first?.no11.location ?? "error")
                                        .fontWeight(.black)
                            }
                        }
            
            HStack() {
                            Text(network.users.first?.no12.magnitude ?? "error")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                            VStack(alignment: .leading, spacing: 5) {
                                Text(network.users.first?.no12.time ?? "error")
                                        .foregroundColor(.secondary)
                                        .fixedSize(horizontal: false, vertical: true)
                                Text(network.users.first?.no12.location ?? "error")
                                        .fontWeight(.black)
                            }
                        }
            
            HStack() {
                            Text(network.users.first?.no13.magnitude ?? "error")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                            VStack(alignment: .leading, spacing: 5) {
                                Text(network.users.first?.no13.time ?? "error")
                                        .foregroundColor(.secondary)
                                        .fixedSize(horizontal: false, vertical: true)
                                Text(network.users.first?.no13.location ?? "error")
                                        .fontWeight(.black)
                            }
                        }
            
            HStack() {
                            Text(network.users.first?.no14.magnitude ?? "error")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                            VStack(alignment: .leading, spacing: 5) {
                                Text(network.users.first?.no14.time ?? "error")
                                        .foregroundColor(.secondary)
                                        .fixedSize(horizontal: false, vertical: true)
                                Text(network.users.first?.no14.location ?? "error")
                                        .fontWeight(.black)
                            }
                        }
            
            HStack() {
                            Text(network.users.first?.no15.magnitude ?? "error")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                            VStack(alignment: .leading, spacing: 5) {
                                Text(network.users.first?.no15.time ?? "error")
                                        .foregroundColor(.secondary)
                                        .fixedSize(horizontal: false, vertical: true)
                                Text(network.users.first?.no15.location ?? "error")
                                        .fontWeight(.black)
                            }
                        }
            
            HStack() {
                            Text(network.users.first?.no16.magnitude ?? "error")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                            VStack(alignment: .leading, spacing: 5) {
                                Text(network.users.first?.no16.time ?? "error")
                                        .foregroundColor(.secondary)
                                        .fixedSize(horizontal: false, vertical: true)
                                Text(network.users.first?.no16.location ?? "error")
                                        .fontWeight(.black)
                            }
                        }
            
            HStack() {
                            Text(network.users.first?.no17.magnitude ?? "error")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                            VStack(alignment: .leading, spacing: 5) {
                                Text(network.users.first?.no17.time ?? "error")
                                        .foregroundColor(.secondary)
                                        .fixedSize(horizontal: false, vertical: true)
                                Text(network.users.first?.no17.location ?? "error")
                                        .fontWeight(.black)
                            }
                        }
            
            HStack() {
                            Text(network.users.first?.no18.magnitude ?? "error")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                            VStack(alignment: .leading, spacing: 5) {
                                Text(network.users.first?.no18.time ?? "error")
                                        .foregroundColor(.secondary)
                                        .fixedSize(horizontal: false, vertical: true)
                                Text(network.users.first?.no18.location ?? "error")
                                        .fontWeight(.black)
                            }
                        }
            
            HStack() {
                            Text(network.users.first?.no19.magnitude ?? "error")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                            VStack(alignment: .leading, spacing: 5) {
                                Text(network.users.first?.no19.time ?? "error")
                                        .foregroundColor(.secondary)
                                        .fixedSize(horizontal: false, vertical: true)
                                Text(network.users.first?.no19.location ?? "error")
                                        .fontWeight(.black)
                            }
                        }
            
            HStack() {
                            Text(network.users.first?.no20.magnitude ?? "error")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                            VStack(alignment: .leading, spacing: 5) {
                                Text(network.users.first?.no20.time ?? "error")
                                        .foregroundColor(.secondary)
                                        .fixedSize(horizontal: false, vertical: true)
                                Text(network.users.first?.no20.location ?? "error")
                                        .fontWeight(.black)
                            }
                        }
            
            HStack() {
                            Text(network.users.first?.no21.magnitude ?? "error")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                            VStack(alignment: .leading, spacing: 5) {
                                Text(network.users.first?.no21.time ?? "error")
                                        .foregroundColor(.secondary)
                                        .fixedSize(horizontal: false, vertical: true)
                                Text(network.users.first?.no21.location ?? "error")
                                        .fontWeight(.black)
                            }
                        }
            
            HStack() {
                            Text(network.users.first?.no22.magnitude ?? "error")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                            VStack(alignment: .leading, spacing: 5) {
                                Text(network.users.first?.no22.time ?? "error")
                                        .foregroundColor(.secondary)
                                        .fixedSize(horizontal: false, vertical: true)
                                Text(network.users.first?.no22.location ?? "error")
                                        .fontWeight(.black)
                            }
                        }
            
            HStack() {
                            Text(network.users.first?.no23.magnitude ?? "error")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                            VStack(alignment: .leading, spacing: 5) {
                                Text(network.users.first?.no23.time ?? "error")
                                        .foregroundColor(.secondary)
                                        .fixedSize(horizontal: false, vertical: true)
                                Text(network.users.first?.no23.location ?? "error")
                                        .fontWeight(.black)
                            }
                        }
            
            HStack() {
                            Text(network.users.first?.no24.magnitude ?? "error")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                            VStack(alignment: .leading, spacing: 5) {
                                Text(network.users.first?.no24.time ?? "error")
                                        .foregroundColor(.secondary)
                                        .fixedSize(horizontal: false, vertical: true)
                                Text(network.users.first?.no24.location ?? "error")
                                        .fontWeight(.black)
                            }
                        }
            
            HStack() {
                            Text(network.users.first?.no25.magnitude ?? "error")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                            VStack(alignment: .leading, spacing: 5) {
                                Text(network.users.first?.no25.time ?? "error")
                                        .foregroundColor(.secondary)
                                        .fixedSize(horizontal: false, vertical: true)
                                Text(network.users.first?.no25.location ?? "error")
                                        .fontWeight(.black)
                            }
                        }
            
            HStack() {
                            Text(network.users.first?.no26.magnitude ?? "error")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                            VStack(alignment: .leading, spacing: 5) {
                                Text(network.users.first?.no26.time ?? "error")
                                        .foregroundColor(.secondary)
                                        .fixedSize(horizontal: false, vertical: true)
                                Text(network.users.first?.no26.location ?? "error")
                                        .fontWeight(.black)
                            }
                        }
            
            HStack() {
                            Text(network.users.first?.no27.magnitude ?? "error")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                            VStack(alignment: .leading, spacing: 5) {
                                Text(network.users.first?.no27.time ?? "error")
                                        .foregroundColor(.secondary)
                                        .fixedSize(horizontal: false, vertical: true)
                                Text(network.users.first?.no27.location ?? "error")
                                        .fontWeight(.black)
                            }
                        }
            
            HStack() {
                            Text(network.users.first?.no28.magnitude ?? "error")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                            VStack(alignment: .leading, spacing: 5) {
                                Text(network.users.first?.no28.time ?? "error")
                                        .foregroundColor(.secondary)
                                        .fixedSize(horizontal: false, vertical: true)
                                Text(network.users.first?.no28.location ?? "error")
                                        .fontWeight(.black)
                            }
                        }
            
            HStack() {
                            Text(network.users.first?.no29.magnitude ?? "error")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                            VStack(alignment: .leading, spacing: 5) {
                                Text(network.users.first?.no29.time ?? "error")
                                        .foregroundColor(.secondary)
                                        .fixedSize(horizontal: false, vertical: true)
                                Text(network.users.first?.no29.location ?? "error")
                                        .fontWeight(.black)
                            }
                        }
            
            HStack() {
                            Text(network.users.first?.no30.magnitude ?? "error")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                            VStack(alignment: .leading, spacing: 5) {
                                Text(network.users.first?.no30.time ?? "error")
                                        .foregroundColor(.secondary)
                                        .fixedSize(horizontal: false, vertical: true)
                                Text(network.users.first?.no30.location ?? "error")
                                        .fontWeight(.black)
                            }
                        }
            
            HStack() {
                            Text(network.users.first?.no31.magnitude ?? "error")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                            VStack(alignment: .leading, spacing: 5) {
                                Text(network.users.first?.no31.time ?? "error")
                                        .foregroundColor(.secondary)
                                        .fixedSize(horizontal: false, vertical: true)
                                Text(network.users.first?.no31.location ?? "error")
                                        .fontWeight(.black)
                            }
                        }
            
            HStack() {
                            Text(network.users.first?.no32.magnitude ?? "error")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                            VStack(alignment: .leading, spacing: 5) {
                                Text(network.users.first?.no32.time ?? "error")
                                        .foregroundColor(.secondary)
                                        .fixedSize(horizontal: false, vertical: true)
                                Text(network.users.first?.no32.location ?? "error")
                                        .fontWeight(.black)
                            }
                        }
            
            HStack() {
                            Text(network.users.first?.no33.magnitude ?? "error")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                            VStack(alignment: .leading, spacing: 5) {
                                Text(network.users.first?.no33.time ?? "error")
                                        .foregroundColor(.secondary)
                                        .fixedSize(horizontal: false, vertical: true)
                                Text(network.users.first?.no33.location ?? "error")
                                        .fontWeight(.black)
                            }
                        }
            
            HStack() {
                            Text(network.users.first?.no34.magnitude ?? "error")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                            VStack(alignment: .leading, spacing: 5) {
                                Text(network.users.first?.no34.time ?? "error")
                                        .foregroundColor(.secondary)
                                        .fixedSize(horizontal: false, vertical: true)
                                Text(network.users.first?.no34.location ?? "error")
                                        .fontWeight(.black)
                            }
                        }
            
            HStack() {
                            Text(network.users.first?.no35.magnitude ?? "error")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                            VStack(alignment: .leading, spacing: 5) {
                                Text(network.users.first?.no35.time ?? "error")
                                        .foregroundColor(.secondary)
                                        .fixedSize(horizontal: false, vertical: true)
                                Text(network.users.first?.no35.location ?? "error")
                                        .fontWeight(.black)
                            }
                        }
            
            HStack() {
                            Text(network.users.first?.no36.magnitude ?? "error")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                            VStack(alignment: .leading, spacing: 5) {
                                Text(network.users.first?.no36.time ?? "error")
                                        .foregroundColor(.secondary)
                                        .fixedSize(horizontal: false, vertical: true)
                                Text(network.users.first?.no36.location ?? "error")
                                        .fontWeight(.black)
                            }
                        }
            
            HStack() {
                            Text(network.users.first?.no37.magnitude ?? "error")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                            VStack(alignment: .leading, spacing: 5) {
                                Text(network.users.first?.no37.time ?? "error")
                                        .foregroundColor(.secondary)
                                        .fixedSize(horizontal: false, vertical: true)
                                Text(network.users.first?.no37.location ?? "error")
                                        .fontWeight(.black)
                            }
                        }
            
            HStack() {
                            Text(network.users.first?.no38.magnitude ?? "error")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                            VStack(alignment: .leading, spacing: 5) {
                                Text(network.users.first?.no38.time ?? "error")
                                        .foregroundColor(.secondary)
                                        .fixedSize(horizontal: false, vertical: true)
                                Text(network.users.first?.no38.location ?? "error")
                                        .fontWeight(.black)
                            }
                        }
            
            HStack() {
                            Text(network.users.first?.no39.magnitude ?? "error")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                            VStack(alignment: .leading, spacing: 5) {
                                Text(network.users.first?.no39.time ?? "error")
                                        .foregroundColor(.secondary)
                                        .fixedSize(horizontal: false, vertical: true)
                                Text(network.users.first?.no39.location ?? "error")
                                        .fontWeight(.black)
                            }
                        }
            
            HStack() {
                            Text(network.users.first?.no40.magnitude ?? "error")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                            VStack(alignment: .leading, spacing: 5) {
                                Text(network.users.first?.no40.time ?? "error")
                                        .foregroundColor(.secondary)
                                        .fixedSize(horizontal: false, vertical: true)
                                Text(network.users.first?.no40.location ?? "error")
                                        .fontWeight(.black)
                            }
                        }
            
            HStack() {
                            Text(network.users.first?.no41.magnitude ?? "error")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                            VStack(alignment: .leading, spacing: 5) {
                                Text(network.users.first?.no41.time ?? "error")
                                        .foregroundColor(.secondary)
                                        .fixedSize(horizontal: false, vertical: true)
                                Text(network.users.first?.no41.location ?? "error")
                                        .fontWeight(.black)
                            }
                        }
            
            HStack() {
                            Text(network.users.first?.no42.magnitude ?? "error")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                            VStack(alignment: .leading, spacing: 5) {
                                Text(network.users.first?.no42.time ?? "error")
                                        .foregroundColor(.secondary)
                                        .fixedSize(horizontal: false, vertical: true)
                                Text(network.users.first?.no42.location ?? "error")
                                        .fontWeight(.black)
                            }
                        }
            
            HStack() {
                            Text(network.users.first?.no43.magnitude ?? "error")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                            VStack(alignment: .leading, spacing: 5) {
                                Text(network.users.first?.no43.time ?? "error")
                                        .foregroundColor(.secondary)
                                        .fixedSize(horizontal: false, vertical: true)
                                Text(network.users.first?.no43.location ?? "error")
                                        .fontWeight(.black)
                            }
                        }
            
            HStack() {
                            Text(network.users.first?.no44.magnitude ?? "error")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                            VStack(alignment: .leading, spacing: 5) {
                                Text(network.users.first?.no44.time ?? "error")
                                        .foregroundColor(.secondary)
                                        .fixedSize(horizontal: false, vertical: true)
                                Text(network.users.first?.no44.location ?? "error")
                                        .fontWeight(.black)
                            }
                        }
            
            HStack() {
                            Text(network.users.first?.no45.magnitude ?? "error")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                            VStack(alignment: .leading, spacing: 5) {
                                Text(network.users.first?.no45.time ?? "error")
                                        .foregroundColor(.secondary)
                                        .fixedSize(horizontal: false, vertical: true)
                                Text(network.users.first?.no45.location ?? "error")
                                        .fontWeight(.black)
                            }
                        }
            
            HStack() {
                            Text(network.users.first?.no46.magnitude ?? "error")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                            VStack(alignment: .leading, spacing: 5) {
                                Text(network.users.first?.no46.time ?? "error")
                                        .foregroundColor(.secondary)
                                        .fixedSize(horizontal: false, vertical: true)
                                Text(network.users.first?.no46.location ?? "error")
                                        .fontWeight(.black)
                            }
                        }
            
            HStack() {
                            Text(network.users.first?.no47.magnitude ?? "error")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                            VStack(alignment: .leading, spacing: 5) {
                                Text(network.users.first?.no47.time ?? "error")
                                        .foregroundColor(.secondary)
                                        .fixedSize(horizontal: false, vertical: true)
                                Text(network.users.first?.no47.location ?? "error")
                                        .fontWeight(.black)
                            }
                        }
            
            HStack() {
                            Text(network.users.first?.no48.magnitude ?? "error")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                            VStack(alignment: .leading, spacing: 5) {
                                Text(network.users.first?.no48.time ?? "error")
                                        .foregroundColor(.secondary)
                                        .fixedSize(horizontal: false, vertical: true)
                                Text(network.users.first?.no48.location ?? "error")
                                        .fontWeight(.black)
                            }
                        }
            
            HStack() {
                            Text(network.users.first?.no49.magnitude ?? "error")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                            VStack(alignment: .leading, spacing: 5) {
                                Text(network.users.first?.no49.time ?? "error")
                                        .foregroundColor(.secondary)
                                        .fixedSize(horizontal: false, vertical: true)
                                Text(network.users.first?.no49.location ?? "error")
                                        .fontWeight(.black)
                            }
            }.listRowSeparator(.visible)
            
            HStack() {
                            Text(network.users.first?.no50.magnitude ?? "error")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                            VStack(alignment: .leading, spacing: 5) {
                                Text(network.users.first?.no50.time ?? "error")
                                        .foregroundColor(.secondary)
                                        .fixedSize(horizontal: false, vertical: true)
                                Text(network.users.first?.no50.location ?? "error")
                                        .fontWeight(.black)
                            }
            }.listRowSeparator(.visible)
            
        }
        .padding(.vertical)
        .onAppear {
            network.getUsers()
        }
    }
}
