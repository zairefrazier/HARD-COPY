//
//  PaymentHandler.swift
//  Hard Copy
//
//  Created by Zaire on 7/8/22.
//

import Foundation
import PassKit

typealias PaymentCompletionHandler = (Bool) -> Void

class PaymentHandler: NSObject {
    
    var paymentController: PKPaymentAuthorizationController?
    var paymentSummaryItems = [PKPaymentSummaryItem]()
    var paymentStatus = PKPaymentAuthorizationStatus.failure
    var completionHandler: PaymentCompletionHandler?
    
    static let supportedNetworks: [PKPaymentNetwork] = [
        .visa,
        .masterCard
                
    ]
    
    func shipperMethodCalculator() -> [PKShippingMethod] {
        let today = Date()
        let calender = Calendar.current
        
        let shippingStart = calender.date(byAdding: .day, value: 5, to: today)
        
        let shippingEnd = calender.date(byAdding: .day, value: 10, to: today)
        
        
        if let shippingEnd = shippingEnd, let shippingStart = shippingStart {
            
            let startComponents = calender.dateComponents([.calendar, .year, .month, .day], from: shippingStart)
            let endComponents = calender.dateComponents([.calendar, .year, .month, .day], from: shippingEnd)
            
            
            let shippingDelivery = PKShippingMethod(label: "Delivery", amount: NSDecimalNumber(string: "0.00"))
            
            shippingDelivery.dateComponentsRange = PKDateComponentsRange(start: startComponents, end: endComponents)
            
            shippingDelivery.detail = "Shirts sent to your address"
            shippingDelivery.identifier = "DELIVERY"
            
            return [shippingDelivery]
            
            
        }
        return []
        
    }
    
    func startPayment(products: [Product], total: Int, completion: @escaping PaymentCompletionHandler) {
        
        completionHandler = completion
        paymentSummaryItems = []
        
        products.forEach{ product in
            let item = PKPaymentSummaryItem(label: product.style + ", " + product.size , amount: NSDecimalNumber(string: "\(product.price).00"), type: .final)
            paymentSummaryItems.append(item)
            
            
            
            
        }
        
        let total = PKPaymentSummaryItem(label: "HARD COPY LLC", amount: NSDecimalNumber(string: "\(total).00"), type: .final)
        paymentSummaryItems.append(total)
        
        let paymentRequest = PKPaymentRequest()
        paymentRequest.paymentSummaryItems = paymentSummaryItems
        paymentRequest.merchantIdentifier = "merchant.com.hard--copy.HARDCOPY"
        paymentRequest.merchantCapabilities = .capability3DS
        paymentRequest.countryCode = "US"
        paymentRequest.currencyCode = "USD"
        paymentRequest.supportedNetworks = PaymentHandler.supportedNetworks
        paymentRequest.shippingType = .delivery
        paymentRequest.shippingMethods = shipperMethodCalculator()
        paymentRequest.requiredShippingContactFields = [.name, .postalAddress]
        
        paymentController = PKPaymentAuthorizationController(paymentRequest: paymentRequest)
        paymentController?.delegate = self
        paymentController?.present(completion: { (presented: Bool) in
            if presented {
                debugPrint("Presented Payment Controller")
            } else {
                debugPrint("Failed to Present Payment Controller")

            }
        })
        
    }
}
extension PaymentHandler: PKPaymentAuthorizationControllerDelegate {
    func paymentAuthorizationController(_ controller: PKPaymentAuthorizationController, didAuthorizePayment payment: PKPayment, handler completion: @escaping (PKPaymentAuthorizationResult) -> Void) {
        let errors = [Error]()
        let status = PKPaymentAuthorizationStatus.success
        
        self.paymentStatus = status
        completion(PKPaymentAuthorizationResult(status: status, errors: errors))
    }
    
    func paymentAuthorizationControllerDidFinish(_ controller: PKPaymentAuthorizationController) {
        controller.dismiss {
            DispatchQueue.main.async {
                if self.paymentStatus == .success {
                    if let completionHandler = self.completionHandler {
                        completionHandler(true)
                    }
                    
                } else {
                    if let completionHandler = self.completionHandler {
                        completionHandler(false)
                    }
                }
            }
        }
    }
}
