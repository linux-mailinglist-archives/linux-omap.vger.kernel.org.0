Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3FCE956471E
	for <lists+linux-omap@lfdr.de>; Sun,  3 Jul 2022 13:24:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232331AbiGCLYM (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 3 Jul 2022 07:24:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231533AbiGCLYL (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 3 Jul 2022 07:24:11 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD03565C8
        for <linux-omap@vger.kernel.org>; Sun,  3 Jul 2022 04:24:10 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id r14so3682972wrg.1
        for <linux-omap@vger.kernel.org>; Sun, 03 Jul 2022 04:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=dfqMDST0ctikYyVhyrN6CFDCAh9hKzpIRKIYLiClkow=;
        b=S8r9+EUM1NMQvwxVTvLuLAMt992ZUbJcw/ALDYuUt0Cg/s/86myILzdXqjRO8FTOkb
         m3r33nJPowbF3muVXjfIkHCis7p/fYNE+ZrkC8SkZUuFmVBTWVu/qUJhjbaLBr1Dgjn6
         dwDmL+PNr3onnt6JzJ1aV104HGDIyj54JUPGZDH8jA7e+qENqifSal7jq08Ggmd7sNJB
         MnWGxm4PdMY66fcyrpHafrfEF8TiGDHnHUC+OIcGl3O/nT0BalMyQ/4LBVzhJw/yMfRO
         41xdwR5H39x4Uie7kL2bnB5YFJPDduuPvdlR0zezVyRrpJebS/9cxFOihTb+jiWjnzCH
         n3ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=dfqMDST0ctikYyVhyrN6CFDCAh9hKzpIRKIYLiClkow=;
        b=DdP9+8k9BdHLHjLMvlbGYywprstT7/B50+innj07+UUJN/XdCLqTKkzj2j8hWI0Gvx
         u2jbrUbuYUmQf1h7Jbm1LOgHkdTHNWeIL4Q9G+NvbE3GkZFD2aAnf/yuJBHp9Vwq2tpt
         KZa926fbjTNkYt2pRb11TmbKLkvUYn2TtbdeJ39VPGpu/vwxMvYjEOjJ92Gqj74D+Sw5
         fUShisjZq/hex281AZYw5lkGyEYnRNCsBenqw9QTnI4yKiuSHvx+6vHbCvvD3/IWf1F8
         75PWJyBLvSZh4tSzOFUceqnNSB5XSk8gTUPRLrNjQLXhNXU4x74uXTE+NNdzd8zWeUlc
         M0EA==
X-Gm-Message-State: AJIora+XigH3uJpvPV8wO4Dr1gDN0KmgaXk2X5q4ZdHYfy2w/pnzunds
        OCOfYlrDvG10FAJBxr3GY7g=
X-Google-Smtp-Source: AGRyM1uCYAV4LlFPUW7ZGjujBT5iVA0ce2SzrDUDoV+tu/yVIbB+AG+IUR6paNwRmak+guqP9ZDoow==
X-Received: by 2002:a05:6000:2a2:b0:21d:1e00:c198 with SMTP id l2-20020a05600002a200b0021d1e00c198mr21502957wry.520.1656847449366;
        Sun, 03 Jul 2022 04:24:09 -0700 (PDT)
Received: from giga-mm.localdomain ([195.245.18.14])
        by smtp.gmail.com with ESMTPSA id s14-20020a5d510e000000b0021d60994b0asm3487306wrt.100.2022.07.03.04.24.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Jul 2022 04:24:08 -0700 (PDT)
Message-ID: <ba286beeecaa0f11fce3d90ac4904ca7df310c22.camel@gmail.com>
Subject: Re: Scheduling (unused) board file removal for linux-6.x
From:   Alexander Sverdlin <alexander.sverdlin@gmail.com>
To:     Arnd Bergmann <arnd@kernel.org>,
        Nikita Shubin <nikita.shubin@maquefel.me>,
        Lukasz Majewski <lukma@denx.de>,
        H Hartley Sweeten <hsweeten@visionengravers.com>
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
Date:   Sun, 03 Jul 2022 13:24:05 +0200
In-Reply-To: <CAK8P3a0QDgKfHxri0YOj_4nJdGOD9ALRdCseb2EmJ36S7FrBaQ@mail.gmail.com>
References: <CAK8P3a0Z9vGEQbVRBo84bSyPFM-LF+hs5w8ZA51g2Z+NsdtDQA@mail.gmail.com>
         <0010bbe738eb6853f49f07a6eb6043e0e7f426a8.camel@gmail.com>
         <CAK8P3a0QDgKfHxri0YOj_4nJdGOD9ALRdCseb2EmJ36S7FrBaQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1 
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hello Nikita, Lukasz, Hartley,

On Thu, 2022-06-30 at 09:42 +0200, Arnd Bergmann wrote:
> > > ep93xx
> > >=20
> > > These are still used, and the platform includes the only remaining tw=
o
> > > board files that were added after linux-3.0. DT support is probably
> > > doable now that common-clk works. Need information about which boards
> > > are important.
> >=20
> > I'm still maintaining/able to test CONFIG_MACH_EDB93XX (edb93xx.c).
>=20
> Noted, thanks! We'll leave them in for 2023 then.
>=20
> Any thoughts on long-term uses for the platform? Do you know of users
> of any products other than the reference boards that would justify doing
> a DT conversion, or do we just delete the platform another time?

what are your projections for EP93xx support?

I'm personally a bit pessimistic about DT conversion because existing parti=
tion
tables were already challenged by the kernel growth. It has at least grown
+60% with the same config since 2006. This makes me think that 2023 EOL for=
 this
SoC might be feasible.

--=20
Alexander Sverdlin.

