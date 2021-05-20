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


    < main.json jq '.' > formatted.json
