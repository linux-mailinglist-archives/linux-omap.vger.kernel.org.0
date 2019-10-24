Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6CC1AE2B9D
	for <lists+linux-omap@lfdr.de>; Thu, 24 Oct 2019 09:59:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408766AbfJXH7y (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 24 Oct 2019 03:59:54 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:39470 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404701AbfJXH7y (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 24 Oct 2019 03:59:54 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9O7xpKB066748;
        Thu, 24 Oct 2019 02:59:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1571903991;
        bh=+IUED6wuPtdFzwetdXLMK4dsNj7i3Pf25koVr6ceON8=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=u/xwwGQ+I3WW3uguQVeK3bzwHYzzz5PMJetrrqu/u552Yzuo4i2ulMhDzKB3TFdVT
         +pIFGA5kZLiYwjONdqEG68vnQFqwzNuPRUfWToKn0kPY3ecAAQE4+HnSc/RS8cH+1B
         Kwg8G7zmiUCkv6waemSF4KNy6XPmnJpV5bMQYdUo=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9O7xpeq046214;
        Thu, 24 Oct 2019 02:59:51 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 24
 Oct 2019 02:59:39 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 24 Oct 2019 02:59:49 -0500
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9O7xlgJ040749;
        Thu, 24 Oct 2019 02:59:48 -0500
Subject: Re: [PATCH v2] clk: ti: dra7-atl-clock: Remove ti_clk_add_alias call
To:     Peter Ujfalusi <peter.ujfalusi@ti.com>, <mturquette@baylibre.com>
CC:     <sboyd@kernel.org>, <linux-omap@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20191002083436.10194-1-peter.ujfalusi@ti.com>
From:   Tero Kristo <t-kristo@ti.com>
Message-ID: <0770a061-c731-dfee-0de7-c16dcf87454e@ti.com>
Date:   Thu, 24 Oct 2019 10:59:47 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191002083436.10194-1-peter.ujfalusi@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 02/10/2019 11:34, Peter Ujfalusi wrote:
> ti_clk_register() calls it already so the driver should not create
> duplicated alias.
> 
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
> ---
> Hi,
> 
> changes since v1:
> - removed unused ret variable
> 

Queued up for 5.4 fixes, thanks.

-Tero


> Regards,
> Peter
> 
>   drivers/clk/ti/clk-dra7-atl.c | 6 ------
>   1 file changed, 6 deletions(-)
> 
> diff --git a/drivers/clk/ti/clk-dra7-atl.c b/drivers/clk/ti/clk-dra7-atl.c
> index a01ca9395179..f65e16c4f3c4 100644
> --- a/drivers/clk/ti/clk-dra7-atl.c
> +++ b/drivers/clk/ti/clk-dra7-atl.c
> @@ -174,7 +174,6 @@ static void __init of_dra7_atl_clock_setup(struct device_node *node)
>   	struct clk_init_data init = { NULL };
>   	const char **parent_names = NULL;
>   	struct clk *clk;
> -	int ret;
>   
>   	clk_hw = kzalloc(sizeof(*clk_hw), GFP_KERNEL);
>   	if (!clk_hw) {
> @@ -207,11 +206,6 @@ static void __init of_dra7_atl_clock_setup(struct device_node *node)
>   	clk = ti_clk_register(NULL, &clk_hw->hw, node->name);
>   
>   	if (!IS_ERR(clk)) {
> -		ret = ti_clk_add_alias(NULL, clk, node->name);
> -		if (ret) {
> -			clk_unregister(clk);
> -			goto cleanup;
> -		}
>   		of_clk_add_provider(node, of_clk_src_simple_get, clk);
>   		kfree(parent_names);
>   		return;
> 

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
