{
  partitions = {
    dev = {
      module = ./dev;
      extraInputsFlake = ./dev;
    };
  };
  partitionedAttrs = {
    formatter = "dev";
    devShells = "dev";
  };
  # perSystem = {system,...}:{};
}
