Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 219B32A0D32
	for <lists+linux-omap@lfdr.de>; Fri, 30 Oct 2020 19:15:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726095AbgJ3SPw (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 30 Oct 2020 14:15:52 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:39568 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725844AbgJ3SPw (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 30 Oct 2020 14:15:52 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09UIFkEl069707;
        Fri, 30 Oct 2020 13:15:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1604081746;
        bh=9dgcKo3td0TMDTyJTQO2t4p6XonAw2x1KObaMxUhugI=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=M8PYW0TLGUb7ESlGjL2CdFH3YaD98GhUYL8wYWbb8aXKPmvXax9952OBeBhlA48pe
         CWkyr1PTjryjNazbRkN/4oRcFe8TeMTK8zaMIxDB3KULfdivEMbuYOQeKV5rWigoft
         aXUbYdtDwwd+jBkv3ZgSBbVLd8XM71iiepnrTnPs=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09UIFka7020280
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 30 Oct 2020 13:15:46 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 30
 Oct 2020 13:15:46 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 30 Oct 2020 13:15:46 -0500
Received: from [10.250.100.73] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09UIFgcK032563;
        Fri, 30 Oct 2020 13:15:43 -0500
Subject: Re: [PATCH 4/4] bus: ti-sysc: Fix bogus resetdone warning for cpsw
To:     Tony Lindgren <tony@atomide.com>, <linux-omap@vger.kernel.org>
CC:     Dave Gerlach <d-gerlach@ti.com>, Faiz Abbas <faiz_abbas@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Keerthy <j-keerthy@ti.com>, Nishanth Menon <nm@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Roger Quadros <rogerq@ti.com>, Suman Anna <s-anna@ti.com>,
        Tero Kristo <t-kristo@ti.com>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20201026105812.38418-1-tony@atomide.com>
 <20201026105812.38418-5-tony@atomide.com>
From:   Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <b8a3cfc1-f9f5-1b18-b980-e88eb8b20e43@ti.com>
Date:   Fri, 30 Oct 2020 20:15:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201026105812.38418-5-tony@atomide.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tony,

On 26/10/2020 12:58, Tony Lindgren wrote:
> The cpsw SOFT_RESET register is cleard when out of reset so let's
> add SYSS_QUIRK_RESETDONE_INVERTED flag for cpsw. Otherwise we will
> get bogus "OCP softreset timed out" warnings on boot.

Not sure if this quirk based approach is right way to move forward here.

The cpsw/cpgmac is "ti,sysc-omap4-simple" which means sysc_omap4_simple, which,
in turn, has .srst_shift = -ENODEV.

And above should be enough to avoid both sysc_reset() and sysc_wait_softreset() for such modules.


> 
> Fixes: d46f9fbec719 ("bus: ti-sysc: Use optional clocks on for enable and wait for softreset bit")
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
>   drivers/bus/ti-sysc.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
> --- a/drivers/bus/ti-sysc.c
> +++ b/drivers/bus/ti-sysc.c
> @@ -1364,6 +1364,8 @@ static const struct sysc_revision_quirk sysc_revision_quirks[] = {
>   	/* Quirks that need to be set based on detected module */
>   	SYSC_QUIRK("aess", 0, 0, 0x10, -ENODEV, 0x40000000, 0xffffffff,
>   		   SYSC_MODULE_QUIRK_AESS),
> +	SYSC_QUIRK("cpgmac", 0, 0x1200, 0x1208, 0x1204, 0x4edb1902,
> +		   0xffff00f0, SYSS_QUIRK_RESETDONE_INVERTED),
>   	SYSC_QUIRK("dcan", 0x48480000, 0x20, -ENODEV, -ENODEV, 0xa3170504, 0xffffffff,
>   		   SYSC_QUIRK_CLKDM_NOAUTO),
>   	SYSC_QUIRK("dss", 0x4832a000, 0, 0x10, 0x14, 0x00000020, 0xffffffff,
> @@ -1423,8 +1425,6 @@ static const struct sysc_revision_quirk sysc_revision_quirks[] = {
>   	SYSC_QUIRK("atl", 0, 0, -ENODEV, -ENODEV, 0x0a070100, 0xffffffff, 0),
>   	SYSC_QUIRK("cm", 0, 0, -ENODEV, -ENODEV, 0x40000301, 0xffffffff, 0),
>   	SYSC_QUIRK("control", 0, 0, 0x10, -ENODEV, 0x40000900, 0xffffffff, 0),
> -	SYSC_QUIRK("cpgmac", 0, 0x1200, 0x1208, 0x1204, 0x4edb1902,
> -		   0xffff00f0, 0),
>   	SYSC_QUIRK("dcan", 0, 0x20, -ENODEV, -ENODEV, 0xa3170504, 0xffffffff, 0),
>   	SYSC_QUIRK("dcan", 0, 0x20, -ENODEV, -ENODEV, 0x4edb1902, 0xffffffff, 0),
>   	SYSC_QUIRK("dispc", 0x4832a400, 0, 0x10, 0x14, 0x00000030, 0xffffffff, 0),
> 

-- 
Best regards,
grygorii
