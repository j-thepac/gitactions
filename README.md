# Rules
## Things to remember :
Refer /.github/workflows/ for code 
1. Format
2. Events
3. Jobs
4. Steps vs Actions
5. Steps-
   1.  Change Shell
   2.  Run - python , shell
   3.  Run Git string operations
   4.  if Condition
   5.  Use Variables  
   6.  Use sh file 
   7.  Error handling
6. Actions (Functions)
   1. Call Jobs in same File
   2. Call External Actions with paramters   
   3. Use Result of Action into Another
7. Use Git Secrets
8. Rest API
9. Docker
   1. Create env and run scala file
10. Create Complete Workflow (refer pythonCI.yml)


## Format

        name: Test
        on: [workflow_dispatch]
        jobs:
            job1:
                - run: echo "test"
                - uses: actions/checkout@v3
Json Equivalent

        { "name": "Test",
           "on": ["workflow_dispatch"],
           "jobs": {
                "job1": [
                    {"run": "echo \"test\""},
                    {"uses": "actions/checkout@v3"}
                ]}
        }
                  
## Create WorkFlow
#### Method 1:
Git Repo > Actions > Ck on Simple Worflow (this automatically creates folder structure)

#### Method 2
- Manually Create root/.github/workflows/
- Add yaml here 

## Structure 
- Workflow > Jobs (VM) >  Steps > command ,  Actions(functions)

## Rules
- All Jobs in a file run parallely by default
- To create sequence
        - Dependency "needs: [job_name] "
- Workflows run inside git-hosted / self-hosted Vm
- By Default the current repository is not checked out.
- Events  Eg: on: [workflow_dispatch] #manual , [push]
-  "_" instead of "-"
- By default all yaml files gets executed in worklow folder
- Vm has Python and Docker Pre-Installed 



## Events (on)
- [ref link](https://docs.github.com/en/actions/using-workflows/events-that-trigger-workflows#pull_request)
- [workflow](https://docs.github.com/en/actions/using-workflows/workflow-syntax-for-github-actions)
- [push,pull_request,workflow_dispatch] #workflow_dispatch = manual trigger
- push: branches, tags , path , branches_ignore, tags_ignore , paths_ignore
- some activites have many activities types

        name:
        on:
          push:
           branches: [master,'branch*']
          pull_request:
            types: [closed ,assigned]
            
- repository_dispatch (using REST API)

        name:
        on:
          repository_dispatch:
            types: [startme]

        # in Postman / curl      
        curl --location --request POST 'https://api.github.com/repos/j-thepac/gitactions/dispatches' \
        --header 'Accept: application/vnd.github+json' \
        --header 'Content: application/json' \
        --header 'Authorization: Bearer generate_personal_token' \
        --header 'Content-Type: application/json' \
        --data-raw '{
            "event_type": "startme"
        }'

## Actions (Functions)
  - Can reference :
    - In Same File
    - Same Repo
    - Different Repo
  - Different Repo  
    - copy title of the git repo or from url ie., account/repo_name
    - "uses: account/repo_name@branch"
    - "uses: account/repo_name@v1"
    - "uses: account/repo_name@commit"
  - With : Provide input
  
         with:
          varName: value

## Python
- add "shell: python"

## GIT Environment Variables

    echo $GITHUB_SHA
    echo $GITHUB_REPOSITORY
    echo $GITHUB_WORKSPACE
    #github is an object existing environment
    echo "${{github.token}}"

## Custom Variables

        env:
          key: Value
          
       echo ${{env.key}}  #access
## Access Secrets

        echo "${{secrets.KEY}}"

## Basic Steps in a Workflow
- Set Up Env
- Checkout Code
- install Dependencies
- Verify Formatting
- (Build Project if Necessary)
- Run Automatd Tests
- Upload Code Coverage as Artifact
- Cache Dependencies
- On Failure , Send message , Mail

## CODEOWNERS
- create file CODEOWNERS

        * @usernsme
        *.py @usrname 
