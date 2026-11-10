# Share one package store across every checkout and worktree. Projects pin
# enableGlobalCache: false and nodeLinker: node-modules in .yarnrc.yml; env vars
# override that locally, so each node_modules is hardlinked from
# ~/.yarn/berry/cache instead of being a full copy.
export YARN_ENABLE_GLOBAL_CACHE=true
export YARN_NM_MODE=hardlinks-global
