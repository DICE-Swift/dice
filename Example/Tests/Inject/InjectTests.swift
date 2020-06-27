import XCTest
import DICE

class InjectTests: XCTestCase {
    
    @Inject var injectableService: InjectableServiceType
    
    override func setUp() {
        super.setUp()
        
        Dependencies.shared.register({ InjectableService() as InjectableServiceType })
    }
    
    func testInjectatbleServiceShouldBeAccessible() {
        injectableService.test()
    }
    
}
