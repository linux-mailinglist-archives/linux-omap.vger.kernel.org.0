Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AAABF5619EF
	for <lists+linux-omap@lfdr.de>; Thu, 30 Jun 2022 14:10:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233788AbiF3MKy (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 30 Jun 2022 08:10:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232835AbiF3MKx (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 30 Jun 2022 08:10:53 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AABF457B3
        for <linux-omap@vger.kernel.org>; Thu, 30 Jun 2022 05:10:52 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 34C85B82A4F
        for <linux-omap@vger.kernel.org>; Thu, 30 Jun 2022 12:10:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1633C341D2
        for <linux-omap@vger.kernel.org>; Thu, 30 Jun 2022 12:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1656591050;
        bh=9rfiaoeTXYExqEyN2w9WKYBmFOpIJvL+l8e5gD6IE8w=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=EbwfTT7WticRk1NohZ0QLFJgZzaEM44EfdSG/U0yR020TFbr5gJoElndfwuRo63X8
         //QITiY/vEftOD1ePT0MNxTy7Rs28Vts2FaeZkCE6iImGIpsrfCVlZEnJmee3fA361
         ovD6QSnh54PJtczCFDaoqYu4PghtO90AiqoKrxXCvGjGt2vT6/DtUPHokSWYufNuMN
         zdxzCT9imHMohLFog2KUyyB56/2skP8iMb/rsOjMdPS7eTQ0EJsRgP+eegtulUietr
         nlevH9dT4Y5AwmWj0Eu1KQYgHBao+j2ySMPGdoPQXEvU+6/umZATyY2gqkIS4eBqo4
         I+ofW3FY2uoMQ==
Received: by mail-yb1-f173.google.com with SMTP id o19so26820003ybg.2
        for <linux-omap@vger.kernel.org>; Thu, 30 Jun 2022 05:10:49 -0700 (PDT)
X-Gm-Message-State: AJIora+cOCqkeekadxLx0iZzrYYAYoIW7VCp6GYwKUG995KObeowLa7e
        DI5PvpbvEWSzH7e+iEPSimhg7c+xleotWTum2AQ=
X-Google-Smtp-Source: AGRyM1upUqUMAikPmDztiCcn91myQ+vwpyNXXTYryzkqjY2QiZJTKZfoWy8BFfd+3npRtpNPHoNfyeMYT1YUFzBKKbI=
X-Received: by 2002:a05:6902:120f:b0:668:2228:9627 with SMTP id
 s15-20020a056902120f00b0066822289627mr9486338ybu.134.1656591048874; Thu, 30
 Jun 2022 05:10:48 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a0Z9vGEQbVRBo84bSyPFM-LF+hs5w8ZA51g2Z+NsdtDQA@mail.gmail.com>
 <1413e8b9-5e55-e121-926e-38cb66d152ee@kernel.org> <CAK8P3a2br8pmFf=SG9OzZOPfyw36kOxKiyMLm_KWfsQPOnqyRg@mail.gmail.com>
 <7ae70216-d29e-6555-5b0f-6ab4d5632970@kernel.org>
In-Reply-To: <7ae70216-d29e-6555-5b0f-6ab4d5632970@kernel.org>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Thu, 30 Jun 2022 14:10:31 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2zc6rP+frkuT4S5wDJDyxnihij8M4coDcfABJRKb-yOg@mail.gmail.com>
Message-ID: <CAK8P3a2zc6rP+frkuT4S5wDJDyxnihij8M4coDcfABJRKb-yOg@mail.gmail.com>
Subject: Re: Scheduling (unused) board file removal for linux-6.x
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Russell King <rmk+kernel@armlinux.org.uk>,
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
        Mauri Sandberg <maukka@ext.kapsi.fi>,
        Mark Brown <broonie@kernel.org>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Tomasz Figa <tfiga@google.com>
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

On Thu, Jun 30, 2022 at 11:22 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On 30/06/2022 11:08, Arnd Bergmann wrote:
> > On Thu, Jun 30, 2022 at 9:10 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >> On 29/06/2022 22:42, Arnd Bergmann wrote:
> >>>
> >>> s3c64xx
> >>>
> >>> There are ten board files, which are currently scheduled for removal in
> >>> 2024, along with the DT based boards for this SoC. We can still decide
> >>> to throw out some of the board files earlier though, while keeping the
> >>> platform around.
> >>
> >> I would keep all s3c24xx/s3c64xx boards till the platform drop. Removing
> >> few boards before platform won't give us huge benefits... and anyway
> >> just 1 and 2 years and they all will be gone.
> >
> > I think there is benefit in throwing out some unused s3c64xx boards
> > even earlier, as this would simplify some treewide cleanups that have to
> > touch every board file, and potentially let us drop some peripheral
> > device drivers that have no other users and no DT probing.
> >
> > Ten boards is of course not a lot, but it's still about a third of the
> > board files I have currently marked as sticking around past early
> > 2023.
>
> OK, if you have some idea which one could be the candidates.
> Unfortunately I cannot provide here inputs - I have no clue which of S3C
> boards have users.

The only one I know of is MACH_WLF_CRAGG_6410, as Mark Brown
has pointed this one out as being used as the testbed for Wolfson/Cirrus
audio codecs. The machine is also the only one that shows being worked
on from the git history. The last patches I found that look like they were
boot tested on other machines include work by Kukjin Kim in 2015 and by
Sergio Prado in 2016, but I don't see which boards they were using, and
I don't think they still care. Thomasz Figa had access to multiple
machines back in 2014, but he converted those to use DT.

If we follow the same approach that I'm suggesting for the other
platforms and nobody else speaks up, that would leave only the DT
boards plus the Cragganmore.

       Arnd
