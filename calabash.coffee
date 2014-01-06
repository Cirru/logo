
require("calabash").do "reload",
  "pkill -f doodle"
  "coffee -o src/ -cwm coffee/"
  "doodle index.html src/ log:yes"