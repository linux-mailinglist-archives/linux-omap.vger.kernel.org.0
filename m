Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A4AD22AC46
	for <lists+linux-omap@lfdr.de>; Thu, 23 Jul 2020 12:16:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726867AbgGWKQl (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 23 Jul 2020 06:16:41 -0400
Received: from mail-ej1-f67.google.com ([209.85.218.67]:44577 "EHLO
        mail-ej1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725846AbgGWKQk (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 23 Jul 2020 06:16:40 -0400
Received: by mail-ej1-f67.google.com with SMTP id ga4so5751437ejb.11;
        Thu, 23 Jul 2020 03:16:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=dnWqbbfyoTOE1v2/nsDrkVQKi2TdYuhkczsrtV9Tj/A=;
        b=NtC5oSEYS63EEfhdQWLyY0hoLsqGLZMOIcQD3MP1xs6q12+e2JwulyF/k3ABp3031u
         5qIx5ABNhz4g7yDccFUQvWuxT9a7RfPmj8/d554pnTal6Okd1EgvCrleJIQOKtBAU75u
         0D8J6qK1IBDlBrSH9nGlP9yse/xZwdm9oyFZqpL6OVfsKkucaEPV7qEXtM2YhPja3kJ/
         4JHDhqPr6ICy8988bR0cGcqeQBnMgfvNS/QOWOIdlmduskW3bQvA8Kyn1JJBhlav5e+g
         DQTHchwMn8xMqdhaCJF92814zXagOvNXogyNXrWvFq3D0LVf+T8WxoSV0wpcZGKMgSjA
         ajGg==
X-Gm-Message-State: AOAM533XQYVR40CiFN3SNvsxsmKzDHhlokyKBUMf3l3jSafiXSZ1Soc/
        MGjgDdzz5W19PINoQ1INup8=
X-Google-Smtp-Source: ABdhPJxFOO+eX3VP5KW+75n2zsTc3LGcB7+QqfGOKNwpQ7g2yIGn/n4uVf5RddsxBNhVVCNRNqRwLw==
X-Received: by 2002:a17:906:2e83:: with SMTP id o3mr3639213eji.261.1595499398253;
        Thu, 23 Jul 2020 03:16:38 -0700 (PDT)
Received: from kozik-lap ([194.230.155.213])
        by smtp.googlemail.com with ESMTPSA id ah1sm841926ejc.43.2020.07.23.03.16.36
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Jul 2020 03:16:37 -0700 (PDT)
Date:   Thu, 23 Jul 2020 12:16:34 +0200
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
Subject: Re: [PATCH 19/23] memory: omap-gpmc: Enclose macro statements in
 do-while
Message-ID: <20200723101634.GD30472@kozik-lap>
References: <20200723073744.13400-1-krzk@kernel.org>
 <20200723073744.13400-20-krzk@kernel.org>
 <CAK8P3a3emZd=Tz5JhxevkX3OJMMEn_2Nb+_LQtGZJ9-GWNpd2g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAK8P3a3emZd=Tz5JhxevkX3OJMMEn_2Nb+_LQtGZJ9-GWNpd2g@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, Jul 23, 2020 at 11:09:40AM +0200, Arnd Bergmann wrote:
> On Thu, Jul 23, 2020 at 9:39 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >
> > do-while is a preferred way for complex macros because of safety
> > reasons.  This fixes checkpatch error:
> >
> >     ERROR: Macros starting with if should be enclosed by a do - while
> >         loop to avoid possible if/else logic defects
> >
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> This is an improvement, but the macro still has other issues that
> are just as bad as the one you address:
> 
> - Using the # operator to avoid the "" in the invocation seems confusing

I guess it was useful for debugging.

> - it implicitly uses the 'cs' and 't' variables of the calling function instead
>   of passing them as arguments.

Actually another reason to convert it to just a function.

> - it calls 'return -1' in a function that otherwise uses errno-style
>   return codes, so this gets interpreted as EPERM "Operation not
>   permitted".

The users of this macro also do it (gpmc_cs_set_timings()) so this
wrong practice is consistent with the driver. :)

> 
> I would probably just open-code the entire thing and remove the
> macro like:
> 
> ret = 0;
> ret |= set_gpmc_timing_reg(cs, GPMC_CS_CONFIG2,  0,  3, 0, t->cs_on,
> GPMC_CD_FCLK, "cs_on");
> ret |= set_gpmc_timing_reg(cs, GPMC_CS_CONFIG2,  8,  12, 0,
> t->cs_rd_off, GPMC_CD_FCLK, "cs_rd_off");
> ret |= set_gpmc_timing_reg(cs, GPMC_CS_CONFIG2,  16,  20, 0,
> t->cs_wr_off, GPMC_CD_FCLK, "cs_wr_off);
> ...
> if (ret)
>      return -ENXIO;a

I like this approach because it also removes the 'return' from macro
which is not desired.

> 
> Of maybe leave the macro, but remove the if/return part and use
> the "ret |= GPMC_SET_ONE(...)" trick to avoid some of the problems.

I could probably then keep it as a function.  This would be the safest
and remove most of the problems here.

Best regards,
Krzysztof

