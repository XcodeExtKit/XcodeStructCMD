

typealias XCInvocation = XCSourceEditorCommandInvocation

extension XCInvocation: XCInvocationP {}
public extension XCInvocation {
    
    var lastSelectedLineIdx: Int? {
        buffer.lastSelectedLineIdx
    }
    
    var tabWidth: Int {
        buffer.tabWidth
    }
    
    var contentUTI: Str {
        buffer.contentUTI
    }
    
    /// selects text in the given range
    func selectLines(startIndex: Int,
                     endIndex: Int) {
        buffer.selectLines(startIndex: startIndex,
                           endIndex: endIndex)
    }
    
    /// inserts string at given index, can be line with breaks -> will immediately regenerate current buffer
    func insert(_ str: Str,
                at lineIndex: Int) {
        buffer.insert(str, at: lineIndex)
    }

    /// insert text at the very bottom
    func addAtTheBottom(_ str: Str) {
        buffer.addAtTheBottom(str)
    }
}
