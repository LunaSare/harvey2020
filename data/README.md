## Contents of this folder

  `test-nameset` folder
<br>&emsp; Contains nameset JSON files to test the service in OpenTree curation.

  `T400F_complete-renamed.tre`
<br>&emsp; A newick file with original tree in `T400F_complete.tre` with tip labels changed to taxon names.


## Use cases of the `Import pre-mapped names` tool for OTU mapping of original tip labels on a given tree:

- When curating large trees, encompassing hundreds and thousands of tip labels to map.
- When original tip labels are unmappable, usually because they are "coded", i.e., following a nomenclatural code developed for a specific study or project. Authors usually include a table connecting the "coded" names to a formal taxon name that can be mapped using TNRS. In this case it is necessary to replace the original "coded" tip labels in the tree with the taxon names, either by hand or by automatically connecting the "coded" names to the formal taxon name provided in a table.

When original tip labels are mappable, the `Import pre-mapped names` tool takes
a `.zip` archive generated with the [TNRS bulk mapping tool](https://tree.opentreeoflife.org/curator/tnrs/).

When original tip labels are unmappable, the `Import pre-mapped names` tool takes
a nameset file connecting the original tip label, the mapped OTT taxon name, and the OTT taxon id. Accepted formats are CSV, TSV, and JSON. For CSV and TSV formats, each set of values goes on a separate line. Values on each line can be comma separated (`.csv` or `.txt` extension) or tab separated (`.tsv` or `.txt` extension).
If choosing a JSON format, your file can contain the same fields from a JSON file generated
using the [TNRS bulk mapping tool](https://tree.opentreeoflife.org/curator/tnrs/), plus
an `adjustedLabel` value.

To map the adjusted taxon names, you can use external tools in R and Python, such as the packages [rotl](https://cran.r-project.org/web/packages/rotl/index.html) or [python-opentree](https://opentree.readthedocs.io/en/latest/).
You will have to create the nameset file yourself.


## How to format a JSON file for "easier" reading

If you have a JSON file named `main.json`, you can format it for ease of reading using [jq]() with the following command:

    < main.json jq '.' > formatted.json


## Current behavior of importing premapped names

### using a CSV file

- original tip labels must match exactly. This is good.
- adjusted labels are not included in the nameset --> Could we include an `adjusted label` value on the pre-mapped nameset to populate the `Modified for mapping` column? Alternatively, no value should appear on that column if it was not provided by the curator.
- it does not like it when CSV or TSV nameset has a single line, gives a message saying that no matching labels were found --> allow for single lined nameset files?
- ott taxon name can be anything. It will still link to correct taxon page, but it is potentially confusing for users. Alos, woul ddownloading the tree with OTT taxon names show the name from the nameset file or one obtained from OTT taxonomy following the OTT id? --> could we just infer the ott name from the ott id to populate the `Mapped to taxon` column?
- names that are mapped on the curation site are automatically favored above pre-mapped names --> Should we give users a chance to review them and choose the one they prefer? Add curator notes?
- when the nameset contains one or all names that have been already succesfully matched with the pre-mapping tool, it says "only N were succesfully matched" when there are N names already pre-mapped, or "no matches were found" when all names have already succesfully pre-mapped--> This gives the idea that mapping has failed. Change to "N have already been succesfully matched"?

### using a TSV file

- TSV namesets do not seem to work well

### using a JSON file

_In review_

## TNRS bulk matching behaviour

_In review_

- when a line or value has trailing white spaces, the tool takes the white spaces as an extra value, I think
