import Vapor

let drop = Droplet()

//get
drop.get("hello") { _ in
    return "Hello World!"
}

//nesting
drop.get("welcome", "hello") { request in
   return "Welcome, Hello World!"
}

//with parameter
drop.get("name",":name") { request in
  if let name = request.parameters["name"]?.string {
    return "Welcome, \(name)"
  }
  return "Unable to retrieve the key:name from JSON.\n \(request)"
}

drop.get("/profession/:profession") { request in
  if let profession = request.parameters["profession"]?.string {
    return "\(profession)"
  }
  return ""
}

//Type-safe parameters
drop.get("age", Int.self) { request, age in
  return "\(age)"
}

//multiple-parametes
drop.get("/name/:name/age/:age") { request in
  if let name =  request.parameters["name"]?.string, let age = request.parameters["age"]?.string {
    return "\(name), \(age)"
  }
  return ""
}


drop.run()
