ruleset hello_monkey {
    meta {
      name "Hello Monkey"
      description <<
  A first ruleset for the Quickstart
  >>
      author "Phil Windley"
      shares hello, monkey
    }
     
    global {
      hello = function(obj) {
        msg = "Hello Mr." + obj;
        msg
      }
      monkey = function(obj) {
        msg = "Hello new monkeyRule" + obj;
        msg
      }
    }
    
     
    rule hello_world {
      select when echo hello
      send_directive("say", {"something": "Hello World"})
    }

    rule hello_monkey {
      select when echo monkey
      pre {
        name = event:attr("name").klog("our passed in name: ")
             => event:attr("name")
             | "Monkey"
      }
      
      send_directive("say", {"something": "Hello " + name})
      
    }
     
    rule my_other_rule {
        select when echo my_name
    }
  }