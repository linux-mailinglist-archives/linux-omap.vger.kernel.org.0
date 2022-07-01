Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 64EF55632C6
	for <lists+linux-omap@lfdr.de>; Fri,  1 Jul 2022 13:43:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233732AbiGALnX (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 1 Jul 2022 07:43:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234579AbiGALnV (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 1 Jul 2022 07:43:21 -0400
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07D24E01C
        for <linux-omap@vger.kernel.org>; Fri,  1 Jul 2022 04:43:20 -0700 (PDT)
Received: by mail-yb1-xb30.google.com with SMTP id p136so3591752ybg.4
        for <linux-omap@vger.kernel.org>; Fri, 01 Jul 2022 04:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dHsUlYHvJjwLkKL8sZaM8XM6KuEYgMAVpktI6koVIjw=;
        b=cSocmnmNgyzEopJXOW3d3QA51aXrbLdzKNS7s84ZBo5eNHmQCtR1L5rTcKksB8XUjb
         gEvDJRoOqkFuRlN3/SdgO6vh4BitdbIOgINBgH3konngwJqHFBoQZwURwMwUhMz8aToa
         sCazXRnVh9J5iaY4nIqM7X7anmKVMDQ/PgGwnkSFYcTXZqkQWGcuhIG8VkGeNuOd92AK
         PAKqwONj//YIVOadoXxcU5prsOPtLhZqyR2tBJE8tbbNIhk27HrIeqx1Z1EJY24JTljq
         a4C8rg1RsZZNiendZk8dmbC1dBaTcFAxxqjob6Z9T79MnxaG4VRg5N9vmCBRefVkJBeC
         9SCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dHsUlYHvJjwLkKL8sZaM8XM6KuEYgMAVpktI6koVIjw=;
        b=XFge92cBDkxWoasFChNrCGvM5uaGmuMDu2RQCKo/uJ3RH7nbTzSn7XVbQP8RX/umLR
         /cHjTgfYFH8VQBudjYZ1rQM/YovNzjFhrPQzg1Rigqk1XHbGaWfO3WEkC6BjAEXFGVRU
         ExPKX1Z9vGqs5WysdqoVDWU6FSUp2RjiDXF1zuXJ1Ih+EeydtqvWeCveXdYz7hmWyD51
         hXinGPJEd8t9DiA6aYcbIkOdH/8NwZoH3vcv/a6jfG7WCCJi6Mh0DsIoXoOERTr8cACU
         BDdr1TqarlElAPHUXfEQXrs5oo2n5jSATiAeW+DXmBsuXDQjl5q6M5AtsqXlpALzBxKA
         i+dQ==
X-Gm-Message-State: AJIora+9erEb5E5BiLfx3pinI+nvDLioki5KSNfhdBT3QuZpo+hrYon9
        /Xcgi/o+d/lpTUhPzEkTWo/IRoRyaykle4JIWRQvHQ==
X-Google-Smtp-Source: AGRyM1udDbNpOT3zQ8lONezt+onF9Vf2mLbpM2S/NEwKnE5s3BFvMxi+Aqq776BTyhYhXlSm3Igx9g62ngwC1UmQc3M=
X-Received: by 2002:a25:e7d4:0:b0:66c:899b:49c6 with SMTP id
 e203-20020a25e7d4000000b0066c899b49c6mr15814774ybh.291.1656675799180; Fri, 01
 Jul 2022 04:43:19 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a0Z9vGEQbVRBo84bSyPFM-LF+hs5w8ZA51g2Z+NsdtDQA@mail.gmail.com>
 <CACRpkdY2_ZbmcSuuMB9t5bB-tGE0iAc-nE26JwxidRFocRahSw@mail.gmail.com> <CAK8P3a2yh1Uh9+YP42ekt3LB9oTfEg0WMB5FVqwp40qHb6vWFg@mail.gmail.com>
In-Reply-To: <CAK8P3a2yh1Uh9+YP42ekt3LB9oTfEg0WMB5FVqwp40qHb6vWFg@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 1 Jul 2022 13:43:07 +0200
Message-ID: <CACRpkdZ=hAkxEzmXwpshYKF1V20kyguqQh1aDEdAuKW7ng_8aQ@mail.gmail.com>
Subject: Re: Scheduling (unused) board file removal for linux-6.x
To:     Arnd Bergmann <arnd@kernel.org>
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
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, Jul 1, 2022 at 12:54 PM Arnd Bergmann <arnd@kernel.org> wrote:
> On Thu, Jun 30, 2022 at 1:32 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> > On Wed, Jun 29, 2022 at 10:43 PM Arnd Bergmann <arnd@kernel.org> wrote:

> > > davinci
> > >
> > > DT conversion has stalled, and there are 12 remaining board files,
> > > mostly for evaluation machines. No idea if any are still in use.
> >
> > TI is semi-actively maintaining DaVinci, I wonder if we can send
> > the message that this needs to be converted to DT pronto to live
> > on?
>
> I assume Sekhar and Bartosz have a plan. As Tony said, the
> important machines are the DA850 ones that are already converted.

TI is OK with having these removed, my gpiod-conversion patches
has been resent a few merge windows without getting merged or
tested. I will send patches to simply delete them,
then the hobbyists can take it from there if they don't like it.

Yours,
Linus Walleij
