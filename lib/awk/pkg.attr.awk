
function handle( qpat ){
    varname = qpat

    gsub("\\.", SUBSEP, qpat)
    gsub("\\.", "_", varname)

    print varname "=" shqu( juq( table_attr( table, PKG_NAME, jqu("hook") SUBSEP jqu("env-init") )  ) )
}

END {
    query_arrl = split(QUERY, query_arr, ",")
    for (i=1; i<=query_arrl; ++i) {
        handle( query_arr[ i ] )
    }
}
