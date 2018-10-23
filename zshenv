camelcase() {
    perl -pe 's#(-)(.)#\u$2#g'
}

pascalcase() {
    perl -pe 's#(-|^)(.)#\u$2#g'
}
