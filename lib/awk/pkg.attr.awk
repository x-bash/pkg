
NR==1 {
    meta_json = $0
}

NR==2 {
    version_json = $0

    parse_pkg_meta_json( jobj, PKG_NAME, meta_json )
    parse_pkg_version_json( jobj, PKG_NAME, version_json )
    pkg_init_table( jobj, table, jqu(PKG_NAME), PKG_NAME, VERSION_NAME, OSARCH )
}

NR>2 {
    varname="$0"
    print varname "=" jobj[ PKG_NAME, jqu( varname ) ]
}
