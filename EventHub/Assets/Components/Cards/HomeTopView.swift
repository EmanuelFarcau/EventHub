//
//  HomeTopView.swift
//  EventHub
//
//  Created by Raul Emanuel Farcau on 28.11.2022.
//

import SwiftUI

struct HomeTopView: View {
    //  var date: Date
    //    var location: String
    //
    //    init(date: Date, location: String) {
    //        self.date = date
    //        self.location = location
    //    }
    //
    @State private var searchText = ""
    
    var body: some View {
        
        VStack(alignment: .leading){
            
            HStack{
                Text(Date().dayOfWeek()!)
                Text(Date().displayFormat)
            }.font(.system(size: 13).bold())
                .foregroundColor(Color("Purple20"))
                .padding(.leading)
                .padding(.top)
            HStack{
                Text("Oradea, România").font(.system(size: 24).bold())
                    .foregroundColor(.white)
            }.padding(.leading)
            
            ZStack{
                HStack {
                    Image(systemName: "magnifyingglass")
                    TextField("Caută evenimente", text: $searchText)
                        .foregroundColor(Color("Purple20"))
                }
                .foregroundColor(.gray)
                .padding(.leading)
                
            }.frame(width:308, height: 40)
            .background(Color("Purple40"))
            .cornerRadius(20)
            .padding(.bottom)
            
            HStack{
                ColoredButton(title: "Astăzi", color: "Green50", width: 90)
                ColoredButton(title: "Mâine", color: "Orange50", width: 90)
                ColoredButton(title: "Săptămâna aceasta", color: "Orange80", width: 170)
            }
        }.frame(
            minWidth: 0,
            maxWidth: .infinity,
            minHeight: 0,
            maxHeight: 250
        ).background(LinearGradient(gradient: Gradient(colors: [Color("topGradient"), Color("bottomGradient")]), startPoint: .top, endPoint: .bottom)).cornerRadius(35)
    }
    

}

struct HomeTopView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTopView()
    }
}

extension Date {
    func dayOfWeek() -> String? {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "EEEE,"
            return dateFormatter.string(from: self).capitalized            // or use capitalized(with: locale) if you want
        }
    var displayFormat: String{
        self.formatted(
            .dateTime
                .day(.twoDigits)
                .month(.abbreviated)
        )
    }
}
