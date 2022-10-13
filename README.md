# Rules
## Create WorkFlow
#### Method 1:
Git Repo > Actions > Ck on Simple Worflow (this automatically creates folder structure)

#### Method 2
- Manually Create root/.github/workflows/
- Add yaml here 

## Structure 
- Workflow > Jobs (has 1 VM) >  Steps (name ,command) ,  Actions ie., functions

## Rules
- Workflows run inside git-hosted / self-hosted Vm
- By Default the current repository is not checked out.
- Events(on) Trigger Worflows
-  "_" instead of "-"
- By default all yaml files gets executed in worklow folder
- Has Python and Docker Pre-Installed 
- on: [workflow_dispatch] , to trigger manually 
- Multiple Jobs run by default in parallel
- Dependency "needs: [job_name] "

## Events (on)
- [ref link](https://docs.github.com/en/actions/using-workflows/events-that-trigger-workflows#pull_request)
- [push,pull_request]
- some activites have many activities types

        name:
        on:
          pull_request:
            types: [closed ,assigned]
- repository_dispatch (using REST API)

        name:
        on:
          repository_dispatch:
            types: [build]
            
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

## Python
- add "shell: python"

## Environment Variables

    echo $GITHUB_SHA
    echo $GITHUB_REPOSITORY
    echo $GITHUB_WORKSPACE
    #github is an object existing environment
    echo "${{github.token}}"

