

@_exported import XcodeExtBase


//TODO: consider making BaseTypeCommand or protocol ext - to share
class Initializer: BaseCommand {
    
    override func exec(with invoc: XCInvocation) {
        
        let b = invoc.buffer
        
        if let selectedLines = b.selectedLines,
           let str = generateInit(selectedLines,
                                  indentWidth: b.indentationWidth,
                                  usesTabs: b.usesTabsForIndentation) {
            // with newLines - buffer will autogenerate
            b.replaceSelectedLines(with: [str])
        }
    }
    
    /// extracts properties from lines (var / let) and uses them to generate init
    /// returns nil - if no properties were found
    func generateInit(_ lines: [Str],
                      indentWidth: Int,
                      usesTabs: Bool) -> Str? {
        
        //TODO: dash is not parsed !
        guard let funcArgs = parseArgs(lines,
                                           indentWidth: indentWidth,
                                           usesTabs: usesTabs) else {
            return nil
        }
        return makeInitDecl(funcArgs,
                            indentWidth: indentWidth,
                            usesTabs: usesTabs)
    }
}
