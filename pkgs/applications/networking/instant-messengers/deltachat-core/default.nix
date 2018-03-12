{ stdenv, fetchFromGitHub, libetpan, meson, ninja, openssl, sqlite, zlib, pkgconfig, cyrus_sasl, bzip2, git }:

stdenv.mkDerivation rec {
  name = "deltachat-core-${version}";
  version = "v0.15.0-69-g35846dc";

  src = fetchFromGitHub {
    owner = "mogorman";
    repo = "deltachat-core";
    rev = "${version}";
    sha256 = "1jwschgzbmzx5vkfccg2gcy51pdhf59rvx7fzayi9r3f29m2719p";
  };

  nativeBuildInputs = [ meson ninja pkgconfig openssl sqlite zlib cyrus_sasl bzip2 libetpan git ];

  postInstall = ''
    ls $out/lib
    sed -i 's/unknown-error/${version}/' $out/lib/pkgconfig/deltachat.pc
  '';

  meta = with stdenv.lib; {
    homepage = https://delta.chat;
    description = "Create your own, email-compatible messenger.";
    license = licenses.gpl3;
    platforms = platforms.linux;
    maintainers = with maintainers; [ mog ];
  };

}
