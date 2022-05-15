
NR==1 {
    meta_json = $0
}

NR==2 {
    version_json = $0

    parse_pkg_meta_json( jobj, PKG_NAME, meta_json )
    parse_pkg_version_json( jobj, PKG_NAME, version_json )
    pkg_init_table( jobj, table, jqu(PKG_NAME), PKG_NAME, VERSION_NAME, OSARCH )
}

function handle( qpat ){
    varname = qpat
    gsub(".", SUBSEP, qpat)
    gsub(".", "_", varname)
    print varname "=" jobj[ PKG_NAME, qpat ]
}

NR>2 {
    handle( $0 )
}

END {
    query_arrl = split(QUERY, query_arr, ",")
    for (i=1; i<=query_arrl; ++i) {
        handle ( query_arr[ i ] )
    }
}
