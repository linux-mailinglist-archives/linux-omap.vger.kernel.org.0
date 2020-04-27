Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 300251B97F0
	for <lists+linux-omap@lfdr.de>; Mon, 27 Apr 2020 09:01:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726434AbgD0HBl (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 27 Apr 2020 03:01:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726539AbgD0HBk (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 27 Apr 2020 03:01:40 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F53AC061A10
        for <linux-omap@vger.kernel.org>; Mon, 27 Apr 2020 00:01:40 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id e26so18274648wmk.5
        for <linux-omap@vger.kernel.org>; Mon, 27 Apr 2020 00:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=QHAofsn8uU1kUPQWRssw/x34P9GiDf/VQqxTjU3liBY=;
        b=lxLMOkd1PYJiuXNbiS1a+eCzpOKElS/bsErxIHkznDJH5u6pIkk1E4X+4LqtwndjII
         eoJLlW2AwA1kBCEIU3pV2UTMMuCaBxuc+S+HbWL2IdklsTXEAnj7C4qO8ZVM0oJ1KCgg
         FfegEAT6rE7Rfwb72o5vN86xnJ3cIDBFa1wHdTXWhuQCIegoWHpUUq2YUV47/BMxPanm
         JwpSOt97R3sGlHkgClQopDUIliobBXJngq9kCSOA54w3UIBmslSEFwbQ7TxB/Ozvz1Sd
         Qwc+YTg3rcJePhkpF0S/sfuQkwPn7Cdv9ypurEQNp2H8MFVw83/Tx23Diw4qA0mjzNBg
         /W+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=QHAofsn8uU1kUPQWRssw/x34P9GiDf/VQqxTjU3liBY=;
        b=OCf8kP5ybRwE91yW51apriILMZ32E1k2qHOfBosJPAp9h61RWGU5RrQt+Esl6qF6vk
         zaGCrmpJhaFVOOk+EC8CTrcrr9hBkuVuTkp31KiX4jhrHAr6zgZc7gFJmXVFSbbdBayE
         jLQjoEaa5AaHHXnY92na7nRlpZh4oDXYieBvr8kgBlCRicQeNJax2G73w5ZdFQS3wKq/
         n0IGXI6heObZ26Zrz2zowO7vjr5xQlhw/Nzu/1Hhum56XVG7sAbSOjTSV0HQNtWUh0LN
         KFyehaX600945OeAmLX+lgKrn1yzujlBf5V9CAncFRf2MIdu/kxY4ubVJiD4B2X2YfJw
         sigQ==
X-Gm-Message-State: AGi0PuaYjiguDOyS94KXte9ZEbtkTKk9AqNlq5J81APrpJv33oGAEjZc
        7pqnKjw9L8Tz9IJfAty+snkwSw==
X-Google-Smtp-Source: APiQypIxdT2HUhgGkoWPlHuZswORpnAHJK6SShlkzX3VJ6JLRM5EuzMolS4/U7skbaaoQTdl+dh97Q==
X-Received: by 2002:a7b:c0cb:: with SMTP id s11mr26429338wmh.180.1587970898665;
        Mon, 27 Apr 2020 00:01:38 -0700 (PDT)
Received: from [192.168.0.41] (lns-bzn-59-82-252-135-148.adsl.proxad.net. [82.252.135.148])
        by smtp.googlemail.com with ESMTPSA id k133sm15433186wma.0.2020.04.27.00.01.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2020 00:01:38 -0700 (PDT)
Subject: Re: [PATCH 00/14] Update omaps to use drivers/clocksource timers
To:     Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Adam Ford <aford173@gmail.com>,
        Andreas Kemnade <andreas@kemnade.info>,
        Keerthy <j-keerthy@ti.com>, Lokesh Vutla <lokeshvutla@ti.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Tero Kristo <t-kristo@ti.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200417165519.4979-1-tony@atomide.com>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <9cee6c42-781e-6897-abcc-a470732327a8@linaro.org>
Date:   Mon, 27 Apr 2020 09:01:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200417165519.4979-1-tony@atomide.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


Hi Tony,

On 17/04/2020 18:55, Tony Lindgren wrote:
> Hi all,
> 
> Here's a series of changes to udpate omaps to use drivers/clocksource
> timers for the 32k counter and dmtimer and to remove the old legacy
> platform code. Please review and test.
> 
> Daniel, if the the first two patches look OK after review, maybe you
> can again set up an immutable branch for the first two patches against
> v5.7-rc1 that I can merge in?

Ok let me review the patches.


> Tony Lindgren (14):
>   clocksource/drivers/timer-ti-32k: Add support for initializing
>     directly
>   clocksource/drivers/timer-ti-dm: Add clockevent and clocksource
>     support
>   clk: ti: dm816: enable sysclk6_ck on init
>   bus: ti-sysc: Ignore timer12 on secure omap3
>   ARM: OMAP2+: Add omap_init_time_of()
>   ARM: dts: Configure system timers for am335x
>   ARM: dts: Configure system timers for am437x
>   ARM: dts: Configure system timers for omap4
>   ARM: dts: Configure system timers for omap5 and dra7
>   ARM: dts: Configure system timers for omap3
>   ARM: dts: Configure system timers for ti81xx
>   ARM: dts: Configure system timers for omap2
>   ARM: OMAP2+: Drop old timer code for dmtimer and 32k counter
>   bus: ti-sysc: Timers no longer need legacy quirk handling
> 
>  .../devicetree/bindings/timer/ti,timer.txt    |   2 +
>  arch/arm/boot/dts/am33xx-l4.dtsi              |   2 -
>  arch/arm/boot/dts/am33xx.dtsi                 |  12 +
>  arch/arm/boot/dts/am3517.dtsi                 |  16 +-
>  arch/arm/boot/dts/am4372.dtsi                 |  12 +
>  arch/arm/boot/dts/am437x-l4.dtsi              |   3 -
>  arch/arm/boot/dts/dm814x.dtsi                 |  66 +-
>  arch/arm/boot/dts/dm816x.dtsi                 |  70 ++-
>  arch/arm/boot/dts/dra7-l4.dtsi                |   5 -
>  arch/arm/boot/dts/dra7.dtsi                   |   6 +
>  arch/arm/boot/dts/omap2.dtsi                  |  38 +-
>  arch/arm/boot/dts/omap2420.dtsi               |  65 +-
>  arch/arm/boot/dts/omap2430.dtsi               |  65 +-
>  arch/arm/boot/dts/omap3-beagle.dts            |  16 +
>  arch/arm/boot/dts/omap3-devkit8000.dts        |  16 +
>  arch/arm/boot/dts/omap3.dtsi                  | 130 +++-
>  arch/arm/boot/dts/omap4-l4.dtsi               |   2 -
>  arch/arm/boot/dts/omap4.dtsi                  |   6 +
>  arch/arm/boot/dts/omap5-l4.dtsi               |   2 -
>  arch/arm/boot/dts/omap5.dtsi                  |   6 +
>  arch/arm/mach-omap2/Makefile                  |   4 +-
>  arch/arm/mach-omap2/board-generic.c           |  32 +-
>  arch/arm/mach-omap2/common.h                  |   7 +
>  arch/arm/mach-omap2/omap_hwmod_2420_data.c    |  20 -
>  arch/arm/mach-omap2/omap_hwmod_2430_data.c    |  19 -
>  .../omap_hwmod_2xxx_interconnect_data.c       |   8 -
>  .../mach-omap2/omap_hwmod_2xxx_ipblock_data.c |  47 --
>  .../omap_hwmod_33xx_43xx_common_data.h        |   2 -
>  .../omap_hwmod_33xx_43xx_interconnect_data.c  |   8 -
>  .../omap_hwmod_33xx_43xx_ipblock_data.c       |  62 --
>  arch/arm/mach-omap2/omap_hwmod_33xx_data.c    |  10 -
>  arch/arm/mach-omap2/omap_hwmod_3xxx_data.c    | 146 +----
>  arch/arm/mach-omap2/omap_hwmod_43xx_data.c    |  45 --
>  arch/arm/mach-omap2/omap_hwmod_44xx_data.c    |  90 ---
>  arch/arm/mach-omap2/omap_hwmod_54xx_data.c    |  89 ---
>  arch/arm/mach-omap2/omap_hwmod_7xx_data.c     | 176 ------
>  arch/arm/mach-omap2/omap_hwmod_81xx_data.c    |  74 ---
>  arch/arm/mach-omap2/omap_hwmod_common_data.h  |   3 -
>  arch/arm/mach-omap2/timer.c                   | 568 +-----------------
>  drivers/bus/ti-sysc.c                         |  25 +-
>  drivers/clk/ti/clk-816x.c                     |   1 +
>  drivers/clocksource/Makefile                  |   1 +
>  drivers/clocksource/timer-ti-32k.c            |  48 +-
>  drivers/clocksource/timer-ti-dm-systimer.c    | 468 +++++++++++++++
>  include/clocksource/timer-ti-dm.h             |   1 +
>  45 files changed, 1016 insertions(+), 1478 deletions(-)
>  create mode 100644 drivers/clocksource/timer-ti-dm-systimer.c
> 


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
