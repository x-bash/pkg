
function handle( qpat,  _arr, _arrl, _pat ){
    varname = qpat

    _arrl = split(qpat, _arr, /\./)
    for (i=1; i<=_arrl; ++i) {
        _pat = (_pat == "") ? jqu(_arr[i]) : ( _pat SUBSEP jqu(_arr[i]))
    }

    gsub("\\.", "_", varname)
    # print PKG_NAME "--------"  _pat
    # print varname "="  table_attr( table, PKG_NAME, _pat )
    print varname "=" shqu( juq( table_attr( table, PKG_NAME, _pat )  ) )
}

END {
    query_arrl = split(QUERY, query_arr, ",")
    for (i=1; i<=query_arrl; ++i) {
        handle( query_arr[ i ] )
    }
}
