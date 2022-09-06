//
//  SenderView.swift
//  MC_assignmet_1
//
//  Created by k2rth1k on 9/3/22.
//

import SwiftUI

struct SenderView: View {
    @StateObject var appState : AppState
    @State private var username: String = ""

    var body: some View {
        Spacer()
        VStack{
            if appState.capturePhoto != nil{
                appState.capturePhoto? .resizable()
                    .frame(width: 400.0, height: 320.0)
            }else{
                Image("logo")
            }
            Spacer()
            Text("Sender Viewer")
            TextField(
                    "User name (email address)",
                    text: $username
                )
                .onSubmit {
                }
                .textInputAutocapitalization(.never)
                .disableAutocorrection(true)
                .border(.secondary)
            Button(action: {
                let imageToUpload = appState.uiCapturedPhoto
                saveImage(image: (imageToUpload ?? UIImage(named:"logo")!), name: "new")
                
            }, label: {
                Text("upload image to server")
            })
            
            Button(action: {
                appState.route=routesType.camera
            }, label:{
                Text("go to camera view")
            })
            Spacer()
        }
        
    }
}

struct SenderView_Previews: PreviewProvider {
    static var previews: some View {
        SenderView(appState: AppState())
    }
}


func saveImage(image: UIImage, name:String) {
    let url="https://eec1-2600-8800-1b03-2f00-29-3257-5826-3b5b.ngrok.io"+"/poster"
    let req = NSMutableURLRequest(url: NSURL(string:url)! as URL)
    let ses = URLSession.shared
    req.httpMethod="POST"
    req.setValue("application/octet-stream", forHTTPHeaderField: "Content-Type")
    req.setValue(name, forHTTPHeaderField: "X-FileName")
    let jpgData = image.jpegData(compressionQuality: 0.1);
    req.httpBodyStream = InputStream(data: jpgData!)
    let task = ses.uploadTask(withStreamedRequest: req as URLRequest)
    task.resume()
}
