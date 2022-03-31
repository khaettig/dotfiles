command Gamend :G commit --amend --no-edit
command Gamendpush :G commit --amend --no-edit | G push --force-with-lease
command OCS :! echo % > .compile_suite
command ACS :! echo % >> .compile_suite
