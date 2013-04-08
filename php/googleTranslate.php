#!/usr/bin/php5
<?php
/* Very Simple Google Translate REST client
* Created on march 19th 2011 ronan.guilloux
* @author ronan.guilloux
* @license http://www.gnu.org/licenses/agpl.txt GNU AFFERO GPL v3
* @version 1.0
*/

// URL example : http://www.googleapis.com/language/translate/v2?key=AIzaSyBoh0w_7SYPgEkpKAq5uvIcpLfXyX8efAs&q=flowers&source=en&target=fr&callback=handleResponse
// shortcut in ~/.bashrc : alias gtr='php ~/shell/googleTranslate.php' 
// usage  : gtr slug
$key = 'AIzaSyBoh0w_7SYPgEkpKAq5uvIcpLfXyX8efAs';
$word = trim($argv[1]);
$url = 'https://www.googleapis.com/language/translate/v2?key=%s&q=%s&source=en&target=fr&callback=handleResponse';
$url = sprintf($url, $key, $word);
//echo 'fetching ' . $url;
echo "\n" . file_get_contents($url) . "\n";

?>
