# Installation of the dependencies

Now we will start using the [aws-api](https://github.com/cognitect-labs/aws-api).

Several aws-api dependencies are needed to be included in our Clojure project, 
in order to have a proper interface of AWS. 

First, we have the following necessary libraries to install,
- `com.cognitect.aws/api`
- `com.cognitect.aws/endpoints`

and then, the libraries of the service(s) of your choice, we will use in this tutorial
- `com.cognitect.aws/lambda` 
- `com.cognitect.aws/iam` 


To install the dependencies in our Leiningen project, we will modify the file `aws-api-tutorial/project.clj`{{open}}.

We will add the following code to the dependencies value:
<pre class="file" data-filename="aws-api-tutorial/project.clj" 
    data-target="insert" 
    data-marker=':dependencies [[org.clojure/clojure "1.10.1"]]'>
:dependencies [[org.clojure/clojure "1.10.1"] 
               [com.cognitect.aws/api "0.8.505"] 
               [com.cognitect.aws/endpoints "1.1.11.976"] 
               [com.cognitect.aws/lambda "811.2.865.0"] 
               [com.cognitect.aws/iam "811.2.889.0"]]
</pre>


In complement, you can find the right tool for your AWS project. 
This library provides a lot of different functions to access AWS, see the different [examples](https://github.com/cognitect-labs/aws-api/tree/master/examples).


