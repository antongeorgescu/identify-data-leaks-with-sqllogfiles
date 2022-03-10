CREATE SERVICE [SBSendService]
    AUTHORIZATION [dbo]
    ON QUEUE [dbo].[SBSendQueue]
    ([SBContract]);

