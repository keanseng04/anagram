We're going to write a simple web application that accepts a word via an HTML form and returns a list of anagrams. This will be our first database-backed web application.
<h2>Learning Goals</h2>
<ul>
	<li>Become more familiar with how HTML forms work</li>
	<li>Understand the difference between the various HTTP methods (GET, POST, etc.).</li>
	<li>Gain familiarity with the core patterns of MVC on the web.</li>
</ul>
<h2>Objectives</h2>
<h3>Create Models &amp; Migrations</h3>
First, download and decompress the <a href="http://ge.tt/8fpASR22/v/0?c">sinatra application skeleton here</a>.

Second, we need to store the dictionary of words from which to construct anagrams in the database. We'll do it with a<code>words</code> table.

That means we'll need a <code>Word</code> model and a <code>create_words</code> migration. You can generate them by running the following from the command line inside the application root directory:
<div class="highlight">
<pre><span class="nv">$ </span>rake generate:model <span class="nv">NAME</span><span class="o">=</span>Word
<span class="nv">$ </span>rake generate:migration <span class="nv">NAME</span><span class="o">=</span>create_words
</pre>
</div>
These are custom rake tasks. Look in the <code>Rakefile</code> to see how they work, if you're curious.
<h3>Import a Dictionary</h3>
<h3>- Ubuntu</h3>
<ol>
	<li>Download this file: <a href="http://ge.tt/2PLiRT22/v/0?c">http://ge.tt/2PLiRT22/v/0?c</a></li>
	<li>Put the file in your application directory</li>
</ol>
<h3>- OS X</h3>
OS X comes with its own big-ass dictionary. Try running this from the command line:
<div class="highlight">
<pre><span class="nv">$ </span>cat /usr/share/dict/words <span class="c"># outputs the contents of the file to STDOUT</span>
<span class="nv">$ </span>wc -w /usr/share/dict/words <span class="c"># counts the number of words in the file</span>
</pre>
</div>
Copy <code>/usr/share/dict/words</code> into your application directory.
<h3>- Seed your database with words</h3>
Edit <code>db/seeds.rb</code> to read the dictionary file in and create one entry in the <code>words</code> table per word in the file.

We're copying the file into our application directory because in the world where we deploy the application to a server or someone else installs the application on their computer we want each instance to have the same dictionary, not whatever dictionary happens to be on the machine.
<h3>Build The Site</h3>
Before we dive into constructing anagrams, let's get the page to show the URL parameter on the web page.

Build your application such that when you visit <a href="http://localhost:9393/chicken">http://localhost:9393/chicken</a>. You see something like this:

<img src="http://f.cl.ly/items/0D1b3q1E1q3R0y3x461s/Screen%20Shot%202013-02-18%20at%209.15.07%20AM.png" alt="" />

As always, you can start your application by running <code>$ shotgun config.ru</code>

Now edit <code>app/views/index.erb</code> to make it look like you want. Feel free to add your own CSS, remove debugging information, etc. But make sure you understand the flow of data from the browser to the server and back to the browser again.
<h3>Define a <code>Word#anagrams</code> Method</h3>
Define a method on your <code>Word</code> model like this:
<div class="highlight">
<pre>class Word &lt; ActiveRecord::Base
  ...
  <span class="c"># Returns an Array of Word objects which represent anagrams of this word</span>
  <span class="c"># This can and should make calls to the database</span>
  <span class="c"># Try to do it in as few calls as possible, without loading every word into memory. If you can't, that's ok.</span>
  def anagrams
  end
  ...
end
</pre>
</div>
You should re-use some of the logic from <a href="http://learn.codedivision.my/challenges/14">Anagrams 2: Generating Anagrams</a>. You might think this means "re-use the<code>anagrams_for</code> method we defined there." That's not what we mean; we mean re-use the core logic. It should be written in an object-oriented style and return an <code>Array</code> of <code>Words</code>, not <code>Strings</code>.
<h3>Display Anagrams</h3>
Edit <code>app/controllers/index.rb</code> so that then you visit <code>http://localhost:9393/racecar</code>,<code>http://localhost:9393/apples</code>, etc. it displays a nice list of anagrams for the given word as encoded in the URL.

It should still render the same form, so your users can ask for a new set of anagrams. Remember: DRY! Small fragments of view code that are to be re-used between views are called <strong>partials</strong> .

See <a href="http://www.sinatrarb.com/faq.html#partials">How do I render partials?</a> in Sinatra's FAQ.
<h3>Upload Your Attempt</h3>
Upload to a gist any files that you've changed, or embed the github project repository URL in a gist and submit that if you prefer.
