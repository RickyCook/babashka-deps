function awscli() {
    requires awscli_installed
    requires awscli_configured
}
function awscli_installed() {
    install_package awscli
    process
}
function awscli_configured() {
    file_linked ~/.aws/config .aws/config
    process
}
