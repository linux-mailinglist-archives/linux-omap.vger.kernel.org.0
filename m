Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B81BBA3392
	for <lists+linux-omap@lfdr.de>; Fri, 30 Aug 2019 11:18:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727386AbfH3JSz (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 30 Aug 2019 05:18:55 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:56354 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727521AbfH3JSz (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 30 Aug 2019 05:18:55 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7U9Ik5I061172;
        Fri, 30 Aug 2019 04:18:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1567156726;
        bh=nzwNbK2OHYnA8jNkBzWmQDsCh69Jnha6jJdyXynf8qw=;
        h=Subject:From:To:CC:References:Date:In-Reply-To;
        b=hbLgoM0frQ+0TOMbEOlLJXa89Upu5w3g2WySk9ImU48FQ8tQrbGCgCCFKhXPFg/LQ
         X8GBZEyrwvmG9p66HcxMpcidKM6ezkc7vn23AvaJ+x26kl5Uhd1mlIof/pwU8maXco
         zV8CWxpIKSOxDd3QMQ9R7Qxj9xomQ3c4DX23DobY=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7U9IkVP052106
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 30 Aug 2019 04:18:46 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 30
 Aug 2019 04:18:45 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 30 Aug 2019 04:18:45 -0500
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7U9IhL9130186;
        Fri, 30 Aug 2019 04:18:43 -0500
Subject: Re: [PATCHv2 01/11] dt-bindings: omap: add new binding for PRM
 instances
From:   Tero Kristo <t-kristo@ti.com>
To:     <ssantosh@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-omap@vger.kernel.org>, <robh+dt@kernel.org>,
        <p.zabel@pengutronix.de>
CC:     <tony@atomide.com>, <s-anna@ti.com>, <devicetree@vger.kernel.org>
References: <20190828071941.32378-1-t-kristo@ti.com>
 <20190828071941.32378-2-t-kristo@ti.com>
Message-ID: <8f4bcd94-6555-26cc-2458-51b0e8712f68@ti.com>
Date:   Fri, 30 Aug 2019 12:18:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190828071941.32378-2-t-kristo@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Rob,

Quick question below based on some discussion on the implementation 
details of the PRM support.

On 28/08/2019 10:19, Tero Kristo wrote:
> Add new binding for OMAP PRM (Power and Reset Manager) instances. Each
> of these will act as a power domain controller and potentially as a reset
> provider.
> 
> Signed-off-by: Tero Kristo <t-kristo@ti.com>
> ---
>   .../devicetree/bindings/arm/omap/prm-inst.txt | 31 +++++++++++++++++++
>   1 file changed, 31 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/arm/omap/prm-inst.txt
> 
> diff --git a/Documentation/devicetree/bindings/arm/omap/prm-inst.txt b/Documentation/devicetree/bindings/arm/omap/prm-inst.txt
> new file mode 100644
> index 000000000000..7c7527c37734
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/omap/prm-inst.txt
> @@ -0,0 +1,31 @@
> +OMAP PRM instance bindings
> +
> +Power and Reset Manager is an IP block on OMAP family of devices which
> +handle the power domains and their current state, and provide reset
> +handling for the domains and/or separate IP blocks under the power domain
> +hierarchy.
> +
> +Required properties:
> +- compatible:	Must be one of:
> +		"ti,am3-prm-inst"
> +		"ti,am4-prm-inst"
> +		"ti,omap4-prm-inst"
> +		"ti,omap5-prm-inst"
> +		"ti,dra7-prm-inst"

Each of these bindings describes multiple PRM instances, like 
ti,dra7-prm-inst maps eventually into 21 different PRM instances. I end 
up matching these in the kernel based on base address to map additional 
details, like support for reset handling, supported reset bits, etc.

What is your take on this, should I just provide individual compatible 
strings for these all, the total amount of them would end up being like 
70+, or keep them like this? I find it rather cumbersome if I would have 
to deal with 70+ different compatibles... Also, I would need to keep 
updating the bindings doc once I add new instances on the supported list.

-Tero

> +- reg:		Contains PRM instance register address range
> +		(base address and length)
> +
> +Optional properties:
> +- #reset-cells:	Should be 1 if the PRM instance in question supports resets.
> +- clocks:	Associated clocks for the reset signals if any. Certain reset
> +		signals can't be toggled properly without functional clock
> +		being active for them.
> +
> +Example:
> +
> +prm_dsp2: prm@1b00 {
> +	compatible = "ti,dra7-prm-inst";
> +	reg = <0x1b00 0x40>;
> +	#reset-cells = <1>;
> +	clocks = <&dsp2_clkctrl DRA7_DSP2_MMU0_DSP2_CLKCTRL 0>;
> +};
> 

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
