import Foundation

// #1 გვაქვს 1,5,10,20 და 50 თეთრიანი მონეტები. დაწერეთ ფუნქცია, რომელსაც გადაეცემა თანხა (თეთრებში) და აბრუნებს მონეტების მინიმალურ რაოდენობას, რომლითაც შეგვიძლია ეს თანხა დავახურდაოთ.


func minSplit(amount: Int) -> Int {
    var table = [Int](repeating: Int.max, count: amount + 1)
    
    // საწყისი მონეტა/თეთრი:
    table[0] = 0 // 0 რაოდენობის მონეტსსათვის
    table[1] = 1 // 1 თეთრის რაოდენობისათვის
    
    for i in 2 ... amount {
        
        for coin in [50, 20, 10, 5, 1] {
            if i >= coin {
                table[i] = min(table[i], table[i - coin] + 1)
            }
        }
    }
    return table[amount]
}

//Test
minSplit(amount: 9)
minSplit(amount: 26)
minSplit(amount: 172)


// #2 დაწერეთ ფუნქცია რომელიც დააჯამებს ციფრებს ორ რიცსხვს შორის. მაგალითად გადმოგვეცემა 19 და 22. მათ შორის ციფრების ჯამი იქნება :
// 19, 20, 21, 22
// (1 + 9) + (2 + 0) + (2 + 1) + (2 + 2) = 19

func sumOfDigits(_ start: Int, _ end: Int) -> Int {
    var totalSum = 0
    
    for number in start...end {
        var currentNumber = number
        var digitSum = 0
        
        while currentNumber > 0 {
            digitSum += currentNumber % 10
            currentNumber /= 10
        }
        
        totalSum += digitSum
    }
    
    return totalSum
}

// Test
sumOfDigits(7, 8)
sumOfDigits(17, 20)
sumOfDigits(10, 12)

// #3 მოცემულია String რომელიც შედგება „(" და „)" ელემენტებისგან. დაწერეთ ფუნქცია რომელიც აბრუნებს ფრჩხილები არის თუ არა მათემატიკურად სწორად დასმული.

func isProperly(sequence: String) -> Bool {
    var stack = [Character]()
    
    for char in sequence {
        if char == "(" {
            stack.append(char)
        } else if char == ")" {
            if stack.isEmpty {
                return false
            }
            stack.popLast()
        } else {
        }
    }

    return stack.isEmpty
}

// Test
isProperly(sequence: "(()())")
isProperly(sequence: ")(()")
isProperly(sequence: "(()())(")


// #4 გვაქვს N ფიცრისგან შემდგარი ხიდი. სიძველის გამო ზოგიერთი ფიცარი ჩატეხილია. ზურიკოს შეუძლია გადავიდეს შემდეგ ფიცარზე ან გადაახტეს ერთ ფიცარს. (რათქმაუნდა ჩატეხილ   ფიცარზე ვერ გადავა) ჩვენი ამოცანაა დავითვალოთ რამდენი განსხვავებული კომბინაციით შეუძლია ზურიკოს ხიდის გადალახვა. გადმოგვეცემა ხიდის სიგრძე და ინფორმაცია ჩატეხილ ფიცრებზე. 0 აღნიშნავს ჩატეხილ ფიცარს 1_ანი კი მთელს. დასაწყისისთვის ზურიკო დგას ხიდის ერთ მხარეს (არა პირველ ფიცარზე) და გადალახვად ჩათვლება ხიდის მეორე მხარე (ბოლო ფიცრის შემდეგი ნაბიჯი)

func countWays(n: Int, steps: [Int]) -> Int {
    // Create an array to store the number of ways to reach each plank
    var dp = Array(repeating: 0, count: n + 1)
    
    // Initialize the base cases
    dp[0] = 0
    dp[1] = 1
    
    for i in 2...n {
        if steps[i - 1] == 1 {
            dp[i] = dp[i - 1] + dp[i - 2]
        }
    }
    
    return dp[n]
}

// Test (მაგრამ სხვა პასუხებს ვიღებ ვიდრე საწყისი მეილის, ნიმუშშია, ვერ ვხვდები სად მაქვს შეცდომა.
countWays(n: 3, steps: [0, 1, 0])    // ➞ 1
countWays(n: 4, steps: [0, 1, 1, 0])  // ➞ 1
countWays(n: 5, steps: [1, 1, 0, 1, 1]) // ➞ 4


// #5 გადმოგეცემათ მთელი რიცხვი N. დაწერეთ ფუნქცია რომელიც დაითვლის რამდენი 0ით ბოლოვდება N! (ფაქტორიალი)
// შენიშვნა 1000! შედგება 2568 სიმბოლოსაგან.

func zeros(N: Int) -> Int {
    var countZeros = 0
    
    var currentDivisor = 5 // Start with dividing by 5
    
    while currentDivisor <= N {
        countZeros += N / currentDivisor
        currentDivisor *= 5
    }
    
    return countZeros
}

// Test
zeros(N: 7)
zeros(N: 12)
zeros(N: 490)










