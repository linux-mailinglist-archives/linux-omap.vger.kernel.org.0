Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 76A5D563F51
	for <lists+linux-omap@lfdr.de>; Sat,  2 Jul 2022 11:48:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231938AbiGBJsg (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 2 Jul 2022 05:48:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbiGBJsg (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 2 Jul 2022 05:48:36 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A96F513CD1
        for <linux-omap@vger.kernel.org>; Sat,  2 Jul 2022 02:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=QX1rXAVjRgfgXt+cFBaA06Jth2xFBoDDIr0VX3IjoQI=; b=hy+f2TwXTPkItv0VK4btuSFY58
        ORD1e6D6X22oSQU7LeqUFGf4AtKSUIQaz6SqfXpYnvzNImg/Xu80/eJnQkjSkD51rZeglnB5YJV4q
        6tOheB37+ZGV0VbmRyLIVlkfDEsT7hyZ/UuiYN0T5xBliGC4LoiRyWb3vgjr3vlZvin81QnE/wp5z
        1hiZejPlGpiXBJTvk7SEfo3lmqGnBk69+XtAWqAE/79dIvgio36IqLx3/rdl6dXZ7xIbLA4pYC+Po
        699x1QDjWJxOCpQRyIhwzo/8eChR7xZ3yx5xciRzeXtuZtdffE4SJyUstIuoDY1f9EzZnMn5KqqeT
        9FkzXMkA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1o7ZjB-008wuB-7R; Sat, 02 Jul 2022 09:47:49 +0000
Date:   Sat, 2 Jul 2022 02:47:49 -0700
From:   Christoph Hellwig <hch@infradead.org>
To:     Arnd Bergmann <arnd@kernel.org>
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
Subject: Re: Scheduling (unused) board file removal for linux-6.x
Message-ID: <YsAURTbSPBXtW+4Q@infradead.org>
References: <CAK8P3a0Z9vGEQbVRBo84bSyPFM-LF+hs5w8ZA51g2Z+NsdtDQA@mail.gmail.com>
 <CACRpkdY2_ZbmcSuuMB9t5bB-tGE0iAc-nE26JwxidRFocRahSw@mail.gmail.com>
 <CAK8P3a2yh1Uh9+YP42ekt3LB9oTfEg0WMB5FVqwp40qHb6vWFg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a2yh1Uh9+YP42ekt3LB9oTfEg0WMB5FVqwp40qHb6vWFg@mail.gmail.com>
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

On Fri, Jul 01, 2022 at 12:53:46PM +0200, Arnd Bergmann wrote:
> footbridge is probably the easiest out of the lot. I can resend
> my patch to remove ebsa285 add-in mode, and I also have
> some patches for cleaning up the ISA DMA.

Given that no one could be bothered to test the DMA mapping patches
on footbridge so far I wonder if it isn't actually dead yet..
