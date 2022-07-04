Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB151565084
	for <lists+linux-omap@lfdr.de>; Mon,  4 Jul 2022 11:14:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233614AbiGDJOJ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 4 Jul 2022 05:14:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233602AbiGDJOI (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 4 Jul 2022 05:14:08 -0400
X-Greylist: delayed 365 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 04 Jul 2022 02:14:05 PDT
Received: from forward500o.mail.yandex.net (forward500o.mail.yandex.net [37.140.190.195])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C56F1559F
        for <linux-omap@vger.kernel.org>; Mon,  4 Jul 2022 02:14:05 -0700 (PDT)
Received: from myt6-3955a48a7d81.qloud-c.yandex.net (myt6-3955a48a7d81.qloud-c.yandex.net [IPv6:2a02:6b8:c12:1eae:0:640:3955:a48a])
        by forward500o.mail.yandex.net (Yandex) with ESMTP id 6CC8B941E30;
        Mon,  4 Jul 2022 12:07:56 +0300 (MSK)
Received: from myt6-efff10c3476a.qloud-c.yandex.net (myt6-efff10c3476a.qloud-c.yandex.net [2a02:6b8:c12:13a3:0:640:efff:10c3])
        by myt6-3955a48a7d81.qloud-c.yandex.net (mxback/Yandex) with ESMTP id WtpAH9XoiH-7rgSn5e0;
        Mon, 04 Jul 2022 12:07:56 +0300
X-Yandex-Fwd: 2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail; t=1656925676;
        bh=ylrYf8PpQpTbCgt5wlDXxvDehvWCSIYx9cl/kaQvPMM=;
        h=In-Reply-To:Subject:Cc:To:From:References:Date:Message-ID;
        b=Lwo65iQZDIiFLs9OaDlsAnqVarhvp8YUlej3NqKHsRwarmYlmG2jM5h4YsQAeLL/l
         TqTJuZHgOhtRVNHuu5eMaoHauHkwVEXuh5KcfDJyIHoBdY7grGP2LN9W1DzeSMPBuX
         x8jYTnTj3F+SJkeTyV0cTvF4baiprinF9zy7fiBE=
Authentication-Results: myt6-3955a48a7d81.qloud-c.yandex.net; dkim=pass header.i=@maquefel.me
Received: by myt6-efff10c3476a.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id ch8JReNEaj-7pNK2hKw;
        Mon, 04 Jul 2022 12:07:52 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
Date:   Mon, 4 Jul 2022 12:07:49 +0300
From:   Nikita Shubin <nikita.shubin@maquefel.me>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Alexander Sverdlin <alexander.sverdlin@gmail.com>,
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
Subject: Re: Scheduling (unused) board file removal for linux-6.x
Message-ID: <20220704120749.7a742c2c@redslave.neermore.group>
In-Reply-To: <CAK8P3a1ZhFiPPR=tkLgsMB8pFjFoqiuD9GacTWBn0KM4nNynNQ@mail.gmail.com>
References: <CAK8P3a0Z9vGEQbVRBo84bSyPFM-LF+hs5w8ZA51g2Z+NsdtDQA@mail.gmail.com>
        <0010bbe738eb6853f49f07a6eb6043e0e7f426a8.camel@gmail.com>
        <CAK8P3a0QDgKfHxri0YOj_4nJdGOD9ALRdCseb2EmJ36S7FrBaQ@mail.gmail.com>
        <ba286beeecaa0f11fce3d90ac4904ca7df310c22.camel@gmail.com>
        <CAK8P3a1ZhFiPPR=tkLgsMB8pFjFoqiuD9GacTWBn0KM4nNynNQ@mail.gmail.com>
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hello Arnd and Alexander!

On Sun, 3 Jul 2022 18:11:36 +0200
Arnd Bergmann <arnd@kernel.org> wrote:

> On Sun, Jul 3, 2022 at 1:24 PM Alexander Sverdlin
> <alexander.sverdlin@gmail.com> wrote:
> > Hello Nikita, Lukasz, Hartley,
> > On Thu, 2022-06-30 at 09:42 +0200, Arnd Bergmann wrote:  
> > > > > ep93xx
> > > > >
> > > > > These are still used, and the platform includes the only
> > > > > remaining two board files that were added after linux-3.0. DT
> > > > > support is probably doable now that common-clk works. Need
> > > > > information about which boards are important.  
> > > >
> > > > I'm still maintaining/able to test CONFIG_MACH_EDB93XX
> > > > (edb93xx.c).  
> > >
> > > Noted, thanks! We'll leave them in for 2023 then.
> > >
> > > Any thoughts on long-term uses for the platform? Do you know of
> > > users of any products other than the reference boards that would
> > > justify doing a DT conversion, or do we just delete the platform
> > > another time?  
> >
> > what are your projections for EP93xx support?
> >
> > I'm personally a bit pessimistic about DT conversion because
> > existing partition tables were already challenged by the kernel
> > growth. It has at least grown +60% with the same config since 2006.
> > This makes me think that 2023 EOL for this SoC might be feasible.  
> 
> I don't think converting the platform to DT will make the space
> problem noticeably
> worse, as the DT infrastructure is already enabled unconditionally
> since the multiplatform enablement. There are probably a few more
> lines that need to be added to parse DT properties in a couple of
> drivers, but removing the board files
> will save a bit as well.
> 
> There is little hope of stopping the general accumulation of code
> bloat through, so any boards that are hitting a size limit are
> probably at the end of their lives
> regardless.
> 
>          Arnd

On the bright side i have a working (bootable with UBIFS rootfs)
dt-based version of ts7250. Did almost a year ago, but unfortunately
got caught by RISC-V bustle, Sorry for github links:

Almost "clean" branch:
https://github.com/maquefel/linux/tree/ep93xx_dt_rework 

Dirty, last known good branch:
https://github.com/maquefel/linux/tree/gpio/devel-ep93xx-rework-v6

But all my users moved from ts7250 usage to other products, so i am
okay if it vanishes from main tree...

I have a dozen of ts7250, even with TS-DIO24, TS-SER4, CAN etc..., if
someone is interested in Device Tree version of ep93xx/ts7250, it's not
a problem for me to finalize the current work on the top of most recent
version, but i can test only on ts7250.

Yours,
Nikita Shubin.








