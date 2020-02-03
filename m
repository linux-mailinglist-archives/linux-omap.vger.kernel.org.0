Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E8AA15061E
	for <lists+linux-omap@lfdr.de>; Mon,  3 Feb 2020 13:25:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727339AbgBCMZr (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 3 Feb 2020 07:25:47 -0500
Received: from mout.kundenserver.de ([217.72.192.75]:56091 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727074AbgBCMZr (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 3 Feb 2020 07:25:47 -0500
Received: from mail-qk1-f170.google.com ([209.85.222.170]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1N7yuz-1jdEvy0FiF-0150X2; Mon, 03 Feb 2020 13:25:45 +0100
Received: by mail-qk1-f170.google.com with SMTP id u19so6277011qku.8;
        Mon, 03 Feb 2020 04:25:44 -0800 (PST)
X-Gm-Message-State: APjAAAVsig5ayJqpiKY25ChbkwKG8B2i4S8N2jQsFADPbXJ25qZZzHaR
        qsMyO9bGFEhTUo73T6fu0YHDFqXxy7aA0wWLF+A=
X-Google-Smtp-Source: APXvYqx0ocLgdidrznoQ8Enyx2eLL3hOdlL2MjBSkguYuLYfdkmdQylLrutBTZG2BNKne5lK1uCb3UnyrUHgc1yB+DQ=
X-Received: by 2002:a05:620a:909:: with SMTP id v9mr10712027qkv.138.1580732743857;
 Mon, 03 Feb 2020 04:25:43 -0800 (PST)
MIME-Version: 1.0
References: <20200130195525.4525-1-krzk@kernel.org> <20200130195525.4525-2-krzk@kernel.org>
 <9f8a0a8e09893e7087d2212fb0eeb94a908b7be1.camel@perches.com> <CAJKOXPf5Mf4FCmtME5yJsBZeP8BkYJgcxkKzS2hd-gp-mq3nag@mail.gmail.com>
In-Reply-To: <CAJKOXPf5Mf4FCmtME5yJsBZeP8BkYJgcxkKzS2hd-gp-mq3nag@mail.gmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Mon, 3 Feb 2020 13:25:27 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3VxqKuPyoparMZQYNNic6K2QsuzHE2mHskBt56cjny=g@mail.gmail.com>
Message-ID: <CAK8P3a3VxqKuPyoparMZQYNNic6K2QsuzHE2mHskBt56cjny=g@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: configs: Cleanup old Kconfig options
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Joe Perches <joe@perches.com>,
        Russell King <linux@armlinux.org.uk>,
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
        Olof Johansson <olof@lixom.net>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        linux-stm32@st-md-mailman.stormreply.com,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:Z/o9hl+VbVFCd3JbFMrSX5q5pl1EGoe4TUEC+JYUrP0wfQufBCt
 x/tSoiBEU2+RFgpd5DRkEdhSBsimgXbMosZEhQwG00/NdJbNrh11Sbm/DeULFKlaCeVyeB5
 jcHDjtZgpX05iLKDnf4MAuciJQN3pjxGpydNJk2z7UPVXVle2k17FStyt0rJCs3NOo469iv
 ghOOcuDImLbuTdPVxsRQg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:LTIDGvjRHmQ=:+Cq4IdjiThj/pyKdrz+aZ5
 NEPm6iOhe4dr/KngwTqUhDIgfOi1FdeUuxDeiR/8cIt3yVDDN6B3WACw4uqsMlUgY4c77b3iu
 gElD4y/8VkSsdXCM/pYed4MgPGHq5eCCyE5uK20EYRzL04ssTZskfnT2VrWa76ie0ynDCn8c8
 eeXPuY7MmtuKm4jY+KkX5kgvjMgBK8OtzZ2RLYgjZqPOOHcuXriVmkdvoCJZdZAq+MaofmJGy
 k+A0bj7Si1cTiru9eupfeADcU8FAI3LuVdHgeVC/ZQbVMrjhlXcGb8NyXnmGlbT9BeRiOXG3Z
 aiM+PlQQPqRp84D2hH62/SETV3NBmRrh7P21KIvYWxOA9eoMTT22Lyrftu78euEHg/oioRQYR
 PTOSBbXaaANOxfY89g3Sdpq6XHZJTqZWkrW6YeuH3Fd0kPmlH6vANXiOqZ/mWMO0MfHLKgIuR
 FAlEfkGEDe7FiZGyhTJbpPvlFQ10XsS4ulDUQGqH/sIBsxqPQgqShvHbQOr9q88dvyR76O7kn
 TsECwZ0M3dPWp34ZoIqMO0ZWnfMRa8E+2/k2O+iekVYOXFj1VYo/0MsMTjuvcKByqne5hwbaZ
 QFWGYFgehhGWiVd/4Ozl5hhrX5XKEe7+KLRBN/rlsOg7KoGMK/BiAVego8K3dcRFgeg0E3PL5
 WU5tWfKPlXFZ6/TUN+hLOZbVTl0xSlZle/9aGGcifhHP66TeWwWoNCwY5YyGEPzadfaGNYHua
 VmBedHg+ed2vKsUWz3amSLXqXPRYoq3PPw639aVAh6HXoVxoztZiTC/qREn3BLIicS5Gc76Zl
 0RPWL2QF/raRe/ihJd7aLmKj/oJwKYEj8qNK6mnlBo1PwXiYpM=
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, Feb 3, 2020 at 12:53 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
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

Acked-by: Arnd Bergmann <arnd@arndb.de>

> > Hi Krzysztof.
> >
> > There seems there are a lot more of these unused CONFIG_<foo>
> > symbols in various defconfigs. (just for arm and treewide below)

Feel free to pick any of these symbols and send patches for those.
No need to do it one symbol at a time, but please group them like
Krzysztof has done.

> Nice finding! The trickier point is to nicely remove them because:
> 1. The easiest is 'savedefconfig' but then some valuable options might
> disappear (like recently happened with DEBUG_FS),
> 2. They could be removed in automated way with a script. However in
> such case what about replacements? If some symbol was replaced with
> other (or just renamed), maybe we should enable the other one to
> restore the desired functionality?
> 3. Or maybe let's don't care about keeping defconfigs stable and just
> clean them up automatically.

I don't see a good way to do it automatically. It would be good to check
that we don't remove Kconfig symbols that are still used in defconfig
files without changing those files as well. Cleaning up afterwards also
works, but this always requires manual inspection for each symbol.

     Arnd
