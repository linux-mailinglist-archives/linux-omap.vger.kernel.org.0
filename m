Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B6BCD1505A8
	for <lists+linux-omap@lfdr.de>; Mon,  3 Feb 2020 12:53:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727170AbgBCLxA (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 3 Feb 2020 06:53:00 -0500
Received: from mail.kernel.org ([198.145.29.99]:45718 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726100AbgBCLw7 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 3 Feb 2020 06:52:59 -0500
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8B0DE217BA;
        Mon,  3 Feb 2020 11:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1580730778;
        bh=7xf6l0x9f3yqiOhlxlprQWM2OQY9DYvJlDJWXMnII54=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=QAAyKp0DMnE4/Ke93ayIXNd2pfxyBG9VkCoj8wEGNaGM/6XTQdWI1P194C5TNIw6h
         m5Wu+ATH6+LztErcvWKxz2sep2OFwsgKGWHxZAE3wqMr3bSNwm8ZVYc7FsB4J1FZJx
         GFNHkcd4WglHAIf2oN4mWPlfR9HRwokyWSF3soKc=
Received: by mail-lj1-f181.google.com with SMTP id x7so14330773ljc.1;
        Mon, 03 Feb 2020 03:52:58 -0800 (PST)
X-Gm-Message-State: APjAAAUtZXlQFHfVa4+wjO4rgTDxrHqoYNOL4ziHF+0QpBiwOr9Dwtgm
        s4UF6CwfXqJaH7TzjXYV7RqmkLsyOVFkN/ozF90=
X-Google-Smtp-Source: APXvYqzr5wd/VbPIliYCYFMvvcM1qcze60h66l8h6hCiB4vZZDzfTGLOeSa9EfTbYebXVLxdN/na3R/Ef6tYAfxaBEQ=
X-Received: by 2002:a2e:9a11:: with SMTP id o17mr13176749lji.256.1580730776602;
 Mon, 03 Feb 2020 03:52:56 -0800 (PST)
MIME-Version: 1.0
References: <20200130195525.4525-1-krzk@kernel.org> <20200130195525.4525-2-krzk@kernel.org>
 <9f8a0a8e09893e7087d2212fb0eeb94a908b7be1.camel@perches.com>
In-Reply-To: <9f8a0a8e09893e7087d2212fb0eeb94a908b7be1.camel@perches.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Mon, 3 Feb 2020 12:52:45 +0100
X-Gmail-Original-Message-ID: <CAJKOXPf5Mf4FCmtME5yJsBZeP8BkYJgcxkKzS2hd-gp-mq3nag@mail.gmail.com>
Message-ID: <CAJKOXPf5Mf4FCmtME5yJsBZeP8BkYJgcxkKzS2hd-gp-mq3nag@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: configs: Cleanup old Kconfig options
To:     Joe Perches <joe@perches.com>
Cc:     Russell King <linux@armlinux.org.uk>,
        Alexander Shiyan <shc_work@mail.ru>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Tony Lindgren <tony@atomide.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Avi Fishman <avifishman70@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Tali Perry <tali.perry1@gmail.com>,
        Patrick Venture <venture@google.com>,
        Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-omap@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com, openbmc@lists.ozlabs.org,
        arm@kernel.org, soc@kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, 30 Jan 2020 at 23:06, Joe Perches <joe@perches.com> wrote:
>
> On Thu, 2020-01-30 at 20:55 +0100, Krzysztof Kozlowski wrote:
> > CONFIG_MMC_BLOCK_BOUNCE is gone since commit c3dccb74be28 ("mmc: core:
> > Delete bounce buffer Kconfig option").
> >
> > CONFIG_LBDAF is gone since commit 72deb455b5ec ("block: remove
> > CONFIG_LBDAF").
> >
> > CONFIG_IOSCHED_DEADLINE and CONFIG_IOSCHED_CFQ are gone since
> > commit f382fb0bcef4 ("block: remove legacy IO schedulers").
> >
> > The IOSCHED_DEADLINE was replaced by MQ_IOSCHED_DEADLINE and it will be
> > now enabled by default (along with MQ_IOSCHED_KYBER).
> >
> > The IOSCHED_BFQ seems to replace IOSCHED_CFQ so select it in configs
> > previously choosing the latter.
> >
> > CONFIG_CROSS_COMPILE is gone since commit f1089c92da79 ("kbuild: remove
> > CONFIG_CROSS_COMPILE support").
>
> Hi Krzysztof.
>
> There seems there are a lot more of these unused CONFIG_<foo>
> symbols in various defconfigs. (just for arm and treewide below)
>
> ARM defconfigs:

Hi Joe,

Nice finding! The trickier point is to nicely remove them because:
1. The easiest is 'savedefconfig' but then some valuable options might
disappear (like recently happened with DEBUG_FS),
2. They could be removed in automated way with a script. However in
such case what about replacements? If some symbol was replaced with
other (or just renamed), maybe we should enable the other one to
restore the desired functionality?
3. Or maybe let's don't care about keeping defconfigs stable and just
clean them up automatically.

Best regards,
Krzysztof

> --------------------------------------------------------------------
>
> # find all defined config symbols in Kconfig files
>
> $ git grep -P -oh '^\s*(?:menu)?config\s+\w+' -- '*/Kconfig*' | \
>   sed -r -e 's/\s*config\s+//' -e 's/\s*menuconfig\s+//' | \
>   sort | uniq > config_symbols
>
> # find CONFIG_ symbols in arm defconfigs
>
> $ git grep -w -oh -P 'CONFIG_\w+' 'arch/arm*/*defconfig*' | \
>   sort | uniq > used_in_arm_defconfigs
>
> # find all the unused symbols
>
> $ cat used_in_arm_defconfigs | \
>   while read line ; do \
>     echo -n "$line " ; grep -w -c ${line/CONFIG_/} config_symbols ; \
>   done | \
>   grep " 0" | \
>   sed 's/ 0//'

(...)
