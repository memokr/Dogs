//
//  ContentView.swift
//  Dogs
//
//  Created by Guillermo Kramsky on 14/04/25.
//

import SwiftUI

struct ContentView: View {
    @Environment(DogViewModel.self) private var viewModel
    @State private var showAlert = false
    @State private var errorType: APIError?
    @State private var searchText: String = ""


    var body: some View {
        NavigationStack {
            VStack {
                if viewModel.isLoading {
                    // Show loading indicator while data is being fetched
                    HStack{
                        ProgressView()
                        Text("Loading list")
                    }
                } else {
                    // Display list of dog breeds
                    List {
                        ForEach(filteredBreeds, id: \.self) { breed in
                            NavigationLink(destination: DogDetailView(selectedDog: breed)) {
                                Text(breed.capitalized)
                                    .padding(.vertical, 10)
                            }
                        }
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle(Text("Dogs"))
            .task {
                // Fetch dog breeds when view appears
                viewModel.isLoading = true
                do {
                    try await viewModel.fetchBreeds()
                }
                // Handle specific API errors
                catch APIError.invalidData {

                    handleError(.invalidData)

                } catch APIError.invalidUrl{

                    handleError(.invalidUrl)

                } catch APIError.invalidResponse{

                    handleError(.invalidResponse)

                } catch {
                    print("Unexpected Error")
                }
                viewModel.isLoading = false
            }
            // Show alert if there's an error
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text(errorType?.errorTitle ?? "Error"),
                    message: Text(viewModel.errorType?.errorDescription ?? "Unknown error"),
                    dismissButton: .default(Text("OK"))
                )
            }
            .searchable(text: $searchText, prompt: "Search")
        }
    }

    // Filter dog breeds based on search text
    var filteredBreeds: [String] {
        if searchText.isEmpty {
            return viewModel.breeds
        } else {
            return viewModel.breeds.filter { $0.localizedCaseInsensitiveContains(searchText) }
        }
    }

    // Handle and display API errors
    private func handleError(_ error: APIError) {
        errorType = error
        showAlert.toggle()
    }
}

#Preview {
    ContentView()
        .environment(DogViewModel())
}
