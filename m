Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF21656163C
	for <lists+linux-omap@lfdr.de>; Thu, 30 Jun 2022 11:23:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232340AbiF3JWx (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 30 Jun 2022 05:22:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234645AbiF3JWk (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 30 Jun 2022 05:22:40 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D76E20BDF
        for <linux-omap@vger.kernel.org>; Thu, 30 Jun 2022 02:22:31 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id C9CF6B827E3
        for <linux-omap@vger.kernel.org>; Thu, 30 Jun 2022 09:22:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 673D0C34115;
        Thu, 30 Jun 2022 09:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1656580948;
        bh=HLZYLpIFLXZ9yGMHQ0gp+z7ufeE0cfRlcTTcZhnq+B8=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=QolzpK3qYEU/K9FFuo/sjYpZF4qSA+WgLLZUlwQCqGg2+x+GvaO6sO5Q/sjqHzS7Z
         3QyWVtiAYGhasxrP07cr+y07WqRQTjqSCjKwPP/vaom8aBUmTk89tyB8/uSR5t+0Cu
         sSbwT38D1hEwhz+o6DiqF/kgzwmt4q68ql9ycGZS6KDytRrn6HIFLFLYeF6Fx465cI
         LI7N/I7lSafQaL9z+xIPz4qrGsiK8iw/XSNaf3OxglbX6kzuplVDh5irsIw0jui4JQ
         dmKKkno4cOUisnYglwgpw7YoWCDQ+FUq5TBITVMiRtw7K3A0l08lMITsGTGofx3gEL
         TxV+JXwumW3Hg==
Message-ID: <7ae70216-d29e-6555-5b0f-6ab4d5632970@kernel.org>
Date:   Thu, 30 Jun 2022 11:22:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: Scheduling (unused) board file removal for linux-6.x
Content-Language: en-US
To:     Arnd Bergmann <arnd@kernel.org>
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
References: <CAK8P3a0Z9vGEQbVRBo84bSyPFM-LF+hs5w8ZA51g2Z+NsdtDQA@mail.gmail.com>
 <1413e8b9-5e55-e121-926e-38cb66d152ee@kernel.org>
 <CAK8P3a2br8pmFf=SG9OzZOPfyw36kOxKiyMLm_KWfsQPOnqyRg@mail.gmail.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <CAK8P3a2br8pmFf=SG9OzZOPfyw36kOxKiyMLm_KWfsQPOnqyRg@mail.gmail.com>
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

On 30/06/2022 11:08, Arnd Bergmann wrote:
> On Thu, Jun 30, 2022 at 9:10 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>> On 29/06/2022 22:42, Arnd Bergmann wrote:
>>>
>>> s3c64xx
>>>
>>> There are ten board files, which are currently scheduled for removal in
>>> 2024, along with the DT based boards for this SoC. We can still decide
>>> to throw out some of the board files earlier though, while keeping the
>>> platform around.
>>
>> I would keep all s3c24xx/s3c64xx boards till the platform drop. Removing
>> few boards before platform won't give us huge benefits... and anyway
>> just 1 and 2 years and they all will be gone.
> 
> I think there is benefit in throwing out some unused s3c64xx boards
> even earlier, as this would simplify some treewide cleanups that have to
> touch every board file, and potentially let us drop some peripheral
> device drivers that have no other users and no DT probing.
> 
> Ten boards is of course not a lot, but it's still about a third of the
> board files I have currently marked as sticking around past early
> 2023.

OK, if you have some idea which one could be the candidates.
Unfortunately I cannot provide here inputs - I have no clue which of S3C
boards have users.

Best regards,
Krzysztof
