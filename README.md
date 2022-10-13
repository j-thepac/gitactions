# Rules
## Create WorkFlow
### Method 1:
Git Repo > Actions > Ck on Simple Worflow (this automatically creates folder structure)

### Method 2
- Manually Create root/.github/workflows/
- Add yaml here 

## Structure 
- Workflow > Jobs (has 1 VM) >  Steps (name ,command)
- Workflow > Jobs (has 1 VM) >  Actions (functions)
  - copy title of the git repo or from url ie., account/repo_name
  - "uses: account/repo_name@branch"
  - "uses: account/repo_name@v1"
  - "uses: account/repo_name@commit"

steps:
  - name: some

## Rules
- Events(on) Trigger Worflows
-  "_" instead of "-"
- By default all yaml files gets executed in worklow folder
- Has Python and Docker Pre-Installed 
- on: [workflow_dispatch] , to trigger manually 
- Multiple Jobs run by defaukt in parallel
- Dependency "needs: [job_name] "

## Python
- add "shell: python"

