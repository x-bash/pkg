
END {
    VERSION_REALNAME = jobj[ prefix, k, jqu("version") ]

    result = jobj[ prefix, k, jqu(script) ]
    if (result == "") {
        exit(1)
    } else {
        print PKG_RAWPATH "/" PKG_NAME "/" VERSION_REALNAME "/.x-cmd/" juq(result)
        exit(0)
    }
}
