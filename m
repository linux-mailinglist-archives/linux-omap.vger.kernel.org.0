Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E48A07052E1
	for <lists+linux-omap@lfdr.de>; Tue, 16 May 2023 17:53:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234352AbjEPPxd (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 16 May 2023 11:53:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234353AbjEPPxT (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 16 May 2023 11:53:19 -0400
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB36293D7
        for <linux-omap@vger.kernel.org>; Tue, 16 May 2023 08:52:31 -0700 (PDT)
Received: from darkstar.musicnaut.iki.fi (85-76-146-199-nat.elisa-mobile.fi [85.76.146.199])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: aaro.koskinen)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4QLLN16TB9z49Q7H;
        Tue, 16 May 2023 18:52:17 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1684252339;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=kSYyLsSZT49dNmTVApIM43IiREtU/502L6HxZl4PYGE=;
        b=J8X6wf5kEEJCdfI13eBvowk96/kmxsxoA3UtNLfLg2U5upFhu0SYDp9Ga3VGuNPzcQZDTF
        V/Al4dRlG14ptsF0BSTuFV8yd7huIK5wkw1jLypjfewoG78RO6wjPS9IEoSgnOVx9i/W9Q
        qMrHeh0u/fRRMEopLBdHbRLEJpPc/JY74R0Hgg2Repxlwn0ura+jQWe14VjDrUa4Bj7xTA
        aYAVSMeW4ISuILkZGaEuIfGlcJc/PACP+3yVwwMUYOcmuGeHqPdxVefo0/e1vN8KRCmC2/
        v5gMR8xLh/ootQxBYUZIg5fWerRQksi5R1YKAUREzXC9HGLZu3ASwskQuHDfLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1684252339;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=kSYyLsSZT49dNmTVApIM43IiREtU/502L6HxZl4PYGE=;
        b=c1h0YRbTU0qk1+nfjVhztBt0J4GvdTnOIuGkx6n5f5vkjMPmtqxa1TLsLHvGoVPJ9KZIxl
        jNFFqrDXZNoBEDsDoBLNANpk7i5Akr+rQf4IkVz96VLt+5Rbqade8lrWPSe781zA9tCP2L
        rOKRqyJEqdxU43RO2oSvvbmy7umn7eU4kbPRS9lpdyT6ntno7kT8kiaSmWfReewYuGM7Hv
        fC+zcwUv2okOxM23ThWKlfKDHJGUdOnoKcF0lwCD+Egji1WWkZhfNXCU3cGNrdUb+/xnGg
        osOR/JCyeuH19A4v+acHcwLVxVbJdF61sG1RhYsb+HTPBkkopATsQpRXvdJPCw==
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=aaro.koskinen smtp.mailfrom=aaro.koskinen@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1684252339; a=rsa-sha256;
        cv=none;
        b=tb2sL2hfUgE8UttLybWm5zuiJonoCW35YlbY6MPLeQO8QiSfgkw8bUWYQHCaAGV7tgpPgJ
        mB6tBkIrWK5mAzlrpPAlncl3cEaxk+k2YQ3ikUy26mtfA4FNnKgrzvhU4oFLDs8Kpv0OX4
        MnJmV9oya4swyjD4CK/mZEcCV0jZnDla+ylw8PmBT5GQmkg+Q/6hjwoaTF2yJNe8lTlSl6
        RFYUjs27nq1658UsZ9bYlWKvaTYMqZgMZZtzs78K9vOk5bS846S2jiGgS5dPNijHVj7jzv
        G/JZkq391NA/abxELFmwhNVlDgGGbnvKNoIhxktJuWJ/pFrKJGCNQLFEEJ2MtQ==
Date:   Tue, 16 May 2023 18:52:15 +0300
From:   Aaro Koskinen <aaro.koskinen@iki.fi>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        andy.shevchenko@gmail.com, Andreas Kemnade <andreas@kemnade.info>,
        Lee Jones <lee@kernel.org>
Subject: Re: [PATCH v3] ARM/mfd/gpio: Fixup TPS65010 regression on OMAP1 OSK1
Message-ID: <20230516155215.GB271152@darkstar.musicnaut.iki.fi>
References: <20230430093505.561265-1-linus.walleij@linaro.org>
 <20230515210254.GA271152@darkstar.musicnaut.iki.fi>
 <CACRpkdYauX+Q2p+Nccxmd__fxjEjyGvs=Oysv-5BaArSScV2wg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdYauX+Q2p+Nccxmd__fxjEjyGvs=Oysv-5BaArSScV2wg@mail.gmail.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

On Tue, May 16, 2023 at 02:07:31PM +0200, Linus Walleij wrote:
> On Mon, May 15, 2023 at 11:02 PM Aaro Koskinen <aaro.koskinen@iki.fi> wrote:
> 
> > There is still a problem that smc_irq is not working. It seems when I
> > tested the previous version, I only quickly checked that the eth0 again
> > probes and the link comes up, without testing any actual traffic - sorry.
> >
> > It seems the irq is stuck hi:
> >
> > gpiochip1: GPIOs 208-223, parent: platform/omap_gpio.1, gpio-0-15:
> >  gpio-208 (                    |smc_irq             ) in  hi IRQ
> >
> > To fix it I had to add:
> >
> >         irq_set_irq_type(gpiod_to_irq(d), IRQ_TYPE_EDGE_RISING);
> 
> I just added that onliner, it gives a nice symmetry to the CF card
> IRQ.

It seems you forgot to add braces as they are now needed for if .. else:

+	d = gpiod_get(NULL, "smc_irq", GPIOD_IN);
+	if (IS_ERR(d))
+		pr_err("Unable to get SMC IRQ GPIO descriptor\n");
+	else
+		irq_set_irq_type(gpiod_to_irq(d), IRQ_TYPE_EDGE_RISING);
+		osk5912_smc91x_resources[1] = DEFINE_RES_IRQ(gpiod_to_irq(d));
+

> > But I'm not sure why this is now needed?
> 
> Me neither. I hope some people will test the other boards as well,
> or I will fix them as they report breakage, as is custom.

I will try to test all the OMAP1 boards.

A.
