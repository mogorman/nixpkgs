{ stdenv, fetchFromGitHub, libetpan, meson, ninja, openssl, sqlite, zlib, pkgconfig, cyrus_sasl, bzip2 }:

stdenv.mkDerivation rec {
  name = "deltachat-core-${version}";
  version = "0.15.0";

  src = fetchFromGitHub {
    owner = "deltachat";
    repo = "deltachat-core";
    rev = "${version}";
    sha256 = "22xpz316jmns6i143v4j6sd6k0a4a54alw08rvwjckf2rig57lj2";
  };

  meta = with stdenv.lib; {
    homepage = https://delta.chat;
    description = "Create your own, email-compatible messenger.";
    license = licenses.gpl3;
    platforms = platforms.linux;
    maintainers = with maintainers; [ mog ];
  };

}
