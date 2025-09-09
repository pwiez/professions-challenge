//
//  HomeView.swift
//  professions-challenge
//
//  Created by Rafael Venetikides on 03/09/25.
//

import SwiftUI
import SwiftData

struct HomeView: View {
    @Environment(\.modelContext) private var modelContext
    @Query var allRecords: [RecordModel]
    @State private var filteredRecords: [RecordModel] = []
    @AppStorage("Onboarding") var isOnboardingComplete: Bool = false
    
    @State private var showFilters = false
    @State private var filters = FilterOptions()
    @State private var isPresentingTitleRegistration = false
    
    var body: some View {
        NavigationStack{
            if isOnboardingComplete {
                ZStack {
                    Color.light.ignoresSafeArea()
                    
                    VStack(spacing: 22) {
                        HStack{
                            Text("Tekoá")
                                .foregroundStyle(.blueDark)
                                .font(.system(size: 22, weight: .bold))
                            
                            
                            Spacer()
                            
                            Button {
                                showFilters.toggle()
                            } label: {
                                Text("\(Image(systemName: "slider.horizontal.3")) Filtros")
                                    .foregroundStyle(.light)
                                    .padding(.vertical, 6)
                                    .padding(.horizontal, 8)
                                    .background{
                                        RoundedRectangle(cornerRadius: 10)
                                            .fill(.clay)
                                    }
                            }
                        }
                        
                        if allRecords.isEmpty {
                            Spacer()
                            
                            VStack(spacing: 6){
                                Text("Nenhuma ficha adicionada ainda.")
                                    .multilineTextAlignment(.center)
                                    .font(.system(size: 28, weight: .bold))
                                    .foregroundStyle(.blueDark)
                                
                                Text("Toque em \"Cadastrar ficha\" para começar")
                                    .multilineTextAlignment(.center)
                                    .foregroundStyle(.blueDark)
                                    .frame(width: 243)
                            }
                            
                        } else {
                            ScrollView {
                                VStack {
                                    ForEach(allRecords){ record in
                                        RecordCardView(record: record)
                                    }
                                }
                            }
                            
                        }
                        Spacer()
                        
                        NavigationLink(isActive: $isPresentingTitleRegistration) {
                            TitleRegistrationView(isPresenting: $isPresentingTitleRegistration)
                        } label: {
                            Text("Cadastrar ficha")
                                .font(.system(size: 17))
                                .foregroundStyle(.light)
                                .frame(maxWidth: .infinity)
                                .frame(height: 50)
                                .background{
                                    RoundedRectangle(cornerRadius: 12)
                                        .fill(.clay)
                                }
                        }
                        .padding(.horizontal, 12)
                    }
                    .sheet(isPresented: $showFilters) {
                        FilterSheetView(filters: $filters) {
                            
                        }
                        .presentationDetents([.fraction(0.3)])
                        .presentationDragIndicator(.visible)
                    }
                }
            }
            else {
                OnboardingView1() {
                    isOnboardingComplete = true
                }
            }
        }
        .tint(.clay)
        .onAppear {
            applyFilters()
        }
    }
    
    private func applyFilters() {
        var records = allRecords
        if filters.exported {
            records = records.filter { $0.isExported }
        }
        
        if filters.withImage {
            records = records.filter { !$0.photos.isEmpty }
        }
        
        if filters.withAudio {
            records = records.filter { !$0.audios.isEmpty }
        }
        
        if filters.recents {
            records = records.sorted { $0.createdAt > $1.createdAt }
        } else {
            records = records.sorted { $0.createdAt < $1.createdAt }
        }
        filteredRecords = records
    }
}

#Preview {
    HomeView()
}
