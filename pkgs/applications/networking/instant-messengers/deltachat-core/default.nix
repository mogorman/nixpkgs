{ stdenv, fetchFromGitHub, libetpan, meson, ninja, openssl, sqlite, zlib, pkgconfig, cyrus_sasl, bzip2 }:

stdenv.mkDerivation rec {
  name = "deltachat-core-${version}";
  version = "0.15.0";

  src = fetchFromGitHub {
    owner = "deltachat";
    repo = "deltachat-core";
    rev = "v${version}";
    sha256 = "1qp28cfnnk9hazq3xmsy03wfgij4njfgkv9b243hkfl781si37pl";
  };

  nativeBuildInputs = [ meson ninja pkgconfig openssl sqlite zlib cyrus_sasl bzip2 libetpan ];

  meta = with stdenv.lib; {
    homepage = https://delta.chat;
    description = "Create your own, email-compatible messenger.";
    license = licenses.gpl3;
    platforms = platforms.linux;
    maintainers = with maintainers; [ mog ];
  };

}
