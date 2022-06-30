Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 07C4E56136E
	for <lists+linux-omap@lfdr.de>; Thu, 30 Jun 2022 09:42:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229757AbiF3Hmf (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 30 Jun 2022 03:42:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233075AbiF3Hme (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 30 Jun 2022 03:42:34 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD7A93B28F
        for <linux-omap@vger.kernel.org>; Thu, 30 Jun 2022 00:42:33 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4C02961852
        for <linux-omap@vger.kernel.org>; Thu, 30 Jun 2022 07:42:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA0B0C341DA
        for <linux-omap@vger.kernel.org>; Thu, 30 Jun 2022 07:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1656574952;
        bh=EdodgFYR66rPVPN9SolrQoXIjvQcLU1Q+ShpRqAPG8Y=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=KeEOSw3gaIrXDy/zrXDOH0jnpBEugFiO+oBPxEaVU7fTP7j5zXllLqPub7D39GIKY
         z0AoYC1smNI8Lv2gHXcO3WdyqScDd/ikPtK0z0SZAYm8JbnnQ2KQVjcKWgy3pWZot/
         DzFtz6XejKy/Os1GtJE3PwNg6MldV7HylVjuZV5rfVvYPMJ1kCiGHckjQ0AZj9I8f+
         lOcLFkZbeWO2xgj1gLUgUMiEtgaZMkrWhg5xUEHoBRkPPIDBDa4r569tMYFmCC1Dfc
         Yj3dkuf/ELwZeLfsNKNCslF0n8FWY6nhS2Piy0XMmFBq5ey2gb3d/BFE6Mw43tOUH0
         YsQmq5gFprDpQ==
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-31780ad7535so170669187b3.8
        for <linux-omap@vger.kernel.org>; Thu, 30 Jun 2022 00:42:32 -0700 (PDT)
X-Gm-Message-State: AJIora828pYt+extKqih7D6Ib32zrDcYW8cgmaNunpVzeQPsnczVaePs
        O2FuarPT8NRqBzGuT/thW5v6ikGqRYtSgRYhUfk=
X-Google-Smtp-Source: AGRyM1vpQGWnr3p2afoyzafkWGhOAZYcbd7yoT2G1j28Pffljof0cN2i7Dz8Hz1PTsCWtfth8g/e13icMj4L4m3Kg9A=
X-Received: by 2002:a0d:df0f:0:b0:31b:e000:7942 with SMTP id
 i15-20020a0ddf0f000000b0031be0007942mr8288142ywe.320.1656574951594; Thu, 30
 Jun 2022 00:42:31 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a0Z9vGEQbVRBo84bSyPFM-LF+hs5w8ZA51g2Z+NsdtDQA@mail.gmail.com>
 <0010bbe738eb6853f49f07a6eb6043e0e7f426a8.camel@gmail.com>
In-Reply-To: <0010bbe738eb6853f49f07a6eb6043e0e7f426a8.camel@gmail.com>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Thu, 30 Jun 2022 09:42:14 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0QDgKfHxri0YOj_4nJdGOD9ALRdCseb2EmJ36S7FrBaQ@mail.gmail.com>
Message-ID: <CAK8P3a0QDgKfHxri0YOj_4nJdGOD9ALRdCseb2EmJ36S7FrBaQ@mail.gmail.com>
Subject: Re: Scheduling (unused) board file removal for linux-6.x
To:     Alexander Sverdlin <alexander.sverdlin@gmail.com>
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

On Wed, Jun 29, 2022 at 10:59 PM Alexander Sverdlin
<alexander.sverdlin@gmail.com> wrote:
> On Wed, 2022-06-29 at 22:42 +0200, Arnd Bergmann wrote:
> > ep93xx
> >
> > These are still used, and the platform includes the only remaining two
> > board files that were added after linux-3.0. DT support is probably
> > doable now that common-clk works. Need information about which boards
> > are important.
>
> I'm still maintaining/able to test CONFIG_MACH_EDB93XX (edb93xx.c).

Noted, thanks! We'll leave them in for 2023 then.

Any thoughts on long-term uses for the platform? Do you know of users
of any products other than the reference boards that would justify doing
a DT conversion, or do we just delete the platform another time?

        Arnd
