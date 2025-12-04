# Galaxy project at UiO - combining the web interface and power of a high performance computer cluster FOX
At USIT (https://www.usit.uio.no/) we have a galaxy instance which is connected to the High Performance Computing cluster FOX (https://galaxy.educloud.no). This instance has more than 6500 tools for bioinformatics, it actually mounts the tool directory from the Galaxy project (by CVMFS). CVMFS (CernVM File System) is a service which deploys software and reference data on computing infrastructure. CernVM-FS is a read-only file system where the applications and reference data are hosted on servers outside the computing infrastructure (FOX cluster, in our case) and are mounted in the Galaxy server as any other directory.   The galaxy-on-FOX instance is connected to an HPC cluster and allows for complex and heavy calculations. It also proposes a substantial storage of 1TB for each user. The datasets in this storage are manageable directly from the Galaxy by its file manager.  Galaxy-on-FOX is free to use and provides a daily user support for all interested users. It is very convenient for courses and teamwork in groups as it allows for sharing of resources and for reproduction both of procedures and results. It can easily integrate partners from national and foreign institutions.

## Instructors
Nikolay Vazov, Torfinn Nome, Sabry Razick, Pubudu Saneth Samarakoon

## Prerequisites 

1. A laptop with a WiFi connectivity and a common browser : Google Chrome, Firefox, Edge, Safari ...
   
2. Before the start of the course it is recommended that all the participants :
   
   -  Apply for the ec73 project in Educloud. Please follow the attached document : [Instructions to apply for the Galaxy project in Educloud](./GALAXY-FOX-portal-application.pdf). The user support will receive an e-mail with your application and will approve your membership to ec73.
     
        <sub>_why do you need this_ : The web platform Galaxy sends its calculations for execution to the High Performance Computing (HPC) cluster FOX. To optimize the performance and management, clusters require that all calculations (jobs) run in dedicated projects. All users must be members of a cluster project in order to be allowed to run cluster jobs. Galaxy on FOX uses project ec73 and this is the project all the users shall apply for.</sub>
       
   -  Set up two-factor authentication, often referred to as OTP (One Time Passcode). You can set this up using ID-porten and an authentication app on your mobile. Please refer to the following link for detailed instructions [Set up two-factor authentication](https://www.uio.no/english/services/it/research/platforms/edu-research/help/two-factor-authentication.html)
  
3.  After executing the two steps above, please log in to Galaxy using your username and password from the application and your OTP (One Time Passcode) generated on your mobile phone. To do this go to (https://galaxy.educloud.no/) and click on the Login button.
     
     <p align="center">
     <img src="Educloud-login.png" center raw=true />
     </p>


   - If you succeed, you shall see the following page
     
     <img src="Galaxy-welcome-page.png" center raw=true />

## Presentation

Open the [Galaxy presentation](https://docs.google.com/presentation/d/1nmJh4OO_JMljCk96xLYti--sYX1xxGzd/edit?usp=sharing&ouid=109401063488907514927&rtpof=true&sd=true)

## Hands-on Session - basics

1. Download the [simple dataset to start](two-column-table.txt) to your laptop. 
2. Log into Galaxy at (https://galaxy.educloud.no)
3. See the three panels:
      - Tools (entire set of tools you can use) - LEFT
      - Menu of the selected tool (here you define how to run the tool) - CENTER
      - History (your individual workspace) - RIGHT
4. Create a new history in the history pannel. Click on the + sign in the right upper corner.
5. Upload the file `two-column-table.txt` to Galaxy. This will be your first dataset in Galaxy-FOX. Let's do something with it -:)
6. SINGLE JOBS - 1 
      - Select the tool group `Text Manipulation` and then the tool `Convert delimiters to TAB`
      - Select the dataset `two-column-table.txt` from History, select `Commas` from the `Convert all` parameter, and run the job.
      - Examine the result.
7. SINGLE JOBS - 2
      - Select the tool group `Text Manipulation` and then the tool `Line/Word/Character count of a dataset`.
      - Select the dataset `Convert on data X` and run the job.
      - Examine the result.
8. WORKFLOW
      - Create
          - Select `Workflows` on the top menu and click on `+Create`
          - Select the tool group `Inputs` and then the tool `Input dataset`
          - Select the tool group `Text Manipulation` and then the tool `Convert delimiters to TAB`, with `Commas` selected from the `Convert all` parameter
          - Select the tool group `Text Manipulation` and then the tool `Line/Word/Character count of a dataset`
          - Click on the right upper corner pencil icon, give the workflow a name and save it by clicking on the disc icon
      - Run
          - Select `Workflows` on the top menu, choose a workflow and run it by clicking on the white arrow on blue background on the right
      - Export
          - Select `Workflows` on the top menu, choose a workflow and export it by clicking on the blue arrow in the right upper corner of the workflow box
9. WORKFLOW
      - Extract from steps 6 & 7
      - Go to the three horisontal lines on the top of History and select `Extract workflow` in the dropdown
      - Check `two-column-table.txt` from History Items (green fields) section
      - Check `Include "Convert" in workflow` and `Include "Line/Word/Character count" in workflow` from Tools section
      - Click on `Create Workflow` button on top
10. DATA LIBRARIES
      - Create : go to `Data` > `Data Libraries`
      - Click on `+Libraries` and set Name/Description/Synopsis, then Save
      - Add Folders and Datasets into folders
      - Manage each folder or dataset by giving permissions over these entities to other users
11. VISUALIZATION
      - Select `Visualize` from the top menu
      - Select Line chart (NVD3) and then `Convert on data X`
      - Select Pie Chart (NVD3) and then `Convert on data X`
   
If you want to try it again using different examples, try this: [A short introduction to Galaxy](https://training.galaxyproject.org/training-material/topics/introduction/tutorials/galaxy-intro-short/tutorial.html)

## Hands-on Session - real examples

- Process sample dataset using tools available in Galaxy portal

## Software Requirements
