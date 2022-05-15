

END {
    result = jobj[ prefix, k, jqu(script) ]
    if (result == "") {
        exit(1)
    } else {
        print PKG_RAWPATH "/" PKG_NAME "/" VERSION_REALNAME "/.x-cmd/" juq(result)
        exit(0)
    }
}


# NR==1 {
#     meta_json = $0
# }

# NR==2 {
#     version_json = $0
# }

# END {
#     parse_pkg_meta_json( jobj, PKG_NAME, meta_json )
#     parse_pkg_version_json( jobj, PKG_NAME, version_json )

#     pkg_init_table( jobj, table, jqu(PKG_NAME), PKG_NAME, VERSION_NAME, OSARCH )

#     print "get-exe:\t" jobj[ pkg_kp( PKG_NAME, "meta", "rule", "v*/win-*", "dot_exe" ) ]

#     print "url_default:\t" pkg_kp( PKG_NAME, "meta", "rule", "v*/win-*", "dot_exe" )

#     print "--------"
#     print table[ pkg_kp( PKG_NAME, "sb_repo" ) ]

#     str = table[ pkg_kp( PKG_NAME, "sb_gh" ) ]

#     print "---" pkg_eval_str( str, table, "nmap" )

# }

