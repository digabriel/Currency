// I
//(3-1) * (-(3-9))

// II
func isAnagram(first: String, second: String) -> Bool {
    let firstSanitized = first.filter { $0 != " " }.lowercased()
    let secondSanitized = second.filter { $0 != " " }.lowercased()
    
    return firstSanitized.sorted() == secondSanitized.sorted()
}


// III.a
// Recursive (considering that the sequence starts with 1)
func getFibonacciAt(position: Int) -> Int {
    guard position > 1 else { return 1 }
    return getFibonacciAt(position: position-1) + getFibonacciAt(position: position-2)
}

// III.b
// Iterative (considering that the sequence starts with 1)
func getFibonacciAt2(position: Int) -> Int {
    guard position > 1 else { return 1 }
    
    var last1 = 1
    var last2 = 1
    
    for _ in 2...position {
        let new = last1 + last2
        last1 = last2
        last2 = new
    }
    
    return last2
}

isAnagram(first: "dimas", second: "imads")
getFibonacciAt(position: 10)
getFibonacciAt2(position: 10)

// IV
/*
I will use Clean Architecture (using MVVM on the Presentation layer). For that, I’m thinking this app as a large scale production app that will need to be updated and maintained by several years (containing Rest API integrations, local caches, multiple devices support, etc).
 
With Clean Architecture we have a great modularization and separation of concerns, using 3 layers/modules: Presentation, Domain and Data.

Domain defines the logic and business rules, and keeps isolated from the rest of the modules. With that is possible to extract the domain code and use in a watch/iPad app, or even on Mac OS.

The Data layer defines the integrations with external resources and communicates only with the domain. On this app, if in sometime we need to change the fixe.io API by another API, is simple as implementing a new Data Source for the new API. No modifications on the Domain or Presentations layers will be necessary to start consuming another currency API.

The presentation layer communicates only with the domain, so changes to the complete layout of the app have no impact on other layers.

Another thing that I’ve implemented on this app is a concept of Mocked Repositories. All repositories on the data Layer have mocked versions (that implements a contract/protocol), so we can develop the app logic and the presentation layer before any external integration. This is useful  especially when an API (eg, a remote REST API) is being developed at the same time of the app.  When we are done with mocking, all that is need to do is implement the remote version respecting the same repository protocol. To test this, the app have to Schemes with separated build configurations: Currency and CurrencyMock.
*/
