import os
counter = 0
alpha = {'1':'1','2':'2','3':'3','4':'4','5':'5','6':'6','7':'7','8':'8','9':'9','10':'9a','11':'9b','12':'9c','13':'9d','14':'9e','15':'9f','16':'9g','17':'9h','18':'9i','19':'9j','20':'9k','21':'9l','22':'9m','23':'9n','24':'9o','25':'9p','26':'9q','27':'9r','28':'9s','29':'9t','30':'9u','31':'9v','32':'9w','33':'9x','34':'9y','35':'9z','36':'9za','37':'9zb','38':'9zc','39':'9zd','40':'9ze'}
for iname in os.listdir(os.getcwd()):
   numberstring = ''
   if '.jpg' in iname.lower():
     fname, ext = iname.split('.')
     fname, ext = fname.strip(), ext.strip()
     for s in fname:
       if s.isdigit():
         numberstring = numberstring+s
     fname = fname.replace(numberstring,alpha[numberstring])     
     oname = fname + '.' + ext.lower()
     os.rename(iname, oname)
