Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B696A8138
	for <lists+linux-omap@lfdr.de>; Wed,  4 Sep 2019 13:41:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725911AbfIDLjU (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 4 Sep 2019 07:39:20 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:41888 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725840AbfIDLjU (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 4 Sep 2019 07:39:20 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x84BdHWY070739;
        Wed, 4 Sep 2019 06:39:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1567597157;
        bh=anQNbIiLb2XttPGXO+6KuMInwj7aZ/WRLX9aBcM3oKk=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=UQmDVxSMPYc9q29Ov0qb5APtKca3KLTQU9FvxyI13xh3yjrsmmdPBFP/OFNDKDoMb
         pYFhXhj7qUjgwSWDg9wPrCkLrrz76QGwcxr6ZskTrL7GWruV+VtTmojA9QnUnPZ1KN
         FeuFIw8wdSgIucMF6TC8t00iqONQDZ8VypN+axhU=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x84BdHe7130866
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 4 Sep 2019 06:39:17 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 4 Sep
 2019 06:39:16 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 4 Sep 2019 06:39:16 -0500
Received: from [10.250.98.116] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x84BdF6W082917;
        Wed, 4 Sep 2019 06:39:15 -0500
Subject: Re: Linux-next: File system over NFS broken on DRA7/AM5 platforms
To:     Tony Lindgren <tony@atomide.com>
CC:     Tero Kristo <t-kristo@ti.com>, Keerthy <j-keerthy@ti.com>,
        <linux-omap@vger.kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>
References: <b5f54d5f-4790-7be1-cb65-847a98d2e8dd@ti.com>
 <c32b9e04-b230-7634-051b-202868597ec1@ti.com>
 <59564d54-c032-7ca0-3130-6fa7d10f43b7@ti.com>
 <c89bd1cb-be2b-eceb-4c3d-144dc9bb951a@ti.com>
 <17acc359-5938-5f43-3f20-c8de93556748@ti.com>
 <20190903140553.GN52127@atomide.com> <20190903152427.GO52127@atomide.com>
 <6fa1c2af-457c-3dbc-74a2-72ae539a48b0@ti.com>
 <20190903170107.GP52127@atomide.com> <20190903182906.GQ52127@atomide.com>
From:   Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <e67d05c7-b35b-1ddc-ca06-9496c3e28f74@ti.com>
Date:   Wed, 4 Sep 2019 14:39:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190903182906.GQ52127@atomide.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 03/09/2019 21:29, Tony Lindgren wrote:
> * Tony Lindgren <tony@atomide.com> [190903 17:01]:
>> * Grygorii Strashko <grygorii.strashko@ti.com> [190903 15:58]:
>>> This might be not right thing to do as in probe this operation is delayed
>>> sysc_probe()
>>> 	pm_runtime_enable(ddata->dev);
>>> 	error = pm_runtime_get_sync(ddata->dev);
>>> ^^^ above is the first PM runtime get call, so it might be bette to keep module active
>>
>> Oh OK, yeah that needs some more thinking.
>>
>>> ^^^ by the way, CPSW will fail here with "ti,no-idle" removed
>>
>>> 	if (ddata->cfg.quirks & (SYSC_QUIRK_NO_IDLE_ON_INIT |
>>> 				 SYSC_QUIRK_NO_RESET_ON_INIT)) {
>>> 		schedule_delayed_work(&ddata->idle_work, 3000);
>>>
>>> ^^ and check and double disable module in first PM runtime suspend
>>> 	} else {
>>
>> Hmm yeah that might work.
> 
> Actually we can just decrement the clocks in ti_sysc_idle()
> since we have it already available.
> 
>>>> +	sysc_clkdm_allow_idle(ddata);
>>>
>>> No. if SYSC_QUIRK_NO_IDLE is set we can't do above
>>
>> Well we should pair here since we call it unconditionally. The
>> calls for sysc_clkdm_deny_idle() and sysc_clkdm_allow_idle()
>> are only needed when enabling or disabling the clocks.
> 
> I've kept the sysc_clkdm_allow_idle() change to keep things
> paired locally. That is assuming you don't come up with good
> reasons to not do it :)
> 
> Updated patch below to play with.
> Regards,
> 
> Tony
> 
> 8< ---------------------
> diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
> --- a/drivers/bus/ti-sysc.c
> +++ b/drivers/bus/ti-sysc.c
> @@ -1632,17 +1632,19 @@ static int sysc_init_module(struct sysc *ddata)
>   	if (error)
>   		return error;
>   
> -	if (manage_clocks) {
> -		sysc_clkdm_deny_idle(ddata);
> +	sysc_clkdm_deny_idle(ddata);
>   
> -		error = sysc_enable_opt_clocks(ddata);
> -		if (error)
> -			return error;
> +	/*
> +	 * Always enable clocks. The bootloader may or may not have enabled
> +	 * the related clocks.
> +	 */
> +	error = sysc_enable_opt_clocks(ddata);
> +	if (error)
> +		return error;
>   
> -		error = sysc_enable_main_clocks(ddata);
> -		if (error)
> -			goto err_opt_clocks;
> -	}
> +	error = sysc_enable_main_clocks(ddata);
> +	if (error)
> +		goto err_opt_clocks;
>   
>   	if (!(ddata->cfg.quirks & SYSC_QUIRK_NO_RESET_ON_INIT)) {
>   		error = sysc_rstctrl_reset_deassert(ddata, true);


-       if (!ddata->legacy_mode && manage_clocks) {
+       if (!ddata->legacy_mode) {
                 error = sysc_enable_module(ddata->dev);
                 if (error)
                         goto err_main_clocks;

Module should also enabled here.

> @@ -1677,10 +1679,10 @@ static int sysc_init_module(struct sysc *ddata)
>   	if (manage_clocks)
>   		sysc_disable_main_clocks(ddata);
>   err_opt_clocks:
> -	if (manage_clocks) {
> +	if (manage_clocks)
>   		sysc_disable_opt_clocks(ddata);
> -		sysc_clkdm_allow_idle(ddata);
> -	}
> +
> +	sysc_clkdm_allow_idle(ddata);

clkdm doesn't have counters while clock do, so if module is in HW_AUTO
and clkdm in HW_AUTO - the module can go IDLE between this point and  ti_sysc_idle() call.

Errate i877 required
CM_GMAC_CLKSTCTRL[1:0] CLKTRCTRL = 0x2:SW_WKUP.
to be set at boot time and never changed.

and
"In addition to programming SW_WKUP(0x2) on CM_GMAC_CLKSTCTRL, SW should
also program modulemode field as ENABLED(0x2) on CM_GMAC_GMAC_CLKCTRL
register."

>   
>   	return error;
>   }
> @@ -2357,6 +2359,28 @@ static void ti_sysc_idle(struct work_struct *work)
>   
>   	ddata = container_of(work, struct sysc, idle_work.work);
>   
> +	/*
> +	 * One time decrement of clock usage counts if left on from init.
> +	 * Note that we disable opt clocks unconditionally in this case
> +	 * as they are enabled unconditionally during init without
> +	 * considering sysc_opt_clks_needed() at that point.
> +	 */
> +	if (ddata->cfg.quirks & (SYSC_QUIRK_NO_IDLE |
> +				 SYSC_QUIRK_NO_IDLE_ON_INIT)) {
> +		sysc_clkdm_deny_idle(ddata);
> +		sysc_disable_main_clocks(ddata);
> +		sysc_disable_opt_clocks(ddata);
> +		sysc_clkdm_allow_idle(ddata);
> +	}
> +
> +	/* Keep permanent PM runtime usage count for SYSC_QUIRK_NO_IDLE */
> +	if (ddata->cfg.quirks & SYSC_QUIRK_NO_IDLE)
> +		return;
> +
> +	/*
> +	 * Decrement PM runtime usage count for SYSC_QUIRK_NO_IDLE_ON_INIT
> +	 * and SYSC_QUIRK_NO_RESET_ON_INIT
> +	 */
>   	if (pm_runtime_active(ddata->dev))
>   		pm_runtime_put_sync(ddata->dev);
>   }
> @@ -2445,7 +2469,8 @@ static int sysc_probe(struct platform_device *pdev)
>   	INIT_DELAYED_WORK(&ddata->idle_work, ti_sysc_idle);
>   
>   	/* At least earlycon won't survive without deferred idle */
> -	if (ddata->cfg.quirks & (SYSC_QUIRK_NO_IDLE_ON_INIT |
> +	if (ddata->cfg.quirks & (SYSC_QUIRK_NO_IDLE |
> +				 SYSC_QUIRK_NO_IDLE_ON_INIT |
>   				 SYSC_QUIRK_NO_RESET_ON_INIT)) {
>   		schedule_delayed_work(&ddata->idle_work, 3000);
>   	} else {
> 

-- 
Best regards,
grygorii
