-- npm i -g intelephense
local utils = require 'utils'
local projectSettings = require 'settings'

local config = {
    settings = {
        intelephense = {
            stubs = {
                "apache", "bcmath", "bz2", "calendar", "com_dotnet", "Core", "ctype", "curl",
                "date", "dba", "dom", "enchant", "exif", "FFI", "fileinfo", "filter", "fpm",
                "ftp", "gd", "gettext", "gmp", "hash", "iconv", "imap", "intl", "json", "ldap",
                "libxml", "mbstring", "meta", "mysqli", "oci8", "odbc", "openssl", "pcntl",
                "pcre", "PDO", "pdo_ibm", "pdo_mysql", "pdo_pgsql", "pdo_sqlite", "pgsql",
                "Phar", "posix", "pspell", "readline", "Reflection", "session", "shmop",
                "SimpleXML", "snmp", "soap", "sockets", "sodium", "SPL", "sqlite3", "standard",
                "superglobals", "sysvmsg", "sysvsem", "sysvshm", "tidy", "tokenizer", "xml",
                "xmlreader", "xmlrpc", "xmlwriter", "xsl", "Zend OPcache", "zip", "zlib"
            },
            files = {
                exclude = {}
            },
        }
    },
    on_attach = function (client, bufnr)
        require'lsp_signature'.on_attach()
    end
}

if globalSettings and globalSettings.lsp and globalSettings.lsp.intelephense then
    config = utils.merge(config, globalSettings.lsp.intelephense)
end

if projectSettings.lsp and projectSettings.lsp.intelephense then
    config = utils.merge(config, projectSettings.lsp.intelephense)
end

config.capabilities = require('cmp_nvim_lsp').default_capabilities()
require 'lspconfig'.intelephense.setup(config)
