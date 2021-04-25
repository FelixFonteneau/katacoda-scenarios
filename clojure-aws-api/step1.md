# Initialisation
Before we get started, let's create a Clojure Project. 
We will use Leiningen, if you want to use other build tools, please skip this part. 
You will also need to manage the dependencies according to your specific tools.

# Soundcheck

First, we take a look that our build tools are correctly installed
- `lein version`{{execute}}

If no correct output of the form:

`Leiningen ... on Java ... 64-Bit Server VM`

please see documentation to install [Leiningen](https://leiningen.org/) or other clojure tools.

# Create an empty project

Then we create a project, `lein new app aws-api-tutorial`{{execute}}.

Once done, you should have the main script file here: 

`aws-api-tutorial/src/aws_api_tutorial/core.clj`{{open}} with a Hello World. 

Go to the project directory 
- `cd aws-api-tutorial`{{execute}} 

and start the REPL 
- `lein repl`{{execute}}. 

You should be able to see the result of the hello world with the function call
- `(-main)`{{execute}}.

Then you can quit the REPL with either 
- `(quit)`{{execute}}, either by pressing `ctrl d`.
