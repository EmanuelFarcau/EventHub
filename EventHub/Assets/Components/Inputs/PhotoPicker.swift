//
//  PhotoPicker.swift
//  EventHub
//
//  Created by Raul Emanuel Farcau on 07.12.2022.
//

import SwiftUI
import PhotosUI

struct PhotoPicker: View {
    
    
    @State var selectedItems: [PhotosPickerItem] = []
    @Binding var image: UIImage
    
    init(image: Binding<UIImage>) {
        self._image = image
    }
    
    var body: some View {
        VStack{
            
            Text("Copertă eveniment")
                .foregroundColor(Color("Black20"))
            
            
            if let image {
                Image(uiImage: image)
                    .resizable()
            }
            //Spacer()
            PhotosPicker(
                selection: $selectedItems,
                maxSelectionCount: 1,
                matching: .images
            ){
                Text("Selectează")
                    .frame(width: 112, height: 36)
                    .background(Color(.lightGray))
                    .cornerRadius(8)
                    .foregroundColor(.white)
                    .font(.system(size: 13).bold())
            }.onChange(of: selectedItems) { newValue in
                guard let item = selectedItems.first else{
                    return
                }
                item.loadTransferable(type: Data.self) { result in
                    switch result {
                    case .success(let data):
                        if let data = data {
                            image = UIImage(data: data) ?? UIImage()
                        } else {
                            print ("Data is nil")
                        }
                    case .failure(let failure):
                        fatalError("\(failure)")
                    }
                }
            }
        }.frame(minWidth: 0,
                maxWidth: .infinity,
                minHeight: 0,
                maxHeight: 160)
            .background(Color("Black10"))
    }
}


//struct PhotoPicker_Previews: PreviewProvider {
//    static var previews: some View {
//        PhotoPicker()
//    }
//}
