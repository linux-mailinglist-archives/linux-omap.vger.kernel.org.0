Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F0EF22ABF4
	for <lists+linux-omap@lfdr.de>; Thu, 23 Jul 2020 11:52:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728156AbgGWJwQ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 23 Jul 2020 05:52:16 -0400
Received: from mail-ej1-f67.google.com ([209.85.218.67]:34222 "EHLO
        mail-ej1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728159AbgGWJwP (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 23 Jul 2020 05:52:15 -0400
Received: by mail-ej1-f67.google.com with SMTP id y10so5732037eje.1;
        Thu, 23 Jul 2020 02:52:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=puQQ+kEDvp4d2ixkulEX0wUmGQuAZ6n3qHTJVU/5Rzc=;
        b=uOaVaHGMj3MZOOD2eGbtuDLkfJAHe6Lo5uitQQlTO2Sr8T2r0qfpm3mng8NNaCNtea
         OSE2UC9euL0ZUBKNoyzwWKiXT3REURpKNthjsWA6PBcbpB1foMQXAm4+cQmE73A3XdBC
         YrE3yJZdCrTMS6SYZ5YUm1bbvdKyed94No6xfHK+hyWGkAvygJoIE5tGAEtl69hXITG+
         cMRFO6t8v46DXydYLRyC+uH0mdAziK6gEgkwY7n4c2mnX5WksI1v/uZxDKSRwWRD5vH+
         JNzeAfQyeJbw7B0+gukxS2xrk9xSQyNZBExGNHYywf8YIDul040xd0tNSiF1l5bHbSFd
         PvJg==
X-Gm-Message-State: AOAM530OfWYM9n6U7Ksi7ANr70/0fUXfUncdZ0PdtFynyLOjKv5Y1d1k
        bXju0dNCl+Exp8DF0pyOFtkPw4251ug=
X-Google-Smtp-Source: ABdhPJyu48ABbekwvtALO2JO+gDw0IjhchbBRuiUgpHvsnkMl605uS9uQX1F3s0EVoraFKz+/aPreg==
X-Received: by 2002:a17:906:d9d9:: with SMTP id qk25mr3760460ejb.448.1595497933238;
        Thu, 23 Jul 2020 02:52:13 -0700 (PDT)
Received: from kozik-lap ([194.230.155.213])
        by smtp.googlemail.com with ESMTPSA id bn7sm1713556ejb.100.2020.07.23.02.52.10
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Jul 2020 02:52:12 -0700 (PDT)
Date:   Thu, 23 Jul 2020 11:52:09 +0200
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
Subject: Re: [RFC PATCH 00/23] memory: Cleanup, improve and compile test
 memory drivers
Message-ID: <20200723095209.GA30472@kozik-lap>
References: <20200723073744.13400-1-krzk@kernel.org>
 <CAK8P3a0hcVhBbKCBDSZYXChmPpRVsEi_G6+oj5quC6uUiPeeiA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAK8P3a0hcVhBbKCBDSZYXChmPpRVsEi_G6+oj5quC6uUiPeeiA@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, Jul 23, 2020 at 11:31:02AM +0200, Arnd Bergmann wrote:
> On Thu, Jul 23, 2020 at 9:37 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >
> > Dear All,
> >
> > The drivers/memory directory contains generic code (of_memory.c) and a
> > bunch of drivers.  Changes to generic code were coming usually through
> > different trees with the driver code.
> >
> > Over last days, memory drivers grew in numbers but not necessarily in
> > quality.  They lacked compile testing and code cleanup.  Also lacked
> > maintainer.
> >
> > I would be happy to take care about this part.
> >
> > If there are no objections, the patches could go either to Linus or to
> > arm-soc (most of drivers are ARM specific).
> >
> > Driver-specific changes in the patchset were only compile-tested. Tests
> > are welcome. The generic code was tested on ARMv7 Exynos based boards
> > with a exynos5422-dmc memory controller driver.
> 
> Overall this looks great, I had a look through the patches and commented
> on the few things that seemed slightly odd though harmless.
> 
> Thanks for picking up the subsystem. How do you want to proceed
> in the long run? I suppose you can send a pull request to soc@kernel.org
> to be picked up for the coming merge window as the normal way, since
> you are not yet listed as the maintained until the end of the series.
> 
> Afterwards you could either send the pull requests to Linus directly,
> or send them to the soc team (or to Greg) as well, the way we handle
> a couple of other subsystems like drivers/reset and drivers/tee that
> usually only have a handful of patches per release.

Most of the drivers are for ARM architecture so arm-soc seems like the
way to do it.  However BT1_L2_CTL and JZ4780_NEMC are MIPS specific and
maybe more would come in the future.  Are you fine taking them as well?

Best regards,
Krzysztof

