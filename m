Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E24E156A01
	for <lists+linux-omap@lfdr.de>; Sun,  9 Feb 2020 12:52:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727681AbgBILv7 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 9 Feb 2020 06:51:59 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:37631 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726378AbgBILv6 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 9 Feb 2020 06:51:58 -0500
Received: by mail-lj1-f195.google.com with SMTP id v17so3973268ljg.4
        for <linux-omap@vger.kernel.org>; Sun, 09 Feb 2020 03:51:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=cYfE72YZyxByl4dR2QWGKhFqP7/CoINOriIGeXLOawg=;
        b=NptrmHtYTiL5YgJrYH1ti+K078fPaTfnbfGukV1wYirmvtVfyLHmk1Y4G+sPJKzhtO
         VgRFHCDnWWN+XuVsDUc/DNV0NsDAuA2QOU06s5e1+fW6D8mS1IQM1mZXo/5tOruAXnEz
         4MjqiZlt4kB0G3I7w9ipN+dGcniokuXyuNBVVhpbVKp4hPGH1jz37zk8Iba/rzzbc43S
         IUejSY2mrWWstTFatbHDPiv2stxA0cAwteuFIXbqAZFLIlyD+iRgkFrkzU9rs6XzYD42
         8VCyfkaKdOZCtqpix7QOOcXbC0dgvoPIxPEVz8rICA+iBFfrWxPSl/cJVJaN4lxXkrIm
         sAfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=cYfE72YZyxByl4dR2QWGKhFqP7/CoINOriIGeXLOawg=;
        b=pRUamlE2rJqLHTRNx0aFZS+fktoN6wtokQc4uqNwXSfYyydMWRnloeq9+YPxLBbuPP
         fjpuPJvhYo4Jfxm/Ei0yx/FoyXw9F2eusrEtuwzbGrtUHUofVnkehs2+N+6+HczF02jX
         PugHP2el/6dIo/jBoMFOR0J/IbabNnfXsIaWpEmABpdFuo1jXvuS3aIzUrS47ewZS3gI
         vaaN7oZJUvAD0rXa4qVG5W71HKnYnv8FbVOL5AnN7gkRIQN8dsgmknOWHKcDzzyKo0PX
         twVwQV2n05N/LHj+Woyau+jqHySXQzVLKseatwMhGytUhxzKYcONkJja7ZrXCi1KUm5P
         jgRQ==
X-Gm-Message-State: APjAAAXvyUD16XGloD9iW9OxeR6ckRdhu9nIcTkXk+HQZoaogFN/c+Bq
        4pdnwBijRfyZZYTBaEBiM+wCXA==
X-Google-Smtp-Source: APXvYqyBJcdgJJntrsixcqZPfIHwYwrfiSxVX8Hkh88iVLuNcb42dKupf9X+gL/jDnv0ncXLtXIzSg==
X-Received: by 2002:a2e:7e11:: with SMTP id z17mr4960192ljc.279.1581249116367;
        Sun, 09 Feb 2020 03:51:56 -0800 (PST)
Received: from localhost (h85-30-9-151.cust.a3fiber.se. [85.30.9.151])
        by smtp.gmail.com with ESMTPSA id 14sm3752313lfz.47.2020.02.09.03.51.54
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 09 Feb 2020 03:51:55 -0800 (PST)
Date:   Sun, 9 Feb 2020 03:44:22 -0800
From:   Olof Johansson <olof@lixom.net>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Joe Perches <joe@perches.com>,
        Russell King <linux@armlinux.org.uk>,
        Alexander Shiyan <shc_work@mail.ru>,
        Uwe Kleine-K??nig <u.kleine-koenig@pengutronix.de>,
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
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-omap@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com, openbmc@lists.ozlabs.org,
        arm@kernel.org, soc@kernel.org
Subject: Re: [PATCH 2/2] ARM: configs: Cleanup old Kconfig options
Message-ID: <20200209114422.as5xpytakhaa3vur@localhost>
References: <20200130195525.4525-1-krzk@kernel.org>
 <20200130195525.4525-2-krzk@kernel.org>
 <9f8a0a8e09893e7087d2212fb0eeb94a908b7be1.camel@perches.com>
 <CAJKOXPf5Mf4FCmtME5yJsBZeP8BkYJgcxkKzS2hd-gp-mq3nag@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJKOXPf5Mf4FCmtME5yJsBZeP8BkYJgcxkKzS2hd-gp-mq3nag@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, Feb 03, 2020 at 12:52:45PM +0100, Krzysztof Kozlowski wrote:
> On Thu, 30 Jan 2020 at 23:06, Joe Perches <joe@perches.com> wrote:
> >
> > On Thu, 2020-01-30 at 20:55 +0100, Krzysztof Kozlowski wrote:
> > > CONFIG_MMC_BLOCK_BOUNCE is gone since commit c3dccb74be28 ("mmc: core:
> > > Delete bounce buffer Kconfig option").
> > >
> > > CONFIG_LBDAF is gone since commit 72deb455b5ec ("block: remove
> > > CONFIG_LBDAF").
> > >
> > > CONFIG_IOSCHED_DEADLINE and CONFIG_IOSCHED_CFQ are gone since
> > > commit f382fb0bcef4 ("block: remove legacy IO schedulers").
> > >
> > > The IOSCHED_DEADLINE was replaced by MQ_IOSCHED_DEADLINE and it will be
> > > now enabled by default (along with MQ_IOSCHED_KYBER).
> > >
> > > The IOSCHED_BFQ seems to replace IOSCHED_CFQ so select it in configs
> > > previously choosing the latter.
> > >
> > > CONFIG_CROSS_COMPILE is gone since commit f1089c92da79 ("kbuild: remove
> > > CONFIG_CROSS_COMPILE support").
> >
> > Hi Krzysztof.
> >
> > There seems there are a lot more of these unused CONFIG_<foo>
> > symbols in various defconfigs. (just for arm and treewide below)
> >
> > ARM defconfigs:
> 
> Hi Joe,
> 
> Nice finding! The trickier point is to nicely remove them because:
> 1. The easiest is 'savedefconfig' but then some valuable options might
> disappear (like recently happened with DEBUG_FS),

Note that while they disappear from the defconfig, they were already not part
of the build. So kernels have been built without them for a while. It's a good
way to surface the problem, but it's pretty clear that trees fall in the forest
here all the time and nobody is noticing.

> 2. They could be removed in automated way with a script. However in
> such case what about replacements? If some symbol was replaced with
> other (or just renamed), maybe we should enable the other one to
> restore the desired functionality?
> 3. Or maybe let's don't care about keeping defconfigs stable and just
> clean them up automatically.

Churning defconfigs is just noise, and a source of annoying needless
conflicts when people do it at the same time. If an option is no longer
in-tree, it doesn't do any harm. But it makes sense to clean up every
now and then like the original patch here.


-Olof
