Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8D8FAB735E
	for <lists+linux-omap@lfdr.de>; Thu, 19 Sep 2019 08:46:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388492AbfISGqM (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 19 Sep 2019 02:46:12 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:33010 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387824AbfISGqM (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 19 Sep 2019 02:46:12 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8J6k6EM071396;
        Thu, 19 Sep 2019 01:46:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1568875566;
        bh=uBl5JIJLGiUHEpU8n2kGovFFQZIZ9dJYmqd6XAX2V2k=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=qlRJ2Sb16aSht2UbIeZJsbHbkJUfyYA6J+/+wIoE/ZlNs+yI06NpqGznG6zitb0NY
         9qLomxg39sTdUmfbdZ/NoaqibuB65/rWhZV4IG1SzWP1zrzTSTdTiRy2hapHsxsXU9
         u0v2xrWE2dMnw80Cw/AlE7V381xrh+P+PgaRWW1U=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8J6k6aj002224
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 19 Sep 2019 01:46:06 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 19
 Sep 2019 01:46:02 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 19 Sep 2019 01:46:02 -0500
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8J6k3VO004101;
        Thu, 19 Sep 2019 01:46:03 -0500
Subject: Re: [PATCH] clk: ti: clkctrl: Fix hidden dependency to node name with
 reg-names
To:     Tony Lindgren <tony@atomide.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>
CC:     <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-omap@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>
References: <20190905215532.8357-1-tony@atomide.com>
From:   Tero Kristo <t-kristo@ti.com>
Message-ID: <256788c4-ae09-3c72-b563-b9707c4751b4@ti.com>
Date:   Thu, 19 Sep 2019 09:46:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190905215532.8357-1-tony@atomide.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 06/09/2019 00:55, Tony Lindgren wrote:
> We currently have a hidden dependency to the device tree node name for
> the clkctrl clocks. Instead of using standard node name like "clock", we
> must use "l4-per-clkctrl" naming so the clock driver can find the
> associated clock domain. Further, if "clk" is specified for a clock node
> name, the driver sets TI_CLK_CLKCTRL_COMPAT flag that uses different
> logic with earlier naming for the clock node name.
> 
> If the clock node naming dependency is not understood, the related
> clockdomain is not found, or a wrong one can get used if a clock manager
> instance has multiple domains.
> 
> As each clkctrl instance represents a single clock domain with it's
> reg property describing the clocks available in that clock domain,
> we can simply use "reg-names" property for the clock domain.
> 
> This simplifies things and removes the hidden dependency to the node
> name. And then later on, we should be able to drop the related code
> for parsing the node names.
> 
> Let's also update the binding to use standard "clock" node naming
> instead of "clk".
> 
> Cc: devicetree@vger.kernel.org
> Cc: Rob Herring <robh+dt@kernel.org>
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
>   Documentation/devicetree/bindings/clock/ti-clkctrl.txt |  6 +++++-
>   drivers/clk/ti/clkctrl.c                               | 10 ++++++++--
>   2 files changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/ti-clkctrl.txt b/Documentation/devicetree/bindings/clock/ti-clkctrl.txt
> --- a/Documentation/devicetree/bindings/clock/ti-clkctrl.txt
> +++ b/Documentation/devicetree/bindings/clock/ti-clkctrl.txt
> @@ -20,15 +20,19 @@ Required properties :
>   - #clock-cells : shall contain 2 with the first entry being the instance
>   		 offset from the clock domain base and the second being the
>   		 clock index
> +- reg : clock registers
> +- reg-names : clock register names for the clock, should be same as the
> +	      domain name

Hmm, I think using the reg-names property like this is kind of wrong. 
Basically, reg and reg-names have pretty much nothing in common. 
Shouldn't you instead use something like ti,clkdm-name? This also breaks 
with SoCs like am3, which have mutant clkctrl entries like the one here:

                 l4ls_clkctrl: l4ls-clkctrl@38 {
                         compatible = "ti,clkctrl";
                         reg = <0x38 0x2c>, <0x6c 0x28>, <0xac 0xc>, 
<0xc0 0x1c>, <0xec 0xc>, <0x10c 0x8>, <0x130 0x4>;
                         #clock-cells = <2>;
                 };

What would you think single entry in reg-names would mean in this case?

Other than that, I think the approach taken in this patch looks fine.

-Tero

>   
>   Example: Clock controller node on omap 4430:
>   
>   &cm2 {
>   	l4per: cm@1400 {
>   		cm_l4per@0 {
> -			cm_l4per_clkctrl: clk@20 {
> +			cm_l4per_clkctrl: clock@20 {
>   				compatible = "ti,clkctrl";
>   				reg = <0x20 0x1b0>;
> +				reg-names = "l4_per";
>   				#clock-cells = <2>;
>   			};
>   		};
> diff --git a/drivers/clk/ti/clkctrl.c b/drivers/clk/ti/clkctrl.c
> --- a/drivers/clk/ti/clkctrl.c
> +++ b/drivers/clk/ti/clkctrl.c
> @@ -446,6 +446,7 @@ static void __init _ti_omap4_clkctrl_setup(struct device_node *node)
>   	struct clk_hw_omap *hw;
>   	struct clk *clk;
>   	struct omap_clkctrl_clk *clkctrl_clk;
> +	const char *clkdm_name;
>   	const __be32 *addrp;
>   	u32 addr;
>   	int ret;
> @@ -534,7 +535,12 @@ static void __init _ti_omap4_clkctrl_setup(struct device_node *node)
>   
>   	provider->base = of_iomap(node, 0);
>   
> -	if (ti_clk_get_features()->flags & TI_CLK_CLKCTRL_COMPAT) {
> +	ret = of_property_read_string_index(node, "reg-names", 0, &clkdm_name);
> +	if (!ret) {
> +		provider->clkdm_name = kasprintf(GFP_KERNEL, "%s_clkdm",
> +						 clkdm_name);
> +		goto clkdm_found;
> +	} else if (ti_clk_get_features()->flags & TI_CLK_CLKCTRL_COMPAT) {
>   		provider->clkdm_name = kasprintf(GFP_KERNEL, "%pOFnxxx", node->parent);
>   		if (!provider->clkdm_name) {
>   			kfree(provider);
> @@ -570,7 +576,7 @@ static void __init _ti_omap4_clkctrl_setup(struct device_node *node)
>   			*c = '_';
>   		c++;
>   	}
> -
> +clkdm_found:
>   	INIT_LIST_HEAD(&provider->clocks);
>   
>   	/* Generate clocks */
> 

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
