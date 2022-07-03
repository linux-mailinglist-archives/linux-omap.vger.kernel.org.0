Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E921F564889
	for <lists+linux-omap@lfdr.de>; Sun,  3 Jul 2022 18:12:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232280AbiGCQL5 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 3 Jul 2022 12:11:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231873AbiGCQL4 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 3 Jul 2022 12:11:56 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BABF60F0
        for <linux-omap@vger.kernel.org>; Sun,  3 Jul 2022 09:11:55 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2446F61019
        for <linux-omap@vger.kernel.org>; Sun,  3 Jul 2022 16:11:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A3A3C341C6
        for <linux-omap@vger.kernel.org>; Sun,  3 Jul 2022 16:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1656864714;
        bh=ndEB3gx3UOHJQ54Vt7+w5DDEvNVbFyWNVpJNQHEAFfo=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=nkcU0qxqEQKT/TZ5l9VrXcm8/r/6juTwUjhT/+k1366iyT8R+pE0jSjUMJcCBRoi4
         biwgejZPHg5Q90XWFQif/bUpTdhUZpswU0+tEWe5jWfgH5hePVith00rmaA4JhJiUj
         1tjiOiJxHwlkk1hdeqy6SHaF053OkMhw+l31iMqhYUjqv3nygC0JImHC8xyp5uHAaN
         0kPRGsPKyEzfIf+2elnhq9ttzVm60/lSIfhYzMEsXGEKMdA1lPpBfxc1VaDkYYuOO4
         31DcLJQz+HKA8tk/LFEt/8BJGDM8/CamA0ulGLQ43JCLe2ILwuc9RBtGYCnSAnhKEp
         fb1Fi0ZPLPzGg==
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-31c8340a6f7so21555927b3.4
        for <linux-omap@vger.kernel.org>; Sun, 03 Jul 2022 09:11:54 -0700 (PDT)
X-Gm-Message-State: AJIora8AwYKUACji1H8XMe0nSFHvTjktZnoYhBKRebtUT0EvOAQTCalO
        Jj38ZCHG+/0polFShTtmG5OhC8zcJAFU9WQdCHA=
X-Google-Smtp-Source: AGRyM1tHNO5tbrXdW9XCHMhqXVdBCQco77uZMBLmxCZpZJSN6B4JiZwJFa3FjuXmOHNoCp7lxJIWkAWrwsBlnMOwIdw=
X-Received: by 2002:a81:9b02:0:b0:31c:9ae4:99ec with SMTP id
 s2-20020a819b02000000b0031c9ae499ecmr274356ywg.495.1656864713563; Sun, 03 Jul
 2022 09:11:53 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a0Z9vGEQbVRBo84bSyPFM-LF+hs5w8ZA51g2Z+NsdtDQA@mail.gmail.com>
 <0010bbe738eb6853f49f07a6eb6043e0e7f426a8.camel@gmail.com>
 <CAK8P3a0QDgKfHxri0YOj_4nJdGOD9ALRdCseb2EmJ36S7FrBaQ@mail.gmail.com> <ba286beeecaa0f11fce3d90ac4904ca7df310c22.camel@gmail.com>
In-Reply-To: <ba286beeecaa0f11fce3d90ac4904ca7df310c22.camel@gmail.com>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Sun, 3 Jul 2022 18:11:36 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1ZhFiPPR=tkLgsMB8pFjFoqiuD9GacTWBn0KM4nNynNQ@mail.gmail.com>
Message-ID: <CAK8P3a1ZhFiPPR=tkLgsMB8pFjFoqiuD9GacTWBn0KM4nNynNQ@mail.gmail.com>
Subject: Re: Scheduling (unused) board file removal for linux-6.x
To:     Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc:     Nikita Shubin <nikita.shubin@maquefel.me>,
        Lukasz Majewski <lukma@denx.de>,
        H Hartley Sweeten <hsweeten@visionengravers.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Russell King <rmk+kernel@armlinux.org.uk>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Krzysztof Halasa <khalasa@piap.pl>,
        Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Marek Vasut <marek.vasut@gmail.com>,
        Lubomir Rintel <lkundrak@v3.sk>,
        linux-omap <linux-omap@vger.kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Sekhar Nori <nsekhar@ti.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andrew Lunn <andrew@lunn.ch>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Gregory CLEMENT <gregory.clement@bootlin.com>,
        Lennert Buytenhek <kernel@wantstofly.org>,
        Marc Zyngier <maz@kernel.org>,
        Mauri Sandberg <maukka@ext.kapsi.fi>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Sun, Jul 3, 2022 at 1:24 PM Alexander Sverdlin
<alexander.sverdlin@gmail.com> wrote:
> Hello Nikita, Lukasz, Hartley,
> On Thu, 2022-06-30 at 09:42 +0200, Arnd Bergmann wrote:
> > > > ep93xx
> > > >
> > > > These are still used, and the platform includes the only remaining two
> > > > board files that were added after linux-3.0. DT support is probably
> > > > doable now that common-clk works. Need information about which boards
> > > > are important.
> > >
> > > I'm still maintaining/able to test CONFIG_MACH_EDB93XX (edb93xx.c).
> >
> > Noted, thanks! We'll leave them in for 2023 then.
> >
> > Any thoughts on long-term uses for the platform? Do you know of users
> > of any products other than the reference boards that would justify doing
> > a DT conversion, or do we just delete the platform another time?
>
> what are your projections for EP93xx support?
>
> I'm personally a bit pessimistic about DT conversion because existing partition
> tables were already challenged by the kernel growth. It has at least grown
> +60% with the same config since 2006. This makes me think that 2023 EOL for this
> SoC might be feasible.

I don't think converting the platform to DT will make the space
problem noticeably
worse, as the DT infrastructure is already enabled unconditionally since the
multiplatform enablement. There are probably a few more lines that need to be
added to parse DT properties in a couple of drivers, but removing the
board files
will save a bit as well.

There is little hope of stopping the general accumulation of code bloat through,
so any boards that are hitting a size limit are probably at the end of
their lives
regardless.

         Arnd
