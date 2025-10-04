## Overview

This shell script converts HTML bookmark files into the Nix format for easy integration with NixOS or other Nix-based systems. It parses the HTML file, extracts the bookmarks, and generates a .nix file that can be used to manage bookmarks in a Nix environment. Obviously there are better and safer ways to do this. This was just for fun and out of interest.

## Features

 - Parses HTML bookmark files.
 - Converts bookmarks into a structured Nix format.

## Usage

```shell
   # clone the repository
   git clone https://github.com/OnGalaxySteroids/bookmarks.git
   cd bookmarks/

   # make the script executable
   chmod 755 bookmarks.sh

   # run the script
   ./bookmarks.sh

   # followed by the bookmark file
   # bookmarks.html should be the default for most browserns
```

## Known Issues and Stuff

  - Doesn't work with special charackters
  - The formating looks ridiculous
  - uses to many tmp files
  - rewrites the entire file everytime it updates

#
***Kind Regards 2025.10.04***
