Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0620A4136F7
	for <lists+linux-omap@lfdr.de>; Tue, 21 Sep 2021 18:07:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233926AbhIUQIz (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 21 Sep 2021 12:08:55 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:38748 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233808AbhIUQIy (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 21 Sep 2021 12:08:54 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 18LG7Hrg024487;
        Tue, 21 Sep 2021 11:07:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1632240437;
        bh=/a1W7IPmzzGl3sZu6vkWa+mjYDw4tT7DUSxlF9GjKaI=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=xfVApT0n7vMiP1BLASvvZ9ZPw3/EIG/3DbpADD1bpD75UCLVSwOZA50jWOh9FaDzQ
         FraFSj7yEJq5y3rQVXiGjwPjjmjcSC2XfyOtWLaReHr5ntMLc+LvnkbvlMRCK/PDN5
         RjeVm22VIUJ0pBvREpcEczgAvVzrFalR501J46+Q=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 18LG7HRH114212
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 21 Sep 2021 11:07:17 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 21
 Sep 2021 11:07:17 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 21 Sep 2021 11:07:17 -0500
Received: from [10.250.37.219] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 18LG7G0G047699;
        Tue, 21 Sep 2021 11:07:16 -0500
Subject: Re: beaglebone black boot failure Linux v5.15.rc1
To:     Tony Lindgren <tony@atomide.com>,
        Matti Vaittinen <mazziesaccount@gmail.com>
CC:     Grygorii Strashko <grygorii.strashko@ti.com>,
        "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
        Paul Barker <paul.barker@sancloud.com>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        =?UTF-8?Q?Beno=c3=aet_Cousson?= <bcousson@baylibre.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <120a0ca4-28c7-5a7b-f1ab-2015c8817bda@fi.rohmeurope.com>
 <YUQyQgFAOFnBlcdP@atomide.com>
 <0679a5bb-88d1-077d-6107-d5f88ef60dbf@fi.rohmeurope.com>
 <8f3963ca-ff09-b876-ae9e-433add242de2@ti.com>
 <331ab81e-cd42-7e9b-617a-fde4c773c07a@ti.com>
 <615b6fec-6c62-4a97-6d0c-d2e5a5d1ccb2@fi.rohmeurope.com>
 <dab93132-2e5a-78f2-4313-fc541ea36a10@ti.com>
 <36785ccf-57b4-eaf1-cfc0-b024857f7694@gmail.com>
 <YUmOGFUFONR/ynfW@atomide.com>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <cce97271-11d2-cc1a-a0fc-c8e8b4482329@ti.com>
Date:   Tue, 21 Sep 2021 11:07:10 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YUmOGFUFONR/ynfW@atomide.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Matti, Tony,

On 9/21/21 2:47 AM, Tony Lindgren wrote:
> * Matti Vaittinen <mazziesaccount@gmail.com> [210920 08:23]:
>> Finally, adding the udelay(100); (as Tony suggested) at the end of the
>> omap_reset_deassert() did make the oops go away even when pruss_tm was
>> enabled. I don't know what would be a proper fix though.

I have been able to boot v5.15-rc1 just fine on my BBB without any additional
changes [1].

May I ask what is your BBB board version? My board is rev.A5C.

I vaguely remember from all those years ago when I first enabled PRUSS on AM335x
that some earlier BBB versions had some issues around PRUSS.

regards
Suman

[1] https://marc.info/?l=linux-omap&m=163223991005545&w=2

> 
> The following patch works for me on bbb with the following test script:
> 
> #!/bin/sh
> 
> module="4a326000.target-module"
> driver="/sys/bus/platform/drivers/ti-sysc"
> 
> while true; do
> 	echo ${module} > ${driver}/bind
> 	echo ${module} > ${driver}/unbind
> done
> 
> It also allows leaving out the udelay for dra7 iva reset. Care to try
> this and see if it helps?
> 
> Regards,
> 
> Tony
> 
> 8< -----------------
> diff --git a/drivers/soc/ti/omap_prm.c b/drivers/soc/ti/omap_prm.c
> --- a/drivers/soc/ti/omap_prm.c
> +++ b/drivers/soc/ti/omap_prm.c
> @@ -825,26 +825,29 @@ static int omap_reset_deassert(struct reset_controller_dev *rcdev,
>  	writel_relaxed(v, reset->prm->base + reset->prm->data->rstctrl);
>  	spin_unlock_irqrestore(&reset->lock, flags);
>  
> -	if (!has_rstst)
> -		goto exit;
> -
> -	/* wait for the status to be set */
> -	ret = readl_relaxed_poll_timeout_atomic(reset->prm->base +
> +	if (has_rstst) {
> +		/* wait for the status to be set */
> +		ret = readl_relaxed_poll_timeout_atomic(reset->prm->base +
>  						 reset->prm->data->rstst,
>  						 v, v & BIT(st_bit), 1,
>  						 OMAP_RESET_MAX_WAIT);
> -	if (ret)
> -		pr_err("%s: timedout waiting for %s:%lu\n", __func__,
> -		       reset->prm->data->name, id);
> -
> -exit:
> -	if (reset->clkdm) {
> -		/* At least dra7 iva needs a delay before clkdm idle */
> -		if (has_rstst)
> -			udelay(1);
> -		pdata->clkdm_allow_idle(reset->clkdm);
> +		if (ret)
> +			pr_err("%s: timedout waiting for %s:%lu\n", __func__,
> +			       reset->prm->data->name, id);
> +	} else {
> +		/* wait for the reset bit to cleaar */
> +		ret = readl_relaxed_poll_timeout_atomic(reset->prm->base +
> +						reset->prm->data->rstctrl,
> +						v, !(v & BIT(id)), 1,
> +						OMAP_RESET_MAX_WAIT);
> +		if (ret)
> +			pr_err("%s: timedout waiting for %s:%lu\n", __func__,
> +			       reset->prm->data->name, id);
>  	}
>  
> +	if (reset->clkdm)
> +		pdata->clkdm_allow_idle(reset->clkdm);
> +
>  	return ret;
>  }
>  
> 

