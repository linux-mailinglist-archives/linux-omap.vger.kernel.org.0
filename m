Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB947560CBC
	for <lists+linux-omap@lfdr.de>; Thu, 30 Jun 2022 00:55:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231393AbiF2Wyz (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 29 Jun 2022 18:54:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231396AbiF2Wyg (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 29 Jun 2022 18:54:36 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DFF532EF7
        for <linux-omap@vger.kernel.org>; Wed, 29 Jun 2022 15:54:02 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 21B9E61C12
        for <linux-omap@vger.kernel.org>; Wed, 29 Jun 2022 22:54:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7ED8AC341CD
        for <linux-omap@vger.kernel.org>; Wed, 29 Jun 2022 22:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1656543241;
        bh=Wnwei/zrN10bL9jU87VPdetb5jDz5QviZHRYYSxWlro=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=D3S8Y5vfCAfm4pxHRoCg1qvr6He0eRqi9QTFSTn2n9VVxTHP5GRJ1pbnO/Krg4Pil
         eiPmUwiqk7mTBSTmuLMKp5dtsnUPifaDY9LGTIktP1h3qLIWQcek0F4VVsNa2m51EM
         RUFGDzgSflOTI2bY7fpu3Pz4xss/TxWcddw+pHeY6Vdl9QmDLv8pDwrSBdLJhAnC0n
         eGB/nR7KxQJzYDAQUDI8ijOBV0gioh36GO0dAiwNbDKXvsDJeky1rQDbM5z1hMy25D
         Tc+q74ZK4gTS/bFz/mHN6Q6nkzTRbxbS+8qaeoUczW7fn1Wjw8e2twFgVeYfKo46w5
         Dh5Lb5/X2p/PA==
Received: by mail-vs1-f51.google.com with SMTP id t127so16587672vsb.8
        for <linux-omap@vger.kernel.org>; Wed, 29 Jun 2022 15:54:01 -0700 (PDT)
X-Gm-Message-State: AJIora81d+yoFR2kA4y205R+etVNU8fOZZP315ACQ56wz4xj86iEeTVr
        NU/oU+bqv+m467bi2h7z0IUs3mim7erKazTsVw==
X-Google-Smtp-Source: AGRyM1vp5NZEWhLcguNZL386Fp5Ci5AyO6aju7sQ3kWlxEQ2HMaR0k5N7yxSA58NmZoV9huC+t7MkyWvvVP7hWwVnzY=
X-Received: by 2002:a67:1787:0:b0:354:6490:437f with SMTP id
 129-20020a671787000000b003546490437fmr6957181vsx.26.1656543240448; Wed, 29
 Jun 2022 15:54:00 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a0Z9vGEQbVRBo84bSyPFM-LF+hs5w8ZA51g2Z+NsdtDQA@mail.gmail.com>
In-Reply-To: <CAK8P3a0Z9vGEQbVRBo84bSyPFM-LF+hs5w8ZA51g2Z+NsdtDQA@mail.gmail.com>
From:   Rob Herring <robh@kernel.org>
Date:   Wed, 29 Jun 2022 16:53:48 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJof4gtkYoxbiVSCe147ADNpgasqEgnP5LR8+t8ZRgfyA@mail.gmail.com>
Message-ID: <CAL_JsqJof4gtkYoxbiVSCe147ADNpgasqEgnP5LR8+t8ZRgfyA@mail.gmail.com>
Subject: Re: Scheduling (unused) board file removal for linux-6.x
To:     Arnd Bergmann <arnd@kernel.org>
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

On Wed, Jun 29, 2022 at 2:44 PM Arnd Bergmann <arnd@kernel.org> wrote:
>
> With the multiplatform work completed in the past merge window, and the
> scheduled deprecation of the Samsung s3c platforms, I decided to have a
> look at the remaining board files. There are 196 remaining boards, down
> from 489 boards ten years ago, but my estimate is that only few of those
> ever booted a linux-5.x kernel, and even less for future kernels. The
> question is how to find out which ones are still used, and which ones
> can go.
>
> I would propose that we start by changing the assumption that all boards
> might be used, instead assuming that they are all outdated unless someone
> says that they actually prefer to keep it in the kernel.  I have started
> a list of all 196 boards and annotated the ones that look like candidates
> for removal [1]. If a board you use is on that list, please either reply
> here or add a comment in the document.
>
> Unless someone has a better idea for how to proceed, I would allow
> six months for users to speak up and then remove the orphaned board
> files for the release following the LTS kernel. I can't list all boards
> individually, so here is a breakdown by platform:
>
> s3c24xx
>
> These are all scheduled for removal in early 2023 already, once the next
> longterm stable kernel is out. No changes here, but it seems useful
> to use the same timeline for removing unused board files of the other
> platforms together.
>
> s3c64xx
>
> There are ten board files, which are currently scheduled for removal in
> 2024, along with the DT based boards for this SoC. We can still decide
> to throw out some of the board files earlier though, while keeping the
> platform around.
>
> cns3xxx
>
> There is only one reference board here, the actual products that were
> previously supported, none of the board files from openwrt (now gone) made
> it in, and the DT support was never completed, so the entire platform can
> go away. We could also consider dropping the other arm11mpcore platforms
> (oxnas and the mpcore variants of realview/integrator) at the same time,
> since there are known issues with the CPU core.
>
> iop32x
>
> Some of the NAS devices were still in use two years ago as they have
> a lot of RAM for an ARMv5 based machine, not sure if they still are
> used. If they are, a DT conversion similar to what we did for ixp4xx
> should be possible.
>
> pxa
>
> There are a ton of boards on this one, including seven with qemu support,
> but based on IRC discussions, my feeling is that everyone who worked on
> this has already lost interest a few years ago. There is rudimentary DT
> support, so it may be helpful to pick one or two boards (gumstix?) with
> good qemu support and keep them around for conversion to DT, while
> removing all other boards.

FWIW, u-boot is removing all PXA support.

Rob
