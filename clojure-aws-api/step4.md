# 

In this step, we are finally going to use AWS services. For this tutorial, we are going to explore the AWS Lambda service.

This service allows users to run serverless computation. We have prepared a lambda function called function-test-1 and we will now call it from the REPL.

In your REPL, use the client that we created at the last step to see the lists of operations that you can use. 
`(def lambda (aws/client {:api :lambda}))`
`(-> (aws/ops lambda) keys sort)`

We can see from this the operations that we can perform. Let's try to run our function. 
`(aws/invoke lambda {:op :Invoke :request{:FunctionName "function-test-1"}})`

Let's now use Clojure built-in functions to get the content of the payload (reading the BufferedInputStream). 
`(-> (aws/invoke lambda {:op :Invoke :request{:FunctionName "function-test-1"}}) :Payload slurp)`

