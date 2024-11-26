{ fetchgit
, rustPlatform
, stdenv
, lib
}: rustPlatform.buildRustPackage rec {
  pname = "radicle-native-ci";
  version = "0.3.0";
  src = fetchgit {
    url = "https://seed.radicle.xyz/z3qg5TKmN83afz2fj9z3fQjU8vaYE.git";
    rev = "d677911da6c1f7bd39cf43bf84aa019004957ca8";
    hash = "sha256-KWxg0FLDmUhv9WAVNkKXpsTU17Ri5J9cnTkhgPCK3fQ=";
  };
  cargoHash = "sha256-o4RxrbHgI6FEX/vhLe6xKJNFkanqQ+RZg/yY0VVPpoc=";
  doCheck = false;

  meta = {
    description = "Radicle Native CI";
    longDescription = ''
      Radicle is an open source, peer-to-peer code collaboration stack built on Git.
      This is the CI runner for the broker.
    '';
    homepage = "https://radicle.xyz";
    license = with lib.licenses; [ asl20 mit ];
    platforms = lib.platforms.unix;
    maintainers = with lib.maintainers; [ mog ];
    mainProgram = "radicle-native-ci";
  };
}
