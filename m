Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6761540E46B
	for <lists+linux-omap@lfdr.de>; Thu, 16 Sep 2021 19:24:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244543AbhIPQ6Z (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 16 Sep 2021 12:58:25 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:47194 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346884AbhIPQ4U (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 16 Sep 2021 12:56:20 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 18GGsfZL041074;
        Thu, 16 Sep 2021 11:54:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1631811281;
        bh=Yh9GiJTL96YzEGggAd4MW2P4bYFr16XP7mFUuGQI04E=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=InxjydOvMNmS02IZKwjoYjEAVM6oUEXyXVfPbC5wSS1FYu2Dp/o8Y6jV4tvy1GYz4
         8HJP+wTCDJsZOmFovAkeW8U7u6tp/GgIil87fdkvBZhr9qtx/kUdPhqxL2WAbL/bKi
         M7+pLEjAhxr2GmO4aH2JekAOvKgNwiRFnEBba51c=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 18GGsfYK002084
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 16 Sep 2021 11:54:41 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 16
 Sep 2021 11:54:41 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 16 Sep 2021 11:54:41 -0500
Received: from [10.250.69.57] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 18GGsekI023402;
        Thu, 16 Sep 2021 11:54:40 -0500
Subject: Re: [PATCH] bus: ti-sysc: Fix external abort for am335x pruss probe
To:     Tony Lindgren <tony@atomide.com>, <linux-omap@vger.kernel.org>
CC:     Dave Gerlach <d-gerlach@ti.com>, Faiz Abbas <faiz_abbas@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Keerthy <j-keerthy@ti.com>, Nishanth Menon <nm@ti.com>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Kishon Vijay Abraham <kishon@ti.com>
References: <20210915065032.45013-1-tony@atomide.com>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <3fd1968e-491e-6d98-ec9c-d29baed3158f@ti.com>
Date:   Thu, 16 Sep 2021 11:54:40 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210915065032.45013-1-tony@atomide.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tony,

On 9/15/21 1:50 AM, Tony Lindgren wrote:
> Starting with v5.15-rc1, I'm now seeing am335x beaglebone black produce
> the following error on pruss probe:
> 
> Unhandled fault: external abort on non-linefetch (0x1008) at 0xe0326000
> 
> This seems to have started with the enabling of pruss for am335x in the
> dts files. Adding a read-back after write to the sysconfig register fixes
> the issue for me.

Let me take a look at this during the weekend. I did verify the AM335x PRUSS
when I posted the dts patches on 5.14-rc. You should be able to check as well
from your staging branch with PRUSS patches.

regards
Suman

> 
> Cc: Suman Anna <s-anna@ti.com>
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
>  drivers/bus/ti-sysc.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
> --- a/drivers/bus/ti-sysc.c
> +++ b/drivers/bus/ti-sysc.c
> @@ -2037,6 +2037,9 @@ static int sysc_reset(struct sysc *ddata)
>  		sysc_val = sysc_read_sysconfig(ddata);
>  		sysc_val |= sysc_mask;
>  		sysc_write(ddata, sysc_offset, sysc_val);
> +
> +		/* Flush posted write */
> +		sysc_read_sysconfig(ddata);
>  	}
>  
>  	if (ddata->cfg.srst_udelay)
> 

