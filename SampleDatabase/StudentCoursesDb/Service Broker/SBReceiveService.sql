CREATE SERVICE [SBReceiveService]
    AUTHORIZATION [dbo]
    ON QUEUE [dbo].[SBReceiveQueue]
    ([SBContract]);

