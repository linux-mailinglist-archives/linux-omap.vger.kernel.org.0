Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27EE2252F4F
	for <lists+linux-omap@lfdr.de>; Wed, 26 Aug 2020 15:05:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730216AbgHZNF1 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 26 Aug 2020 09:05:27 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:43950 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730131AbgHZNFX (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 26 Aug 2020 09:05:23 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 07QD5Fe2031113;
        Wed, 26 Aug 2020 08:05:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1598447115;
        bh=S9XBz7cs9fo5vrEmLetovu1R76fFJ8F44+ifbtoIm2Q=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=FBKqznDmJ8HQ9+Z5AG9AJThxuD9sYbVYsPEcOsIq+EQZYjMuIuXF54XgE8+hw5aO8
         vLVWnhdd+wC60UhId1abi7//L4AMFSFVdFZLxoOerHgDH7GCyTEvaN/97R1s27haXa
         uXLJi8u9ai53xbLQZdAHA09VHhO0mYkozO4hnz7E=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 07QD5ETO017084
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 26 Aug 2020 08:05:15 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 26
 Aug 2020 08:05:14 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 26 Aug 2020 08:05:14 -0500
Received: from [192.168.2.14] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07QD5C5P078714;
        Wed, 26 Aug 2020 08:05:13 -0500
Subject: Re: [PATCH] memory: omap-gpmc: Fix a couple off by ones
To:     Dan Carpenter <dan.carpenter@oracle.com>
CC:     Tony Lindgren <tony@atomide.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>
References: <20200825104707.GB278587@mwanda>
From:   Roger Quadros <rogerq@ti.com>
Message-ID: <919395fe-8108-94f5-3370-a573da8313f9@ti.com>
Date:   Wed, 26 Aug 2020 16:05:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200825104707.GB278587@mwanda>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 25/08/2020 13:47, Dan Carpenter wrote:
> These comparisons should be >= instead of > to prevent reading one
> element beyond the end of the gpmc_cs[] array.
> 
> Fixes: cdd6928c589a ("ARM: OMAP2+: Add device-tree support for NOR flash")
> Fixes: f37e4580c409 ("ARM: OMAP2: Dynamic allocator for GPMC memory space")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Roger Quadros <rogerq@ti.com>

> ---
>   drivers/memory/omap-gpmc.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/memory/omap-gpmc.c b/drivers/memory/omap-gpmc.c
> index cd9e80748591..fd245b82163a 100644
> --- a/drivers/memory/omap-gpmc.c
> +++ b/drivers/memory/omap-gpmc.c
> @@ -989,7 +989,7 @@ static int gpmc_cs_remap(int cs, u32 base)
>   	int ret;
>   	u32 old_base, size;
>   
> -	if (cs > gpmc_cs_num) {
> +	if (cs >= gpmc_cs_num) {
>   		pr_err("%s: requested chip-select is disabled\n", __func__);
>   		return -ENODEV;
>   	}
> @@ -1024,7 +1024,7 @@ int gpmc_cs_request(int cs, unsigned long size, unsigned long *base)
>   	struct resource *res = &gpmc->mem;
>   	int r = -1;
>   
> -	if (cs > gpmc_cs_num) {
> +	if (cs >= gpmc_cs_num) {
>   		pr_err("%s: requested chip-select is disabled\n", __func__);
>   		return -ENODEV;
>   	}
> 

cheers,
-roger

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
