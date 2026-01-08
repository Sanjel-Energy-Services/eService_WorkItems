<!-- Identifier: C-04-09-04-05 -->
<!-- Name:  Finalize Test Results -->



```mermaid

sequenceDiagram
    
box Sanjel
    participant Lab Technician
    participant  LabDatabase
end

    Lab Technician->>LabDatabase: Upload Test Results
    

    Lab Technician->>LabDatabase: Review Test Result File
   

    Lab Technician->> LabDatabase: Process Test Result File
    %%Sanjel LabDatabase->>Lab Technician: Confirm Processing Completion

    loop Check More Files
        LabDatabase->> LabDatabase: More Test Result Files to Process?
        alt More Files Available
             LabDatabase->>Lab Technician: Prompt to Upload Next File
        else No More Files
            LabDatabase->>Lab Technician: All Test Files Processed
        end
    end


```









