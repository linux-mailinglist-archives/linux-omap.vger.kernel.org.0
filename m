Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 11172C4959
	for <lists+linux-omap@lfdr.de>; Wed,  2 Oct 2019 10:21:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727685AbfJBIVM (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 2 Oct 2019 04:21:12 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:56986 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726478AbfJBIVM (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 2 Oct 2019 04:21:12 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x928L9lT078479;
        Wed, 2 Oct 2019 03:21:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1570004469;
        bh=q+RZ32osXQbS1Fp5eKtb7L/Lst0he1B/SFe77H778ro=;
        h=Subject:From:To:CC:References:Date:In-Reply-To;
        b=Epb4N85u7RKv72gHS6tM48s7RQsjuyObBIhzDF3vTVRujm9ZFMCsyfU/Wyq6V3YM8
         wxnGnEU57MjRF76aOztck/yq5En3rZOnvSwC3NO7smIEeXaArn1Lqc70Cq2Ey88frQ
         /8rOsmkEbI2s12lVvZcjJXF6rJ8F/In6ClrpOUdc=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x928L9Fa064900;
        Wed, 2 Oct 2019 03:21:09 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 2 Oct
 2019 03:21:08 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 2 Oct 2019 03:20:58 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x928L6fA075440;
        Wed, 2 Oct 2019 03:21:07 -0500
Subject: Re: [PATCH] clk: ti: dra7-atl-clock: Remove ti_clk_add_alias call
From:   Peter Ujfalusi <peter.ujfalusi@ti.com>
To:     <t-kristo@ti.com>, <mturquette@baylibre.com>
CC:     <sboyd@kernel.org>, <linux-omap@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20190926104556.28716-1-peter.ujfalusi@ti.com>
Message-ID: <71d281e9-e834-6fb7-b16c-57500770aa54@ti.com>
Date:   Wed, 2 Oct 2019 11:21:55 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190926104556.28716-1-peter.ujfalusi@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 26/09/2019 13.45, Peter Ujfalusi wrote:
> ti_clk_register() calls it already so the driver should not create
> duplicated alias.

This patch will leave 'ret' as unused in of_dra7_atl_clock_setup(), I'll
send v2 in a minute or so.

> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
> ---
>  drivers/clk/ti/clk-dra7-atl.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/clk/ti/clk-dra7-atl.c b/drivers/clk/ti/clk-dra7-atl.c
> index a01ca9395179..c0e0ee974151 100644
> --- a/drivers/clk/ti/clk-dra7-atl.c
> +++ b/drivers/clk/ti/clk-dra7-atl.c
> @@ -207,11 +207,6 @@ static void __init of_dra7_atl_clock_setup(struct device_node *node)
>  	clk = ti_clk_register(NULL, &clk_hw->hw, node->name);
>  
>  	if (!IS_ERR(clk)) {
> -		ret = ti_clk_add_alias(NULL, clk, node->name);
> -		if (ret) {
> -			clk_unregister(clk);
> -			goto cleanup;
> -		}
>  		of_clk_add_provider(node, of_clk_src_simple_get, clk);
>  		kfree(parent_names);
>  		return;
> 

- Péter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
