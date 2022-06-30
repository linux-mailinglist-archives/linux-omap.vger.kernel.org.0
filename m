Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A72755612F1
	for <lists+linux-omap@lfdr.de>; Thu, 30 Jun 2022 09:11:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229728AbiF3HKq (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 30 Jun 2022 03:10:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230160AbiF3HKp (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 30 Jun 2022 03:10:45 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F17562E9D4
        for <linux-omap@vger.kernel.org>; Thu, 30 Jun 2022 00:10:44 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id B26D9B828C2
        for <linux-omap@vger.kernel.org>; Thu, 30 Jun 2022 07:10:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EF36C34115;
        Thu, 30 Jun 2022 07:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1656573042;
        bh=Y+AUqoURDAycPB9UGVfadSmfG2RRmL8S3RK7conX7U0=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=ORNNYvbQnwABXLvhX0ingCb1ZKQJIDCeZajFH2HVFoOfSOe2XQ9uv8puCdTdLA8U+
         7w2CnsvbiOmL3sZgf86BbU/KsXD+DSYnvjx1Uc0i2I7cuLxoxmKZ2CWnlfRT1eHiZ8
         S4gRF9lTcF33Az2GDNg4K33VnhvaTWDir8E5aopEHBmuI9smIOBVBwoIwD0MyvwT8q
         usHkzZ+dHREqJ3r6D6cNAy7vrGc4aJanfRFdsDsO5DyGcol+8+cepqumK+PnS7RRMz
         fhW616nmJSOHMwf2DvyPDKBnx/iD2rOP2Orgpsmt1hLzL1wEmp8oHBTIvpoXv5fqlh
         G+ASsLw3x6qkg==
Message-ID: <1413e8b9-5e55-e121-926e-38cb66d152ee@kernel.org>
Date:   Thu, 30 Jun 2022 09:10:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: Scheduling (unused) board file removal for linux-6.x
Content-Language: en-US
To:     Arnd Bergmann <arnd@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Cc:     Russell King <rmk+kernel@armlinux.org.uk>,
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
References: <CAK8P3a0Z9vGEQbVRBo84bSyPFM-LF+hs5w8ZA51g2Z+NsdtDQA@mail.gmail.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <CAK8P3a0Z9vGEQbVRBo84bSyPFM-LF+hs5w8ZA51g2Z+NsdtDQA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 29/06/2022 22:42, Arnd Bergmann wrote:
> With the multiplatform work completed in the past merge window, and the
> scheduled deprecation of the Samsung s3c platforms, I decided to have a
> look at the remaining board files. There are 196 remaining boards, down
> from 489 boards ten years ago, but my estimate is that only few of those
> ever booted a linux-5.x kernel, and even less for future kernels. The
> question is how to find out which ones are still used, and which ones
> can go.
> 
> I would propose that we start by changing the assumption that all boards
> might be used, instead assuming that they are all outdated unless someone
> says that they actually prefer to keep it in the kernel.  I have started
> a list of all 196 boards and annotated the ones that look like candidates
> for removal [1]. If a board you use is on that list, please either reply
> here or add a comment in the document.
> 
> Unless someone has a better idea for how to proceed, I would allow
> six months for users to speak up and then remove the orphaned board
> files for the release following the LTS kernel. I can't list all boards
> individually, so here is a breakdown by platform:
> 
> s3c24xx
> 
> These are all scheduled for removal in early 2023 already, once the next
> longterm stable kernel is out. No changes here, but it seems useful
> to use the same timeline for removing unused board files of the other
> platforms together.
> 
> s3c64xx
> 
> There are ten board files, which are currently scheduled for removal in
> 2024, along with the DT based boards for this SoC. We can still decide
> to throw out some of the board files earlier though, while keeping the
> platform around.

I would keep all s3c24xx/s3c64xx boards till the platform drop. Removing
few boards before platform won't give us huge benefits... and anyway
just 1 and 2 years and they all will be gone.

Best regards,
Krzysztof
