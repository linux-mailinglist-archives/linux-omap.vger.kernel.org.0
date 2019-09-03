Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0EE9CA6D60
	for <lists+linux-omap@lfdr.de>; Tue,  3 Sep 2019 17:57:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729053AbfICP5i (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 3 Sep 2019 11:57:38 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:55796 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729005AbfICP5h (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 3 Sep 2019 11:57:37 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x83FvV3i053935;
        Tue, 3 Sep 2019 10:57:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1567526251;
        bh=eP8OurZeSnSoevkLbPDBwWDAkym0f51lj8ILd84TgdE=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=gzQZ0E+/ejKbm2Fyc185fpUmmOyp1udwR+aCETQWy+lc9UP55ylSYq2FC7bwcXEWh
         F7j3LMnNl4Jb0USC+Eiz00rNB36A8SS/JtWaCx1dUJ6T+sfoVFAvy6QieMbTZsWuML
         jbCDM8EkCNSxIuegcm3sTeNNGNOQ3X7YyvQNxw+Y=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x83FvUFv114713
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 3 Sep 2019 10:57:31 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 3 Sep
 2019 10:57:30 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 3 Sep 2019 10:57:30 -0500
Received: from [10.250.98.116] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x83FvSBQ049342;
        Tue, 3 Sep 2019 10:57:29 -0500
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
From:   Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <6fa1c2af-457c-3dbc-74a2-72ae539a48b0@ti.com>
Date:   Tue, 3 Sep 2019 18:57:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190903152427.GO52127@atomide.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 03/09/2019 18:24, Tony Lindgren wrote:
> * Tony Lindgren <tony@atomide.com> [190903 14:06]:
>> * Grygorii Strashko <grygorii.strashko@ti.com> [190903 12:46]:
>>>> The clock definition itself looks fine, however the question is why does someone try to disable it while it
>>>   is apparently still used (by NFS that is)? If it fails to disable, clock core is trying to disable it, but the IDLEST bit does not switch for some reason.
>>>
>>> I've tried to disable "ti,no-idle" in DT for dra7 cpsw and got below failure
>>>
>>> [    0.634530] gmac-clkctrl:0000:0: failed to enable 08070002
>>> [    0.634557] ti-sysc: probe of 48485200.target-module failed with error -16
>>>
>>> so samthing is not right with GMAC clocks as it should probe without "ti,no-idle".
>>>
>>>
>>> original place of the issue is:
>>>
>>> cpsw_probe()
>>>   -> pm_runtime_get_sync()
>>>      -> sysc_runtime_resume()
>>>         -> sysc_enable_main_clocks()
>>>
>>> Note. the sysc_init_module() for "ti,no-idle" case looks a little bit strange as there is
>>> no guarantee that target-module or clock were enabled before.
>>
>> Good point on the "ti,no-idle" handling. That is easy to fix by always enabling
>> the clocks. The "ti,no-idle-on-init" handling needs probably a flag set for
>> PM runtime.
> 
> The following should fix the clock handling for "ti,no-idle" and

It does - i have mostly similar diff. I've posted it below for you reference -
  feel free to reuse or combine.
Note. pm_runtime_get_noresume() in my patch should be done only for SYSC_QUIRK_NO_IDLE.


> "ti,no-idle-on-init". Sounds like we still might have other issues
> left though based on removing "ti,no-idle"?

Yes. if you remove "ti,no-idle" cpsw 48485200.target-module will fail to probe at all.

X15 may boot due to u-boot differences.

> 
> Regards,
> 
> Tony
> 
> 8< -------------------------
> diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
> --- a/drivers/bus/ti-sysc.c
> +++ b/drivers/bus/ti-sysc.c
> @@ -66,6 +66,7 @@ static const char * const clock_names[SYSC_MAX_CLOCKS] = {
>    * @name: name if available
>    * @revision: interconnect target module revision
>    * @enabled: sysc runtime enabled status
> + * @clocks_enabled_from_init: clocks left on from init with ti,no-idle-on-init
>    * @needs_resume: runtime resume needed on resume from suspend
>    * @child_needs_resume: runtime resume needed for child on resume from suspend
>    * @disable_on_idle: status flag used for disabling modules with resets
> @@ -93,6 +94,7 @@ struct sysc {
>   	const char *name;
>   	u32 revision;
>   	unsigned int enabled:1;
> +	unsigned int clocks_enabled_from_init:1;
>   	unsigned int needs_resume:1;
>   	unsigned int child_needs_resume:1;
>   	struct delayed_work idle_work;
> @@ -1128,6 +1130,18 @@ static int __maybe_unused sysc_runtime_resume(struct device *dev)
>   
>   	sysc_clkdm_allow_idle(ddata);
>   
> +	/*
> +	 * One time decrement of clock usage counts if left on from init.
> +	 * Note that we disable opt clocks unconditionally in this case
> +	 * as they are enabled unconditionally during init without
> +	 * considering sysc_opt_clks_needed() at that point.
> +	 */
> +	if (unlikely(ddata->clocks_enabled_from_init)) {
> +		sysc_disable_main_clocks(ddata);
> +		sysc_disable_opt_clocks(ddata);
> +		ddata->clocks_enabled_from_init = false;
> +	}
> +

This might be not right thing to do as in probe this operation is delayed
sysc_probe()
	pm_runtime_enable(ddata->dev);
	error = pm_runtime_get_sync(ddata->dev);
^^^ above is the first PM runtime get call, so it might be bette to keep module active
^^^ by the way, CPSW will fail here with "ti,no-idle" removed
...
	

	if (ddata->cfg.quirks & (SYSC_QUIRK_NO_IDLE_ON_INIT |
				 SYSC_QUIRK_NO_RESET_ON_INIT)) {
		schedule_delayed_work(&ddata->idle_work, 3000);

^^ and check and double disable module in first PM runtime suspend
	} else {



>   	return 0;
>   
>   err_main_clocks:
> @@ -1628,21 +1642,26 @@ static int sysc_init_module(struct sysc *ddata)
>   	    (SYSC_QUIRK_NO_IDLE | SYSC_QUIRK_NO_IDLE_ON_INIT))
>   		manage_clocks = false;
>   
> +	if (ddata->cfg.quirks & SYSC_QUIRK_NO_IDLE_ON_INIT)
> +		ddata->clocks_enabled_from_init = true;
> +
>   	error = sysc_clockdomain_init(ddata);
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
> @@ -1677,10 +1696,10 @@ static int sysc_init_module(struct sysc *ddata)
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

No. if SYSC_QUIRK_NO_IDLE is set we can't do above

>   
>   	return error;
>   }
> 

-- Best regards,
grygorii


========
diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
index 9207ac291341..04e2f87799b1 100644
--- a/drivers/bus/ti-sysc.c
+++ b/drivers/bus/ti-sysc.c
@@ -1632,17 +1632,15 @@ static int sysc_init_module(struct sysc *ddata)
         if (error)
                 return error;
  
-       if (manage_clocks) {
-               sysc_clkdm_deny_idle(ddata);
+       sysc_clkdm_deny_idle(ddata);
  
-               error = sysc_enable_opt_clocks(ddata);
-               if (error)
-                       return error;
+       error = sysc_enable_opt_clocks(ddata);
+       if (error)
+               return error;
  
-               error = sysc_enable_main_clocks(ddata);
-               if (error)
-                       goto err_opt_clocks;
-       }
+       error = sysc_enable_main_clocks(ddata);
+       if (error)
+               goto err_opt_clocks;
  
         if (!(ddata->cfg.quirks & SYSC_QUIRK_NO_RESET_ON_INIT)) {
                 error = sysc_rstctrl_reset_deassert(ddata, true);
@@ -1660,7 +1658,7 @@ static int sysc_init_module(struct sysc *ddata)
                         goto err_main_clocks;
         }
  
-       if (!ddata->legacy_mode && manage_clocks) {
+       if (!ddata->legacy_mode) {
                 error = sysc_enable_module(ddata->dev);
                 if (error)
                         goto err_main_clocks;
@@ -1673,6 +1671,9 @@ static int sysc_init_module(struct sysc *ddata)
         if (!ddata->legacy_mode && manage_clocks)
                 sysc_disable_module(ddata->dev);
  
+       if (!manage_clocks)
+               pm_runtime_get_noresume(ddata->dev);
+
  err_main_clocks:
         if (manage_clocks)
                 sysc_disable_main_clocks(ddata);
