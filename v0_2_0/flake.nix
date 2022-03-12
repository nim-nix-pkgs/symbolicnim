{
  description = ''A symbolic library written purely in Nim with the ability to compile expressions into efficient functions.'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-symbolicnim-v0_2_0.flake = false;
  inputs.src-symbolicnim-v0_2_0.owner = "HugoGranstrom";
  inputs.src-symbolicnim-v0_2_0.ref   = "refs/tags/v0.2.0";
  inputs.src-symbolicnim-v0_2_0.repo  = "symbolicnim";
  inputs.src-symbolicnim-v0_2_0.type  = "github";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@deps:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib" "src-symbolicnim-v0_2_0"];
  in lib.mkRefOutput {
    inherit self nixpkgs ;
    src  = deps."src-symbolicnim-v0_2_0";
    deps = builtins.removeAttrs deps args;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
  };
}