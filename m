Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B4C31B851B
	for <lists+linux-omap@lfdr.de>; Sat, 25 Apr 2020 11:14:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726022AbgDYJOt (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 25 Apr 2020 05:14:49 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:59892 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725837AbgDYJOt (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 25 Apr 2020 05:14:49 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03P9ECl1024003;
        Sat, 25 Apr 2020 04:14:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1587806052;
        bh=GDlV6eUy6bns317G5z2VpGWhOK+hYb7W4GH1t1p8iwA=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=v5zsAajQDAgpnV36Utm1muwekgrNyI0GbCWU/wNLZApqVXJHrak3QyJ6sHM4lT1MT
         /Fkw82qOgWwxXBsgFu9N7naye+vPoX1+rlw25LOj0BDFl5geWMASAJY8MKF/Rn6a3I
         6gAy6l6idYdp5NzI276sQQf2MauU/GaoN1bBv3rI=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03P9ECwq087678;
        Sat, 25 Apr 2020 04:14:12 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Sat, 25
 Apr 2020 04:14:11 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Sat, 25 Apr 2020 04:14:11 -0500
Received: from [10.24.69.20] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03P9E3AI128512;
        Sat, 25 Apr 2020 04:14:07 -0500
Subject: Re: [PATCH] clocksource: timer-ti-dm: Drop bogus
 omap_dm_timer_of_set_source()
To:     Suman Anna <s-anna@ti.com>, Tony Lindgren <tony@atomide.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>
CC:     <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Tero Kristo <t-kristo@ti.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        "H . Nikolaus Schaller" <hns@goldelico.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Keerthy <j-keerthy@ti.com>,
        Ladislav Michl <ladis@linux-mips.org>,
        Pavel Machek <pavel@ucw.cz>, Sebastian Reichel <sre@kernel.org>
References: <20200213053504.22638-1-s-anna@ti.com>
From:   Lokesh Vutla <lokeshvutla@ti.com>
Message-ID: <7debff4f-8f64-ee7c-2fdd-879649e35eb0@ti.com>
Date:   Sat, 25 Apr 2020 14:44:03 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20200213053504.22638-1-s-anna@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tony, Suman,

On 13/02/20 11:05 AM, Suman Anna wrote:
> The function omap_dm_timer_of_set_source() was originally added in
> commit 31a7448f4fa8a ("ARM: OMAP: dmtimer: Add clock source from DT"),
> and is designed to set a clock source from DT using the clocks property
> of a timer node. This design choice is okay for clk provider nodes but
> otherwise is a bad design as typically the clocks property is used to
> specify the functional clocks for a device, and not its parents.
> 
> The timer nodes now all define a timer functional clock after the
> conversion to ti-sysc and the new clkctrl layout, and this results
> in an attempt to set the same functional clock as its parent when a
> consumer driver attempts to acquire any of these timers in the
> omap_dm_timer_prepare() function. This was masked and worked around
> in commit 983a5a43ec25 ("clocksource: timer-ti-dm: Fix pwm dmtimer
> usage of fck reparenting"). Fix all of this by simply dropping the
> entire function.
> 
> Any DT configuration of clock sources should be achieved using
> assigned-clocks and assigned-clock-parents properties provided
> by the Common Clock Framework.
> 
> Cc: Tony Lindgren <tony@atomide.com>
> Cc: Tero Kristo <t-kristo@ti.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: H. Nikolaus Schaller <hns@goldelico.com>
> Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Cc: Keerthy <j-keerthy@ti.com>
> Cc: Ladislav Michl <ladis@linux-mips.org>
> Cc: Pavel Machek <pavel@ucw.cz>
> Cc: Sebastian Reichel <sre@kernel.org>
> Signed-off-by: Suman Anna <s-anna@ti.com>
> ---
> Hi Tony,
> 
> Do you have the history of why the 32 KHz source is set as parent during
> prepare? One of the current side-affects of this patch is that now instead
> of bailing out, the 32 KHz source is set, and consumers will still need
> to select their appropriate parent. Dropping that call should actually
> allow us to select the parents in the consumer nodes in dts files using
> the assigned-clocks and assigned-clock-parents properties. I prefer to
> drop it if you do not foresee any issues. For now, I do not anticipate
> any issues with omap-pwm-dmtimer with this patch.
> 

Sorry to bring up an old thread. But ping on this question by Suman. prepare()
is over writing any parent set by DT to 32KHz. Is it possible to know why
prepare is doing it? If there is no proper reason can we drop this setting all
together?

Thanks and regards,
Lokesh
