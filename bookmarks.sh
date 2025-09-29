#!/bin/sh

# Issues
# if u use a language or signs thatt arent supported itll break
# formating looks ass
# maybe to long links will break
# fucking fix the tmp bullshit

outputFile=test.nix
outputTmpUrl=tmpUrl
outputTmpName=tmpName

testPath()
{
    echo "Please enter your bookmark file"
    read htmlFile

    if [ ! -f "$htmlFile" ]; then
        echo "$htmlFile does not exist. Exiting the script"
        exit 1
    fi

    if [ "${htmlFile##*.}" != "html" ]; then
        echo "$htmlFile is not an HTML file. Exiting the script."
        exit 1
    fi
}

findAndFormat()
{
    grep -oP 'HREF="\K[^"]+' $htmlFile > $outputTmpUrl
    grep -oP '\">\K[^<]+' $htmlFile > $outputTmpName
}

formatNix()
{
    lineCount=$(wc -l < "$outputTmpUrl")

    echo -e '{ config, pkgs, ... }:
{
    programs.firefox = {
        enable = true;
        profiles.kitten = {
            bookmarks = [\n' > "$outputFile"

    for i in $(seq 1 "$lineCount"); do
        url=$(sed -n "${i}p" "$outputTmpUrl")
        name=$(sed -n "${i}p" "$outputTmpName")

        if [ -n "$url" ] && [ -n "$name" ]; then
            echo -e "                   {\n                     name = \"$name\";\n                     url = \"$url\";\n                   }" >> "$outputFile"
        fi
    done

    echo '             ];
        };
    };
}' >> "$outputFile"
}

cleanUp()
{
    rm $outputTmpUrl
    rm $outputTmpName
    rm $htmlFile
}

testPath
findAndFormat
formatNix
cleanUp
