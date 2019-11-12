Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6A814F8AE5
	for <lists+linux-omap@lfdr.de>; Tue, 12 Nov 2019 09:45:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725853AbfKLIpY (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 12 Nov 2019 03:45:24 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:57348 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725775AbfKLIpY (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 12 Nov 2019 03:45:24 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAC8jNZb115346;
        Tue, 12 Nov 2019 02:45:23 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1573548323;
        bh=PT4Kqs6yT5YV2xakhhQMGtdAnmbzmu9KwbLZu9H/ZbQ=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=UthnuRyPVx6QpXeB0D9jaqoNtUZagJBqFI7LJ3wvUzdo9sJGXzeqjhNZQJ26P2X6M
         0Qrj6Lu+vrbDg6tf0k/gJMjBDFmiVPkomIYqtTSE2+LlfIxKxok1yfgsX53Juj83zZ
         h0Z8ttB1jBBK2Ike8l6SUUN5UqVMXiQO69gjw9ks=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xAC8jNN9056535
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 12 Nov 2019 02:45:23 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 12
 Nov 2019 02:45:04 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 12 Nov 2019 02:45:04 -0600
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAC8jJPc117203;
        Tue, 12 Nov 2019 02:45:19 -0600
Subject: Re: [PATCH 13/17] remoteproc/omap: add support for system
 suspend/resume
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
CC:     <ohad@wizery.com>, <linux-remoteproc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <s-anna@ti.com>
References: <20191028124238.19224-1-t-kristo@ti.com>
 <20191028124238.19224-14-t-kristo@ti.com> <20191112061536.GO3108315@builder>
From:   Tero Kristo <t-kristo@ti.com>
Message-ID: <c0fe03eb-86c9-8c67-684e-b1f6f606b7ed@ti.com>
Date:   Tue, 12 Nov 2019 10:45:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191112061536.GO3108315@builder>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 12/11/2019 08:15, Bjorn Andersson wrote:
> On Mon 28 Oct 05:42 PDT 2019, Tero Kristo wrote:
>> diff --git a/drivers/remoteproc/omap_remoteproc.c b/drivers/remoteproc/omap_remoteproc.c
> [..]
>> +static int _omap_rproc_suspend(struct rproc *rproc)
> 
> I think it would make sense to inline this and _omap_rproc_resume() in
> their single call sites.

Well, these get re-used in following patch for runtime PM also, so it is 
probably better leave this for compiler to decide?

> 
> [..]
>> +static int _omap_rproc_resume(struct rproc *rproc)
>> +{
> [..]
>> @@ -806,6 +972,14 @@ static int omap_rproc_probe(struct platform_device *pdev)
>>   			oproc->num_timers);
>>   	}
>>   
>> +	init_completion(&oproc->pm_comp);
>> +
>> +	oproc->fck = of_clk_get(np, 0);
> 
> devm_clk_get() ?
> 
> Otherwise I think you're lacking a clk_put() in omap_rproc_remove()

Yeah, let me replace with devm_clk_get.

-Tero

> 
> Regards,
> Bjorn
> 

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
