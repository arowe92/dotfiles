let fs = require('fs');

let dir = '/Users/alexrowe/Desktop/themes/';
let file_names = fs.readdirSync(dir);

file_names = file_names.filter(f => f.match('.sublime-theme'));

let themes = {};

for (let f of file_names) {
  let file = fs.readFileSync(dir + f, 'utf-8');

  let s = JSON.stringify({
    "specific": true
  });

  file = file.replace(/Specific/g,`\n${s},\n//`);

  file = file.replace(/\/\*[^/]*\*\//g,'');
  file = file.replace(/\n+/g,'\n');
  file = file.replace(/\/\/.*/g,'');
  file = file.replace(/,[\n ]*\}/g,'\n}');
  file = file.replace(/,[\n ]*]/g,'\n]');

  let json = JSON.parse(file)
  let specifics = {};

  let theme = {}
  let fg;
  for (let i in json) {
    theme[json[i].class]=json[i];
    if (i > 0 && json[i-1].specific) {
      specifics[json[i].class] = json[i];
    }

    if (Object.keys(json[i]).join(':') == 'class:color') {
      fg = json[i].color;
    }
  }
  themes[f] = theme;

  let new_json = [{
    class: "title_bar",
    fg,
    bg: specifics.status_bar['layer0.tint'],
  }];

  file = fs.writeFileSync('./' + f, JSON.stringify(new_json, null, '  '), 'utf-8');
}
