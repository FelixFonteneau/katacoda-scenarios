# Lambda Function Call

In this step, we are finally going to use an AWS services tool: Lambda service.

This service allows users to run serverless computations. We have prepared a lambda function called function-test-1 and we will now call it from the REPL.

## Usage
In your REPL, use the client that we created at the last step to see the lists of operations that you can use. 
- `lein repl`{{execute}}
- `(def lambda (aws/client {:api :lambda}))`{{execute}}
- `(-> (aws/ops lambda) keys sort)`{{execute}}

### Quick explanations
* `(def lambda (aws/client {:api :lambda}))` creates a client for the AWS Lambda service and calls it lambda.
* `(-> (aws/ops lambda) keys sort)` calls the function keys and gives as parameter the previsouly defined lambda client. The output of keys is then passed to the sort function. 

We can now see the operations what we can perform in alphabetical order. 

## Lambda function call
Now let's try to run our function:

- `(aws/invoke lambda {:op :Invoke :request{:FunctionName "function-test-1"}})`{{execute}}

This line of code calls the aws/invoke function. This function takes 2 parameters: a client and an operation. The client is our predefined lambda object. The operation is the invocation of a lambda function. This operation is also defined by a request. This request holds as information the name of the function that we are trying to invoke. 

You can see in the result, the status code of the request, and the executed version. 
Our result is under the key :Payload but in the form of a BufferdInputStream. 
In order to retrieve the result of our request, we need to parse it with a `slurp` for instance!

Let's parse this request: 

- `(-> (aws/invoke lambda {:op :Invoke :request{:FunctionName "function-test-1"}}) :Payload slurp)`{{execute}}

This line is the same as before but passing the object Payload from the output as parameter of the function slurp. 

We can exit now the repl:
- `(quit)`{{execute}}

## Final Code

We can summarize all the previous code in our main function:

<pre class="file" data-filename="aws-api-tutorial/src/aws_api_tutorial/core.clj" 
    data-target="replace">
(ns aws-api-tutorial.core
  (:gen-class))

(require '[cognitect.aws.client.api :as aws])

(def lambda (aws/client {:api :lambda}))

(defn who-iam
  [& args]
  ( ->  (aws/client {:api :iam})
        (aws/invoke {:op :GetUser})
        (println)))


(defn get-lambda-info 
  [& args]
  ( ->  (aws/ops lambda)
        keys
        sort
        println))

(defn execute-lambda
  [& args]
  (-> (aws/invoke lambda {:op :Invoke :request{:FunctionName "function-test-1"}})
      :Payload 
      slurp
      println))

(defn -main 
  "main"
  [& args]
  ( ->  (println "User info:")
        (who-iam)
        (println "Lambda info:")
        (get-lambda-info)
        (println "Lambda execution:")
        (execute-lambda)))
</pre>

You can run this code `lein run`{{execute}}
