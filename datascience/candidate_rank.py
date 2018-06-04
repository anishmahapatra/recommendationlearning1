d = {'profile_id' : [1,2,3,4,5]
	 'profile_name' : ['ram', 'shyam']
     



}


if d is not None and len(d) > 0:
	for dkey, dvalue in d.iteritems():
        key = d.get(dkey, None)
        print key
        values =d.get(dvalue, None)

        if values is not None and len(values) > 0:
            for item in values:
                print item