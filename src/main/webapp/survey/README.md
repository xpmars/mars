README
==========

This is a small application to realize surveys. It can be configured
to register different types of questions (single, multiple choice,
dates, fill-in). It allows to configure different question-flows
(e.g. in case some answer requires more details).

Surveys can be conduced by any modern browser (initally it
was google chrome only). It also includes a small administrative
interface to export and consolidate the surveys information.

History
----------

I created this application as a tool to recopilate data for a friend's
PhD thesis. The surveys were configured in Bahasa Indonesia, and were
done by a group of surveyors using netbooks to collect information
about daily water use and sickness in shanty towns in Indonesia. The
analysis of the collected data was published in this
[journal paper](http://www.yale.eduænvælimelech/publication-pdf/Sima_etªl_AmJTropMedHyg_2012.pdf).

Technical Information
----------

This is a client-side web-based app that uses jquery, concretely a
google-chrome app, it can be used as it is, but it's easier to
distribute it as a .crx file. New questions or surveys can be
configured changing the surveys data structure in the JSON format. For
practical reasons the application was optimized to be used with the
keyboard.

We asumed that the surveyors won't have connectivity the whole time,
so we decided to save the data locally using client-side HTML5 local
storage, and it's constrained to local browser limitations
(e.g. google chrome doesn't allow this data to be bigger than 5MB). It
can be viewed (and changed) in Google chrome using the Developer
Tools. The application includes an option to export the data.

Possible Improvements
----------

I had many ideas on how to improve this application, but in the moment
it was created we had to produce it as fast as possible, because the
surveyors were waiting to use it, nevertheless I made a list of
interesting improvements that can be done to it, to make it a more
robust product:

- Support smartphone and tablet interfaces
- Save and synchronize survey information in the server side
- Survey-edition in the admin interface (questions only)
- Server-side statistics and graphs
