# Pritunl CI/CD pipeline

<a href="https://dash.elest.io/deploy?source=cicd&social=dockerCompose&url=https://github.com/elestio-examples/pritunl"><img src="deploy-on-elestio.png" alt="Deploy on Elest.io" width="180px" /></a>

Deploy Pritunl server with CI/CD on Elestio

<img src="pritunl.png" style='width: 100%;'/>
<br/>
<br/>

# Once deployed ...

You can open Pritunl ADMIN UI here:

    URL: https://[CI_CD_DOMAIN]
    email: pritunl
    password: [ADMIN_PASSWORD]

# Quick start

1. After logging in with your credentials, you will have a popup that will appear, click on save without touching anything.

   <img src="./steps/step-01.png" style='width: 300px;'/>

2. Before you begin, go to the `Users tab` and click on `Add Organization`.
   A popup will open, put the name of your organization and click on `Add`.

   <img src="./steps/step-02.png" style='width: 300px;'/>

3. Click on `Add User`.
   A popup will open, put the name of the user, choose a 6-length digit for the pin and click on `Add`.

   <img src="./steps/step-03.png" style='width: 300px;'/>

4. Go to the `Servers tab` and click on `Add server`.
   A popup will open, put the name of the server, make sure that Port value is `1194`, then click on `Add`.

   <img src="./steps/step-04.png" style='width: 300px;'/>

5. Click on `Attach Organization`.
   A popup will open, choose the organization to connect to the server, click on `Attach`, then click on `Start server`.

   <img src="./steps/step-05.png" style='width: 300px;'/>

6. Now you will have to download the user file to be able to connect to the server.
   Before doing this, you will need to download two software.

- 7zip to extract the customer file, <a href="https://www.7-zip.org/" target="_blank">Download here</a>
- OpenVPN to connect to your VPN, <a href="https://openvpn.net/client/" target="_blank">Download here</a>

7. Once installed, go back to the `Users tab`, and next to the user status, you have some icons, click on the `arrow icon`.

   <img src="./steps/step-06.png" style='width: 300px;'/>

8. Extract the `.tar` file, launch OpenVPN, and click to the `UPLOAD FILE tab`. Browse your file and open it.

   <img src="./steps/step-07.png" style='width: 300px;'/>

9. Enter your credentials, then click on `CONNECT`.
   Now you are connected to your VPN.

   <img src="./steps/step-08.png" style='width: 300px;'/>
