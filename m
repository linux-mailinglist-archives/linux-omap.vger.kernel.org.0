Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A4B58562C
	for <lists+linux-omap@lfdr.de>; Thu,  8 Aug 2019 00:44:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389423AbfHGWn4 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 7 Aug 2019 18:43:56 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:34716 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389347AbfHGWn4 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 7 Aug 2019 18:43:56 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x77Mhqhl068345;
        Wed, 7 Aug 2019 17:43:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1565217832;
        bh=pXhcsaRQmS6YukiVkKyKHnAj4+WSevpF/WmJhJH1syg=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=Uiy6h8BmvSHygY/vSyRypGVxGgd3rFU5SRpwMW6fkWkQ7ZF6qE8xapQU7Zn9kN1jT
         FC2N/qBJxa3XuxxAZYWRSMVUSaZtxDXenRNqsec0mQwh7Jw/V7O3sQh1VIbFFLMtdo
         +TbYogFoyEp/z7s1ylSukHitygsY6L7u6pTMTBlQ=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x77MhqZL125483
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 7 Aug 2019 17:43:52 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 7 Aug
 2019 17:43:52 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 7 Aug 2019 17:43:52 -0500
Received: from [128.247.58.153] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x77MhqtW117754;
        Wed, 7 Aug 2019 17:43:52 -0500
Subject: Re: [PATCH 1/3] clk: ti: clkctrl: add support for polling clock
 status for enable only
To:     Tero Kristo <t-kristo@ti.com>, <linux-clk@vger.kernel.org>,
        <sboyd@kernel.org>, <mturquette@baylibre.com>
CC:     <linux-omap@vger.kernel.org>, <tony@atomide.com>
References: <1565183079-27798-1-git-send-email-t-kristo@ti.com>
 <1565183079-27798-2-git-send-email-t-kristo@ti.com>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <6a088bc2-e854-b4fa-3c97-ce94dd2a92cb@ti.com>
Date:   Wed, 7 Aug 2019 17:43:52 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1565183079-27798-2-git-send-email-t-kristo@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tero,

On 8/7/19 8:04 AM, Tero Kristo wrote:
> The activity status for certain clocks is possible to be polled only
> during enable phase; the disable phase depends on additional reset
> logic. 

I am not sure this is an entirely accurate statement. Can you explain
why this is an issue only with disable sequence and not enable sequence?
Almost sounds like you are doing some asymmetric sequence w.r.t clocks
and resets.

On the downstream kernel, we have reused the existing NO_IDLEST flag as
a quirk within both the enable and disable functions for the IPs with
hardreset lines, and this patch seems to introduce a new NO_IDLE_POLL
flag but only during the disable path.

regards
Suman

If the disable phase is polled with these clocks, it will
> result in a timeout. To fix this, add logic for polling the clock
> activity only during enable, and add a new flag for this purpose.
> 
> Signed-off-by: Tero Kristo <t-kristo@ti.com>
> ---
>  drivers/clk/ti/clkctrl.c | 5 ++++-
>  drivers/clk/ti/clock.h   | 1 +
>  2 files changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/ti/clkctrl.c b/drivers/clk/ti/clkctrl.c
> index 975995e..f5517a8 100644
> --- a/drivers/clk/ti/clkctrl.c
> +++ b/drivers/clk/ti/clkctrl.c
> @@ -25,6 +25,7 @@
>  #include "clock.h"
>  
>  #define NO_IDLEST			0x1
> +#define NO_IDLE_POLL			0x2
>  
>  #define OMAP4_MODULEMODE_MASK		0x3
>  
> @@ -187,7 +188,7 @@ static void _omap4_clkctrl_clk_disable(struct clk_hw *hw)
>  
>  	ti_clk_ll_ops->clk_writel(val, &clk->enable_reg);
>  
> -	if (clk->flags & NO_IDLEST)
> +	if (clk->flags & (NO_IDLEST | NO_IDLE_POLL))
>  		goto exit;
>  
>  	/* Wait until module is disabled */
> @@ -597,6 +598,8 @@ static void __init _ti_omap4_clkctrl_setup(struct device_node *node)
>  			hw->enable_bit = MODULEMODE_HWCTRL;
>  		if (reg_data->flags & CLKF_NO_IDLEST)
>  			hw->flags |= NO_IDLEST;
> +		if (reg_data->flags & CLKF_NO_IDLE_POLL)
> +			hw->flags |= NO_IDLE_POLL;
>  
>  		if (reg_data->clkdm_name)
>  			hw->clkdm_name = reg_data->clkdm_name;
> diff --git a/drivers/clk/ti/clock.h b/drivers/clk/ti/clock.h
> index e4b8392..6410ff6 100644
> --- a/drivers/clk/ti/clock.h
> +++ b/drivers/clk/ti/clock.h
> @@ -82,6 +82,7 @@ enum {
>  #define CLKF_SW_SUP			BIT(5)
>  #define CLKF_HW_SUP			BIT(6)
>  #define CLKF_NO_IDLEST			BIT(7)
> +#define CLKF_NO_IDLE_POLL		BIT(8)
>  
>  #define CLKF_SOC_MASK			GENMASK(11, 8)
>  
> 

