Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76E65460965
	for <lists+linux-omap@lfdr.de>; Sun, 28 Nov 2021 20:27:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229560AbhK1Tan (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 28 Nov 2021 14:30:43 -0500
Received: from 49-237-179-185.static.tentacle.fi ([185.179.237.49]:59370 "EHLO
        bitmer.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1357211AbhK1T2m (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sun, 28 Nov 2021 14:28:42 -0500
X-Greylist: delayed 2513 seconds by postgrey-1.27 at vger.kernel.org; Sun, 28 Nov 2021 14:28:40 EST
Received: from 88-114-184-140.elisa-laajakaista.fi ([88.114.184.140] helo=[192.168.1.48])
        by bitmer.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <jarkko.nikula@bitmer.com>)
        id 1mrP8t-0003BD-LO; Sun, 28 Nov 2021 20:43:15 +0200
Subject: Re: [PATCH] ARM: dts: Fix timer regression for beagleboard revision c
To:     Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org
Cc:     =?UTF-8?Q?Beno=c3=aet_Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Rob Herring <robh+dt@kernel.org>
References: <20211125144834.52457-1-tony@atomide.com>
From:   Jarkko Nikula <jarkko.nikula@bitmer.com>
Message-ID: <18772611-59f8-57ad-581d-40ea71d3d706@bitmer.com>
Date:   Sun, 28 Nov 2021 20:43:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211125144834.52457-1-tony@atomide.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 25.11.2021 16.48, Tony Lindgren wrote:
> Commit e428e250fde6 ("ARM: dts: Configure system timers for omap3")
> caused a timer regression for beagleboard revision c where the system
> clockevent stops working if omap3isp module is unloaded.
> 
> Turns out we still have beagleboard revisions a-b4 capacitor c70 quirks
> applied that limit the usable timers for no good reason. This also affects
> the power management as we use the system clock instead of the 32k clock
> source.
> 
> Let's fix the issue by adding a new omap3-beagle-ab4.dts for the old timer
> quirks. This allows us to remove the timer quirks for later beagleboard
> revisions. We also need to update the related timer quirk check for the
> correct compatible property.
> 
> Fixes: e428e250fde6 ("ARM: dts: Configure system timers for omap3")
> Cc: linux-kernel@vger.kernel.org
> Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Rob Herring <robh+dt@kernel.org>
> Reported-by: Jarkko Nikula <jarkko.nikula@bitmer.com>
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
>  .../devicetree/bindings/arm/omap/omap.txt     |  3 ++
>  arch/arm/boot/dts/Makefile                    |  1 +
>  arch/arm/boot/dts/omap3-beagle-ab4.dts        | 47 +++++++++++++++++++
>  arch/arm/boot/dts/omap3-beagle.dts            | 33 -------------
>  drivers/clocksource/timer-ti-dm-systimer.c    |  2 +-
>  5 files changed, 52 insertions(+), 34 deletions(-)
>  create mode 100644 arch/arm/boot/dts/omap3-beagle-ab4.dts
> 
I trust Tony got this working since I lent the board for him to look at
this regression since our earlier remote attempts didn't find a working fix.

Jarkko

