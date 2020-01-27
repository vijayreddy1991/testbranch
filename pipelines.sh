resources:
      
  - name: gitresource
    type: GitRepo
    configuration:
      gitProvider: s_gitHub
      path: vijayreddy1991/dummy
      files:  # optional
        include: k.*
        exclude: r.*
      branches:  # optional
        include: t.*
        exclude: r.*
      tags:  # optional
        include: v.*
        exclude: m.*      
      buildOn:  # optional
        commit: true
#          pullRequestCreate: true
#          pullRequestClose: true
#          releaseCreate: true
        tagCreate: true
      shallowDepth: 1  # optional 
      
      
pipelines:

  - name: pipelines_true
  
    steps:
      - name: s_BashTriggerTrue
        type: Bash
        configuration:
          environmentVariables:
            env1: value1
            env2: value2
          inputResources:
            - name: gitresource
        execution:
          onExecute:
            - printenv 
            - pushd $res_gitresource_resourcePath
            - git log
            - ls
            - cat pipelines.sh         
