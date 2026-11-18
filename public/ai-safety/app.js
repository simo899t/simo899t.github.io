(function () {
  "use strict";

  var DATA = window.EXPLORER;
  var app = document.getElementById("app");
  var STORE_KEY = "ai-safety-explored";
  var revealed = false;
  var current = null; // { kind, solution, level }

  // ---------- small helpers ----------
  function esc(s) {
    return String(s).replace(/[&<>"']/g, function (c) {
      return { "&": "&amp;", "<": "&lt;", ">": "&gt;", '"': "&quot;", "'": "&#39;" }[c];
    });
  }
  function load(key, fallback) {
    try { var v = localStorage.getItem(key); return v ? JSON.parse(v) : fallback; } catch (e) { return fallback; }
  }
  function save(key, value) {
    try { localStorage.setItem(key, JSON.stringify(value)); } catch (e) { /* storage unavailable */ }
  }
  function explored() { return load(STORE_KEY, []); }
  function markExplored(id) {
    var list = explored();
    if (list.indexOf(id) === -1) { list.push(id); save(STORE_KEY, list); }
  }
  function findSolution(id) {
    for (var i = 0; i < DATA.solutions.length; i++) if (DATA.solutions[i].id === id) return i;
    return -1;
  }
  function go(hash) { location.hash = hash; }
  function focusMain() { app.focus({ preventScroll: true }); window.scrollTo(0, 0); }

  // ---------- screens ----------
  function renderProblem() {
    current = { kind: "problem" };
    var p = DATA.problem;
    app.innerHTML =
      '<section class="wrap hero">' +
      '<div class="kicker">' + esc(p.kicker) + "</div>" +
      "<h1>" + esc(p.title) + "</h1>" +
      p.body.map(function (t) { return "<p>" + esc(t) + "</p>"; }).join("") +
      '<div class="actions"><a class="btn primary" href="#/solutions">' + esc(p.button) + " &rarr;</a></div>" +
      "</section>";
  }

  function renderMenu() {
    current = { kind: "menu" };
    var done = explored();
    var cards = DATA.solutions.map(function (s, i) {
      var isDone = done.indexOf(s.id) !== -1;
      return (
        '<a class="card" href="#/s/' + s.id + '/1">' +
        (isDone ? '<span class="done">Explored</span>' : "") +
        '<div class="num">' + (i + 1) + "</div>" +
        "<h3>" + esc(s.title) + "</h3>" +
        "<p>" + esc(s.tagline) + "</p></a>"
      );
    }).join("");
    app.innerHTML =
      '<section class="wrap">' +
      "<h2>How would you make AI safe?</h2>" +
      '<p class="lead">Pick an idea. Each one goes four levels deep: try a fix, see what goes wrong, try to fix it again.</p>' +
      '<div class="grid">' + cards +
      '<a class="card why" href="#/why"><div class="num">&#9670;</div><h3>' + esc(DATA.closing.title) +
      "</h3><p>What all of this adds up to, and what researchers are doing about it.</p></a>" +
      "</div>" +
      '<div class="menu-foot"><span>' + done.length + " of " + DATA.solutions.length + " explored</span>" +
      (done.length ? '<button class="ghost" type="button" id="reset">Start over</button>' : "") +
      "</div></section>";
    var reset = document.getElementById("reset");
    if (reset) reset.addEventListener("click", function () { save(STORE_KEY, []); renderMenu(); });
  }

  function exampleBlock(ex) {
    if (!ex) return "";
    var src = "";
    if (ex.source) {
      src = '<p class="src">Source: ' + (ex.link
        ? '<a href="' + esc(ex.link) + '" target="_blank" rel="noopener">' + esc(ex.source) + "</a>"
        : esc(ex.source)) + "</p>";
    }
    return '<details class="example"><summary>Real example</summary><p>' + esc(ex.body) + "</p>" + src + "</details>";
  }

  function renderStep(id, levelNum) {
    var idx = findSolution(id);
    if (idx === -1) return renderMenu();
    var s = DATA.solutions[idx];
    var n = Math.min(Math.max(levelNum, 1), s.levels.length);
    var lv = s.levels[n - 1];
    var last = n === s.levels.length;
    current = { kind: "step", solution: s, index: idx, level: n };

    var dots = s.levels.map(function (_, i) { return '<span class="' + (i < n ? "on" : "") + '"></span>'; }).join("");
    var head =
      '<div class="crumbs"><a href="#/solutions">&larr; All solutions</a>' +
      '<div class="dots" aria-label="Level ' + n + " of " + s.levels.length + '">' + dots + "</div></div>" +
      '<div class="label">' + esc(s.title) + " &middot; Level " + n + " of " + s.levels.length + "</div>" +
      '<div class="fix"><h2>' + esc(lv.fix) + '</h2><p class="seems">' + esc(lv.text) + "</p></div>";

    var body;
    if (!revealed) {
      body = '<div class="actions"><button class="primary" type="button" id="reveal">What goes wrong?</button>' +
        (n > 1 ? '<a class="btn" href="#/s/' + s.id + "/" + (n - 1) + '">Back</a>' : "") + "</div>";
    } else {
      body = '<div class="panel wrong reveal"><div class="label">What goes wrong</div><p>' + esc(lv.wrong) + "</p></div>" +
        exampleBlock(lv.example);
      if (!last) {
        body += '<div class="actions"><a class="btn primary" href="#/s/' + s.id + "/" + (n + 1) + '">Try to fix it &rarr;</a>' +
          '<a class="btn" href="#/solutions">Try another solution</a></div>';
      } else {
        markExplored(s.id);
        var next = DATA.solutions[(idx + 1) % DATA.solutions.length];
        var link = s.researchersLink
          ? '<p class="src" style="margin-top:10px">Read more: <a href="' + esc(s.researchersLink.link) +
            '" target="_blank" rel="noopener">' + esc(s.researchersLink.label) + "</a></p>"
          : "";
        body +=
          '<div class="panel good reveal"><div class="label">What researchers do</div><p>' + esc(s.researchers) + "</p>" + link + "</div>" +
          '<div class="terms">' + s.terms.map(function (t) {
            return '<div class="term"><b>' + esc(t[0]) + "</b><span>" + esc(t[1]) + "</span></div>";
          }).join("") + "</div>" +
          '<div class="actions"><a class="btn primary" href="#/solutions">Back to solutions</a>' +
          '<a class="btn" href="#/s/' + next.id + '/1">Next: ' + esc(next.title) + "</a>" +
          '<a class="btn" href="#/why">Why this matters</a></div>';
      }
    }

    app.innerHTML = '<section class="wrap">' + head + body + "</section>";
    var btn = document.getElementById("reveal");
    if (btn) btn.addEventListener("click", reveal);
  }

  function reveal() {
    if (!current || current.kind !== "step" || revealed) return;
    revealed = true;
    renderStep(current.solution.id, current.level);
    var panel = app.querySelector(".panel.wrong");
    if (panel && panel.scrollIntoView) panel.scrollIntoView({ block: "nearest", behavior: "smooth" });
  }

  function renderWhy() {
    current = { kind: "why" };
    var c = DATA.closing;
    var holes = function (seed) {
      var out = "";
      for (var i = 0; i < 4; i++) {
        var x = (seed * 37 + i * 53) % 85 + 4;
        var y = (seed * 23 + i * 41) % 44 + 8;
        out += '<i style="left:' + x + "%;top:" + y + 'px"></i>';
      }
      return out;
    };
    app.innerHTML =
      '<section class="wrap">' +
      '<div class="kicker">Putting it together</div>' +
      "<h2>" + esc(c.title) + "</h2>" +
      '<p class="lead">' + esc(c.lead) + "</p>" +
      '<h3 class="sub">Three patterns</h3><div class="patterns">' +
      c.patterns.map(function (p) { return '<div class="pattern"><b>' + esc(p[0]) + "</b><span>" + esc(p[1]) + "</span></div>"; }).join("") +
      "</div>" +
      '<h3 class="sub">No single slice is enough</h3>' +
      '<div class="cheese" aria-hidden="true">' +
      [1, 2, 3, 4, 5].map(function (k) { return '<div class="slice">' + holes(k) + "</div>"; }).join("") +
      "</div><p>" + esc(c.cheese) + "</p>" +
      '<h3 class="sub">What the field is working on</h3><ul class="field">' +
      c.field.map(function (f) { return "<li>" + esc(f) + "</li>"; }).join("") + "</ul>" +
      '<h3 class="sub">Talk about it</h3><ol class="qs">' +
      c.questions.map(function (q) { return "<li>" + esc(q) + "</li>"; }).join("") + "</ol>" +
      '<h3 class="sub">Learn more</h3><ul class="field">' +
      c.learn.map(function (l) { return '<li><a href="' + esc(l[1]) + '" target="_blank" rel="noopener">' + esc(l[0]) + "</a></li>"; }).join("") +
      "</ul>" +
      '<div class="actions"><a class="btn primary" href="#/solutions">Back to solutions</a><a class="btn" href="#/">Start page</a></div>' +
      "</section>";
  }

  // ---------- routing ----------
  function route() {
    var h = location.hash.replace(/^#\/?/, "");
    var parts = h.split("/");
    revealed = false;
    if (parts[0] === "solutions") renderMenu();
    else if (parts[0] === "why") renderWhy();
    else if (parts[0] === "s" && parts[1]) renderStep(parts[1], parseInt(parts[2], 10) || 1);
    else renderProblem();
    focusMain();
  }

  // ---------- presenter mode ----------
  var toggle = document.getElementById("present-toggle");
  function setPresent(on) {
    document.body.classList.toggle("present", on);
    toggle.setAttribute("aria-pressed", on ? "true" : "false");
    save("ai-safety-present", on);
  }
  toggle.addEventListener("click", function () { setPresent(!document.body.classList.contains("present")); });
  setPresent(/[?&]present\b/.test(location.search) || load("ai-safety-present", false));

  // ---------- keyboard (for projector / clicker use) ----------
  document.addEventListener("keydown", function (e) {
    if (e.metaKey || e.ctrlKey || e.altKey) return;
    var tag = (e.target && e.target.tagName) || "";
    if (tag === "INPUT" || tag === "TEXTAREA") return;
    var k = e.key;
    if (k === "p" || k === "P") { setPresent(!document.body.classList.contains("present")); return; }
    if (k === "Escape") { go("#/solutions"); return; }
    if (!current) return;
    var forward = k === "ArrowRight" || k === "PageDown" || (k === " " && tag !== "BUTTON" && tag !== "A" && tag !== "SUMMARY");
    var back = k === "ArrowLeft" || k === "PageUp";
    if (!forward && !back) return;
    e.preventDefault();
    if (current.kind === "problem") { if (forward) go("#/solutions"); return; }
    if (current.kind === "step") {
      var s = current.solution, n = current.level;
      if (forward) {
        if (!revealed) reveal();
        else if (n < s.levels.length) go("#/s/" + s.id + "/" + (n + 1));
        else go("#/solutions");
      } else {
        if (n > 1) go("#/s/" + s.id + "/" + (n - 1));
        else go("#/solutions");
      }
    }
  });

  window.addEventListener("hashchange", route);
  route();
})();
