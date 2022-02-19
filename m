Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 188C64BC324
	for <lists+linux-omap@lfdr.de>; Sat, 19 Feb 2022 01:04:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237430AbiBSAED (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 18 Feb 2022 19:04:03 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:54788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233937AbiBSAEC (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 18 Feb 2022 19:04:02 -0500
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE22B2731F1;
        Fri, 18 Feb 2022 16:03:43 -0800 (PST)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 21J03RI2119691;
        Fri, 18 Feb 2022 18:03:27 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1645229007;
        bh=1x3Kenh4ndILKwhJtba+OvQjGUjAsGb8pbNEJY2OSY8=;
        h=Date:Subject:To:References:From:In-Reply-To;
        b=KNUddUXS3k5yP1+wzVSVpvzL2Sm7QPcTXgj/4CPOA+TRID9JHbFiHONp05Ecq4B3h
         mUGaayF/dj6QiY4a5SGh22v36gA848aOLhpt5ZV4aBrefiaXPvkCKEAJqo8BoufmSs
         uJnqPNecY2HdXkFfq2HiiHc+VY4eJKB87G5pcumk=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 21J03RuW121032
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 18 Feb 2022 18:03:27 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 18
 Feb 2022 18:03:26 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 18 Feb 2022 18:03:26 -0600
Received: from [10.249.33.2] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 21J03PRk112149;
        Fri, 18 Feb 2022 18:03:26 -0600
Message-ID: <9d56bc51-2539-fe14-7968-c172acb8b4c9@ti.com>
Date:   Fri, 18 Feb 2022 18:03:25 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2] clocksource/drivers/timer-ti-dm: fix regression from
 errata i940 fix
Content-Language: en-US
To:     Drew Fustini <dfustini@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Keerthy <j-keerthy@ti.com>, <linux-kernel@vger.kernel.org>,
        <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Tero Kristo <kristo@kernel.org>, <khilman@baylibre.com>
References: <20220204053503.1409162-1-dfustini@baylibre.com>
From:   Suman Anna <s-anna@ti.com>
In-Reply-To: <20220204053503.1409162-1-dfustini@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tony,

On 2/3/22 23:35, Drew Fustini wrote:
> The existing fix for errata i940 causes a conflict for IPU2 which is
> using timer 3 and 4. From arch/arm/boot/dts/dra7-ipu-dsp-common.dtsi:
> 
>   &ipu2 {
>           mboxes = <&mailbox6 &mbox_ipu2_ipc3x>;
>           ti,timers = <&timer3>;
>           ti,watchdog-timers = <&timer4>, <&timer9>;
>   };
> 
> The conflict was noticed when booting mainline on the BeagleBoard X15
> which has a TI AM5728 SoC:
> 
>   remoteproc remoteproc1: 55020000.ipu is available
>   remoteproc remoteproc1: powering up 55020000.ipu
>   remoteproc remoteproc1: Booting fw image dra7-ipu2-fw.xem4
>   omap-rproc 55020000.ipu: could not get timer platform device
>   omap-rproc 55020000.ipu: omap_rproc_enable_timers failed: -19
>   remoteproc remoteproc1: can't start rproc 55020000.ipu: -19
> 
> This change modifies the errata fix to instead use timer 15 and 16 which
> resolves the timer conflict.
> 
> It does not appear to introduce any latency regression. Results from
> cyclictest with original errata fix using dmtimer 3 and 4:
> 
>   # cyclictest --mlockall --smp --priority=80 --interval=200 --distance=0
>   policy: fifo: loadavg: 0.02 0.03 0.05
> 
>   T: 0 ( 1449) P:80 I:200 C: 800368 Min:   0 Act:   32 Avg:   22 Max:  128
>   T: 1 ( 1450) P:80 I:200 C: 800301 Min:   0 Act:   12 Avg:   23 Max:   70
> 
> The results after the change to dmtimer 15 and 16:
> 
>   # cyclictest --mlockall --smp --priority=80 --interval=200 --distance=0
>   policy: fifo: loadavg: 0.36 0.19 0.07
> 
>   T: 0 ( 1711) P:80 I:200 C: 759599 Min:   0 Act:    6 Avg:   22 Max:  108
>   T: 1 ( 1712) P:80 I:200 C: 759539 Min:   0 Act:   19 Avg:   23 Max:   79
> 

Gentle reminder, I don't see this in linux-next yet, was kinda expecting this
would be included in the fixes for 5.17.

Just want to make sure that the patch did not get lost in your mbox.

regards
Suman

> Fixes: 25de4ce5ed02 ("clocksource/drivers/timer-ti-dm: Handle dra7 timer wrap errata i940")
> Link: https://lore.kernel.org/linux-omap/YfWsG0p6to3IJuvE@x1/
> Suggested-by: Suman Anna <s-anna@ti.com>
> Reviewed-by: Tony Lindgren <tony@atomide.com>
> Signed-off-by: Drew Fustini <dfustini@baylibre.com>
> ---
> v2 changes:
> - add cyclictest results
> - use lowercase letter in hex literals
> 
>  arch/arm/boot/dts/dra7-l4.dtsi             | 5 ++---
>  arch/arm/boot/dts/dra7.dtsi                | 8 ++++----
>  drivers/clocksource/timer-ti-dm-systimer.c | 4 ++--
>  3 files changed, 8 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/dra7-l4.dtsi b/arch/arm/boot/dts/dra7-l4.dtsi
> index 956a26d52a4c..0a11bacffc1f 100644
> --- a/arch/arm/boot/dts/dra7-l4.dtsi
> +++ b/arch/arm/boot/dts/dra7-l4.dtsi
> @@ -3482,8 +3482,7 @@ timer14: timer@0 {
>  				ti,timer-pwm;
>  			};
>  		};
> -
> -		target-module@2c000 {			/* 0x4882c000, ap 17 02.0 */
> +		timer15_target: target-module@2c000 {	/* 0x4882c000, ap 17 02.0 */
>  			compatible = "ti,sysc-omap4-timer", "ti,sysc";
>  			reg = <0x2c000 0x4>,
>  			      <0x2c010 0x4>;
> @@ -3511,7 +3510,7 @@ timer15: timer@0 {
>  			};
>  		};
>  
> -		target-module@2e000 {			/* 0x4882e000, ap 19 14.0 */
> +		timer16_target: target-module@2e000 {	/* 0x4882e000, ap 19 14.0 */
>  			compatible = "ti,sysc-omap4-timer", "ti,sysc";
>  			reg = <0x2e000 0x4>,
>  			      <0x2e010 0x4>;
> diff --git a/arch/arm/boot/dts/dra7.dtsi b/arch/arm/boot/dts/dra7.dtsi
> index 6b485cbed8d5..8f7ffe2f66e9 100644
> --- a/arch/arm/boot/dts/dra7.dtsi
> +++ b/arch/arm/boot/dts/dra7.dtsi
> @@ -1339,20 +1339,20 @@ timer@0 {
>  };
>  
>  /* Local timers, see ARM architected timer wrap erratum i940 */
> -&timer3_target {
> +&timer15_target {
>  	ti,no-reset-on-init;
>  	ti,no-idle;
>  	timer@0 {
> -		assigned-clocks = <&l4per_clkctrl DRA7_L4PER_TIMER3_CLKCTRL 24>;
> +		assigned-clocks = <&l4per3_clkctrl DRA7_L4PER3_TIMER15_CLKCTRL 24>;
>  		assigned-clock-parents = <&timer_sys_clk_div>;
>  	};
>  };
>  
> -&timer4_target {
> +&timer16_target {
>  	ti,no-reset-on-init;
>  	ti,no-idle;
>  	timer@0 {
> -		assigned-clocks = <&l4per_clkctrl DRA7_L4PER_TIMER4_CLKCTRL 24>;
> +		assigned-clocks = <&l4per3_clkctrl DRA7_L4PER3_TIMER16_CLKCTRL 24>;
>  		assigned-clock-parents = <&timer_sys_clk_div>;
>  	};
>  };
> diff --git a/drivers/clocksource/timer-ti-dm-systimer.c b/drivers/clocksource/timer-ti-dm-systimer.c
> index b6f97960d8ee..f52bf81dc1dd 100644
> --- a/drivers/clocksource/timer-ti-dm-systimer.c
> +++ b/drivers/clocksource/timer-ti-dm-systimer.c
> @@ -695,9 +695,9 @@ static int __init dmtimer_percpu_quirk_init(struct device_node *np, u32 pa)
>  		return 0;
>  	}
>  
> -	if (pa == 0x48034000)		/* dra7 dmtimer3 */
> +	if (pa == 0x4882c000)           /* dra7 dmtimer15 */
>  		return dmtimer_percpu_timer_init(np, 0);
> -	else if (pa == 0x48036000)	/* dra7 dmtimer4 */
> +	else if (pa == 0x4882e000)      /* dra7 dmtimer16 */
>  		return dmtimer_percpu_timer_init(np, 1);
>  
>  	return 0;

