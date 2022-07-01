Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE8A556337C
	for <lists+linux-omap@lfdr.de>; Fri,  1 Jul 2022 14:28:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231503AbiGAM2w (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 1 Jul 2022 08:28:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229565AbiGAM2v (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 1 Jul 2022 08:28:51 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9341034641
        for <linux-omap@vger.kernel.org>; Fri,  1 Jul 2022 05:28:50 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 41337B82F4D
        for <linux-omap@vger.kernel.org>; Fri,  1 Jul 2022 12:28:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D29C1C341D2
        for <linux-omap@vger.kernel.org>; Fri,  1 Jul 2022 12:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1656678527;
        bh=DmTXWU/gyw8NpiNL5wf39SvjlUNzYYqElwpxxOpU00U=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ozW5s6+k1POrbT8z9Jgx/SdIuh0ju59AN50EzARFeo7sFzYFe7XCUN66Lw05Pun/Z
         pqe035oCYy0eJ2Hp1V4NksS/n7dx/h5Jjq9OwX6PGhb1LyKSW8+I5RIhOdvdvABV65
         o/0uPt6fttt38RJeu490jTyGwp9lq0pqCxhSHKtDwf7EWU+DHnaCzRSrn8vLq7SAB9
         uypdVX7DJrNU5JF+MCmqJ51Gd74HhKyyVS8yRC+TFYLHJCpkdrWr71ycljN7FL4xeX
         mgMuPaWKqlx8CtgONJQzw9atsIpbZHwKYqVsAUf2jtT5EHDBEuljvHAWXmPVCh6tqY
         M7GFljr5r14dw==
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-101dc639636so3326064fac.6
        for <linux-omap@vger.kernel.org>; Fri, 01 Jul 2022 05:28:47 -0700 (PDT)
X-Gm-Message-State: AJIora9n2Zoz5DnlBF1jJLJaECANB31H0YaIXuGI1LhjeoKH+/W9g2fz
        xnROWUpwIH9yKgb9W2DPGTekldoT1inrp4PkPEg=
X-Google-Smtp-Source: AGRyM1sbtmSEfkbWAoLENE1Cb4NAvSHKapf6GPRm7CBe8/NKF//s55eZ8tCTXAv5PEi2+oPxcpSWce2GFTqzIu6Emfk=
X-Received: by 2002:a05:6870:170c:b0:102:e2:7b25 with SMTP id
 h12-20020a056870170c00b0010200e27b25mr9397285oae.188.1656678526886; Fri, 01
 Jul 2022 05:28:46 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a0Z9vGEQbVRBo84bSyPFM-LF+hs5w8ZA51g2Z+NsdtDQA@mail.gmail.com>
 <CACRpkdY2_ZbmcSuuMB9t5bB-tGE0iAc-nE26JwxidRFocRahSw@mail.gmail.com>
 <CAK8P3a2yh1Uh9+YP42ekt3LB9oTfEg0WMB5FVqwp40qHb6vWFg@mail.gmail.com> <CACRpkdZ=hAkxEzmXwpshYKF1V20kyguqQh1aDEdAuKW7ng_8aQ@mail.gmail.com>
In-Reply-To: <CACRpkdZ=hAkxEzmXwpshYKF1V20kyguqQh1aDEdAuKW7ng_8aQ@mail.gmail.com>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Fri, 1 Jul 2022 14:28:30 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3Lon=DrO1WrhLdqHmgbVuk4aJjcP0FOuJywbbMKcGztQ@mail.gmail.com>
Message-ID: <CAK8P3a3Lon=DrO1WrhLdqHmgbVuk4aJjcP0FOuJywbbMKcGztQ@mail.gmail.com>
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

On Fri, Jul 1, 2022 at 1:43 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> On Fri, Jul 1, 2022 at 12:54 PM Arnd Bergmann <arnd@kernel.org> wrote:
> > On Thu, Jun 30, 2022 at 1:32 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> > > On Wed, Jun 29, 2022 at 10:43 PM Arnd Bergmann <arnd@kernel.org> wrote:
> > > > davinci
> > > >
> > > > DT conversion has stalled, and there are 12 remaining board files,
> > > > mostly for evaluation machines. No idea if any are still in use.
> > >
> > > TI is semi-actively maintaining DaVinci, I wonder if we can send
> > > the message that this needs to be converted to DT pronto to live
> > > on?
> >
> > I assume Sekhar and Bartosz have a plan. As Tony said, the
> > important machines are the DA850 ones that are already converted.
>
> TI is OK with having these removed, my gpiod-conversion patches
> has been resent a few merge windows without getting merged or
> tested. I will send patches to simply delete them,
> then the hobbyists can take it from there if they don't like it.

Fine with me. While my plan was to give all users six months
time to speak up across all platforms, but if a platform maintainer
wants to speed up removing their boards, I'm not complaining.

       Arnd
