Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B82C45612ED
	for <lists+linux-omap@lfdr.de>; Thu, 30 Jun 2022 09:10:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231838AbiF3HKQ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 30 Jun 2022 03:10:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231539AbiF3HKQ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 30 Jun 2022 03:10:16 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id AB85A2E9D4
        for <linux-omap@vger.kernel.org>; Thu, 30 Jun 2022 00:10:15 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id E361680B0;
        Thu, 30 Jun 2022 07:04:58 +0000 (UTC)
Date:   Thu, 30 Jun 2022 10:10:13 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Arnd Bergmann <arnd@kernel.org>
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
        Alexander Sverdlin <alexander.sverdlin@gmail.com>,
        Hartley Sweeten <hsweeten@visionengravers.com>,
        linux-omap <linux-omap@vger.kernel.org>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Sekhar Nori <nsekhar@ti.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andrew Lunn <andrew@lunn.ch>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Gregory CLEMENT <gregory.clement@bootlin.com>,
        Lennert Buytenhek <kernel@wantstofly.org>,
        Marc Zyngier <maz@kernel.org>,
        Mauri Sandberg <maukka@ext.kapsi.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: Re: Scheduling (unused) board file removal for linux-6.x
Message-ID: <Yr1MVY/Biq0xA5vl@atomide.com>
References: <CAK8P3a0Z9vGEQbVRBo84bSyPFM-LF+hs5w8ZA51g2Z+NsdtDQA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a0Z9vGEQbVRBo84bSyPFM-LF+hs5w8ZA51g2Z+NsdtDQA@mail.gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

* Arnd Bergmann <arnd@kernel.org> [220629 20:38]:
> omap1
> 
> common-clk and multiplatform support just landed. There are three boards
> that are likely to be in use (ams-delta, osk and nokia770) and two boards
> supported by qemu (sx1 and palmte), so we may want to keep those and
> try to eventually convert them to DT. The rest can probably get retired.

Sounds good to me. It's best to put the effort where there is some
activity. If somebody cares about other board files, please step up :)

> davinci
> 
> DT conversion has stalled, and there are 12 remaining board files,
> mostly for evaluation machines. No idea if any are still in use.

Since we already have arch/arm/boot/dts/da850* supported, removing the
remaining board files sounds good to me. Again, if somebody cares to
step up please respond :)

Regards,

Tony
