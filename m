Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E34E72AF909
	for <lists+linux-omap@lfdr.de>; Wed, 11 Nov 2020 20:28:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726513AbgKKT2R (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 11 Nov 2020 14:28:17 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:53048 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726507AbgKKT2R (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 11 Nov 2020 14:28:17 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0ABJS8D4077839;
        Wed, 11 Nov 2020 13:28:08 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1605122888;
        bh=fMZ9y2f+W3hTXP4idBHxHjT/7PRMSuQUkiYuPFk+Xg0=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=p1sIqPrFsJGQ3L/nuF07Xd6FUGrr4ORU0fPGScteDuOyUuVJM3mQ+Pe3M/blZ4AYw
         CMmKx2v21ytQPfT9W57aqmy7Casfpiw95FLE0ITqqXIumZClkSYUQUaEa3dWY4YpA5
         KN9BelalQumcBIHL7KH/GnE2Lb8U6XweZQc+SJ/4=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0ABJS8VM051366
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 11 Nov 2020 13:28:08 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 11
 Nov 2020 13:28:08 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 11 Nov 2020 13:28:08 -0600
Received: from [10.250.100.73] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0ABJS4W1084521;
        Wed, 11 Nov 2020 13:28:04 -0600
Subject: Re: [PATCHv2] bus: ti-sysc: Fix bogus resetdone warning on enable for
 cpsw
To:     Tony Lindgren <tony@atomide.com>, <linux-omap@vger.kernel.org>
CC:     Dave Gerlach <d-gerlach@ti.com>, Faiz Abbas <faiz_abbas@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Keerthy <j-keerthy@ti.com>, Nishanth Menon <nm@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Roger Quadros <rogerq@ti.com>, Suman Anna <s-anna@ti.com>,
        Tero Kristo <t-kristo@ti.com>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20201110092127.46638-1-tony@atomide.com>
From:   Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <f7be510f-c105-54a1-9446-56687df97668@ti.com>
Date:   Wed, 11 Nov 2020 21:28:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201110092127.46638-1-tony@atomide.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 10/11/2020 11:21, Tony Lindgren wrote:
> Bail out early from sysc_wait_softreset() just like we do in sysc_reset()
> if there's no sysstatus srst_shift to fix a bogus resetdone warning on
> enable as suggested by Grygorii Strashko <grygorii.strashko@ti.com>.
> 
> We do not currently handle resets for modules that need writing to the
> sysstatus register. If we at some point add that, we also need to add
> SYSS_QUIRK_RESETDONE_INVERTED flag for cpsw as the sysstatus bit is low
> when reset is done as described in the am335x TRM "Table 14-202
> SOFT_RESET Register Field Descriptions"
> 
> Fixes: d46f9fbec719 ("bus: ti-sysc: Use optional clocks on for enable and wait for softreset bit")
> Suggested-by: Grygorii Strashko <grygorii.strashko@ti.com>
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---

Acked-by: Grygorii Strashko <grygorii.strashko@ti.com>

> 
> Changes since v1:
> - Drop quirk handling and use fix suggested by Grygorii
> 
> ---
>   drivers/bus/ti-sysc.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
> --- a/drivers/bus/ti-sysc.c
> +++ b/drivers/bus/ti-sysc.c
> @@ -227,6 +227,9 @@ static int sysc_wait_softreset(struct sysc *ddata)
>   	u32 sysc_mask, syss_done, rstval;
>   	int syss_offset, error = 0;
>   
> +	if (ddata->cap->regbits->srst_shift < 0)
> +		return 0;
> +
>   	syss_offset = ddata->offsets[SYSC_SYSSTATUS];
>   	sysc_mask = BIT(ddata->cap->regbits->srst_shift);
>   
> 

-- 
Best regards,
grygorii
