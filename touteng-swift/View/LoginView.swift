//
//  LoginView.swift
//  touteng-swift
//
//  Created by cqs on 2021/5/12.
//

import SwiftUI

let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0)

// 预设账号和密码
//let storedUsername = "toutong"
//let storedpassword = "toutong"

struct LoginView: View {
    

    @State var username: String = ""
    @State var password: String = ""
    
    @State var authenticationDidFail: Bool = false // 验证失败
    @State var authenticationDidSucceed: Bool = false // 验证成功
    
    @Binding var showflag2: Bool
    @State var logined : Int = 0
    
    var body: some View {
        ZStack{
            
        VStack{
            HelloText()  // 欢迎！
            UserImg()  // 用户头像
            UsernameTextField(username: $username) // 用户名输入区域
            PasswordSecureField(password: $password) // 密码输入区域
            
            // 判断是否通过账号验证
            /*
            if self.username==storedUsername&&self.password==storedpassword{
                self.authenticationDidSucceed = true
                //self.authenticationDidFail = false
                self.showflag2 = true
            }
            */
            if authenticationDidFail{
                Text("用户名或密码错误，请重新输入")
                    .offset(y: -10)
                    .foregroundColor(.red)
            }
            if authenticationDidSucceed{
                Text("成功登录!")
                    .offset(y: -200)
                    .foregroundColor(.green)
                    .font(.headline)
                    .animation(Animation.default)
            }
            /*
            Button(action:{
                if self.username == storedUsername && self.password == storedpassword{
                    self.authenticationDidSucceed = true
                }
            }){
                LoginButtonContent()
            }
        */
            
            // 按钮
            Button("登录"){
                 self.showflag2.toggle()
                }
            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .foregroundColor(.orange)
            .overlay(
            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                .stroke(Color.orange, lineWidth: 2)
            )
           .padding(10)
                
            //Button(action:{print("Button tapped")}){
              //  LoginButtonContent()
            //}
        }
        .padding()
            
        }
        .padding()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(showflag2: .constant(true))
    }
}

// 欢迎！
struct HelloText: View{
    var body: some View{
        Text("  欢 迎 使 用 ！")
            .font(.largeTitle)
            .fontWeight(.bold)
            .foregroundColor(.orange)
            .fontWeight(.semibold)
            .padding(.bottom, 20)
    }
}

// 用户头像
struct UserImg: View{
    var body: some View{
        Image("UserImg")
            .resizable()
                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
            .frame(width: 150, height: 150)
            .clipped()
            .cornerRadius(150)
            .padding(.bottom, 50)
    }
}

// 登录按钮
struct LoginButtonContent: View{
    var body: some View{
        Text("登 录")
            .font(Font.system(size: 18))
            //.font(.headline)
            .fontWeight(.bold)
            .foregroundColor(.orange)
            .padding()
            .frame(width: 100, height: 40)
            .overlay(
            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                .stroke(Color.orange, lineWidth: 4))
    }
}

// 用户名输入文本区
struct UsernameTextField: View{
    @Binding var username: String
    var body: some View{
        TextField("用户名", text: $username)
            .padding()
            .background(lightGreyColor)
            .cornerRadius(5.0)
            .padding(.bottom, 20)    }
}

// 密码输入文本区
struct PasswordSecureField: View{
    @Binding var password: String
    var body: some View{
        SecureField("密码", text: $password)
            .padding()
            .background(lightGreyColor)
            .cornerRadius(5.0)
            .padding(.bottom, 20)   }
}
