Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 603D7169D4B
	for <lists+linux-omap@lfdr.de>; Mon, 24 Feb 2020 06:03:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725895AbgBXFDN (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 24 Feb 2020 00:03:13 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:44100 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725535AbgBXFDM (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 24 Feb 2020 00:03:12 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01O52XSZ041807;
        Sun, 23 Feb 2020 23:02:33 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1582520553;
        bh=xCQiqyco8FjikJzeNK9YjdUZlBW8NrFqs3TYqY6Z+qo=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=EC672arnkn2ROdFSdIJjgyB91xBsSJouqUB1oY0d1lodk606FQEOdygQN2uo94BPj
         Y8X9yS+rYcBH0LIfToT98GpEHTRtUOTbdRmjUnEF3d5JniZq+WoTaowhlQq8DN2DN0
         qw8Pk9Sh9kxBtsixQROUSX6+xiIiQLEhnSNdjoiw=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01O52XvJ089117;
        Sun, 23 Feb 2020 23:02:33 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Sun, 23
 Feb 2020 23:02:32 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Sun, 23 Feb 2020 23:02:32 -0600
Received: from [10.24.69.20] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01O52Sb1128124;
        Sun, 23 Feb 2020 23:02:29 -0600
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
Message-ID: <26208b83-32fa-a855-ddbb-715cd7bf8dde@ti.com>
Date:   Mon, 24 Feb 2020 10:31:39 +0530
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

Without this patch, pwm is not being generated at all on my BBB. After applying
this patch I am able to see pwm being generated on the scope.

FWIW:
Tested-by: Lokesh Vutla <lokeshvutla@ti.com>

Thanks and regards,
Lokesh
