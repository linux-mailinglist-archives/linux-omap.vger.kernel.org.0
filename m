Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2CE1D561946
	for <lists+linux-omap@lfdr.de>; Thu, 30 Jun 2022 13:33:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230305AbiF3Lcl (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 30 Jun 2022 07:32:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235106AbiF3LcZ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 30 Jun 2022 07:32:25 -0400
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DF91523BA
        for <linux-omap@vger.kernel.org>; Thu, 30 Jun 2022 04:32:24 -0700 (PDT)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-317a66d62dfso175813527b3.7
        for <linux-omap@vger.kernel.org>; Thu, 30 Jun 2022 04:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8TNN5Ia8y6v+Tooa5CWuukdin5G+eRY0Q8ziLcBYBC8=;
        b=huJGaUDi8lyWMcge6fyskMHcncy+uvpZEruaU46yy9/NBt4TWNwYhPGYP5n9pKLqj4
         ZhZNlPB3hFMbxZ6ySPUmwnue3TIMnPhGOOPHngMGa7dhRcYinq1H0p6MThJ1XNOCrh8j
         yx/GmttrdoDXy3R7rS//LF3mjTPw1dxlAn285nm2tzifxJbnHKTbmlCMb6NpegVgoAtJ
         HSSTNgsh9hXkWlTNdxGAwVt81Mg3NzeleK7ZZ9aeLalEvdamrtI0jlep5Rm1E6mRO18+
         e1A8QiqZn+PvFiL0J6jZDYA3mUS3D6ySxQhoq3rzbSQzycDh6Vcc84J3pGJd5XRaxox2
         hK5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8TNN5Ia8y6v+Tooa5CWuukdin5G+eRY0Q8ziLcBYBC8=;
        b=jImYHdHTc7ys+OBb30UXM4hhHOrqWXPNvrJOH2egF3F7g8qe/RHdvWqWdjG8mwpvsw
         NotfOYHHiep2Z4irFtuAVKiZyrEITsOm1BDmEfcBVfJ3T4170xXAzNhCIem/srIAOE0Y
         GTFlB5cbNZv/jAiHsGmsj08/Tpn10BtHqodMMO9yM/mEe+/+dAgfHeDg8sj6rOw4fS/R
         e2MZYB9yL48zjSEYChIevGvfPxs58OHnV7h8AkYH5pRiJmEvRrAEbPTjkWgSGOCnckTX
         RT9Ut2ZKf3qh21Fn0Z+0AqM8/6DqFRXmYTVs/9DvaR7t6sz096L7tBO7XDa+XC1ICIt3
         M5lA==
X-Gm-Message-State: AJIora90/MnEkez+gECKuZeaeaaGyrw3/byIYySMTjb/J44dOwdpdcAw
        YF4wqlMchR22GxFeQBAoh+tQvo9yKS9jL8tM6bodVQ==
X-Google-Smtp-Source: AGRyM1u0aiGHNpXToi0vrrAHXMGb5cF6xPDiugvBBBxEAIHtHqplZQ/UrIqwpG63pezpGXXlPTffCZwa4ghLn1rFUdg=
X-Received: by 2002:a0d:d487:0:b0:318:48dd:95b3 with SMTP id
 w129-20020a0dd487000000b0031848dd95b3mr10417522ywd.140.1656588743342; Thu, 30
 Jun 2022 04:32:23 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a0Z9vGEQbVRBo84bSyPFM-LF+hs5w8ZA51g2Z+NsdtDQA@mail.gmail.com>
In-Reply-To: <CAK8P3a0Z9vGEQbVRBo84bSyPFM-LF+hs5w8ZA51g2Z+NsdtDQA@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 30 Jun 2022 13:32:11 +0200
Message-ID: <CACRpkdY2_ZbmcSuuMB9t5bB-tGE0iAc-nE26JwxidRFocRahSw@mail.gmail.com>
Subject: Re: Scheduling (unused) board file removal for linux-6.x
To:     Arnd Bergmann <arnd@kernel.org>,
        Matija Glavinic Pecotic <matija.glavinic-pecotic.ext@nokia.com>,
        Aswath Govindraju <a-govindraju@ti.com>
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
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
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Arnd,

thanks for looking into this!

On Wed, Jun 29, 2022 at 10:43 PM Arnd Bergmann <arnd@kernel.org> wrote:

> pxa

This looks like something that would be interesting to pick up and maintain
with DT support, if and only if there are devices with enough memory.

However I doubt there is interest.

I think the palmtops/PDAs are a bit outdated as enthusiast/hobbyist platforms
with screens because those people will use PostmarketOS with
cheap old tablets and phones these days.

> sa1100
>
> Similar to PXA, work on this appears to have stopped. Russell probably
> still has an Assabet or some other machine, but I don't know if he
> still plans to keep using new kernels on those. The only machine with
> qemu support is Collie (Sharp SL-5500), so if we keep any boards at all,
> then this should be kept as well. Probably no point doing a DT conversion
> here though.

My interest is to have something to test that CPU_SA1100 is working
on and I've been using the HP3600.

If I wanna keep doing that I should bite the bullet and convert it to
DT and multiplatform like I did with everything else I need for testing.
Else I deserve to have it removed on me and I can resurrect it
using DT if I want.

> footbridge
>
> Three machines, most notably the NetWinder that a few people still have.
> I assume Russell wants to keep the machines working that he still has.
> ep93xx
>
> These are still used, and the platform includes the only remaining two
> board files that were added after linux-3.0. DT support is probably
> doable now that common-clk works. Need information about which boards
> are important.

I'm using the NetWinder to test that CPU_SA110 is still working.

Same thing: if it matters enough to me I should convert it to DT
and multiplatform.

Someone said (ha ha only serious) to convert it to ACPI if it should
live on since it is a desktop machine...

> davinci
>
> DT conversion has stalled, and there are 12 remaining board files,
> mostly for evaluation machines. No idea if any are still in use.

TI is semi-actively maintaining DaVinci, I wonder if we can send
the message that this needs to be converted to DT pronto to live
on?

Paging Aswath @TI, who just a few days ago sent some
suspend/resume patches for GPIO:
https://lore.kernel.org/linux-gpio/20220613054310.21186-1-a-govindraju@ti.com/

Aswath: can you perhaps raise this internally at TI? Thanks!

Patches also came from Nokia (!) last year see
ea4ab99cb58cc9f8d64c0961ff9a059825f304cf

Yours,
Linus Walleij
