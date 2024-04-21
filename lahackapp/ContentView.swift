import SwiftUI
import UIKit // Add this import
import GoogleGenerativeAI



struct ContentView: View {
    @State private var image: Image?
    @State private var showingImagePicker = false
    @State private var showingCameraPicker = false
    @State private var plantInfo = ""
    
    var body: some View {
        VStack {
            image?
                .resizable()
                .scaledToFit()
            
            Button("Select Image") {
                showingImagePicker = true
            }
            .padding()
            
            Button("Take Photo") {
                showingCameraPicker = true
            }
            .padding()
            
            Text(plantInfo)
                .padding()
        }
        .sheet(isPresented: $showingImagePicker) {
            ImagePicker(image: $image, plantInfo: $plantInfo, sourceType: .photoLibrary)
        }
        .sheet(isPresented: $showingCameraPicker) {
            ImagePicker(image: $image, plantInfo: $plantInfo, sourceType: .camera)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
