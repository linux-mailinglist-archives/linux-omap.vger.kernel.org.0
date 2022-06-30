Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3FDB85620BB
	for <lists+linux-omap@lfdr.de>; Thu, 30 Jun 2022 19:01:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235796AbiF3RBL (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 30 Jun 2022 13:01:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235236AbiF3RBJ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 30 Jun 2022 13:01:09 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26264255A7
        for <linux-omap@vger.kernel.org>; Thu, 30 Jun 2022 10:01:09 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id BED9A62104
        for <linux-omap@vger.kernel.org>; Thu, 30 Jun 2022 17:01:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44DBFC3411E;
        Thu, 30 Jun 2022 17:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1656608468;
        bh=hbNcrIc7xUuJwbrXXRKoHML29Kl+ElgToPNe8ccTRbA=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=FIA4j/Hk8cndLukN2540ZrRFti9FaidbD+UdH68pLA+ll39FuSl7CKthnQF3ycNFL
         n8hqIXhjicOtSi3MpbFKN+Gf6OS0f+i6UZxiSspNAgcC2k69ffoekCjCy+N/vGgGop
         O1cO0xDohY6rdfFgId4g6XIzNiiNSI7L29nMOr2WOJ+7lstwgQe4Uvtz26cH/nrjek
         0OfzHPcW2aksEscfI0iw4gy3JeFMt7Urw1TtOGaDf6MsZFs+Fe576Q8xG+Y0ejLE0m
         kcnOe8stTLl8BCZEcF+SurrIcBDHu0yKby5J8ry923Yb7/KDPrdsGB2d2vnBLl9jok
         w39Cj9kF0bmag==
Message-ID: <a146fdb4-4fa7-e4e8-7084-1e630c61a66b@kernel.org>
Date:   Thu, 30 Jun 2022 19:00:30 +0200
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
        Mauri Sandberg <maukka@ext.kapsi.fi>,
        Mark Brown <broonie@kernel.org>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Tomasz Figa <tfiga@google.com>
References: <CAK8P3a0Z9vGEQbVRBo84bSyPFM-LF+hs5w8ZA51g2Z+NsdtDQA@mail.gmail.com>
 <1413e8b9-5e55-e121-926e-38cb66d152ee@kernel.org>
 <CAK8P3a2br8pmFf=SG9OzZOPfyw36kOxKiyMLm_KWfsQPOnqyRg@mail.gmail.com>
 <7ae70216-d29e-6555-5b0f-6ab4d5632970@kernel.org>
 <CAK8P3a2zc6rP+frkuT4S5wDJDyxnihij8M4coDcfABJRKb-yOg@mail.gmail.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <CAK8P3a2zc6rP+frkuT4S5wDJDyxnihij8M4coDcfABJRKb-yOg@mail.gmail.com>
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

On 30/06/2022 14:10, Arnd Bergmann wrote:

>>
>> OK, if you have some idea which one could be the candidates.
>> Unfortunately I cannot provide here inputs - I have no clue which of S3C
>> boards have users.
> 
> The only one I know of is MACH_WLF_CRAGG_6410, as Mark Brown
> has pointed this one out as being used as the testbed for Wolfson/Cirrus
> audio codecs. The machine is also the only one that shows being worked
> on from the git history. The last patches I found that look like they were
> boot tested on other machines include work by Kukjin Kim in 2015 and by
> Sergio Prado in 2016, but I don't see which boards they were using, and
> I don't think they still care. Thomasz Figa had access to multiple
> machines back in 2014, but he converted those to use DT.
> 
> If we follow the same approach that I'm suggesting for the other
> platforms and nobody else speaks up, that would leave only the DT
> boards plus the Cragganmore.

Huhu, that would be nice spring cleaning! Sure, let's go with board
removal except mentioned Mark's one.


Best regards,
Krzysztof
