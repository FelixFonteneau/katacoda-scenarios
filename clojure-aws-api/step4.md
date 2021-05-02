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
* `(-> (aws/ops lambda) keys sort)` calls the function keys and gives as parameter the previously defined lambda client. The output of keys is then passed to the sort function.

We can now see the operations that we can perform in alphabetical order.

## Lambda function call
Now let's try to run our function:

- `(aws/invoke lambda {:op :Invoke :request{:FunctionName "function-test-1"}})`{{execute}}

This line of code calls the aws/invoke function. This function takes 2 parameters: a client and an operation. The client is our predefined lambda object. The operation is the invocation of a lambda function. This operation is also defined by a request. This request holds as information the name of the function that we are trying to invoke.

You can see in the result, the status code of the request, and the executed version.
Our result is under the key :Payload but in the form of a BufferdInputStream.
In order to retrieve the result of our request, we need to parse it with a `slurp` for instance!

Let's parse this request:

- `(-> (aws/invoke lambda {:op :Invoke :request{:FunctionName "function-test-1"}}) :Payload slurp)`{{execute}}

This line is the same as before but passing the object Payload from the output as a parameter of the function slurp.
The function slurp will take the input stream and print it correctly.

We can exit now the repl:
- `(quit)`{{execute}}

## Final Code

We can summarize all the previous code in our main function
to see a general view of the integration and usage of this library:

<pre class="file" data-filename="aws-api-tutorial/src/aws_api_tutorial/core.clj" 
    data-target="replace">
(ns aws-api-tutorial.core
  (:gen-class))

;; Include the aws-api as aws
(require '[cognitect.aws.client.api :as aws])

;; Setting our Lambda service interface as a global variable
(def lambda (aws/client {:api :lambda}))


(defn who-iam
  "Send a request to AWS 
  and retrieve information about the user"
  [& args]
  ( ->  (aws/client {:api :iam})
        (aws/invoke {:op :GetUser})
        (println)))


(defn get-lambda-info
  "Send a request to AWS 
  and retrieve information about the lambda services"
  [& args]
  ( ->  (aws/ops lambda)
        keys            ;; get the keys
        sort
        println))

(defn execute-lambda
  "Send a request to AWS for the lambda function "function-test-1"
  and print the result of this function"
  [& args]
  (-> (aws/invoke lambda {:op :Invoke :request{:FunctionName "function-test-1"}})
      :Payload    ;; get the result of the call
      slurp       ;; transform the string stream to a string
      println))   ;; print it 

(defn -main 
  "main"
  [& args]
  ( ->  (println "User info:")
        (who-iam)                    ;; call the who-iam function
        (println "Lambda info:")
        (get-lambda-info)            ;; call the get-lambda-info function
        (println "Lambda execution:")
        (execute-lambda)))           ;; call the execute-lambda function
</pre>

You can now run all this code `lein run`{{execute}}
