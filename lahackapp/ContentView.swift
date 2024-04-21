import UIKit
import SwiftUI
import GoogleGenerativeAI



//struct ContentView: View {
//    @State private var image: Image?
//    @State private var showingImagePicker = false
//    @State private var showingCameraPicker = false
//    @State private var plantInfo = ""
//    @State private var isLoading = false
//    @State private var dataAcquired = false
//    
//    
//    var body: some View {
//        
//        ZStack {
//            let customBG = Color(red: 231/255, green: 250/255, blue: 225/255)
//            customBG
//            
//            
//            VStack {
//                Image("testing123123") // Replace "appLogo" with your actual image asset name
//                    .resizable()
//                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
//            
//                if image == nil{
//                    
//                    //                        .ignoresSafeArea(.all)
//                    Text("Welcome!\nUpload an image or take a photo of a plant you want to learn more about!")
//                        .font(.title)
//                        .fontWeight(.bold)
//                        .foregroundColor(.white)
//                        .multilineTextAlignment(.center)
//                        .padding()
//                        .background(
//                            RoundedRectangle(cornerRadius: 20)
//                                .fill(LinearGradient(gradient: Gradient(colors: [Color(red: 88/255, green: 174/255, blue: 125/255), Color(red: 70/255, green: 139/255, blue: 100/255)]), startPoint: .topLeading, endPoint: .bottomTrailing))
//                                .shadow(color: Color.black.opacity(0.5), radius: 5, x: 0, y: 2)
//                        )
//                        .padding(.vertical)
//                    
//                }
//                let customShadowColor = Color(red: 161/255, green: 175/255, blue: 157/255)
//                image?
//                    .resizable()
//                    .scaledToFit()
//                    .clipShape(RoundedRectangle(cornerRadius: 10))
//                    .overlay(
//                        RoundedRectangle(cornerRadius: 10)
//                            .stroke(Color.black, lineWidth: 1)
//                    )
//
//                
//                Button(action: {
//                    showingImagePicker = true
//                }) {
//                    Text("Select Image")
//                    
//                        .padding()
//                        .font(.headline)
//                        .foregroundColor(.white)
//                        .frame(maxWidth: .infinity)
//                        .background(
//                            RoundedRectangle(cornerRadius: 10)
//                                .fill(LinearGradient(gradient: Gradient(colors: [Color.green, Color(red: 170/255, green: 229/255, blue: 156/255)]), startPoint: .topLeading, endPoint: .bottomTrailing))
//                                .shadow(color: customShadowColor, radius: 5, x: 0, y: 0)
//                        )
//                        .padding(.horizontal)
//                }
//                .padding(.horizontal)
//
//                
//                Button(action: {
//                    showingCameraPicker = true
//                }) {
//                    Text("Take Photo")
//                        .padding()
//                        .font(.headline)
//                        .foregroundColor(.white)
//                        .frame(maxWidth: .infinity)
//                        .background(
//                            RoundedRectangle(cornerRadius: 10)
//                                .fill(LinearGradient(gradient: Gradient(colors: [Color.green, Color(red: 170/255, green: 229/255, blue: 156/255)]), startPoint: .topLeading, endPoint: .bottomTrailing))
//                                .shadow(color: customShadowColor, radius: 5, x: 0, y: 0)
//                        )
//                        .padding(.horizontal)
//
//                }
//                .padding(.horizontal)
//
//                if isLoading { // Show loading view while isLoading is true
//                    ProgressView("Loading...")
//                        .padding()
//
//                } else {
//                    if image != nil{
//                        if plantInfo.isEmpty {
//                            Text("Sorry, can't load data. Try again")
//                                .font(.headline)
//                                .foregroundColor(.white)
//                                .multilineTextAlignment(.center)
//                                .padding()
//                                .background(
//                                    RoundedRectangle(cornerRadius: 10)
//                                        .fill(LinearGradient(gradient: Gradient(colors: [Color(red: 88/255, green: 174/255, blue: 125/255), Color(red: 70/255, green: 139/255, blue: 100/255)]), startPoint: .topLeading, endPoint: .bottomTrailing))
//                                        .shadow(color: Color.black.opacity(0.5), radius: 5, x: 0, y: 2)
//                                )
//                                .padding(.horizontal)
//                        } else{
//                            Text(plantInfo)
//                                .font(.headline)
//                                .foregroundColor(.white)
//                                .multilineTextAlignment(.center)
//                                .padding()
//                                .background(
//                                    RoundedRectangle(cornerRadius: 10)
//                                        .fill(LinearGradient(gradient: Gradient(colors: [Color(red: 88/255, green: 174/255, blue: 125/255), Color(red: 70/255, green: 139/255, blue: 100/255)]), startPoint: .topLeading, endPoint: .bottomTrailing))
//                                        .shadow(color: Color.black.opacity(0.5), radius: 5, x: 0, y: 2)
//                                )
//                                .padding(.horizontal)
//                        }
//                    }
//                }
//
//            }
//            .sheet(isPresented: $showingImagePicker) {
//                ImagePicker(image: $image, plantInfo: $plantInfo, sourceType: .photoLibrary, isLoading: $isLoading)
//            }
//            .sheet(isPresented: $showingCameraPicker) {
//                ImagePicker(image: $image, plantInfo: $plantInfo, sourceType: .camera, isLoading: $isLoading)
//            }
//            .padding()
//        }
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}


// ASL:JFESOGI:LKSJFLKS



struct ContentView: View {
    @State private var image: Image?
    @State private var showingImagePicker = false
    @State private var showingCameraPicker = false
    @State private var plantInfo = ""
    @State private var isLoading = false
    @State private var dataAcquired = false // New state variable to track if data is acquired

    var body: some View {
        ZStack {
            let customBG = Color(red: 231/255, green: 250/255, blue: 225/255)
            customBG
            
            VStack {
                if !dataAcquired { // Show this view if data is not acquired
                    Image("testing123123") // Replace "appLogo" with your actual image asset name
                        .resizable()
                        .frame(width: 100, height: 100)
                    
//                    if image == nil {
                    Text("Welcome!\nUpload an image or take a photo of a plant you want to learn more about!")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(LinearGradient(gradient: Gradient(colors: [Color(red: 88/255, green: 174/255, blue: 125/255), Color(red: 70/255, green: 139/255, blue: 100/255)]), startPoint: .topLeading, endPoint: .bottomTrailing))
                                .shadow(color: Color.black.opacity(0.5), radius: 5, x: 0, y: 2)
                        )
                        .padding(.vertical)
//                    }

                    let customShadowColor = Color(red: 161/255, green: 175/255, blue: 157/255)
//                    image?
//                        .resizable()
//                        .scaledToFit()
//                        .clipShape(RoundedRectangle(cornerRadius: 10))
//                        .overlay(
//                            RoundedRectangle(cornerRadius: 10)
//                                .stroke(Color.black, lineWidth: 1)
//                        )

                    Button(action: {
                        dataAcquired = true
                        showingImagePicker = true
                    }) {
                        Text("Select Image")
                            .padding()
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(LinearGradient(gradient: Gradient(colors: [Color.green, Color(red: 170/255, green: 229/255, blue: 156/255)]), startPoint: .topLeading, endPoint: .bottomTrailing))
                                    .shadow(color: customShadowColor, radius: 5, x: 0, y: 0)
                            )
                            .padding(.horizontal)
                    }
                    .padding(.horizontal)

                    Button(action: {
                        dataAcquired = true
                        showingCameraPicker = true
                    }) {
                        Text("Take Photo")
                            .padding()
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(LinearGradient(gradient: Gradient(colors: [Color.green, Color(red: 170/255, green: 229/255, blue: 156/255)]), startPoint: .topLeading, endPoint: .bottomTrailing))
                                    .shadow(color: customShadowColor, radius: 5, x: 0, y: 0)
                            )
                            .padding(.horizontal)
                    }
                    .padding(.horizontal)
    
                } else { // Show this view if data is acquired
                    let customShadowColor = Color(red: 161/255, green: 175/255, blue: 157/255)
                    VStack {
                        if let image = image {
                            image
                                .resizable()
                                .scaledToFit()
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.black, lineWidth: 1)
                                )
                        }
                        if isLoading { // Show loading view while isLoading is true
                            ProgressView("Loading...")
                                .padding()
                        } else{
                            if !plantInfo.isEmpty {
                                Text(plantInfo)
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .multilineTextAlignment(.center)
                                    .padding()
                                    .background(
                                        RoundedRectangle(cornerRadius: 10)
                                            .fill(LinearGradient(gradient: Gradient(colors: [Color(red: 88/255, green: 174/255, blue: 125/255), Color(red: 70/255, green: 139/255, blue: 100/255)]), startPoint: .topLeading, endPoint: .bottomTrailing))
                                            .shadow(color: Color.black.opacity(0.5), radius: 5, x: 0, y: 2)
                                    )
                                    .padding(.horizontal)
                            } else{
                                Text("Sorry, can't load data. Try again")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .multilineTextAlignment(.center)
                                    .padding()
                                    .background(
                                        RoundedRectangle(cornerRadius: 10)
                                            .fill(LinearGradient(gradient: Gradient(colors: [Color(red: 88/255, green: 174/255, blue: 125/255), Color(red: 70/255, green: 139/255, blue: 100/255)]), startPoint: .topLeading, endPoint: .bottomTrailing))
                                            .shadow(color: Color.black.opacity(0.5), radius: 5, x: 0, y: 2)
                                    )
                                    .padding(.horizontal)
                            }
                            
                            Button(action: {
                                dataAcquired = false // Go back to the original screen
                            }) {
                                Text("Go Back")
                                    .padding()
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity)
                                    .background(
                                        RoundedRectangle(cornerRadius: 10)
                                            .fill(LinearGradient(gradient: Gradient(colors: [Color.green, Color(red: 170/255, green: 229/255, blue: 156/255)]), startPoint: .topLeading, endPoint: .bottomTrailing))
                                            .shadow(color: customShadowColor, radius: 5, x: 0, y: 0)
                                    )
                                    .padding(.horizontal)
                            }
                            .padding(.horizontal)
                        }
                    }
                }
            }
            .sheet(isPresented: $showingImagePicker) {
                ImagePicker(image: $image, plantInfo: $plantInfo, sourceType: .photoLibrary, isLoading: $isLoading)
            }
            .sheet(isPresented: $showingCameraPicker) {
                ImagePicker(image: $image, plantInfo: $plantInfo, sourceType: .camera, isLoading: $isLoading)
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

