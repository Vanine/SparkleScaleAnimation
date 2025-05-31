//
//  ContentView.swift
//  ProsperAnimationDemo
//
//  Created by Vanine Ghazaryan on 30.05.25.
//

import SwiftUI

struct ContentView: View {
    @State private var isExpanded = false
    @Namespace private var animation
    let screenWidth = UIScreen.main.bounds.width

    var body: some View {
        ZStack {
            // Background with animated radial gradient
            RadialGradient(gradient: Gradient(colors: [Color.purple.opacity(0.7), Color.black]),
                           center: .center,
                           startRadius: 100,
                           endRadius: 500)
                .ignoresSafeArea()
                .blur(radius: 30)
                .hueRotation(.degrees(isExpanded ? 90 : 0))
                .animation(.linear(duration: 1), value: isExpanded)

            VStack(spacing: 40) {
                Text("Prosper Interface")
                    .font(.system(size: 36, weight: .bold, design: .serif))
                    .foregroundStyle(.white)
                    .shadow(radius: 10)

                ZStack {
                    if isExpanded {
                        RoundedRectangle(cornerRadius: 40, style: .continuous)
                            .fill(.ultraThinMaterial)
                            .matchedGeometryEffect(id: "glassCard", in: animation)
                            .frame(width: screenWidth*0.7, height: screenWidth*0.7)
                            .overlay(
                                VStack {
                                    Image(systemName: "sparkles")
                                        .font(.system(size: 48))
                                        .foregroundColor(.white)
                                    Text("You’re expanding spiritually.")
                                        .multilineTextAlignment(.center)
                                        .foregroundColor(.white.opacity(0.8))
                                        .padding(.top)
                                }
                            )
                            .transition(.scale.combined(with: .opacity))
                            .shadow(color: .white.opacity(0.2), radius: 20, x: 0, y: 15)
                    } else {
                        Circle()
                            .fill(.ultraThinMaterial)
                            .matchedGeometryEffect(id: "glassCard", in: animation)
                            .frame(width: 100, height: 100)
                            .overlay(
                                Image(systemName: "sparkles")
                                    .font(.title)
                                    .foregroundColor(.white)
                            )
                            .transition(.scale.combined(with: .opacity))
                            .shadow(color: .white.opacity(0.3), radius: 15, x: 0, y: 10)
                    }
                }
                .onTapGesture {
                    withAnimation(.spring(response: 0.6, dampingFraction: 0.7)) {
                        isExpanded.toggle()
                    }
                }

                Text("Tap to evolve")
                    .font(.footnote)
                    .foregroundColor(.white.opacity(0.7))
            }
        }
    }
}

#Preview {
    ContentView()
}
