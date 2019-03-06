#!/usr/bin/python3

import sys
import json

if len(sys.argv) != 4:
    print("There are %d arguments" % (len(sys.argv)-1))
    print("Arguments should be")
    print("1-File path")
    print("2-Vault id")
    print("3-Environment")
else:
    path = sys.argv[1]
    vaultId = sys.argv[2]
    environment = sys.argv[3]

    print ('Json file:  %s' % (path))
    print ('Vault ID:  %s' % (vaultId))
    print ('Environment:  %s' % (environment))

    with open(path, 'r') as f:
        content = json.load(f)

        parameters = content['parameters']

        for p in parameters.values(): 
            p['reference']['keyVault']['id'] = vaultId
            p['reference']['secretName'] = p['reference']['secretName'].replace('env', environment)
        
        with open(path+".mod.json", "w") as output:
            json.dump(content, output)


