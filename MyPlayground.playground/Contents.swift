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
