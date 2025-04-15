//
//  DogDetailView.swift
//  Dogs
//
//  Created by Guillermo Kramsky on 14/04/25.
//

import SwiftUI

struct DogDetailView: View {
    @Environment(DogViewModel.self) private var viewModel
    var selectedDog: String
    var body: some View {
        VStack{
            AsyncImage(url: URL(string: viewModel.breedImage ?? "")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(15)
            } placeholder: {
                ZStack{
                    Rectangle()
                        .frame(height: 300)
                        .opacity(0.1)
                    ProgressView()
                }

            }
            .frame(height: 300)
            .cornerRadius(15)
            
            HStack{
                Text(selectedDog.capitalized)
                    .font(.title)
                    .bold()
                Spacer()
            }
            .padding(.vertical)


            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed gravida massa nec mollis fringilla. Nunc gravida ultricies imperdiet.")

            Spacer()
        }
        .padding()
        .task {
            do {
                try await viewModel.fetchImage(for: selectedDog)
            }
            catch APIError.invalidData {
                print("Invalid Data")
            } catch APIError.invalidUrl{
                print("Invalid Url")
            } catch APIError.invalidResponse{
                print("Invalid Response")
            } catch {
                print("Unexpected Error")
            }
        }
    }
}

#Preview {
    DogDetailView(selectedDog: "african")
        .environment(DogViewModel())
}
