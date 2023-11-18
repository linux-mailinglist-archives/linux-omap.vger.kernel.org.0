Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1BB6A7EFECB
	for <lists+linux-omap@lfdr.de>; Sat, 18 Nov 2023 11:05:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229702AbjKRKFR (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 18 Nov 2023 05:05:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbjKRKFR (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 18 Nov 2023 05:05:17 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24247D75
        for <linux-omap@vger.kernel.org>; Sat, 18 Nov 2023 02:05:14 -0800 (PST)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E5CDC433C7;
        Sat, 18 Nov 2023 10:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1700301913;
        bh=BmXZUF2ma1/hrosXgoLcgfFYEpLo3r5C4muwRlkrCP4=;
        h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
        b=R79ZpS4aFbihIl5t03deA5yaEuGm+wSwv8LF6i9YPvodpNYEq8+DIQMAfm2PRE9Je
         Oe09BYB3p8XWF7KTZo86gEMAcThagi+i+NcVWdEUqkujYXIirwYNxrd9hloM/9PXqi
         UOmSPwqP38x+UWvoj6af2qgN7cF6HOlmMUjlhzBV2cX3j8fjB8MIo6ScArA9myTOk5
         nujEIPg6aH1d5ZKO/I05Uyuf2loychRG1QRTgV6eohTzhvryx2pNlkN2lSGmuG2N8i
         952lJrjEtGNuzAYAJUY+9xxRbJbf31FZEQ/YHD0bzSEgODk9dD1neGz72HDP7NfPRM
         DfF8SiSmIiu8w==
Message-ID: <0f053152-a70d-45b9-9924-4c0f728d0b97@kernel.org>
Date:   Sat, 18 Nov 2023 12:05:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] net: ethernet: ti: cpsw: Don't error out in .remove()
Content-Language: en-US
From:   Roger Quadros <rogerq@kernel.org>
To:     =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     Siddharth Vadapalli <s-vadapalli@ti.com>,
        Ravi Gunasekaran <r-gunasekaran@ti.com>,
        Simon Horman <horms@kernel.org>,
        Yunsheng Lin <linyunsheng@huawei.com>,
        Stanislav Fomichev <sdf@google.com>,
        Marek Majtyka <alardam@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Mugunthan V N <mugunthanvnm@ti.com>,
        linux-omap@vger.kernel.org, netdev@vger.kernel.org,
        kernel@pengutronix.de
References: <20231117091655.872426-1-u.kleine-koenig@pengutronix.de>
 <20231117091655.872426-3-u.kleine-koenig@pengutronix.de>
 <4cabffc1-7ff9-4277-b508-5902f42b47cb@kernel.org>
In-Reply-To: <4cabffc1-7ff9-4277-b508-5902f42b47cb@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 18/11/2023 12:00, Roger Quadros wrote:
> 
> 
> On 17/11/2023 11:16, Uwe Kleine-König wrote:
>> Returning early from .remove() with an error code still results in the
>> driver unbinding the device. So the driver core ignores the returned error
>> code and the resources that were not freed are never catched up. In
>> combination with devm this also often results in use-after-free bugs.
>>
>> If runtime resume fails, it's still important to free all resources, so
>> don't return with an error code, but emit an error message and continue
>> freeing acquired stuff.
>>
>> This prepares changing cpsw_remove() to return void.
>>
>> Fixes: 8a0b6dc958fd ("drivers: net: cpsw: fix wrong regs access in cpsw_remove")
>> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
>> ---
>>  drivers/net/ethernet/ti/cpsw.c | 16 ++++++++++++----
>>  1 file changed, 12 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/net/ethernet/ti/cpsw.c b/drivers/net/ethernet/ti/cpsw.c
>> index ca4d4548f85e..db5a2ba8a6d4 100644
>> --- a/drivers/net/ethernet/ti/cpsw.c
>> +++ b/drivers/net/ethernet/ti/cpsw.c
>> @@ -1727,16 +1727,24 @@ static int cpsw_remove(struct platform_device *pdev)
>>  	struct cpsw_common *cpsw = platform_get_drvdata(pdev);
>>  	int i, ret;
>>  
>> -	ret = pm_runtime_resume_and_get(&pdev->dev);
>> +	ret = pm_runtime_get_sync(&pdev->dev);
>>  	if (ret < 0)
>> -		return ret;
>> +		/* There is no need to do something about that. The important
>> +		 * thing is to not exit early, but do all cleanup that doesn't
>> +		 * require register access.
>> +		 */
>> +		dev_err(&pdev->dev, "runtime resume failed (%pe)\n",
>> +			ERR_PTR(ret));
>>  
>>  	for (i = 0; i < cpsw->data.slaves; i++)
>>  		if (cpsw->slaves[i].ndev)
>>  			unregister_netdev(cpsw->slaves[i].ndev);
>>  
>> -	cpts_release(cpsw->cpts);
>> -	cpdma_ctlr_destroy(cpsw->dma);
>> +	if (ret >= 0) {
>> +		cpts_release(cpsw->cpts);
> 
> cpts_release() only does clk_unprepare().
> Why not do that in the error path as well?
> 
>> +		cpdma_ctlr_destroy(cpsw->dma);
> 
> cpdma_ctrl_destroy() not only stops the DMA controller
> but also frees up the channel and calls dma_free_coherent?
> 
> We still want to free up the channel and dma_free_coherent in the
> error path?

cpdma_chan_destroy() does a cpdma_chan_stop() which does register
accesses so I suppose it cannot be called in the error path.

which leaves only the cpdma_desc_pool_destroy() call.

> 
>> +	}
>> +
>>  	cpsw_remove_dt(pdev);
>>  	pm_runtime_put_sync(&pdev->dev);
>>  	pm_runtime_disable(&pdev->dev);
> 

-- 
cheers,
-roger
