Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 630CB5628B1
	for <lists+linux-omap@lfdr.de>; Fri,  1 Jul 2022 04:05:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232509AbiGACFp (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 30 Jun 2022 22:05:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229480AbiGACFo (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 30 Jun 2022 22:05:44 -0400
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E6EF43EEF
        for <linux-omap@vger.kernel.org>; Thu, 30 Jun 2022 19:05:43 -0700 (PDT)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-3137316bb69so10337967b3.10
        for <linux-omap@vger.kernel.org>; Thu, 30 Jun 2022 19:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mjbX2CqDc4kYjoIA7mQmXt/7Ur5KCpQMzZeNYpqCyHo=;
        b=CqHUOHrxS23RKYCQ4tRHjV0RsbrfN6CFokGIyp8U/phWc51en/qGRDz4u9KrQSE+iB
         YT7uqBVLgS+jx0oVaseYrONt5wKkFZpca73t+HIz+qoI7IaxSWC7czjVjHLw078Sjjig
         ulSFbMetpQJMSOfSfFuNMGaVx398SoeKVsBMYN6UgnzeCLPzvTe0rsQN3ePx272/SEBn
         Bn5WnGmg4ZlX50d2qpFV1AH44Sou7hEMupwkIQRpzTYWJ+hJalbmL4Oy1dsAssU7YUXv
         QlCXSDz8jNso9A0fLQLhRIkKMKDtetGE1NqlyPd6TmJIIWi3Y2OQAqOzxy5RlPYIpzp4
         Gn0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mjbX2CqDc4kYjoIA7mQmXt/7Ur5KCpQMzZeNYpqCyHo=;
        b=ZsbiI/z4R9INU62WltV+X99LWKR+otrOToPETsVAOG7SHV/djhAAAOEF5z3S2S9yNn
         yI3/PYW5SSYY+BXJ1gPqammEukQDGOdC2XEepmG2TgUnye0OkqlwaMzfswpKW8iHjDU8
         LUyWKYE0fe4TOy4xMmhGjvtmjXo42dxJL6xzhf5oUDYmJBhxCzi8+j4y/L0pmy7GU9g+
         L+AyschKsff5ej60zS1zfKYGmKP+vnEhoTT8bvLoeQqDkWkVzCrDm3w0S3oyv/nsYzwe
         1ruGlRzkIPbjEX1bME4oF/Tq8QHoK3sMLQ/DCcmgy2NHcnEUXH9WXR22g17jNueIF1WT
         V99A==
X-Gm-Message-State: AJIora/C/B4TDNuTG8KV6O9oGYN+8n6ZBRxiqBL8UHOs+Nl5bkBsgyhh
        764THuFt1IU8taXqLHZcLs4ercyzmBu7pPnsSApRhw==
X-Google-Smtp-Source: AGRyM1uk8uuFt7J/UTj2bSfwevd6BIV6UmYe6Ud3Xr6aPk2H45znRfGBOgXGflKJ6hdSotZqeRWs1scqMm1V1LyYkxw=
X-Received: by 2002:a81:8ac6:0:b0:31c:11fe:d215 with SMTP id
 a189-20020a818ac6000000b0031c11fed215mr14327451ywg.417.1656641142471; Thu, 30
 Jun 2022 19:05:42 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a0Z9vGEQbVRBo84bSyPFM-LF+hs5w8ZA51g2Z+NsdtDQA@mail.gmail.com>
 <1413e8b9-5e55-e121-926e-38cb66d152ee@kernel.org> <CAK8P3a2br8pmFf=SG9OzZOPfyw36kOxKiyMLm_KWfsQPOnqyRg@mail.gmail.com>
 <7ae70216-d29e-6555-5b0f-6ab4d5632970@kernel.org> <CAK8P3a2zc6rP+frkuT4S5wDJDyxnihij8M4coDcfABJRKb-yOg@mail.gmail.com>
 <a146fdb4-4fa7-e4e8-7084-1e630c61a66b@kernel.org>
In-Reply-To: <a146fdb4-4fa7-e4e8-7084-1e630c61a66b@kernel.org>
From:   Tomasz Figa <tfiga@google.com>
Date:   Fri, 1 Jul 2022 11:05:31 +0900
Message-ID: <CAAFQd5BXOxgwG0UsBRquXxF9vvzzk5bytc30PencJPkM6jjQPw@mail.gmail.com>
Subject: Re: Scheduling (unused) board file removal for linux-6.x
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Arnd Bergmann <arnd@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
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
        Charles Keepax <ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, Jul 1, 2022 at 2:01 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 30/06/2022 14:10, Arnd Bergmann wrote:
>
> >>
> >> OK, if you have some idea which one could be the candidates.
> >> Unfortunately I cannot provide here inputs - I have no clue which of S3C
> >> boards have users.
> >
> > The only one I know of is MACH_WLF_CRAGG_6410, as Mark Brown
> > has pointed this one out as being used as the testbed for Wolfson/Cirrus
> > audio codecs. The machine is also the only one that shows being worked
> > on from the git history. The last patches I found that look like they were
> > boot tested on other machines include work by Kukjin Kim in 2015 and by
> > Sergio Prado in 2016, but I don't see which boards they were using, and
> > I don't think they still care. Thomasz Figa had access to multiple
> > machines back in 2014, but he converted those to use DT.
> >
> > If we follow the same approach that I'm suggesting for the other
> > platforms and nobody else speaks up, that would leave only the DT
> > boards plus the Cragganmore.
>
> Huhu, that would be nice spring cleaning! Sure, let's go with board
> removal except mentioned Mark's one.

Sadly I don't have any boards alive anymore. I'm fine with any
removals you suggested. :)

Best regards,
Tomasz
