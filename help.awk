#!/usr/bin/env awk -f

BEGIN {
    # 1st column width
    w = 0;
    # Number of rows
    n = 0;
}
{
    # Join lines ending with backslash
    while (match($0, /\\$/)) {
        sub(/\\$/, "");
        getline nextLine;
        $0 = $0 nextLine;
    }
    # Process lines that match the pattern and determine the max length of 1st column
    if (/^[[:alnum:]_-]+:.*## .*$/) {
        n++;
        split($0, cols[n], ":.*## ");
        l = length(cols[n][1]);
        if (w < l)
            w = l;
    }
}
END {
    for (i = 1; i <= n; i++)
        printf "\033[1m\033[93m%-*s\033[0m %s\n", w + 1, cols[i][1] ":", cols[i][2];
}
