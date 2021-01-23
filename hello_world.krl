ruleset hello_world {
    meta {
      name "Hello World"
      description <<
  A first ruleset for the Quickstart
  >>
      author "Phil Windley"
      shares hello
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
      send_directive("say", {"something": "Hello Monkey"})
    }
     
    rule my_other_rule {
        select when echo my_name
    }
  }