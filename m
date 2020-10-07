Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 426A2285EB8
	for <lists+linux-omap@lfdr.de>; Wed,  7 Oct 2020 14:06:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728037AbgJGMF7 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 7 Oct 2020 08:05:59 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:59510 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726219AbgJGMF7 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 7 Oct 2020 08:05:59 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 097C5dha011272;
        Wed, 7 Oct 2020 07:05:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1602072339;
        bh=98VxpOsUYCaLHzSjHudtgwbcFZvvbzH4YA/ReQeuaIQ=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=POOZLMCaAdDmhwazJDpq02bJQtFxVorGw2HSgdGM5IGFe99ZfwcQcAL7LJdXNmDbK
         XVxa4QGqVSUq7KhmKaloNaQP0KJe0NniLDBQMYKC35WEVoe//atO8Fey91q+6SmBa+
         d1pLrKIRLnl3FJMbTfha9SLLwcmogP6IQzJYeVzw=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 097C5dIe080798
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 7 Oct 2020 07:05:39 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 7 Oct
 2020 07:05:39 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 7 Oct 2020 07:05:39 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 097C5LsU092391;
        Wed, 7 Oct 2020 07:05:22 -0500
Subject: Re: [PATCH] ASoC: omap-mcbsp: Fix use of uninitialised pointer
To:     Alex Dewar <alex.dewar90@gmail.com>
CC:     Jarkko Nikula <jarkko.nikula@bitmer.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, <alsa-devel@alsa-project.org>,
        <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20201004102535.325547-1-alex.dewar90@gmail.com>
From:   Peter Ujfalusi <peter.ujfalusi@ti.com>
Message-ID: <c2441186-c278-d84d-55c4-294ef01823a6@ti.com>
Date:   Wed, 7 Oct 2020 15:05:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201004102535.325547-1-alex.dewar90@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 04/10/2020 13.25, Alex Dewar wrote:
> Commit 9c34d023dc35 ("ASoC: omap-mcbsp: Re-arrange files for core McBSP
> and Sidetone function split"), in rearranging various files, also replaced
> calls to platform_get_resource_by_name() + devm_ioremap_resource() with a
> single call to devm_platform_ioremap_resource_byname(). However, the
> struct resource is needed as we access its members so at present a null
> pointer is dereferenced. Fix by doing things the old way.
> 
> Addresses-Coverity-ID: 1497530 ("Memory - illegal accesses")
> Fixes: 9c34d023dc35 ("ASoC: omap-mcbsp: Re-arrange files for core McBSP and Sidetone function split")

it is fixing:
31e1fc4f11e2e ("ASoC: ti: omap-mcbsp: use
devm_platform_ioremap_resource_byname")

and we should just revert that commit.

> Signed-off-by: Alex Dewar <alex.dewar90@gmail.com>
> ---
>  sound/soc/ti/omap-mcbsp.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/ti/omap-mcbsp.c b/sound/soc/ti/omap-mcbsp.c
> index 186cea91076f..6025b30bbe77 100644
> --- a/sound/soc/ti/omap-mcbsp.c
> +++ b/sound/soc/ti/omap-mcbsp.c
> @@ -620,7 +620,11 @@ static int omap_mcbsp_init(struct platform_device *pdev)
>  	spin_lock_init(&mcbsp->lock);
>  	mcbsp->free = true;
>  
> -	mcbsp->io_base = devm_platform_ioremap_resource_byname(pdev, "mpu");
> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "mpu");
> +	if (!res)
> +		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +
> +	mcbsp->io_base = devm_ioremap_resource(&pdev->dev, res);
>  	if (IS_ERR(mcbsp->io_base))
>  		return PTR_ERR(mcbsp->io_base);
>  
> 

- Péter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
