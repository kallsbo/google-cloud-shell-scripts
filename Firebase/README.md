# Google Cloud Shell Scripts - Firebase

### generateFirebaseConfig.sh
Generates a file with Firebase emulator config values to work with CLoud Shell. Cloud shell tunnels everything through HTTPS so you will get a unique domain name for each port used. So in order for this to work we need to add  For this to work I have used the following setup where I initiate the emulators in my client side code (React example):

```javascript
import { getAuth, connectAuthEmulator } from 'firebase/auth';
import { getFirestore, connectFirestoreEmulator } from 'firebase/firestore';
import * as fireVars from './FireVars';

this.auth = getAuth(app);
this.db = getFirestore(app);

// Debug only
if (!process.env.NODE_ENV || process.env.NODE_ENV === 'development') {
    // Use local db emulator
    connectFirestoreEmulator(this.db, `${fireVars.EMU_FS_HOST}`, fireVars.EMU_FS_PORT);

    // Use local auth emulator
    connectAuthEmulator(this.auth, `${fireVars.EMU_PROT}${fireVars.EMU_AUTH_HOST}`);
} 
```
The generated file will come out like this:

```javascript
export const EMU_PROT = 'https://';
export const EMU_FS_HOST = '8080-zz97bb6ee-5yya-33e7-8e9c-bv04hh207ee7.cs-europe-west4-bhnf.cloudshell.dev';
export const EMU_AUTH_HOST = '9099-zz97bb6ee-5yya-33e7-8e9c-bv04hh207ee7.cs-europe-west4-bhnf.cloudshell.dev';
export const EMU_FS_PORT = '443';
```

And the normal file checked in to git for local use looks like this:
```javascript
export const EMU_PROT = 'http://';
export const EMU_FS_HOST = 'localhost';
export const EMU_AUTH_HOST = 'localhost';
export const EMU_FS_PORT = '8080'; 
```

**usage:** ./generateFirebaseConfig.sh {*filename*}

### getFireStoreProdData.sh
Downloads an export from a projects Firestore. Since the cloud shell is already authenticated this will work without any additional configuration.

**usage:** ./getFireStoreProdData.sh {*project name*}
