<h1><span>Deep fish eDNA</span></h1>
<div class="subtext" id="main">
<p>This is the repository where the data and scripts associated to the paper "Vertical stratification of environmental DNA in the open ocean captures ecological patterns and behavior of deep-sea fishes" by Oriol Canalsl, Iñaki Mendibil, María Santos, Xabier Irigoien, Naiara Rodríguez-Ezpeleta is located</p>
</div>
<h2>
<div class="hex"></div><span>Data</span></h2>
<div class="subtext coll">
Metadata associated to the samples used in this study and resulting OTU tables. 
Vertical profile samples from eight stations along the continental slope of the Bay of Biscay (Figure 1; Supplementary Table S1) were collected in Spring 2018 on board the Ramón Margalef research vessel at 5, 50, 200, 500 and 1,000m depth and at 50 m above the seafloor (thereafter > 1,000 m) using a rosette sampler and, from five of the stations, also at 4.4 m depth using the continuous clean circuit intake of the ship. On board, 2-5 liters of 50 μm pore-sized mesh prefiltered water samples were immediately filtered through Sterivex 0.45 μm pore size enclosed filters (Millipore) using a peristaltic pump and kept at -20 °C until further processing. In total, 52 samples from 8 vertical profiles (13 from the surface and 8 from each 50, 200, 500, 1,000 and >1,000 m depth) were collected.
</div>
<h2>
<div class="hex"></div><span>Scripts</span></h2>
<div class="subtext coll">
Scripts used for raw data preparation and analysis.
Quality of raw demultiplexed reads was verified with FASTQC (Andrews, 2010). Forward and reverse primers were removed with cutadapt (Martin, 2011) allowing a maximum error rate of 20%, discarding read pairs that do not contain the two primer sequences and retaining only those reads longer than 30 nucleotides. Paired reads with a minimum overlap of 20 nucleotides were merged using Pear (Zhang et al. 2014), and those pairs with average quality lower than 25 Phred score were removed using Trimmomatic (Bolger et al. 2014). Reads that: i) did not cover the teleo region, ii) were shorter than 40 nucleotides, and iii) contained ambiguous positions, were removed using mothur (Schloss et al. 2009), as well as potential chimeras, which were detected based on the UCHIME algorithm (Edgar et al. 2011) . Taxonomic assignment of unique reads was performed according to the naïve Bayesian classifier method form Wang et al. (2007) implemented in mothur, and only reads classified to species level were considered for further steps. We used two reference databases for taxonomic assignment, named global and local databases, as described in Fraija-Fernández et al. (2020), which taxonomy was forced to match the seven taxonomic levels of the World Register of Marine Species (WoRMS; Horton et al., 2018): Phylum, Subphylum, Class, Order, Family, Genus, Species. The global database contained the teleo region from all Chordata sequences available from GenBank and was used to detect unexpected species and potential contaminations. Taxonomic assignment using the global database confirmed that most reads belonged to fish (519,358). Only 5 of them (0.001%) belonged to humans, while the remaining were assigned to Aves (0.1%) or were not successfully assigned to any Chordata class (“unclassified”, 1.2%).  The local database was restricted to the fish species (including Myxini, Petromyzonti, Holocephali, Elasmobranchii, Sarcopterygii and Actinopterygii) expected in the Northeast Atlantic and Mediterranean areas and was used to assess fish diversity inferred from the study samples.
</div>
<h2>
<div class="hex"></div><span>Database</span></h2>
<div class="subtext coll">
Reference database used for taxonomic assignment.
We used two reference databases for taxonomic assignment, named global and local databases, as described in Fraija-Fernández et al. (2020), which taxonomy was forced to match the seven taxonomic levels of the World Register of Marine Species (WoRMS; Horton et al., 2018): Phylum, Subphylum, Class, Order, Family, Genus, Species. The global database contained the teleo region from all Chordata sequences available from GenBank and was used to detect unexpected species and potential contaminations. Taxonomic assignment using the global database confirmed that most reads belonged to fish (519,358). Only 5 of them (0.001%) belonged to humans, while the remaining were assigned to Aves (0.1%) or were not successfully assigned to any Chordata class (“unclassified”, 1.2%).  The local database was restricted to the fish species (including Myxini, Petromyzonti, Holocephali, Elasmobranchii, Sarcopterygii and Actinopterygii) expected in the Northeast Atlantic and Mediterranean areas and was used to assess fish diversity inferred from the study samples.</div>
<h2>
<div class="hex"></div><span>Contact</span></h2>
<div class="subtext coll">
<ul>
<li>E-mail: <a>nrodriguez@azti.es</a></li>
</ul>
</div>
</main>
<svg viewBox="0 0 500 150" preserveAspectRatio="none" class="wave" id="one"><path d="M-13.36,88.98 C168.85,182.73 276.72,-73.84 506.31,79.10 L500.00,150.00 L0.00,150.00 Z"></path></svg>
<svg viewBox="0 0 500 150" preserveAspectRatio="none" class="wave" id="two"><path d="M-13.36,88.98 C168.85,182.73 276.72,-73.84 506.31,79.10 L500.00,150.00 L0.00,150.00 Z"></path></svg>
<div id="hex-holder">
<div class="hex" id="uno"></div>
<div class="hex" id="dos"></div>
<div class="hex" id="tres"></div>
</div>




<!--
### Hi there 👋



**iperedaagirre/iperedaagirre** is a ✨ _special_ ✨ repository because its `README.md` (this file) appears on your GitHub profile.

Here are some ideas to get you started:

- 🔭 I’m currently working on ...
- 🌱 I’m currently learning ...
- 👯 I’m looking to collaborate on ...
- 🤔 I’m looking for help with ...
- 💬 Ask me about ...
- 📫 How to reach me: ...
- 😄 Pronouns: ...
- ⚡ Fun fact: ...
-->
