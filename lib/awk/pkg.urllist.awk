

END {
    prefix = jqu(PKG_NAME) SUBSEP jqu("url") SUBSEP jqu( NET_REGION )

    if ( "[" != table[ prefix ] ) {
        printf juq( table[ prefix ] )
    } else {
        l = table[ prefix L ]
        for (i=1; i<=l; ++i) {
            print juq( table[ prefix, i ] )
        }
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

