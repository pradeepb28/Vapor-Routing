import Vapor

let drop = Droplet()

//get
drop.get("/") { _ in
  return "Welcome!"
}

drop.get("helloworld") { _ in
    return "Hello World!"
}

//nesting
drop.get("welcome", "helloworld") { request in
   return "Welcome, Hello World!"
}

//with parameter
drop.get("name",":name") { request in
  if let name = request.parameters["name"]?.string {
    return "Welcome, \(name)"
  }
  return "Unable to retrieve the key:name from JSON.\n \(request)"
}

drop.get("/userId/:userId") { request in
  if let userId = request.parameters["userId"]?.string {
    return "\(userId)"
  }
  return ""
}

//Type-safe parameters
drop.get("age", Int.self) { request, age in
  return "\(age)"
}

//multiple-parametes
drop.get("userId/:userId/name/:name/age/:age") { request in
  if let userId = request.parameters["userId"]?.string, let name =  request.parameters["name"]?.string, let age = request.parameters["age"]?.string {
    return "\(userId), \(name), \(age)"
  }
  return ""
}


drop.run()
