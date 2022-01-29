extension Array {
    mutating func resize(to size: Int, with filler: Element) {
        let sizeDifference = size - count
        guard sizeDifference != 0 else {
            return
        }
        if sizeDifference > 0 {
            self.append(contentsOf: Array<Element>(repeating: filler, count: sizeDifference));
        }
        else {
            self.removeLast(sizeDifference * -1)
        }
    }

    func resized(to size: Int, with filler: Element) -> Array {
        var selfCopy = self;
        selfCopy.resize(to: size, with: filler)
        return selfCopy
    }
}
