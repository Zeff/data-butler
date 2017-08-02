# data-butler
Small repo to begin aggregating my various data collection and manipulation scripts.

Everything in here should be pretty straightforward, nothing you couldn't do with other tools. I'm collecting these items here to:
- create a single resource I can turn to for many of my data needs
- customize tools specific to some of my use cases
  - for example, in writing a lot of test config files for some brief API performance testing with JMeter I performed, I found it useful to have a script that will take a single column CSV and transform it into a multicolumn, multirow CSV to facilitate building JSON payloads of various sizes.

I will be adding in my other scripts as I have time to revisit them and can insure there are no IP claims from any previous employers.

**dat_belt** (as in Bat Belt) will become an overall launch point for other scripts. I have stripped data functionality from it, and am working toward modularizing components as I'm able to add them in. **dat_belt** no longer has any useful functionality at present, but that will change. And I'm oddly partial to the name. The other scripts will be able to be called from it, or can be executed on their own, independent of dat_belt.

I will begin to fill out the wiki here with instructions on usage broken down per script. This collection is all Ruby at the moment, but that will change. I will also be adding scripts written in:
- Python ... it's where data is at. I've already been using Python with Robot Framework and specifically with the Python Requests library. Turning that to data science endeavors.
- Elixir ... the new programming hotness. Plus I like it. Plus it's blazing fast. Plus it's captivatingly concurrent. I have high hopes for applying this language to my data needs. Immutable function programming is a paradigm so comfortably familiar to me coming from the ETL world. 
