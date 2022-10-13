# Rules

## Method 1:
Actions > Simple Worflow
this automatically creates folder structure 

## Method 2
Manually Create root/.github/workflows/
Add yaml here 

## Rules
- Workflow > Jobs[VM (runs-on)] > Actions > Steps
- Events(on) Trigger Worflows
-  "_" instead of "-"
- By default all yaml files gets executed in worklow folder
- Has Python and Docker Pre-Installed 
- on: [workflow_dispatch] , to trigger manually 
- Multiple Jobs run by defaukt in parallel
- Dependency "needs: [job_name] "

## Python
- add "shell: python"

