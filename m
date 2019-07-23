Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D4A3721E1
	for <lists+linux-omap@lfdr.de>; Tue, 23 Jul 2019 23:58:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389406AbfGWV6s (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 23 Jul 2019 17:58:48 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:51514 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392231AbfGWV6s (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 23 Jul 2019 17:58:48 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6NLweTl036312;
        Tue, 23 Jul 2019 16:58:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1563919120;
        bh=ILKhKI41EkFj4wPxs81h4zDtCcBF0AQzAXW0JOqC9K0=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=Dk6jIp5+ZXbAUqHopDnnzLjWF8ef7bRO3D1TFj5xiKqSBuZ8aFkYJZZSYbV/0k3QZ
         w2YcU5RB6ytxVT7uAyQ9xMRLOz8EmjGTuo/oZ8ofOqUY1QzGO5rClW+N8cazVo4ygY
         dwDXwdvi3TbO8+xh0u8rZrVl6b74pRjj0EVf/UTE=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6NLwejB005955
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 23 Jul 2019 16:58:40 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 23
 Jul 2019 16:58:39 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 23 Jul 2019 16:58:40 -0500
Received: from [128.247.58.153] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6NLwdj7128934;
        Tue, 23 Jul 2019 16:58:39 -0500
Subject: Re: [PATCH 6/8] ARM: dts: Fix flags for gpio7
To:     Tony Lindgren <tony@atomide.com>, <linux-omap@vger.kernel.org>
CC:     Dave Gerlach <d-gerlach@ti.com>, Faiz Abbas <faiz_abbas@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Keerthy <j-keerthy@ti.com>, Nishanth Menon <nm@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Roger Quadros <rogerq@ti.com>, Tero Kristo <t-kristo@ti.com>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20190723112811.44381-1-tony@atomide.com>
 <20190723112811.44381-7-tony@atomide.com>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <7b09274a-eed2-a7ef-e1ae-b95f1d0b8666@ti.com>
Date:   Tue, 23 Jul 2019 16:58:39 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190723112811.44381-7-tony@atomide.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tony,

On 7/23/19 6:28 AM, Tony Lindgren wrote:
> The ti,no-idle-on-init and ti,no-reset-on-init flags need to be at
> the interconnect target module level for the modules that have it
> defined. Otherwise we get the following warnings:
> 
> dts flag should be at module level for ti,no-idle-on-init
> dts flag should be at module level for ti,no-reset-on-init
> 
> Signed-off-by: Tony Lindgren <tony@atomide.com>

There's a similar one within the am335x-icev2.dts file for gpio0
that can also use this fix.

Reviewed-by: Suman Anna <s-anna@ti.com>

regards
Suman

> ---
>  arch/arm/boot/dts/am57xx-beagle-x15-common.dtsi | 2 +-
>  arch/arm/boot/dts/dra7-evm.dts                  | 2 +-
>  arch/arm/boot/dts/dra7-l4.dtsi                  | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/am57xx-beagle-x15-common.dtsi b/arch/arm/boot/dts/am57xx-beagle-x15-common.dtsi
> --- a/arch/arm/boot/dts/am57xx-beagle-x15-common.dtsi
> +++ b/arch/arm/boot/dts/am57xx-beagle-x15-common.dtsi
> @@ -379,7 +379,7 @@
>  	};
>  };
>  
> -&gpio7 {
> +&gpio7_target {
>  	ti,no-reset-on-init;
>  	ti,no-idle-on-init;
>  };
> diff --git a/arch/arm/boot/dts/dra7-evm.dts b/arch/arm/boot/dts/dra7-evm.dts
> --- a/arch/arm/boot/dts/dra7-evm.dts
> +++ b/arch/arm/boot/dts/dra7-evm.dts
> @@ -498,7 +498,7 @@
>  	phy-supply = <&ldousb_reg>;
>  };
>  
> -&gpio7 {
> +&gpio7_target {
>  	ti,no-reset-on-init;
>  	ti,no-idle-on-init;
>  };
> diff --git a/arch/arm/boot/dts/dra7-l4.dtsi b/arch/arm/boot/dts/dra7-l4.dtsi
> --- a/arch/arm/boot/dts/dra7-l4.dtsi
> +++ b/arch/arm/boot/dts/dra7-l4.dtsi
> @@ -1261,7 +1261,7 @@
>  			};
>  		};
>  
> -		target-module@51000 {			/* 0x48051000, ap 45 2e.0 */
> +		gpio7_target: target-module@51000 {		/* 0x48051000, ap 45 2e.0 */
>  			compatible = "ti,sysc-omap2", "ti,sysc";
>  			ti,hwmods = "gpio7";
>  			reg = <0x51000 0x4>,
> 

