Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09DC927F0E3
	for <lists+linux-omap@lfdr.de>; Wed, 30 Sep 2020 19:53:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729980AbgI3Rxf (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 30 Sep 2020 13:53:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727468AbgI3Rxe (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 30 Sep 2020 13:53:34 -0400
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91DAFC0613D2
        for <linux-omap@vger.kernel.org>; Wed, 30 Sep 2020 10:53:34 -0700 (PDT)
Received: by mail-ot1-x343.google.com with SMTP id a2so2658976otr.11
        for <linux-omap@vger.kernel.org>; Wed, 30 Sep 2020 10:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=nmx3GK+BJ0d4VG1MnUd724aknrThpuCxNaLSY0XJ58c=;
        b=xS8WcxEVpDZKYDvgXPcKeyIkiQzftLTmFl1axoEXs0Fs32CiYI0KH+BPVPgCu6eiKV
         42m2Uh5QfSYCU0vvxw0usyqGn8nqfxXeCy3g2usLicSNcT3LdNDZfvdwf2eAoq7kTuUn
         9URHPG0/NHIcclklxub5afY/bGPhuRywQDtbKL7okklvJqXiNrbmgeAh+yJ+QxgUEhP6
         hk7YmdzwYb0o2+fEnedyN4Tsc2cDh2t4jFOssNAd5XW6hSFR06iTvsNyKW9recaLnIvs
         frv4wfZLcvUgM3BDXaCuxAd4Wmdo5FgaXCj0KLCCh2DcHUXmGuk2btBzop8MkZn+T8E/
         O/UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=nmx3GK+BJ0d4VG1MnUd724aknrThpuCxNaLSY0XJ58c=;
        b=tmZN0tbYpTnl9o4gKKjSieR984fg4cUsWxAMLu1iTkHJlxOplqlhQhWV1H4vEs8sbV
         UQswyOdRr8XFV++03wO3J/dfvWV7dKCGxoddxraVaOJ/WoK4LBDgAzlIRf5eTxcS7Pil
         ZUgXl72kn9rX0fKj5IIvg5y10VfQ/1HXjP5gBA/x09GK1zk/UF8yN/3qg/DbEROD0Bup
         dOS17dPOwodGGueQJcFtE0RWaEvaa3BA40RDZJq2YPbzqFfwpvi8SVSUzzKNOOulchOq
         Tj3LKfGXxs2pfQOkVdWvt7GHe51nxgPymP8yD4l/vvl64tfGDppPCoE71smkaux+Qq2a
         jDGw==
X-Gm-Message-State: AOAM53256T490al4eeK12OuGfgCQFfLcrRLj7N6jgJv0huql+WE9ikF5
        y72sCmL1hOlAXeqOHlL8q385BA==
X-Google-Smtp-Source: ABdhPJzpc1y+G2Mh4hI2b6mUBCT6UIG0Wm+AK1cTWmMfvdiwkQpSWSp64VdS6GC+wwAIzRfTI4QyCA==
X-Received: by 2002:a9d:2925:: with SMTP id d34mr2284108otb.140.1601488413886;
        Wed, 30 Sep 2020 10:53:33 -0700 (PDT)
Received: from x1 ([2600:1702:da0:ff40:985b:42bd:cfe:59b7])
        by smtp.gmail.com with ESMTPSA id c19sm555297ooq.35.2020.09.30.10.53.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2020 10:53:33 -0700 (PDT)
Date:   Wed, 30 Sep 2020 12:53:30 -0500
From:   Drew Fustini <drew@beagleboard.org>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        =?iso-8859-1?Q?Beno=EEt?= Cousson <bcousson@baylibre.com>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>,
        Trent Piepho <tpiepho@gmail.com>
Subject: Re: [PATCH] pinctrl: single: check if #pinctrl-cells exceeds 3
Message-ID: <20200930175330.GA1295202@x1>
References: <20200913210825.2022552-1-drew@beagleboard.org>
 <CACRpkdZXu9g_Rq7707-6hXqPVfbxPBcrnR8KwLm+zOgS_EabAQ@mail.gmail.com>
 <20200930051659.GO9471@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200930051659.GO9471@atomide.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, Sep 30, 2020 at 08:16:59AM +0300, Tony Lindgren wrote:
> * Linus Walleij <linus.walleij@linaro.org> [200929 12:51]:
> > On Sun, Sep 13, 2020 at 11:17 PM Drew Fustini <drew@beagleboard.org> wrote:
> > 
> > > The property #pinctrl-cells can either be 2 or 3.  There is currently
> > > only a check to make sure that #pinctrl-cells is 2 or greater.  This
> > > patch adds a check to make sure it is not greater than 3.
> > >
> > > Fixes: a13395418888 ("pinctrl: single: parse #pinctrl-cells = 2")
> > > Reported-by: Trent Piepho <tpiepho@gmail.com>
> > > Link: https://lore.kernel.org/linux-omap/3139716.CMS8C0sQ7x@zen.local/
> > > Signed-off-by: Drew Fustini <drew@beagleboard.org>
> > 
> > Tony, does this and the other patch look good to you?
> 
> Hmm well the description looks a bit confusing, #pinctrl-cells can
> also be 1 that's the default. Might be worth clarifying that part.
> 
> Regards,
> 
> Tony

Yes, that was my fault for confusing #pinctrl-cells with
pinctrl_spec.args_count.

- if #pinctrl-cells = <1>, then pinctrl_spec.args_count = 2
- if #pinctrl-cells = <2>, then pinctrl_spec.args_count = 3
- all other values are not valid

I will post a v2.

Thanks,
Drew
