# data-butler
Small repo to begin aggregating my various data collection and manipulation scripts.

Everything in here should be pretty straightforward, nothing you couldn't do with other tools. I'm collecting these items here to:
- polish my skills
  - the reason why I'm re-writing some of my own and making new scripts instead of using existing tools
  - you will find me pragmatic, however ... in the end, I will use the best tool for the job and I will try to mention ones I would recommend in the code comments and wiki pages as I continue to flesh this out
- create a single resource I can turn to for many of my data needs ... I think of more as a tool box than a tool
- customize tools specific to some of my use cases
  - for example, in writing a lot of test config files for some brief API performance testing with JMeter, I found it useful to have a script that will take a single column CSV and transform it into a multicolumn, multirow CSV to facilitate building JSON payloads of various sizes.

I will be adding in my other scripts as I have time to revisit them and can insure there are no IP claims from any previous employers.

**dat_belt** (as in Bat Belt) will become an overall launch point for other scripts. I have stripped data functionality from it, and am working toward modularizing components as I'm able to add them in. **dat_belt** no longer has any useful functionality at present, but that will change, and so will the name. The other scripts will be able to be called from it, or can be executed on their own, independent of dat_belt.

I will begin to fill out the wiki here with instructions on usage broken down per script. This collection is all Ruby at the moment, but that will change. I will also be adding scripts written in:
- Python ... it's where data is at. I've already been using Python with Robot Framework and specifically with the Python Requests library. Turning that to data science endeavors.
- Elixir ... the new programming hotness. Plus I like it. Plus it's fast ... well, except for math. :( Plus it's captivatingly concurrent. I will be exploring applying this language to my data pipelining needs, but the math limitations will likely cause some trouble. Immutable, functional programming is a paradigm so comfortably familiar to me coming from the ETL world. 
- Crystal ... perhaps to deal with some of Elixir's math issues on that end of the data pipelining spectrum.
- Ruby 3 ... the promised speed increases should make things more interesting.
