Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D643564585
	for <lists+linux-omap@lfdr.de>; Sun,  3 Jul 2022 09:16:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231169AbiGCHNr (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 3 Jul 2022 03:13:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230309AbiGCHNp (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 3 Jul 2022 03:13:45 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6012964EB
        for <linux-omap@vger.kernel.org>; Sun,  3 Jul 2022 00:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=yXCSYKK6KzDxtzc87rcXqvLcfQ/LgGbX6w/drGhFUn4=; b=wCOlr1gl9p6Xnw4BVSaUWBPWuU
        f14CIOugYOpcL1lDZOWxc/IcQqq+2U5DZ8JITollhfUTQVNtgP54J4zm2tvpTufxAmAQr5f3A5WT6
        0qWFVRzkiN+VebStivHZCf8aOfmdM3oni4NYwykvZbzIzazOZVzSEEl0XaeOY305czDJ4SZtC+WLL
        aLcYKc5aV+jw/TWIehxD1UQP/a+2RS9L+azoiP59HEI8O72LD3K6ag1i2tJ55M+2r6yV/oXEDgOAY
        1Sxyy3dQp1Vz2NS/cX0NY3kHskB0fjE1n3CPsVsn/ct24tSIhR4WN3nGjdDVNbdMWHCACpKkLsKlS
        XvYqYgFw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1o7tn6-00EDny-BE; Sun, 03 Jul 2022 07:13:12 +0000
Date:   Sun, 3 Jul 2022 00:13:12 -0700
From:   Christoph Hellwig <hch@infradead.org>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Christoph Hellwig <hch@infradead.org>,
        Linus Walleij <linus.walleij@linaro.org>,
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
Subject: Re: Scheduling (unused) board file removal for linux-6.x
Message-ID: <YsFBiHzrJmENBsTQ@infradead.org>
References: <CAK8P3a0Z9vGEQbVRBo84bSyPFM-LF+hs5w8ZA51g2Z+NsdtDQA@mail.gmail.com>
 <CACRpkdY2_ZbmcSuuMB9t5bB-tGE0iAc-nE26JwxidRFocRahSw@mail.gmail.com>
 <CAK8P3a2yh1Uh9+YP42ekt3LB9oTfEg0WMB5FVqwp40qHb6vWFg@mail.gmail.com>
 <YsAURTbSPBXtW+4Q@infradead.org>
 <CAK8P3a3ND-x7Hwwi=sEFX5qJ5X-Q3dfMXuBw0NY8=gBfxRvuUg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a3ND-x7Hwwi=sEFX5qJ5X-Q3dfMXuBw0NY8=gBfxRvuUg@mail.gmail.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Sat, Jul 02, 2022 at 12:06:02PM +0200, Arnd Bergmann wrote:
> > On Fri, Jul 01, 2022 at 12:53:46PM +0200, Arnd Bergmann wrote:
> > > footbridge is probably the easiest out of the lot. I can resend
> > > my patch to remove ebsa285 add-in mode, and I also have
> > > some patches for cleaning up the ISA DMA.
> >
> > Given that no one could be bothered to test the DMA mapping patches
> > on footbridge so far I wonder if it isn't actually dead yet..
> 
> IIRC Marc Zyngier tested your patches successfully on the NetWinder, which
> is a footbridge machine. It's Russell's SA1100/Assabet that has not been
> tested.

Now that I look back that seems to be the case. In that case the same
applies to assabet :)
