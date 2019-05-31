Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 56A8A30DCE
	for <lists+linux-omap@lfdr.de>; Fri, 31 May 2019 14:05:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727318AbfEaMF4 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 31 May 2019 08:05:56 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:41434 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726330AbfEaMFz (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 31 May 2019 08:05:55 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4VC5rC6109848;
        Fri, 31 May 2019 07:05:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1559304353;
        bh=45YvfDOylGSNxGfoAHI9TfRpBcHWXPRnjZyknH7Q4Is=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=vOFx+Hx1s3VoOvyBNaa79Whtr02oWEP+i5Kj+mYicynqNAsmSrtsP1VTgP7XPa8JM
         aarkyKRX8W8Sda6DmACnQJGr0mCbIJjQlKz39/lA+9sE/UFobgWZRtnw2dIhMHzYkS
         PdkiHPlwDi7CP4Kn+3tF3AorHA6JVF5qmbXwnx/I=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4VC5rrd014031
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 31 May 2019 07:05:53 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 31
 May 2019 07:05:52 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 31 May 2019 07:05:52 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4VC5paq106642;
        Fri, 31 May 2019 07:05:51 -0500
Subject: Re: [PATCH] ARM: dts: Drop bogus CLKSEL for timer12 on dra7
To:     Tony Lindgren <tony@atomide.com>, <linux-omap@vger.kernel.org>
CC:     =?UTF-8?Q?Beno=c3=aet_Cousson?= <bcousson@baylibre.com>,
        <devicetree@vger.kernel.org>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Tero Kristo <t-kristo@ti.com>
References: <20190530065635.42811-1-tony@atomide.com>
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <89884096-cda4-ea67-6776-4fb25abc65e3@ti.com>
Date:   Fri, 31 May 2019 15:05:50 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190530065635.42811-1-tony@atomide.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 30/05/2019 09:56, Tony Lindgren wrote:
> There is no CLKSEL for timer12 on dra6 unlike for timer1. This

dra7

> causes issues on booting the device that Tomi noticed if
> DEBUG_SLAB is enabled and the clkctrl clock does not properly
> handle non-existing clock. Let's drop the bogus CLKSEL clock,
> the clkctrl clock handling gets fixed separately.
> 
> Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>
> Cc: Tero Kristo <t-kristo@ti.com>
> Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Reported-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Fixes: 4ed0dfe3cf39 ("ARM: dts: dra7: Move l4 child devices to probe them with ti-sysc")
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
>   arch/arm/boot/dts/dra7-l4.dtsi | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/dra7-l4.dtsi b/arch/arm/boot/dts/dra7-l4.dtsi
> --- a/arch/arm/boot/dts/dra7-l4.dtsi
> +++ b/arch/arm/boot/dts/dra7-l4.dtsi
> @@ -4450,8 +4450,6 @@
>   			timer12: timer@0 {
>   				compatible = "ti,omap5430-timer";
>   				reg = <0x0 0x80>;
> -				clocks = <&wkupaon_clkctrl DRA7_WKUPAON_TIMER12_CLKCTRL 24>;
> -				clock-names = "fck";
>   				interrupts = <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>;
>   				ti,timer-alwon;
>   				ti,timer-secure;
> 

Tested-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
