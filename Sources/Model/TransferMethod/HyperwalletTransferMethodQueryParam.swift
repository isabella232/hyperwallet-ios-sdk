//
// Copyright 2018 - Present Hyperwallet
//
// Permission is hereby granted, free of charge, to any person obtaining a copy of this software
// and associated documentation files (the "Software"), to deal in the Software without restriction,
// including without limitation the rights to use, copy, modify, merge, publish, distribute,
// sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all copies or
// substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING
// BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
// NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
// DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

import Foundation

/// Representation of the common transfer method's query parameters.
public class HyperwalletTransferMethodQueryParam: QueryParam {
    private enum QueryParam: String {
        case status
        case type
    }
    /// Returns transfer method with this status.
    public var status: QueryStatus?
    /// The transfer method  type.
    public var type: QueryType?

    /// Representation of the bank account status
    public enum QueryStatus: String {
        /// Filter by activated bank accounts
        case activated = "ACTIVATED"
        /// Filter by deActivated bank accounts
        case deActivated = "DE_ACTIVATED"
        /// Filter only invalid bank accounts
        case invalid = "INVALID"
        /// Filter only verified bank accounts
        case verified = "VERIFIED"
    }

    /// Representation of the field's sortable
    public enum QuerySortable: String {
        /// Sort the result by ascendant created on
        case ascendantCreatedOn = "+createdOn"
        /// Sort the result by ascendant status
        case ascendantStatus = "+status"
        /// Sort the result by descendant created on
        case descendantCreatedOn = "-createdOn"
        /// Sort the result by descendant status
        case descendantStatus = "-status"
    }

    /// Represents the Bank Account types.
    public enum QueryType: String {
        /// The Bank account type
        case bankAccount = "BANK_ACCOUNT"
        /// The Wire account type
        case wireAccount = "WIRE_ACCOUNT"
        /// The Bank Card  type
        case bankCard = "BANK_CARD"
        /// The PayPal account type
        case payPalAccount = "PAYPAL_ACCOUNT"
        /// The Prepaid Card  type
        case prepaidCard = "PREPAID_CARD"
        /// The Venmo account type 
        case venmoAccount = "VENMO_ACCOUNT"
    }

    override public func toQuery() -> [String: String] {
        var query = super.toQuery()

        if let status = status {
            query[QueryParam.status.rawValue] = status.rawValue
        }

        if let type = type {
            query[QueryParam.type.rawValue] = type.rawValue
        }
        return query
    }
}
