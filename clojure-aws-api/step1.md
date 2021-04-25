In this scenario, we want...

First, we take a look that our build tools are correctly installed
`lein version`{{execute}}

If no correct output of the form `Leiningen ... on Java ... 64-Bit Server VM`, 
please see documentation to install [Leiningen](https://leiningen.org/) or other clojure tools.

Then we create a project, `lein new app aws-api-tutorial`{{execute}}.

Once done, you should have the main script file here: `aws-api-tutorial/src/aws-api-tutorial/core.clj`{{open}} with a Hello World. 

Go to the project directory `cd aws-api-tutorial`{{execute}}, and start the REPL `lein repl`. 
You should see the result of the hello world with the function call `(-main)`{{execute}}.

Then you can quit the REPL with either `(quit)`{{execute}}, either by pressing `ctrl d`.
