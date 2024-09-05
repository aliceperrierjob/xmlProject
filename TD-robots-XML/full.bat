java -cp ".\saxon9he.jar" net.sf.saxon.Transform request-5.xml request.xsl > x1.xml 
java -cp ".\saxon9he.jar" net.sf.saxon.Transform x1.xml invoice.xsl > x2.xml 
java -cp ".\saxon9he.jar" net.sf.saxon.Transform x2.xml robot2html.xsl > x0.html 

pause
