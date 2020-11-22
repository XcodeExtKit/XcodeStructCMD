

@_exported import XcodeExtBase


//TODO: consider making BaseTypeCMD or protocol ext - to share
class Initializer: BaseCMD {
    
    override func exec(with invoc: XCInvocation) {
        
        let b = invoc.buffer
        
        if let selectedLines = b.selectedLines,
           let str = generateInit(propertyLines: selectedLines,
                                  tabIndent: b.indentationWidth,
                                  usesTabs: b.usesTabsForIndentation) {
            // with newLines - buffer will autogenerate
            b.replaceSelectedLines(with: [str])
        }
    }
    
    /// extracts properties from lines (var / let) and uses them to generate init
    /// returns nil - if no properties were found
    func generateInit(propertyLines: [Str],
                      tabIndent: Int,
                      usesTabs: Bool) -> Str? {
        
        //TODO:
        // dash is not parsed !
        // add var optional
        
        guard let args = parseArgs(propertyLines) else {
            return nil
        }
        return makeInitDecl(args, optional: false, usesTabs: usesTabs, tabIndent: tabIndent)
    }
}
