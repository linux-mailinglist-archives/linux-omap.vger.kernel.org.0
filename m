Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B343056168E
	for <lists+linux-omap@lfdr.de>; Thu, 30 Jun 2022 11:39:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234454AbiF3JjW (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 30 Jun 2022 05:39:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234435AbiF3JjO (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 30 Jun 2022 05:39:14 -0400
Received: from ni.piap.pl (ni.piap.pl [195.187.100.5])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B29C02E2
        for <linux-omap@vger.kernel.org>; Thu, 30 Jun 2022 02:39:11 -0700 (PDT)
Received: from t19.piap.pl (OSB1819.piap.pl [10.0.9.19])
        by ni.piap.pl (Postfix) with ESMTPSA id 8CB0EC3F3EDC;
        Thu, 30 Jun 2022 11:39:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 ni.piap.pl 8CB0EC3F3EDC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=piap.pl; s=mail;
        t=1656581947; bh=INqtZw7d8KFcn6LeudMcV9s5qz0Z4tq7JKjoCN4ZVtg=;
        h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
        b=M7hidq7qTrQE2oIaJ84LzuUWkNohE+gV/3iuF538kkLx+QBT/BoR9ZlF5N+vzHusZ
         5YViIdsjJcmRNIVxmJD6Ev18pBs1m6f3P96JFzZxHtUkaOPdlC4kgXYCY/orHzn/UI
         SuM/+l6UOa7eoLbxECOqPF9wHl2Z3bZnIt+Emb0o=
From:   =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Russell King <rmk+kernel@armlinux.org.uk>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
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
Subject: Re: Scheduling (unused) board file removal for linux-6.x
References: <CAK8P3a0Z9vGEQbVRBo84bSyPFM-LF+hs5w8ZA51g2Z+NsdtDQA@mail.gmail.com>
Sender: khalasa@piap.pl
Date:   Thu, 30 Jun 2022 11:39:04 +0200
In-Reply-To: <CAK8P3a0Z9vGEQbVRBo84bSyPFM-LF+hs5w8ZA51g2Z+NsdtDQA@mail.gmail.com>
        (Arnd Bergmann's message of "Wed, 29 Jun 2022 22:42:58 +0200")
Message-ID: <m3sfnm5w3r.fsf@t19.piap.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-KLMS-Message-Action: skipped
X-KLMS-AntiSpam-Status: not scanned, license restriction
X-KLMS-AntiPhishing: not scanned, license restriction
X-KLMS-AntiVirus: Kaspersky Security for Linux Mail Server, version 8.0.3.30, not scanned, license restriction
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Arnd,

> cns3xxx
>
> There is only one reference board here, the actual products that were
> previously supported, none of the board files from openwrt (now gone) made
> it in, and the DT support was never completed, so the entire platform can
> go away. We could also consider dropping the other arm11mpcore platforms
> (oxnas and the mpcore variants of realview/integrator) at the same time,
> since there are known issues with the CPU core.

I still have multiple CNS3xxx dual core boards (Gateworks Laguna) but
TBH I haven't used them for 3 years. They are fine boards, sure, but
I guess their time has long passed.
--=20
Krzysztof "Chris" Ha=C5=82asa

Sie=C4=87 Badawcza =C5=81ukasiewicz
Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
Al. Jerozolimskie 202, 02-486 Warszawa
