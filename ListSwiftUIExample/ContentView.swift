import SwiftUI

struct Person: Identifiable {
    var id: Int
    var name: String
}

struct ContentView: View {
    let persons = [Person(id: 1, name: "Alice"), Person(id: 2, name: "Bob")]

    var body: some View {
        VStack {
            // Static list
            List {
                Text("Item 1")
                Text("Item 2")
                Text("Item 3")
            }
            
            // List from Array if type implements Identifiable
            List(persons) { person in
                Text(person.name)
            }
            
            // ... otherwise you need to specify an id property
            List(persons, id: \.id) { person in
                Text(person.name)
            }
            
            // Lists can be combined from multiple sources / have static items
            List {
                Text("Item 1")
                ForEach(self.persons) { person in
                    Text(person.name)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
