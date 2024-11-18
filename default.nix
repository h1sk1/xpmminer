{ pkgs ? import <nixpkgs> {} }:

let
  ncurses = pkgs.ncurses;
  cmake = pkgs.cmake;
  curl = pkgs.curl;
  jansson = pkgs.jansson;
  openssl = pkgs.openssl;
  gmp = pkgs.gmp5;
  gcc = pkgs.gcc;
  gnumake = pkgs.gnumake;

in pkgs.stdenv.mkDerivation {
  name = "xpmminer-nixos-builder-with-cmake";
<<<<<<< HEAD
  src = ./src;
  nativeBuildInputs = [ cmake ];
  buildInputs = [ ncurses cmake curl jansson openssl gmp gcc gnumake ];

  cmakeFlags = [
    "-DCMAKE_BUILD_TYPE=Release"
    "-DBUILDOPENCLMINER=OFF"
    "-DBUILDCUDAMINER=OFF"
  ];

  enableParallelBuilding = true;

  installPhase = ''
    mkdir -p $out
    cp -r * $out/
  '';
  
  shellHook = ''
    echo "xpmminer nixos builder with cmake ready!"
  '';
}

=======
  src = ./.;
  buildInputs = [ ncurses cmake curl jansson openssl gmp gcc gnumake ];
  buildPhase = ''
    mkdir -p build
    cd build
    cmake -DCMAKE_BUILD_TYPE=Release -DBUILDOPENCLMINER=OFF -DBUILDCUDAMINER=OFF ../src
    make
  '';
  installPhase = ''
    # Define the install phase if required
  '';
  shellHook = ''
    echo "xpmminer nixos builder with cmake ready!"
  '';
}
>>>>>>> 2931ed3ed0c24e1b93d700be32a9b3ad09f54879