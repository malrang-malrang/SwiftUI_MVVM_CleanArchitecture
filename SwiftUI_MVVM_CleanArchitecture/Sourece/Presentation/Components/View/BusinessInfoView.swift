//
//  BusinessInfoView.swift
//  FirstSwiftUI
//
//  Created by 김동욱 on 11/4/23.
//

import SwiftUI

struct BusinessInfoView: View {
  @State private var isPhoneNumberSheet = false
  @State private var isFold: Bool = false

  var body: some View {
    GeometryReader { geometry in
      VStack(alignment: .leading) {

        self.customerCenterView()

        self.operatingInfoView()
          .padding(.top, 1)

        self.toInquireButtonListView()

        Divider()
          .padding([.top, .bottom], 10)

        self.detailView()
          .clipped()
          .animation(.linear, value: self.isFold)
          .transition(.slide)
      }
      .frame(width: geometry.size.width, alignment: .topLeading)
      .background(ColorPalette.Gray.gray2)
    }
  }

  @ViewBuilder
  func customerCenterView() -> some View {
    VStack {
      Button(action: {}) {
        Text(Constant.customerCenter)
          .bold()
          .font(.callout)
        Image(systemName: "chevron.right")
      }
      .tint(.black)
      .padding([.top, .trailing, .bottom], 5)

      Text(Constant.customerCenterNumber)
        .bold()
        .foregroundStyle(ColorPalette.Gray.gray7)
        .font(.callout)
    }
  }

  @ViewBuilder
  func operatingInfoView() -> some View {
    VStack(alignment: .leading, spacing: 4) {
      HStack {
        Text(Constant.on)
          .foregroundStyle(ColorPalette.Gray.gray6)
        Text(Constant.operatingHours)
          .font(.caption)
          .foregroundStyle(ColorPalette.Gray.gray7)
      }
      HStack {
        Text(Constant.on)
          .foregroundStyle(ColorPalette.Gray.gray6)
        Text(Constant.breaktime)
          .bold()
          .font(.caption)
          .foregroundStyle(ColorPalette.Gray.gray7)
        Text(Constant.firstBreakTime)
          .font(.caption)
          .foregroundStyle(ColorPalette.Gray.gray7)
        Divider().frame(width: 2, height: 20)
        Text(Constant.secondBreakTime)
          .font(.caption)
          .foregroundStyle(ColorPalette.Gray.gray7)
        Divider().frame(width: 2, height: 20)
        Text(Constant.thirdBreakTime)
          .font(.caption)
          .foregroundStyle(ColorPalette.Gray.gray7)
      }
    }
  }

  @ViewBuilder
  func toInquireButtonListView() -> some View {
    HStack(spacing: 10) {
      BorderPaddingButton(
        systemName: "phone",
        title: Constant.contactByPhone,
        action: {}
      )
      BorderPaddingButton(
        systemName: "bubble.left",
        title: Constant.contactingUsViaChat,
        action: {}
      )
    }
  }

  @ViewBuilder
  func detailView() -> some View {
    VStack(alignment: .leading, spacing: 20) {
      self.teamFreshFoldingButton()
      self.termsListView()
      if self.isFold {
        self.companyInfoView()
      }
    }
  }

  @ViewBuilder
  func teamFreshFoldingButton() -> some View {
    HStack(spacing: 0) {
      Text(Constant.companyName)
        .bold()
        .font(.callout)
      Button(
        action: {
          self.isFold.toggle()
        }, label: {
          if self.isFold {
            Image(systemName: "chevron.up")
              .resizable()
              .frame(width: 10, height: 5)
              .tint(ColorPalette.Gray.gray7)
              .padding(7)
          } else {
            Image(systemName: "chevron.down")
              .resizable()
              .frame(width: 10, height: 5)
              .tint(ColorPalette.Gray.gray7)
              .padding(7)
          }
        })
    }
  }

  @ViewBuilder
  func termsListView() -> some View {
    HStack(spacing: 10) {
      Button(
        action: {},
        label: {
          Text(Constant.notice)
            .font(.caption)
            .foregroundStyle(ColorPalette.Gray.gray7)
        }
      )
      Button(
        action: {},
        label: { Text(Constant.termsConditionsOfUse)
            .font(.caption)
            .foregroundStyle(ColorPalette.Gray.gray7)
        }
      )
      Button(
        action: {},
        label: {
          Text(Constant.personalPolicy)
            .bold()
            .font(.caption)
            .foregroundStyle(ColorPalette.Gray.gray7)
        }
      )
      Button(
        action: {},
        label: { Text(Constant.youthProtectionPolicy)
            .font(.caption)
            .foregroundStyle(ColorPalette.Gray.gray7)
        }
      )
    }
  }

  @ViewBuilder
  func companyInfoView() -> some View {
    HStack {
      VStack(alignment: .leading, spacing: 10) {
        Text(Constant.ceo)
          .font(.caption)
          .foregroundStyle(ColorPalette.Gray.gray7)
        Text(Constant.address)
          .font(.caption)
          .foregroundStyle(ColorPalette.Gray.gray7)
        Text(Constant.businessRegistrating)
          .font(.caption)
          .foregroundStyle(ColorPalette.Gray.gray7)
        Text(Constant.mailOrderNumber)
          .font(.caption)
          .foregroundStyle(ColorPalette.Gray.gray7)
        Text(Constant.youthProtectionOfficer)
          .font(.caption)
          .foregroundStyle(ColorPalette.Gray.gray7)
        Text(Constant.hostingProvider)
          .font(.caption)
          .foregroundStyle(ColorPalette.Gray.gray7)
      }
      Spacer()
      VStack(alignment: .trailing, spacing: 10) {
        Text("김동욱")
          .font(.caption)
          .foregroundStyle(ColorPalette.Gray.gray6)
        Text("서울특별시 중랑구 면목로95길 11-5")
          .font(.caption)
          .foregroundStyle(ColorPalette.Gray.gray6)
        Text("566-08-01150")
          .font(.caption)
          .foregroundStyle(ColorPalette.Gray.gray6)
        Text("2023-서울중랑-05495")
          .font(.caption)
          .foregroundStyle(ColorPalette.Gray.gray6)
        Text("김동욱")
          .font(.caption)
          .foregroundStyle(ColorPalette.Gray.gray6)
        Text("(주)말랑")
          .font(.caption)
          .foregroundStyle(ColorPalette.Gray.gray6)
      }
      .frame(alignment: .trailing)
    }
  }
}

private enum Constant {
  static var customerCenter: String { "고객센터" }
  static var customerCenterNumber: String { "1666-3931" }
  static var on: String { "•" }
  static var operatingHours: String { "월~일요일 운영 (공휴일 및 휴게시간 제외)" }
  static var breaktime: String { "휴게시간" }
  static var firstBreakTime: String { " 13~14시" }
  static var secondBreakTime: String { "18~19시" }
  static var thirdBreakTime: String { "04~05시" }
  static var contactByPhone: String { "전화로 문의하기" }
  static var contactingUsViaChat: String { "채팅으로 문의하기" }
  static var companyName: String { "(주)말랑" }
  static var notice: String { "공지사항" }
  static var termsConditionsOfUse: String { "이용약관" }
  static var personalPolicy: String { "개인정보처리방침" }
  static var youthProtectionPolicy: String { "청소년보호정책" }
  static var ceo: String { "대표이사" }
  static var address: String { "주소지" }
  static var businessRegistrating: String { "사업자등록번호" }
  static var mailOrderNumber: String { "통신판매번호" }
  static var youthProtectionOfficer: String { "청소년보호책임자" }
  static var hostingProvider: String { "호스팅 제공자" }
}

#Preview { BusinessInfoView() }
