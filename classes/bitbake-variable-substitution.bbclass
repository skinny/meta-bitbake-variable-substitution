# https://patchwork.yoctoproject.org/project/oe-core/patch/20230914105052.112829-1-m.schoepfer@rethinkrobotics.com/#13334
# https://github.com/coreycothrum/meta-mender-const-conf/issues/2
BB_HASH_CODEPARSER_VALS:remove = "PN=no-pn"

inherit bitbake-variable-substitution-helpers

do_patch:append() {
    bitbake_variables_search_and_sub_all_SRC_URI(d)
}

do_install:append() {
  ${@bitbake_variables_search_and_sub_all_FILES_PN(d)}
}
