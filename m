Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC1BC703F33
	for <lists+linux-omap@lfdr.de>; Mon, 15 May 2023 23:03:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245225AbjEOVDD (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 15 May 2023 17:03:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243904AbjEOVDC (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 15 May 2023 17:03:02 -0400
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6280630C3
        for <linux-omap@vger.kernel.org>; Mon, 15 May 2023 14:03:01 -0700 (PDT)
Received: from darkstar.musicnaut.iki.fi (85-76-146-199-nat.elisa-mobile.fi [85.76.146.199])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: aaro.koskinen)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4QKsJw2zT8z49Q47;
        Tue, 16 May 2023 00:02:56 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1684184578;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=094eg8rV8m1QUZwptZQ7jZafFHvtbL2jM3rxppZlfxw=;
        b=lk0WQBaoCvN0laTJMLkjoYZ1xjlyYUwL4Nx1YLS+0a9iGjarw3uK5u3es8QXH40eROXrnr
        qclEWPGWtmfUOhRYJYcBmmbwRXpNQQiuXn1/3sfEX/IcO0K45p/zFrP+rGQsqol+9WVQFI
        bH59iJgt4UgzzdEkQRQas65Z8/zPvLT5HGwKxfJvOSXoNs75az4C/z4Q/6mKaTdRnqtECL
        6oWRW/hdXJnMRcJnhfTlHASFBGnetQDZlYBUUbfAnqgbk9KKJ+/jcjLdGuaw3u4JF3shPN
        ATuxNMUitlGnMVwbis1j6Y4nVlVwIyBCTVeXC2HnhpSQhH9msDhA4Cms54b3vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1684184578;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=094eg8rV8m1QUZwptZQ7jZafFHvtbL2jM3rxppZlfxw=;
        b=vXzVq3bHQEVWEuBlPrc5LA82+IvFE1fHUgH2TgvAhuJXFhP4EHCOKdvOAglDjKbcH/d1jf
        ik/o2GKbI6gQN4gmB9BdGslshDcfhLAjyQXptMDKpMx6kqWa9MrzKfFSG9rAJiOFrvy7OF
        QE8manKC/vEpkW8DNVw3/gmTKfJFl14hZOWfxwVBTqqsUK1tcPZgAuvri2g4zrbl49Pw9o
        JsAbaK794rGcOI/8TSlmBPRDNtBtJpUKaski5Zjjrm5kWr70ISqUjL7tkmPqILPzhNo4fG
        LE71zrbFaM6kylLL19FQ3mw3cW0jXM5qnTvc++Fr6PcOiZjlsEt04CuVHAHdUw==
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=aaro.koskinen smtp.mailfrom=aaro.koskinen@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1684184578; a=rsa-sha256;
        cv=none;
        b=ZjgYmiSpt2+fF5UhzV8C4Jcwa/j5E9f7KxVLio8rkd5P2qbmEEEYOXHIjWvz/RoCKAzFZl
        9Py4FMohrbV37Y5LxrCUQuxrloC3qgwGsPe8gszcEhLnf65grRs1RV0ZjSsYI2AaRIxPuq
        AlVfkEsKl6Uj6H5wnMeNnM6xUlrLW03pgcbXEdeMKHw9qY5ew7XO4KsmJ5OpNAibIz9yIY
        Tl1YzCQD1yXRCFeUSSFWQOkDZ36qYz1x5SevWay0+fIcH/mlmO0rua9WIqlAdHLB2dY9Yn
        VD7j4bJWEqn63HGtApHWUnxcgwpyRVWoGPARf7e2lKFfGSyiKW5+2kiQBP2E2g==
Date:   Tue, 16 May 2023 00:02:54 +0300
From:   Aaro Koskinen <aaro.koskinen@iki.fi>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        andy.shevchenko@gmail.com, Andreas Kemnade <andreas@kemnade.info>,
        Lee Jones <lee@kernel.org>
Subject: Re: [PATCH v3] ARM/mfd/gpio: Fixup TPS65010 regression on OMAP1 OSK1
Message-ID: <20230515210254.GA271152@darkstar.musicnaut.iki.fi>
References: <20230430093505.561265-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230430093505.561265-1-linus.walleij@linaro.org>
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

On Sun, Apr 30, 2023 at 11:35:05AM +0200, Linus Walleij wrote:
> Aaro reports problems on the OSK1 board after we altered
> the dynamic base for GPIO allocations.
> 
> It appears this happens because the OMAP driver now
> allocates GPIO numbers dynamically, so all that is
> references by number is a bit up in the air.

There is still a problem that smc_irq is not working. It seems when I
tested the previous version, I only quickly checked that the eth0 again
probes and the link comes up, without testing any actual traffic - sorry.

It seems the irq is stuck hi:

gpiochip1: GPIOs 208-223, parent: platform/omap_gpio.1, gpio-0-15:
 gpio-208 (                    |smc_irq             ) in  hi IRQ

To fix it I had to add:

	irq_set_irq_type(gpiod_to_irq(d), IRQ_TYPE_EDGE_RISING);

But I'm not sure why this is now needed?

A.
