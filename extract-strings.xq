xquery version "3.0";
declare namespace ead = "urn:isbn:1-931666-22-9";
declare namespace output = "http://www.w3.org/2010/xslt-xquery-serialization";
declare option output:method "text";
(:for xml output change method to xml OR don't use option at all:)
(:declare option output:method "xml";:)

(:for directory follow this pattern::)
(:declare variable $ead as document-node()* := collection("../../../eads/mss")/doc(document-uri(.));:)

declare variable $ead as document-node()* := doc("../../../eads/mss/C1508.EAD.xml");

let $field := ($ead//ead:unittitle | $ead//ead:titleproper | $ead//ead:scopecontent | $ead//ead:abstract)
(:to extract all component-level notes, use $ead//ead:c/*[not(self::ead:did) and not(self::ead:c)]:)
(:to extract all collection-level notes, use $ead//ead:archdesc/*[not(self::ead:did) and not(self::ead:dsc)]:)

return
for $f in $field
return
(:create CSV table with cid, field name, string value, line break. NB cid will remain blank for collection-level fields.:)
($f/ancestor::ead:c[1]/@id || '*' || $f/name() || '*' || normalize-space($f/string()) || codepoints-to-string(10))
(:or <string>{normalize-space($s)}</string>:)
