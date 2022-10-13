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
  echo "${{github.token}}"

