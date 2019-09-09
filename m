Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B0632AD1B2
	for <lists+linux-omap@lfdr.de>; Mon,  9 Sep 2019 03:56:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732350AbfIIB4s (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 8 Sep 2019 21:56:48 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:44890 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732304AbfIIB4s (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 8 Sep 2019 21:56:48 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x891ucNi093546;
        Sun, 8 Sep 2019 20:56:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1567994198;
        bh=lUH/u9a2zTD6UF778x023rDtCPXhaWcsnAHpbSuBK3o=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=nFoHhQ+r46Wn0jPfAF+YacwzfnNk4mm29ggO1pW5VUXM90PuQMzsYZ7PQda6sx/nm
         wkxRkAYX44pkz21mUWS5IbKnkVQBZzd3W+oqvcyirTBTQPFuwObt+WBpGWFn15uiJw
         eXh3LIsGFqpFkBGe4/BjbIdlFokfub5YhMT0GjiQ=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x891ubNL019345
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Sun, 8 Sep 2019 20:56:38 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Sun, 8 Sep
 2019 20:56:37 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Sun, 8 Sep 2019 20:56:37 -0500
Received: from [172.24.191.45] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x891uWaN094203;
        Sun, 8 Sep 2019 20:56:32 -0500
Subject: Re: [PATCH] bus: ti-sysc: Remove unpaired sysc_clkdm_deny_idle()
To:     Tony Lindgren <tony@atomide.com>, <linux-omap@vger.kernel.org>
CC:     "Andrew F . Davis" <afd@ti.com>, Dave Gerlach <d-gerlach@ti.com>,
        Faiz Abbas <faiz_abbas@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Nishanth Menon <nm@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Roger Quadros <rogerq@ti.com>, Suman Anna <s-anna@ti.com>,
        Tero Kristo <t-kristo@ti.com>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Vignesh Raghavendra <vigneshr@ti.com>
References: <20190906200154.6510-1-tony@atomide.com>
From:   Keerthy <j-keerthy@ti.com>
Message-ID: <40e5c2a1-3682-584a-4eb9-4d96901bbfda@ti.com>
Date:   Mon, 9 Sep 2019 07:27:12 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190906200154.6510-1-tony@atomide.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 07/09/19 1:31 AM, Tony Lindgren wrote:
> Commit d098913a10f8 ("bus: ti-sysc: Fix clock handling for no-idle
> quirks") fixed handling for no-idle quirk modules that are not enabled
> by the bootloader.
> 
> But it also caused unpaired clockdomain calls that won't allow idling
> the system. That's because clkdm_allow_idle_nolock() and
> clkdm_deny_idle_nolock() have usage count with clkdm->forcewake_count.
> 
> Let's drop the unpaired sysc_clkdm_deny_idle() to fix idling of devices.

Tested-by: Keerthy <j-keerthy@ti.com>

I believe still the previous fix [1] for nfs boot is still not on 
linux-next. Are you planning on more testing or it will be queued as fixes?


[1] https://lkml.org/lkml/2019/9/5/616

- Keerthy

> 
> Fixes: d098913a10f8 ("bus: ti-sysc: Fix clock handling for no-idle quirks")
> Cc: Keerthy <j-keerthy@ti.com>
> Cc: Vignesh Raghavendra <vigneshr@ti.com>
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
>   drivers/bus/ti-sysc.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
> --- a/drivers/bus/ti-sysc.c
> +++ b/drivers/bus/ti-sysc.c
> @@ -2363,7 +2363,6 @@ static void ti_sysc_idle(struct work_struct *work)
>   	 */
>   	if (ddata->cfg.quirks & (SYSC_QUIRK_NO_IDLE |
>   				 SYSC_QUIRK_NO_IDLE_ON_INIT)) {
> -		sysc_clkdm_deny_idle(ddata);
>   		sysc_disable_main_clocks(ddata);
>   		sysc_disable_opt_clocks(ddata);
>   		sysc_clkdm_allow_idle(ddata);
> 
