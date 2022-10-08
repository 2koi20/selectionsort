import Foundation


func progress(_ asciiList: [Float]) {
    var cache: Float = 1000
    var count: Int = 0
    for i in asciiList {
        if (i<cache) {
            cache = i
            count += 1
        }
    }
    print(count)
}

func toASCII(_ wordList: [String]) -> [Float] {
    var ASCIIList: [Float] = []
    for i in wordList {
        var ASCII: Float = 0
        var count = 0
        for x in i.utf8 {
            
            ASCII += Float(x)/pow(1000.0, Float(count))
            count += 1
        }
        ASCIIList.append(ASCII)
    }
    return(ASCIIList)
}
func bubble(_ wordList: [String]) {
    var outList = wordList
    var array = toASCII(wordList)
    for currentIndex in 0..<(array.count - 1) {
       var minIndex = currentIndex;
        for i in (currentIndex + 1)..<array.count {
            if (array[i] < array[minIndex]) {
                minIndex = i;
            }
        }
        if (minIndex != currentIndex) {
            let temp = array[currentIndex];
            array[currentIndex] = array[minIndex];
            array[minIndex] = temp;
            let tempWord = outList[currentIndex];
            outList[currentIndex] = outList[minIndex];
            outList[minIndex] = tempWord;

        }
    }
    print(outList)
}




var unsortedString = [""]
while let input = readLine() {
    unsortedString.append(input)
}
unsortedString.removeFirst()
bubble(unsortedString)
