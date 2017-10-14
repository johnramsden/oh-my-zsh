local -a vcsh_commands 
 
vcsh_commands=( 
  clone commit delete enter foreach help init list list-tracked list-untracked 
  pull push rename run status upgrade version which write-gitignore) 
 
local -a vcsh_repos 
 
for vcsh_repo in $(vcsh list); do vcsh_repos+=(${vcsh_repo}); done 
 
for c in ${vcsh_commands}; do; alias vcsh-${c}="vcsh ${c}"; done 
for c in ${vcsh_repos}; do; alias vcsh-repo-${c}="vcsh ${c}"; done 
