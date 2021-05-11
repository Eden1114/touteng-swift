//
//  HScrollViewController.swift
//  touteng-swift
//
//  Created by Eden on 2021/5/10.
//

import SwiftUI

private let kLabelWidth: CGFloat = 60
private let kButtonHeight: CGFloat = 24

struct HomeNavigationBar: View {
    @Binding var leftPercent: CGFloat
  
    var body: some View {
        HStack(alignment: .top, spacing: 0) {
            VStack(spacing: 3) {
                HStack(spacing: 0){
                    Text("推荐")
                        .bold()
                        .frame(width: kLabelWidth, height: kButtonHeight)
                        .padding(.top, 5)
                        .opacity(Double(getOpacity(left: leftPercent, labelloc: 0)))
                        .onTapGesture {
                            withAnimation{
                                self.leftPercent = 0
                            }
                        }
                    Spacer()
                    
                    Text("科技")
                        .bold()
                        .frame(width: kLabelWidth, height: kButtonHeight)
                        .padding(.top, 5)
                        .opacity(Double(getOpacity(left: leftPercent, labelloc: 1)))
                        .onTapGesture {
                            withAnimation{
                                self.leftPercent = 1
                            }
                        }
                    Spacer()
                    
                    Text("军事")
                        .bold()
                        .frame(width: kLabelWidth, height: kButtonHeight)
                        .padding(.top, 5)
                        .opacity(Double(getOpacity(left: leftPercent, labelloc: 2)))
                        .onTapGesture {
                            withAnimation{
                                self.leftPercent = 2
                            }
                        }
                    Spacer()
                    
                    Text("娱乐")
                        .bold()
                        .frame(width: kLabelWidth, height: kButtonHeight)
                        .padding(.top, 5)
                        .opacity(Double(getOpacity(left: leftPercent, labelloc: 3)))
                        .onTapGesture {
                            withAnimation{
                                self.leftPercent = 3
                            }
                        }
                }
                .font(.system(size: 20))
                
                
                RoundedRectangle(cornerRadius: 2)
                    .foregroundColor(.orange)
                    .frame(width: 30, height: 4)
                    .offset(x: getOffset(left: self.leftPercent))
            }
            .frame(width: UIScreen.main.bounds.width * 0.75)
        }
        .frame(width: UIScreen.main.bounds.width)
    }
}

func getOffset(left: CGFloat) -> CGFloat {
    let width_space = (UIScreen.main.bounds.width * 0.75 - 4 * kLabelWidth)/3
    var off: CGFloat
    if left == 0 {
        off = UIScreen.main.bounds.width * 0.75 * (-0.5) + kLabelWidth * 0.5
    } else if left == 1 {
        off = UIScreen.main.bounds.width * 0.75 * (-0.5) + kLabelWidth * 1.5 + width_space
    } else if left == 2 {
        off = UIScreen.main.bounds.width * 0.75 * (-0.5) + kLabelWidth * 2.5 + width_space * 2
    } else {
        off = UIScreen.main.bounds.width * 0.75 * (-0.5) + kLabelWidth * 3.5 + width_space * 3
    }
    return off
    
}

func getOpacity(left: CGFloat, labelloc: CGFloat) -> CGFloat {
    if left == labelloc {
        return 1
    } else {
        return 0.5
    }
}


struct HomeNavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        HomeNavigationBar(leftPercent: .constant(2))
    }
}
