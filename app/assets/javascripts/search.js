var lessons = instantsearch({
  appId: 'LZEMPFONKV',
  apiKey: '427c69ac1af038f71cecc79b5be449e3',
  indexName: 'Lesson',
});

var lessonsHits = instantsearch.widgets.hits({
  container: document.querySelector('#lessons'),
  hitsPerPage: 100,
  templates: {
    item: getTemplate('lesson'),
    empty: getTemplate('no-results-lesson'),
  }
});

var searchBox = instantsearch.widgets.searchBox({
  container: document.querySelector('#search-input'),
  placeholder: 'Search for your lesson',
});


$('document').ready(function(){
  lessons.addWidget(lessonsHits);
  lessons.addWidget(searchBox);
  lessons.start();
});


// ---------------------
//
//  Helper functions
//
// ---------------------
function getTemplate(templateName) {
  return document.querySelector("#" + templateName + "-template").innerHTML;
};
