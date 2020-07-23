Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2605122AC24
	for <lists+linux-omap@lfdr.de>; Thu, 23 Jul 2020 12:08:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727997AbgGWKIT (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 23 Jul 2020 06:08:19 -0400
Received: from mail-ej1-f68.google.com ([209.85.218.68]:38099 "EHLO
        mail-ej1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727828AbgGWKIT (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 23 Jul 2020 06:08:19 -0400
Received: by mail-ej1-f68.google.com with SMTP id br7so5758547ejb.5;
        Thu, 23 Jul 2020 03:08:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=XDRXKhZ8bECB/0hKnCNux0bgmgLiM0R8AAOfy3Lf7I4=;
        b=caioMgqV5eeMM4Rm0Jt8AH0aAQHRzzaZElsKfRJCPi+ihDEAL3GzFD7FjegRfWd7Ak
         V7Zea0zEaxHOXlAB7XW09mhhPM6MXSNfJbMujMdHaCkEeg1l5DkGqnEZm0fDKL0UfyKj
         eNt+4MYSNHRjDqlOl8j4lmKW1fD0slsMW9D7GQ0bSC8kcy0xBFYom58eBz3AWVU3X4V5
         B52WKrxDStbWKY0ZdAjQKVf/QKSa5ynykqc8DqoQvULUI1UBMQgMXSQG2W50R32mvdfn
         y8OnU27UvUkpSDLpCpv/3PU5KsgS/0SHhHBPuoaILePWonWGek5HIv3KxKjW6Uq5Aw1g
         tsKA==
X-Gm-Message-State: AOAM533gHUr/d0U2bTlFfc47z+RJhPrKf/PdKrMh2/dlg+Yneld19oyc
        YWRA2oeOGAGdjZ7nLaeQgwk=
X-Google-Smtp-Source: ABdhPJzgAgG+vnt1QaigoG55Zk1ZcSQLRHkD+NArOZpeGKQIdaJNSffWJFnJuyD3vyPvmz52dwBm7A==
X-Received: by 2002:a17:906:6852:: with SMTP id a18mr3546617ejs.348.1595498897021;
        Thu, 23 Jul 2020 03:08:17 -0700 (PDT)
Received: from kozik-lap ([194.230.155.213])
        by smtp.googlemail.com with ESMTPSA id d19sm1693779ejk.47.2020.07.23.03.08.13
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Jul 2020 03:08:16 -0700 (PDT)
Date:   Thu, 23 Jul 2020 12:08:12 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Olof Johansson <olof@lixom.net>, arm-soc <arm@kernel.org>,
        SoC Team <soc@kernel.org>, Markus Mayer <mmayer@broadcom.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Roger Quadros <rogerq@ti.com>,
        Tony Lindgren <tony@atomide.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC..." 
        <linux-mediatek@lists.infradead.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 20/23] memory: omap-gpmc: Fix whitespace issue
Message-ID: <20200723100812.GC30472@kozik-lap>
References: <20200723073744.13400-1-krzk@kernel.org>
 <20200723073744.13400-21-krzk@kernel.org>
 <CAK8P3a1=WCQ5326Et5RRK7yiOYeHH7uUkQ+T3YPtj2XRh+gkgA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAK8P3a1=WCQ5326Et5RRK7yiOYeHH7uUkQ+T3YPtj2XRh+gkgA@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, Jul 23, 2020 at 11:11:08AM +0200, Arnd Bergmann wrote:
> On Thu, Jul 23, 2020 at 9:39 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> 
> > @@ -1756,7 +1756,7 @@ static int gpmc_calc_common_timings(struct gpmc_timings *gpmc_t,
> >  /* TODO: remove this function once all peripherals are confirmed to
> >   * work with generic timing. Simultaneously gpmc_cs_set_timings()
> >   * has to be modified to handle timings in ps instead of ns
> > -*/
> > + */
> 
> This still doesn't follow the normal coding style for multi-line comments.
> 
> I don't think it's worth fixing, but if you think it should be changed, then
> make it
> 
>      /*
>       * mult-line comment
>       * ...
>       */

Sure, thanks for feedback.

Best regards,
Krzysztof

