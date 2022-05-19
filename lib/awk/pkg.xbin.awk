

# Provide

function code( funcname, binpath ){
    gsub("/", "_", funcname)
    print "___x_cmd_" funcname "(){"
    print "  ." INSTALL_PATH "/" binpath " \"$@\""
    print "}"
    exit(0)
}

END {
    prefix = jqu(PKG_NAME) SUBSEP jqu("xbin")

    if ( "{" != table[ prefix ] ) {
        idx = index(PKG_NAME, "/")
        print code( substr(PKG_NAME, idx + 1), table_eval(table, PKG_NAME, table[ prefix ] ) ) # DO Not unquote
    }

    # print "Not implemented YET" >"/dev/stderr"

    # exit(1)

    # TODO: Will Implemente in the future
    l = table[ prefix L ]
    for (i=1; i<=l; ++i) {

        k = table[ prefix, i ]
        v = table[ prefix, k ]
        k = juq(k)

        if (( k == BIN_MOD_NAME ) && ( "{" != v ) && ( "\"\"" != v )) {
            print code( k, table_eval(table, PKG_NAME, v ) )
            continue
        }
    }

    exit(1)
}
