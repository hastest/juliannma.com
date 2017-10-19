---
layout: page
title: Media
# subtitle: hi!
permalink: /press/
---

Press Kit
=========

- Long biography (1 page, PDF)
- [Short biography](/short_bio.txt) (250 words)
- Brief (100 words)
- Press photographs
- [downloadable kit](https://static.hackartscience.com/juliannma/juliann_ma_press_kit.zip)

{% assign upcoming_events = site.events | where_exp: "event", "event.date >= site.time" | sort 'date' | reverse %}
{% if upcoming_events != empty %}
<h2>Upcoming Events</h2>
<ul>
{% for event in upcoming_events %}
  {% if event.short_title %}
    {% assign title = event.short_title %}
  {% else %}
    {% assign title = event.title %}
  {% endif %}

  {% if event.short_location %}
    {% assign location = event.short_location %}
  {% else %}
    {% assign location = event.location %}
  {% endif %}

  {% assign id = event.id | replace_first: '/', '' | replace: '/', '-'%}

  {% if event.content.size > 2 %}
    {% assign excerpt = event.content %}
  {% endif %}

  <li>
    <span class="calendar_tile">{{ event.date | date: "%-A, %b %-d, %I:%M%p"}}, </span>
    <b>{{ title }}</b>, at {{ location }}
    {% if event.rsvp_link %}(<a href="{{ event.rsvp_link }}">RSVP</a>){% endif %}
    {% if excerpt %}
      <span class="event-detail">{{ excerpt }}</span>
    {% endif %}
  </li>
{% endfor %}
</ul>
{% endif %}

Juliann Ma's Biography
----------------------

Often lauded as an “audience favorite” ( –Pianomania Festival), 25-year-old pianist Juliann Ma has performed across the United States, Austria, France, Germany, Jamaica, and the Netherlands. Juliann has been invited to give solo, chamber, collaborative, and interdisciplinary concerts in such venues as the American Church in Paris, Arnold Schönberg Center, Cantor Arts Center, British Consul General Residence (San Francisco), Dôme des Grandes Ecuries (Chantilly), Gilder Lerman Hall (Morgan Library & Museum), Herbst Theater, Konzertsaal Bundesallee, New Jersey Performing Arts Center, Salle Cortot, and Weill Recital Hall (Carnegie Hall). She enjoys traveling and experiencing different cultures: in 2011-2012, she was based in Paris as a Fulbright Scholar; currently, she resides in New York City.


### Education

Born and raised in the San Francisco Bay Area, Juliann began performing classical piano at the age of four, making her orchestral debut with the El Camino Youth Symphony at the age of eight. At fifteen, Juliann was the featured soloist with the California Youth Symphony and San Francisco Chamber Orchestra, and became a regular performing artist at the Junior Bach Festival and guest at the Carmel Bach Festival and Pro-Arte Symphony’s Pianomania Festival. In 2011, Juliann completed her Bachelor of Music degree from Stanford University on full scholarship, graduating with honors and distinction and a minor in Creative Writing. She was awarded the prestigious Robert M. Golden Medal for her outstanding contributions to the Humanities and the Arts to the Stanford community. Following her time at Stanford, Juliann earned her Diplôme d’Exécution de Piano et de Musique de Chambre from École Normale Supérieure de Musique de Paris «Alfred Cortot», during her Fulbright studies. Currently, Juliann is completing her Master of Music degree at The Juilliard School in New York as a student of Hung Kuan Chen, Jerome Lowenthal, and Matti Raekallio.


### Concerto Appearances and Performances

Winning the Stanford Concerto Competition (2010), Juliann performed with the Stanford Symphony Orchestra (2011) and was invited to perform with the Peninsula Symphony Orchestra at Bing Concert Hall during its inaugural year (2013). She has worked with prestigious conductors Jindong Cai, Philippe Dalarun, Leo Eylar, Mitchell Klein, Jeffrey Milarsky, and Benjamin Simon, to name a few. Additional concert series appearances include Ars Antonia, Daniel Pearl World Memorial Concerts, Salle Cortot and Stanford University Noon Concerts.


### Festivals, Seminars and Summer Programs

Juliann has had the privilege of attending festivals such as The International Holland Music Sessions; Fulbright Berlin Seminar, hosted by the German-American Fulbright Commission; Piano Music of the Second Viennese School, Schönberg Haus, Mödling; and Stanford University Sophomore College: Musical Collisions and Radical Creativity, led by Professor Mark Applebaum. During her summers, Juliann relishes the opportunity to interact with colleagues from all over the world in new and exciting multi-disciplinary collaborations.


### Scholarships

For her performances and education, has been sponsored by the American Friends of Chantilly, France-Etats-Unis Nice, Franco-American and German-American Fulbright Commissions, Friends of Music (Stanford University), the Freidenrich and Bing families, The International Holland Music Sessions, amongst numerous private donors. She is currently being supported by the A. & C. Levy, Judy Gelfand Piano, and Moca Foundation Scholarships at The Juilliard School.


### Community

Complementing her performance schedule, Juliann is passionate about innovative and well-rounded education. Since 2006, Juliann has tutored students, colleagues, and faculty in French, English, mathematics, expository and creative writing, and music. During the summer of 2013, she served as a resident counselor and teaching assistant at the Stanford Summer Institutes for high school students in the Creative Writing program. From 2009-2011, her position as an Arts Academic Theme Associate at Stanford University gave Juliann the opportunity to design, implement, and direct arts programs and events throughout the campus, cumulating in several arts exhibitions, interviews, and performances by artists, both in-house and off-campus. Notable resulting projects include the ‘Red Couch Concerts’, spearheaded by her colleagues Emma Sedivy and Stephen Henderson, which can be found on Youtube. In addition, Juliann co-taught weekly arts enrichment classes, which included music video production, jewelry design, interior design, culinary arts, and Bollywood dance.
Juliann also devotes time to community service. She has been a major part of Stanford University’s Kimball Haiti fundraiser effort; Stanford Cloud Collaboration Project, supporting cancer research through an arts mural (currently exhibited in Kimball Hall, Stanford University); Music and Medicine collaboration between Weill Cornell Medical College and The Juilliard School; the Daniel Pearl World Memorial Concert Series; and Juilliard’s Gluck Fellowship (see ‘New Horizons’). She also regularly performs for Professor David Dubal’s class in Juilliard’s Evening Division, where she shares her love for music with the greater New York City community.


### New Horizons

Juliann enjoys pursuing new horizons in her music career and is constantly seeking to break the boundaries of musical traditions. She explores her own creativity in music authorship through her work with The Last Word, a piano quartet she co-founded (coached by Noam Sivan), specializing in free improvisation and interaction with audience; as well as through her growing partnership with Chi Wei Lo in their newly formed jazz improvisation duo, C. Lo & Joolz.
She commits to her passions for interdisciplinary collaboration and community health and harmony through her work as a Gluck Community Service Fellow. Facilitated through Juilliard, her team (comprised of a piano trio and two dancers) gives interactive interdisciplinary arts performances at hospitals, senior centers, and homeless shelters. Oftentimes, she gives lecture-concerts, narrating or acting out a theatrical script based on their collaborative performances (i.e. their trio arrangement of and choreography to Schumann’s Carnaval Op. 9). In addition to collaborating with dancers, Juliann recently worked with fifteen pianists and two actors to commemorate the centennial of World War I through Juilliard’s 2014 edition of the PianoScope series.


### New Music

Enjoying a variety of musical styles, Juliann spends a significant portion of her time working with and promoting current composers. Recently, she has given the American premiere of Juilliard composer Alexander Liebermann’s “Rondeaux” for soprano and piano, French premiere of Edith Lejet’s “Echos dans la vallée” for clarinet, viola, and piano, and world premiere of Stanford composer Marc Evans’s “The Hundred Acre Wood Suite” for chamber orchestra. This coming April, Juliann will be giving the world premiere of Alex Liebermann’s “Piano Trio Op. 4” at Weill Recital Hall, Carnegie Hall.


### International

As an avid follower of the work of Daniel Barenboim, Marion Cotillard, Yo-Yo Ma, and Meryl Streep, Juliann continues to develop her studies and interests in international cooperation through the arts. Her current projects include developing cross-cultural and interdisciplinary interactive recital programs to be performed in various settings, as well as directing music videos of composer friends’ works, of which she will complete recordings this spring. The Launch is predicted to occur during fall of 2015.
Ultimately, Juliann’s intention is to use her diverse experiences to create educational interdisciplinary and cross-cultural programs for artists and non-artists, to revolutionize classical music conventions and broaden the creative and ambassadorial possibilities that exist in art today.
