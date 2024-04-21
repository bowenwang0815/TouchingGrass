import SwiftUI
import GoogleGenerativeAI

import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var image: Image?
    @Binding var plantInfo: String
//    @Binding var isLoading: Bool
    @Environment(\.presentationMode) var presentationMode
    
    var sourceType: UIImagePickerController.SourceType
    
    @Binding var isLoading: Bool

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.sourceType = sourceType
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }

    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: ImagePicker

        init(parent: ImagePicker) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let uiImage = info[.originalImage] as? UIImage {
                parent.isLoading = true
                parent.image = Image(uiImage: uiImage)
                parent.uploadImageToAI(uiImage)
            }
            parent.presentationMode.wrappedValue.dismiss()
        }

        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            parent.presentationMode.wrappedValue.dismiss()
        }
    }

    func uploadImageToAI(_ image: UIImage) {
        let model = GenerativeModel(name: "gemini-pro-vision", apiKey: APIKey.default)

        let prompt = "What's in this picture?"

        Task {
            do {
                let response = try await model.generateContent(prompt, image)
                if let text = response.text {
                    self.plantInfo = text
                    print(self.plantInfo)
                }
            } catch {
                print("Error: \(error)")
            }
            self.isLoading = false
        }
    
    }
}
