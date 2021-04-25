In this part of the tutorial, we will set up the system to access AWS services. 

We will use the IAM (Identity and Access Management) service of AWS. A user has been created for this tutorial, with an access key ID, a secret access key and an associated region.

access key ID: AKIATDGHMRLCBX4MNVEG
secret access key: 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
region: eu-north-1

We can now set those credentials as environment variables. 
`export AWS_ACCESS_KEY_ID=AKIATDGHMRLCBX4MNVEG`{{execute}}

`export AWS_SECRET_ACCESS_KEY=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`{{execute}}

`export AWS_DEFAULT_REGION=eu-north-1`{{execute}}

You should now be able to connect as a tester to AWS using aws-cli.
`aws iam get-user`{{execute}}

The aim of this tutorial is to propose a powerful alternative to this aws-cli. 

You can now launch the REPL `lein repl`{{execute}} and create a client: `(aws/invoke iam {:op :GetUser})`{{execute}}.
