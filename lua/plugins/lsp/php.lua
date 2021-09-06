-- npm i -g intelephense
local settings = require 'settings'

if settings.lsp and settings.lsp.intelephense then
    settings = settings.lsp.intelephense
else
    settings = {}
end

local stubs = {
    "apache", "bcmath", "bz2", "calendar", "com_dotnet", "Core", "ctype", "curl",
    "date", "dba", "dom", "enchant", "exif", "FFI", "fileinfo", "filter", "fpm",
    "ftp", "gd", "gettext", "gmp", "hash", "iconv", "imap", "intl", "json", "ldap",
    "libxml", "mbstring", "meta", "mysqli", "oci8", "odbc", "openssl", "pcntl",
    "pcre", "PDO", "pdo_ibm", "pdo_mysql", "pdo_pgsql", "pdo_sqlite", "pgsql",
    "Phar", "posix", "pspell", "readline", "Reflection", "session", "shmop",
    "SimpleXML", "snmp", "soap", "sockets", "sodium", "SPL", "sqlite3", "standard",
    "superglobals", "sysvmsg", "sysvsem", "sysvshm", "tidy", "tokenizer", "xml",
    "xmlreader", "xmlrpc", "xmlwriter", "xsl", "Zend OPcache", "zip", "zlib"
}

for k,v in pairs(settings.stubs or {}) do
    stubs[table.getn(stubs)] = v
end

require 'lspconfig'.intelephense.setup({
    settings = {
        intelephense = {
            stubs = stubs
        }
    }
})
