{ fetchgit
, rustPlatform
, stdenv
, lib
}: rustPlatform.buildRustPackage rec {
  pname = "radicle-ci-broker";
  version = "0.9.0";
  src = fetchgit {
    url = "https://seed.radicle.xyz/zwTxygwuz5LDGBq255RA2CbNGrz8.git";
    rev = "84cfab01debee84dfa0be219bc2f00ac2450ee73";
    hash = "sha256-j1/dSTcTZ4r2BhhbE+WR5GabUK/LyyM66pvmcNsMIxc=";
  };
  cargoHash = "sha256-ed/gVt1nUTxf2XWBcYwl7hE4tS8FnMsAWGWC7zeC6kg=";
  doCheck = false;
  meta = {
    description = "Radicle CI Broker";
    longDescription = ''
      Radicle is an open source, peer-to-peer code collaboration stack built on Git.
      This is a CI broker for that stack.
    '';
    homepage = "https://radicle.xyz";
    license = with lib.licenses; [ asl20 mit ];
    platforms = lib.platforms.unix;
    maintainers = with lib.maintainers; [ mog ];
    mainProgram = "cib";
  };
}
