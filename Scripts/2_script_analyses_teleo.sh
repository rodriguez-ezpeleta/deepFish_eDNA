
DBlocation=/share/projects/OCEAN_eDNA/Oriol/Teleo_20200317
DBprefix=rRNA_12S_teleo_worms_clean_maurolicus
globalDBlocation=/share/projects/OCEAN_eDNA/analyses_Natalia/TELEO/global_DB
globalDBprefix=global_teleo
mothur

#create logfile with all manip that are going to be done
set.logfile(name=Teleo_samples_20200317.log)

#analyse reads (length, ambiguities) and count number of reads per group
summary.seqs(fasta=Teleo_samples_20200317.fasta, processors=12)
count.groups(group=Teleo_samples_20200317.groups)

#dereplicate
unique.seqs(fasta=Teleo_samples_20200317.fasta)
summary.seqs(fasta=Teleo_samples_20200317.unique.fasta, name=Teleo_samples_20200317.names, processors=12)

#align sequences against the 12S rRNA database
align.seqs(fasta=Teleo_samples_20200317.unique.fasta, reference=teleo.align, processors=12, flip=T)
summary.seqs(fasta=Teleo_samples_20200317.unique.align, name=Teleo_samples_20200317.names, processors=12)

#remove sequences not covering the "teleo" region of 12S
screen.seqs(fasta=Teleo_samples_20200317.unique.align, name=Teleo_samples_20200317.names, group=Teleo_samples_20200317.groups, start=6, end=77, minlength=60, maxlength=100, maxambig=0, processors=12)
summary.seqs(fasta=Teleo_samples_20200317.unique.good.align, name=Teleo_samples_20200317.good.names, processors=12)
count.groups(group=Teleo_samples_20200317.good.groups)

# remove columns that contain gap characters
filter.seqs(fasta=Teleo_samples_20200317.unique.good.align, vertical=T, processors=12)
unique.seqs(fasta=Teleo_samples_20200317.unique.good.filter.fasta, name=Teleo_samples_20200317.good.names)
summary.seqs(fasta=Teleo_samples_20200317.unique.good.filter.unique.fasta,name=Teleo_samples_20200317.unique.good.filter.names,processors=12)

#remove chimeras
chimera.uchime(fasta=Teleo_samples_20200317.unique.good.filter.unique.fasta, name=Teleo_samples_20200317.unique.good.filter.names, group=Teleo_samples_20200317.good.groups, processors=12)
remove.seqs(accnos=Teleo_samples_20200317.unique.good.filter.unique.denovo.uchime.accnos, fasta=Teleo_samples_20200317.unique.good.filter.unique.fasta, name=Teleo_samples_20200317.unique.good.filter.names, group=Teleo_samples_20200317.good.groups, dups=T)
summary.seqs(fasta=Teleo_samples_20200317.unique.good.filter.unique.pick.fasta, name=Teleo_samples_20200317.unique.good.filter.pick.names, processors=12)
count.groups(group=Teleo_samples_20200317.good.pick.groups)

#for clarity, rename files
system(cp Teleo_samples_20200317.unique.good.filter.unique.pick.fasta Teleo_samples_20200317_all.fasta)
system(cp Teleo_samples_20200317.unique.good.filter.pick.names Teleo_samples_20200317_all.names)
system(cp Teleo_samples_20200317.good.pick.groups Teleo_samples_20200317_all.groups)

#create count_table with the new files
make.table(name=Teleo_samples_20200317_all.names, group=Teleo_samples_20200317_all.groups, processors=12)

quit

# Taxonomic assignment
# PHYLOTYPES LOCAL DB
mothur "#classify.seqs(fasta=Teleo_samples_20200317_all.fasta, template=$DBlocation/$DBprefix.align, taxonomy=$DBlocation/$DBprefix.tax, name=Teleo_samples_20200317_all.names, group=Teleo_samples_20200317_all.groups, method=wang, cutoff=60, processors=12)"
mothur "#phylotype(taxonomy=Teleo_samples_20200317_all.$DBprefix.wang.taxonomy)"
mothur "#make.shared(list=Teleo_samples_20200317_all.$DBprefix.wang.tx.list, count=Teleo_samples_20200317_all.count_table, label=1)"
mothur "#classify.otu(list=Teleo_samples_20200317_all.$DBprefix.wang.tx.list, count=Teleo_samples_20200317_all.count_table, taxonomy=Teleo_samples_20200317_all.$DBprefix.wang.taxonomy, label=1)"
sed -E s/";[a-zA-Z]*_unclassified"/";unclassified"/g Teleo_samples_20200317_all.$DBprefix.wang.tx.1.cons.taxonomy > Teleo_samples_20200317_all.$DBprefix.wang.tx.1.cons_corr.taxonomy

# PHYLOTYPES GLOBAL DB
mothur "#classify.seqs(fasta=Teleo_samples_20200317_all.fasta, template=$globalDBlocation/$globalDBprefix.align, taxonomy=$globalDBlocation/$globalDBprefix.tax, name=Teleo_samples_20200317_all.names, group=Teleo_samples_20200317_all.groups, method=wang, cutoff=60, processors=12)"
mothur "#phylotype(taxonomy=Teleo_samples_20200317_all.$globalDBprefix.wang.taxonomy)"
mothur "#make.shared(list=Teleo_samples_20200317_all.$globalDBprefix.wang.tx.list, count=Teleo_samples_20200317_all.count_table, label=1)"
mothur "#classify.otu(list=Teleo_samples_20200317_all.$globalDBprefix.wang.tx.list, count=Teleo_samples_20200317_all.count_table, taxonomy=Teleo_samples_20200317_all.$globalDBprefix.wang.taxonomy, label=1)"
sed -E s/";[a-zA-Z]*_unclassified"/";unclassified"/g Teleo_samples_20200317_all.$globalDBprefix.wang.tx.1.cons.taxonomy > Teleo_samples_20200317_all.$globalDBprefix.wang.tx.1.cons_corr.taxonomy
