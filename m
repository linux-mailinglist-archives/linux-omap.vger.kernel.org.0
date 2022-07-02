Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 42B49563F60
	for <lists+linux-omap@lfdr.de>; Sat,  2 Jul 2022 12:06:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230155AbiGBKG0 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 2 Jul 2022 06:06:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbiGBKGZ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 2 Jul 2022 06:06:25 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2DA5186C1
        for <linux-omap@vger.kernel.org>; Sat,  2 Jul 2022 03:06:24 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 2811BCE0950
        for <linux-omap@vger.kernel.org>; Sat,  2 Jul 2022 10:06:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80DBAC341D2
        for <linux-omap@vger.kernel.org>; Sat,  2 Jul 2022 10:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1656756381;
        bh=Igcx8i6KHu0TwD+KMXnIwIMbpqkoQsLz4p3s6ngaoo0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=JcvhHMSot45icgfAlZFACS5rJuXsi2MK6cjGWupZFk0vU+Kbb+qE2YP/W0rXMop8t
         ZHrmv5S2Hl6FeMIXpxifUyEVAEPWu6E26bIH3jC/a84iBirToKvggWe5JSqdzNZGNw
         u48dfn6u+GnN0sF24teh48n6ajuLA5pfw3AOmP88agIREgVKkVn+d6paSNbOYipIFO
         UBwNQI2WRX5/uiIImVt5daFDRlMVRQDB8WnVxt8uPPZ3fjPIocSNA+6zV7Lo8R5W5t
         48/tB2f8tO3mysyoatc6pukXAo+kVq0Z8pndIYQ2w8r3bpBJmZzjpdmlHV20ErbLy+
         ayngTJKvXOK6g==
Received: by mail-yb1-f173.google.com with SMTP id d145so4880186ybh.1
        for <linux-omap@vger.kernel.org>; Sat, 02 Jul 2022 03:06:21 -0700 (PDT)
X-Gm-Message-State: AJIora+sD0VNRppsX6g5HitOApp+IPoph9f4F+4vyGLvjwOASW9OFS06
        6bAgB640hWWNW9o0el2W1gsQElFkM6z7xl5QHQc=
X-Google-Smtp-Source: AGRyM1udESJD95ep4t/1Be8HNSIEWUzgRL5OPpl12Wc1+sc37H7oMPULDAXAkNGotfE595o7nc5j+DTmpAr1Dpimm5U=
X-Received: by 2002:a25:760e:0:b0:66c:95eb:6c69 with SMTP id
 r14-20020a25760e000000b0066c95eb6c69mr20165941ybc.106.1656756380503; Sat, 02
 Jul 2022 03:06:20 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a0Z9vGEQbVRBo84bSyPFM-LF+hs5w8ZA51g2Z+NsdtDQA@mail.gmail.com>
 <CACRpkdY2_ZbmcSuuMB9t5bB-tGE0iAc-nE26JwxidRFocRahSw@mail.gmail.com>
 <CAK8P3a2yh1Uh9+YP42ekt3LB9oTfEg0WMB5FVqwp40qHb6vWFg@mail.gmail.com> <YsAURTbSPBXtW+4Q@infradead.org>
In-Reply-To: <YsAURTbSPBXtW+4Q@infradead.org>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Sat, 2 Jul 2022 12:06:02 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3ND-x7Hwwi=sEFX5qJ5X-Q3dfMXuBw0NY8=gBfxRvuUg@mail.gmail.com>
Message-ID: <CAK8P3a3ND-x7Hwwi=sEFX5qJ5X-Q3dfMXuBw0NY8=gBfxRvuUg@mail.gmail.com>
Subject: Re: Scheduling (unused) board file removal for linux-6.x
To:     Christoph Hellwig <hch@infradead.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Matija Glavinic Pecotic <matija.glavinic-pecotic.ext@nokia.com>,
        Aswath Govindraju <a-govindraju@ti.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Russell King <rmk+kernel@armlinux.org.uk>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Krzysztof Halasa <khalasa@piap.pl>,
        Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Marek Vasut <marek.vasut@gmail.com>,
        Lubomir Rintel <lkundrak@v3.sk>,
        Alexander Sverdlin <alexander.sverdlin@gmail.com>,
        Hartley Sweeten <hsweeten@visionengravers.com>,
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
X-Spam-Status: No, score=-7.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Sat, Jul 2, 2022 at 11:47 AM Christoph Hellwig <hch@infradead.org> wrote:
>
> On Fri, Jul 01, 2022 at 12:53:46PM +0200, Arnd Bergmann wrote:
> > footbridge is probably the easiest out of the lot. I can resend
> > my patch to remove ebsa285 add-in mode, and I also have
> > some patches for cleaning up the ISA DMA.
>
> Given that no one could be bothered to test the DMA mapping patches
> on footbridge so far I wonder if it isn't actually dead yet..

IIRC Marc Zyngier tested your patches successfully on the NetWinder, which
is a footbridge machine. It's Russell's SA1100/Assabet that has not been
tested.

        Arnd
