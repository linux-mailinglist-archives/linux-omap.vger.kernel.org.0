Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 344275613D6
	for <lists+linux-omap@lfdr.de>; Thu, 30 Jun 2022 09:58:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232516AbiF3H6R (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 30 Jun 2022 03:58:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229813AbiF3H6R (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 30 Jun 2022 03:58:17 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D236E12750
        for <linux-omap@vger.kernel.org>; Thu, 30 Jun 2022 00:58:15 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 224EB61B5D
        for <linux-omap@vger.kernel.org>; Thu, 30 Jun 2022 07:58:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8105FC341D1
        for <linux-omap@vger.kernel.org>; Thu, 30 Jun 2022 07:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1656575894;
        bh=Ps6Dcta2rW4mpLJqA+U5Dcb7HCD9i5hvIIhWrSmkeow=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=fiNaennfL591w/C4UpaXC1oFdWFhejw1muiIO8ROeEDpCaC8fSuGsH0FqANJHAnYz
         CwRPxxTVBnuaeMlDh66FICO2AXopKZKyKT7TOgF+3uDWmMtOMcS4MpTMMa1w4Qa8GL
         8p4f38ZX+g+aDji9knnag77elkWbMnKW2ePnbHSDQcYVDMs9A8krvTvIP/FLIvLemE
         /vjmcrXd9BVue1HTKBXL7PS8I2SMxsdjLxE3+Uw8MPSZ/dgCT2CvS3HPvbGBeXoamS
         RzGNWxR1qBXy5LJFnus83CO8IJJh9GKhibumwUrVKFRWwvHvptFVCRrx9M4E84nC1J
         llID1XLNAqa+Q==
Received: by mail-yb1-f178.google.com with SMTP id d5so32336333yba.5
        for <linux-omap@vger.kernel.org>; Thu, 30 Jun 2022 00:58:14 -0700 (PDT)
X-Gm-Message-State: AJIora80FwWihoUH78J4XTw8ZvJ09aywE/7UDijhvIUT3b7ZgN6P3aRJ
        c30x0cT5i65+Xh/rocs8Ad5j9ZOnnXHum9s7LbA=
X-Google-Smtp-Source: AGRyM1sFDX+qSnpHzw+YUX518USnDjL7vuIXpK+mApLLhThhrAqJHGvb6OgrlJDrV/8Sh8roSHsE9EWB21O1iz+G9QQ=
X-Received: by 2002:a25:d60d:0:b0:66c:c951:3eb1 with SMTP id
 n13-20020a25d60d000000b0066cc9513eb1mr8109405ybg.550.1656575893515; Thu, 30
 Jun 2022 00:58:13 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a0Z9vGEQbVRBo84bSyPFM-LF+hs5w8ZA51g2Z+NsdtDQA@mail.gmail.com>
 <CAL_JsqJof4gtkYoxbiVSCe147ADNpgasqEgnP5LR8+t8ZRgfyA@mail.gmail.com>
In-Reply-To: <CAL_JsqJof4gtkYoxbiVSCe147ADNpgasqEgnP5LR8+t8ZRgfyA@mail.gmail.com>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Thu, 30 Jun 2022 09:57:56 +0200
X-Gmail-Original-Message-ID: <CAK8P3a39ENT4-FsdqgCT5P1k7-CoBjgz2znGcqqPJoyVmViKAA@mail.gmail.com>
Message-ID: <CAK8P3a39ENT4-FsdqgCT5P1k7-CoBjgz2znGcqqPJoyVmViKAA@mail.gmail.com>
Subject: Re: Scheduling (unused) board file removal for linux-6.x
To:     Rob Herring <robh@kernel.org>
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
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

On Thu, Jun 30, 2022 at 12:53 AM Rob Herring <robh@kernel.org> wrote:
> On Wed, Jun 29, 2022 at 2:44 PM Arnd Bergmann <arnd@kernel.org> wrote:
> > pxa
> >
> > There are a ton of boards on this one, including seven with qemu support,
> > but based on IRC discussions, my feeling is that everyone who worked on
> > this has already lost interest a few years ago. There is rudimentary DT
> > support, so it may be helpful to pick one or two boards (gumstix?) with
> > good qemu support and keep them around for conversion to DT, while
> > removing all other boards.
>
> FWIW, u-boot is removing all PXA support.

I had a look at what boards are left in u-boot at the moment and found 41
board numbers for machines that can still boot (older) kernels using ATAG.
Almost all of them require DT in the mainline kernel already though, the
only two exceptions are:

* pxa270-colibri (getting removed from u-boot now), and
* davinci da850evm (kernel has both DT and a board file)

All other SoCs on my list already have no u-boot support at all.
For davinci, u-boot supports the same three boards as the kernel
using DT, on PXA the colibri has been the last one standing for a
while now.

       Arnd
