Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 689295631FE
	for <lists+linux-omap@lfdr.de>; Fri,  1 Jul 2022 12:54:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237135AbiGAKyR (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 1 Jul 2022 06:54:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237079AbiGAKyM (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 1 Jul 2022 06:54:12 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16D237E022
        for <linux-omap@vger.kernel.org>; Fri,  1 Jul 2022 03:54:06 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A49E0624F2
        for <linux-omap@vger.kernel.org>; Fri,  1 Jul 2022 10:54:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BDFBC341D4
        for <linux-omap@vger.kernel.org>; Fri,  1 Jul 2022 10:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1656672845;
        bh=vOz9kGDXmswAhcXU73kOmUhwVOeiHd/ROAZlEgpangY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=kgrN0zyi1e0Px54UsdDglRYTqqWrIDg5y0JD0GmxnHIE2YXw4IievsVccGmuPRWwx
         hPhXK82L31gXltqr7+Kv4zQSG9JV0voLzo7q73kuwNMNBOCkvN8Z7i44lhhkEiw9kI
         kxi5510uj81RbaYjcpA6/Cz/hasL0arryAXFTytqnB/31vvZZnDoW6XN3vzZdZ5s2G
         Kocd/79uCmvs3uf0wWtGH6CKY/bZT3+KbciypRtqt7QxWEKXD7JsczI9i6nlSuf6zi
         fIhZnrjBPmLz8TcqOMjKMX+iHTSVhwaW3aVS1ZN8c5jaWxnL1/PveZnWk3N5HjA1zk
         yS2AKZH46cXKg==
Received: by mail-yb1-f180.google.com with SMTP id x184so3318368ybg.12
        for <linux-omap@vger.kernel.org>; Fri, 01 Jul 2022 03:54:05 -0700 (PDT)
X-Gm-Message-State: AJIora+pEpB/d0bmT8Xaj/zZfI4XVGhyftzVeuEHVEamTHJyyCoCsSep
        qo6XdRd0okf4SPQia3BTHo4wSfbW42XbHmZd7X0=
X-Google-Smtp-Source: AGRyM1skGc+VeYXewG0ZKTrGjWrguk6pl7Saz5eD5HUjyc2GwwyJ3dSFcGeS0lHr0GsNrwN0zr5nzMSVui1QDqIwOp0=
X-Received: by 2002:a05:6902:120f:b0:668:2228:9627 with SMTP id
 s15-20020a056902120f00b0066822289627mr15197410ybu.134.1656672843858; Fri, 01
 Jul 2022 03:54:03 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a0Z9vGEQbVRBo84bSyPFM-LF+hs5w8ZA51g2Z+NsdtDQA@mail.gmail.com>
 <CACRpkdY2_ZbmcSuuMB9t5bB-tGE0iAc-nE26JwxidRFocRahSw@mail.gmail.com>
In-Reply-To: <CACRpkdY2_ZbmcSuuMB9t5bB-tGE0iAc-nE26JwxidRFocRahSw@mail.gmail.com>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Fri, 1 Jul 2022 12:53:46 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2yh1Uh9+YP42ekt3LB9oTfEg0WMB5FVqwp40qHb6vWFg@mail.gmail.com>
Message-ID: <CAK8P3a2yh1Uh9+YP42ekt3LB9oTfEg0WMB5FVqwp40qHb6vWFg@mail.gmail.com>
Subject: Re: Scheduling (unused) board file removal for linux-6.x
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Matija Glavinic Pecotic <matija.glavinic-pecotic.ext@nokia.com>,
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

On Thu, Jun 30, 2022 at 1:32 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> On Wed, Jun 29, 2022 at 10:43 PM Arnd Bergmann <arnd@kernel.org> wrote:
> >
> > sa1100
> >
> > Similar to PXA, work on this appears to have stopped. Russell probably
> > still has an Assabet or some other machine, but I don't know if he
> > still plans to keep using new kernels on those. The only machine with
> > qemu support is Collie (Sharp SL-5500), so if we keep any boards at all,
> > then this should be kept as well. Probably no point doing a DT conversion
> > here though.
>
> My interest is to have something to test that CPU_SA1100 is working
> on and I've been using the HP3600.

Ok. I have a H3600 and a Collie (with 64MB) here myself, though I
have no plans to do anything with these. I've marked the assabet,
h3600 and collie for staying around now.

> If I wanna keep doing that I should bite the bullet and convert it to
> DT and multiplatform like I did with everything else I need for testing.
> Else I deserve to have it removed on me and I can resurrect it
> using DT if I want.

My feeling is that it's not worth going there for any of the three
StrongARM platforms: rpc has a deadline in a few years when the
compiler stops working, and sa1100 machines are mostly limited
to 32MB (sometimes 64MB).

footbridge is probably the easiest out of the lot. I can resend
my patch to remove ebsa285 add-in mode, and I also have
some patches for cleaning up the ISA DMA.

> > davinci
> >
> > DT conversion has stalled, and there are 12 remaining board files,
> > mostly for evaluation machines. No idea if any are still in use.
>
> TI is semi-actively maintaining DaVinci, I wonder if we can send
> the message that this needs to be converted to DT pronto to live
> on?

I assume Sekhar and Bartosz have a plan. As Tony said, the
important machines are the DA850 ones that are already converted.

> Paging Aswath @TI, who just a few days ago sent some
> suspend/resume patches for GPIO:
> https://lore.kernel.org/linux-gpio/20220613054310.21186-1-a-govindraju@ti.com/
>
> Aswath: can you perhaps raise this internally at TI? Thanks!
>
> Patches also came from Nokia (!) last year see
> ea4ab99cb58cc9f8d64c0961ff9a059825f304cf

I would assume that both have been for keystone2 or k3, which
share a lot of the drivers with davinci and are widely used with DT.

        Arnd
