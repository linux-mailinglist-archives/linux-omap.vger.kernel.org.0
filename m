Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB9566EFC43
	for <lists+linux-omap@lfdr.de>; Wed, 26 Apr 2023 23:15:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233922AbjDZVPD (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 26 Apr 2023 17:15:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232909AbjDZVPC (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 26 Apr 2023 17:15:02 -0400
Received: from mail.andi.de1.cc (mail.andi.de1.cc [IPv6:2a01:238:4321:8900:456f:ecd6:43e:202c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 325FAE51
        for <linux-omap@vger.kernel.org>; Wed, 26 Apr 2023 14:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kemnade.info; s=20220719; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=4OcyMKbkqqXEG/cAsS7FW0v70CaVoIPmCXfz7WpVyiQ=; b=g4sElXXFuKFXBHfztAinfryxHH
        wqGnbElxIX/+VjfgGu4L7jlpSgcSWq1J05DGbkwDmG1YnulGbmhsQR7Lbxn1AzJARKAlf9Eqh3eMS
        CJ/nTiSIElo970OiWOyw+vsXZDr4kawpt3SNtb9DHmFs68Lj68ZuT0xcmupkFNVE8GxC/ftZMmqlc
        rd+uuuw8hOLHfQvZjbxjK4/OLiJAlEwnexsgzQmGYm3v+0zO8qQTkLMvBKFIZe3baWK5Ty71Jy/l3
        scNi4rlJisOjeA0Z/3GkrVT8w1hNfiFmIj0wSGNGLAJ5u1Le/ewV9LDigAbR2hrV5DjMYxF8Qa1bH
        GRQ/oCkA==;
Received: from p200300ccff09c2001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:cc:ff09:c200:1a3d:a2ff:febf:d33a] helo=aktux)
        by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1prmTN-0008CN-Bz; Wed, 26 Apr 2023 23:14:45 +0200
Date:   Wed, 26 Apr 2023 23:14:43 +0200
From:   Andreas Kemnade <andreas@kemnade.info>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        andy.shevchenko@gmail.com, Lee Jones <lee@kernel.org>
Subject: Re: [PATCH] ARM/mfd/gpio: Fixup TPS65010 regression on OMAP1 OSK1
Message-ID: <20230426231443.516cf387@aktux>
In-Reply-To: <20230426203341.360155-1-linus.walleij@linaro.org>
References: <20230426203341.360155-1-linus.walleij@linaro.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.24; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Score: -1.0 (-)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,T_SCC_BODY_TEXT_LINE,
        T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, 26 Apr 2023 22:33:41 +0200
Linus Walleij <linus.walleij@linaro.org> wrote:

> Aaro reports problems on the OSK1 board after we altered
> the dynamic base for GPIO allocations.
> 
> It appears this happens because the OMAP driver now
> allocates GPIO numbers dynamically, so all that is
> references by number is a bit up in the air.
> 
> Let's bite the bullet and try to just move the gpio_chip
> in the tps65010 MFD driver over to using dynamic allocations.
> Alter everything in the OSK1 board file to use a GPIO
> descriptor table and lookups.
> 
> Utilize the NULL device to define some board-specific
> GPIO lookups and use these to immediately look up the
> same GPIOs, convert to IRQ numbers and pass as resources
> to the devices. This is ugly but should work.
> 
> The .setup() callback for tps65010 was used for some GPIO
> hogging, but since the OSK1 is the only user in the entire
> kernel we can alter the signatures to something that
> is helpful and make a clean transition.
> 
> Fixes: 7b61212f2a07 ("gpiolib: Get rid of ARCH_NR_GPIOS")

Rather:
Fixes: 92bf78b33b0b4 ("gpio: omap: use dynamic allocation of base")?

Which was introduced to fix
7b61212f2a07 ("gpiolib: Get rid of ARCH_NR_GPIOS")

Regards,
Andreas
