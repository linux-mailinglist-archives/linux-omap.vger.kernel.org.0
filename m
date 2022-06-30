Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3669F5615AA
	for <lists+linux-omap@lfdr.de>; Thu, 30 Jun 2022 11:09:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233589AbiF3JIu (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 30 Jun 2022 05:08:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233658AbiF3JIs (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 30 Jun 2022 05:08:48 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90B9815714
        for <linux-omap@vger.kernel.org>; Thu, 30 Jun 2022 02:08:47 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 4452CB82935
        for <linux-omap@vger.kernel.org>; Thu, 30 Jun 2022 09:08:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EED29C34115
        for <linux-omap@vger.kernel.org>; Thu, 30 Jun 2022 09:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1656580125;
        bh=d2GC3Kr/0R7xW3ukZbdxYhtG8FVMuwCG9n9VhvA8HTQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=jq/qlPgSzQYzy0Nx8KKWREoqbo/0H4/Y+uLismUmhDdDHPS+Q7KraXrwaYCuJ7FTL
         wwZe/MMYTDXt5Xytnuhe0Q2n4uQlcdgJqRku6tnxaOx0CxvjfFhpn/PArouXLtZ0ZQ
         AdAKy+502pjtH8vAF/u9QLPeP1Fw2wOdUYnhBoDH23qwc1mi7Kd9LZC0KnsvAr/AM7
         Wyz/EBa+E37nOQKV+JyxThTwIoSMdOv7rhXtTSdWMsyTqe4RtWWg/dzkIhnlw70r/5
         y5tdAG9H1Kq8CcrVry/ZOSMODZN7pNpM47y71mBZa9DAG7OJRmRkLVI6zxwkeUH/ol
         JOP0oIVJeWm+Q==
Received: by mail-yb1-f182.google.com with SMTP id x184so29877183ybg.12
        for <linux-omap@vger.kernel.org>; Thu, 30 Jun 2022 02:08:44 -0700 (PDT)
X-Gm-Message-State: AJIora8P8otpuQHigtksp2A1YDoGYr6OK72AMAu/V/CIT9ug5+I+xOPO
        2XIxbikt5Pc7KJRz+n44UUiFHXmQrjT4YkxPB44=
X-Google-Smtp-Source: AGRyM1tqttjKVcNFNUyZyZg5rAIRUsDrR228cjUjV2kLZTD7ELo7zMtXZoQzo32ly0lkvM73qU7TjJQ+pZpGS2ysWgY=
X-Received: by 2002:a25:d60d:0:b0:66c:c951:3eb1 with SMTP id
 n13-20020a25d60d000000b0066cc9513eb1mr8382337ybg.550.1656580124062; Thu, 30
 Jun 2022 02:08:44 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a0Z9vGEQbVRBo84bSyPFM-LF+hs5w8ZA51g2Z+NsdtDQA@mail.gmail.com>
 <1413e8b9-5e55-e121-926e-38cb66d152ee@kernel.org>
In-Reply-To: <1413e8b9-5e55-e121-926e-38cb66d152ee@kernel.org>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Thu, 30 Jun 2022 11:08:26 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2br8pmFf=SG9OzZOPfyw36kOxKiyMLm_KWfsQPOnqyRg@mail.gmail.com>
Message-ID: <CAK8P3a2br8pmFf=SG9OzZOPfyw36kOxKiyMLm_KWfsQPOnqyRg@mail.gmail.com>
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

On Thu, Jun 30, 2022 at 9:10 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On 29/06/2022 22:42, Arnd Bergmann wrote:
> >
> > s3c64xx
> >
> > There are ten board files, which are currently scheduled for removal in
> > 2024, along with the DT based boards for this SoC. We can still decide
> > to throw out some of the board files earlier though, while keeping the
> > platform around.
>
> I would keep all s3c24xx/s3c64xx boards till the platform drop. Removing
> few boards before platform won't give us huge benefits... and anyway
> just 1 and 2 years and they all will be gone.

I think there is benefit in throwing out some unused s3c64xx boards
even earlier, as this would simplify some treewide cleanups that have to
touch every board file, and potentially let us drop some peripheral
device drivers that have no other users and no DT probing.

Ten boards is of course not a lot, but it's still about a third of the
board files I have currently marked as sticking around past early
2023.

        Arnd
