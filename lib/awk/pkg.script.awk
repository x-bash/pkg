
NR==1 {
    meta_json = $0
}

NR==2 {
    version_json = $0
}

END {
    parse_pkg_meta_json( jobj, PKG_NAME, meta_json )
    parse_pkg_version_json( jobj, PKG_NAME, version_json )

    pkg_init_table( jobj, table, jqu(PKG_NAME), PKG_NAME, version_name, OSARCH )

    result = jobj[ prefix, k, jqu(script) ]
    if (result == "") {
        exit(1)
    } else {
        print juq(result)
        exit(0)
    }
}

