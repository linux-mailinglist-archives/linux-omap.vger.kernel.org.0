Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 28C0D70717A
	for <lists+linux-omap@lfdr.de>; Wed, 17 May 2023 21:06:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229793AbjEQTG4 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 17 May 2023 15:06:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229458AbjEQTGz (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 17 May 2023 15:06:55 -0400
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [IPv6:2a0b:5c81:1c1::37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18AC41FEB
        for <linux-omap@vger.kernel.org>; Wed, 17 May 2023 12:06:54 -0700 (PDT)
Received: from darkstar.musicnaut.iki.fi (85-76-146-199-nat.elisa-mobile.fi [85.76.146.199])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: aaro.koskinen)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4QM2f24rH7z49Q4J;
        Wed, 17 May 2023 22:06:50 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1684350411;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=s3S7ngo/mfXTaN424p5MuhhWDFhkXZZ13DoY70WHgvc=;
        b=pEbH1kHrFwnSkFWy4IAfWaJmAMcg1WN7ipED/brR69y90xGRfKQvL6VVKwNZL6v/QH9pNc
        lOzNOewKFoEjK28vDRJTXpRXzrTxw64//nDSJhx7KVnR4xQyq3duJwushboR/faqQW3vJR
        VGrkEUTpShn09Dgzy5Ia+QKHJ0sqD80WGgv+xvZzGZCR3v1o9850kOgkkHFGyY6KJSOa7l
        7WRhbrnaC8UTo4ewtXqWSFLPwHWQM6NOd6CFhyMO5Td/hj32yFdrwTUTe22uBDj55mLb3b
        tM2ChxaRajl4TYx1eA577465BnbTVlKiBSTxIf5Gc8gJLHHPkVIsmS/A3PHRoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1684350411;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=s3S7ngo/mfXTaN424p5MuhhWDFhkXZZ13DoY70WHgvc=;
        b=Ii3+Hdo/CJu0Lp4nksnUsTdb2uQ+RvpIS7LRayyKAIeYBszBQbRbx+3sf9lXq4RwiBMsfm
        5sGrJeQVbUVtt+MtjAx83l0j44CSBYF5HNZHKWwYQjR9G56J5s28OwnpzKI0nWUx6Z55Xh
        uNpDijLXX7G9JRA0YQEqIJ/MbcVC4W9yIK+wa8uQwrAOjjoqpg4w1gXyqEBaEE/Io4BeAJ
        0C6I4tb7xevrqtW9xyhvPxt9rq81cdRStoRrt6q1AHJUw1Susi+jw4fNcFlBYaK73tAdOY
        pZYgWQyN5X/2X/MtpqftQgQpWvYWJ+vPa1CElnMWld3653VQAtUbNTQvEuHF0A==
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=aaro.koskinen smtp.mailfrom=aaro.koskinen@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1684350411; a=rsa-sha256;
        cv=none;
        b=sKkZ+grLbO0joNtCunQZtxGowzDML//PeLu8kImgfqF1ZEhnT/fHB66yLpigTSRVNVbSMW
        FgOLr+jTyZc4vRfEONOLRW0X0RsFjI5HJjtwWVxqpMILAtg0koRaTpQ/PjGpMBiW8wjOQ/
        S9S4WjjprPs7+Oc+YWANH0JpT/ExDeM9AuxKt72EBedhpQ9LMD9JNryW0vn1+B+A55IHLp
        lUCiznR9D6joiz6d0acRNtbczGWffZ8O5pTaHOhSaDbazOwaaNaIzB6ueVu+Gm1aI75RtR
        buiX6YdQHwu2rTBh4PQQDdLu/HDG1az0GWqueCRv05edb4jc6DswR746YBh6QA==
Date:   Wed, 17 May 2023 22:06:48 +0300
From:   Aaro Koskinen <aaro.koskinen@iki.fi>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org
Subject: Re: [PATCH] ARM: omap1: Make serial wakeup GPIOs use descriptors
Message-ID: <20230517190648.GF271152@darkstar.musicnaut.iki.fi>
References: <20230430175130.574971-1-linus.walleij@linaro.org>
 <20230517180344.GE271152@darkstar.musicnaut.iki.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230517180344.GE271152@darkstar.musicnaut.iki.fi>
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

On Wed, May 17, 2023 at 09:03:49PM +0300, Aaro Koskinen wrote:
> This patch (now also in gpio-descriptors-omap branch) does not
> compile:
> 
> On Sun, Apr 30, 2023 at 07:51:30PM +0200, Linus Walleij wrote:
> > +		pr_err("No interrupt for UART%d wake GPIO\n" idx + 1);
> 
> Comma is missing.                                          ^^^

And when tested something goes wrong:

[    2.555725] (NULL device *): using lookup tables for GPIO lookup
[    2.561950] (NULL device *): No GPIO consumer wakeup found
[    2.567871] Unable to get UART wakeup GPIO descriptor
[    2.573272] (NULL device *): using lookup tables for GPIO lookup
[    2.579498] (NULL device *): No GPIO consumer wakeup found
[    2.585357] Unable to get UART wakeup GPIO descriptor
[    2.590576] (NULL device *): using lookup tables for GPIO lookup
[    2.596954] (NULL device *): No GPIO consumer wakeup found
[    2.602813] Unable to get UART wakeup GPIO descriptor

There are now two tables with the NULL device - one in the board file,
and another in serial.c. Maybe that does not work?

A.
