{ lib, stdenv, zig, fetchFromGitHub }:

stdenv.mkDerivation {
  pname = "ghost-sh";
  version = "0.4.0";

  src = fetchFromGitHub {
    owner = "h-jangra";
    repo = "ghost.sh";
    rev = "0.4.0";
    hash = "sha256-HJmFQPmGWqC1PZ80AMEpiJHNd4NM5u4CZwxq935mvI8=";
  };

  nativeBuildInputs = [ zig.hook ];
  zigBuildFlags = [ "-Doptimize=ReleaseFast" ];

  postInstall = ''
    install -Dm644 ghost.sh $out/share/ghost/ghost.sh
    ln -s $out/bin/ghost $out/share/ghost/ghost
  '';
} 
