Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 23988329EF
	for <lists+linux-omap@lfdr.de>; Mon,  3 Jun 2019 09:45:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726908AbfFCHo7 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 3 Jun 2019 03:44:59 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:51772 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725975AbfFCHo7 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 3 Jun 2019 03:44:59 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x537iusY064967;
        Mon, 3 Jun 2019 02:44:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1559547896;
        bh=kuOA4i6Nx6Wgth74JVkoFKBfiLNmxVOydgXp+a16AJw=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=MG6N2rbH45e2Krv5vLst2qOQFVI+wB3irTc1shlOOw4/LYronJdrhdGVIESeLO9zk
         r4AaQWKh4AjFzphqq0fER15fK/8sCca7ehHDbZMLCjEk3jLL1cHVGtXlM6UD6THg1V
         b2TZueqS2yQw/W5GKBXZ5+HPo/ma8Ap3B0ON89jc=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x537iuNG053712
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 3 Jun 2019 02:44:56 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 3 Jun
 2019 02:44:56 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 3 Jun 2019 02:44:56 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x537isAm040751;
        Mon, 3 Jun 2019 02:44:55 -0500
Subject: Re: [PATCH] ARM: dts: Drop bogus CLKSEL for timer12 on dra7
To:     Tony Lindgren <tony@atomide.com>, <linux-omap@vger.kernel.org>
CC:     =?UTF-8?Q?Beno=c3=aet_Cousson?= <bcousson@baylibre.com>,
        <devicetree@vger.kernel.org>, Tero Kristo <t-kristo@ti.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
References: <20190530065635.42811-1-tony@atomide.com>
From:   Peter Ujfalusi <peter.ujfalusi@ti.com>
Message-ID: <2fac6b75-295b-57ca-379c-a82072a4ba05@ti.com>
Date:   Mon, 3 Jun 2019 10:45:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190530065635.42811-1-tony@atomide.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 30/05/2019 9.56, Tony Lindgren wrote:
> There is no CLKSEL for timer12 on dra6 unlike for timer1. This
> causes issues on booting the device that Tomi noticed if
> DEBUG_SLAB is enabled and the clkctrl clock does not properly
> handle non-existing clock. Let's drop the bogus CLKSEL clock,
> the clkctrl clock handling gets fixed separately.

Tested-by: Peter Ujfalusi <peter.ujfalusi@ti.com>

> Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>
> Cc: Tero Kristo <t-kristo@ti.com>
> Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Reported-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Fixes: 4ed0dfe3cf39 ("ARM: dts: dra7: Move l4 child devices to probe them with ti-sysc")
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
>  arch/arm/boot/dts/dra7-l4.dtsi | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/dra7-l4.dtsi b/arch/arm/boot/dts/dra7-l4.dtsi
> --- a/arch/arm/boot/dts/dra7-l4.dtsi
> +++ b/arch/arm/boot/dts/dra7-l4.dtsi
> @@ -4450,8 +4450,6 @@
>  			timer12: timer@0 {
>  				compatible = "ti,omap5430-timer";
>  				reg = <0x0 0x80>;
> -				clocks = <&wkupaon_clkctrl DRA7_WKUPAON_TIMER12_CLKCTRL 24>;
> -				clock-names = "fck";
>  				interrupts = <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>;
>  				ti,timer-alwon;
>  				ti,timer-secure;
> 

- Péter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
