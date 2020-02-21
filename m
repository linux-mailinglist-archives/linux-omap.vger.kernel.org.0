Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 27FDA168810
	for <lists+linux-omap@lfdr.de>; Fri, 21 Feb 2020 21:05:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726483AbgBUUFx (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 21 Feb 2020 15:05:53 -0500
Received: from mout.kundenserver.de ([217.72.192.75]:38517 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726443AbgBUUFx (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 21 Feb 2020 15:05:53 -0500
Received: from mail-qt1-f173.google.com ([209.85.160.173]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MdeSt-1jeqUT0a3t-00ZiGv for <linux-omap@vger.kernel.org>; Fri, 21 Feb
 2020 21:05:52 +0100
Received: by mail-qt1-f173.google.com with SMTP id l21so2169160qtr.8
        for <linux-omap@vger.kernel.org>; Fri, 21 Feb 2020 12:05:51 -0800 (PST)
X-Gm-Message-State: APjAAAUkIIm6I/BLo0UD86xYZ7dkwDIFrVmMhyd0QReGxM8b2inWf7E+
        Zo502XqZGudMX/8uB7UaToFQnqt9hvXvdl41B7A=
X-Google-Smtp-Source: APXvYqx42gswlIBQGfi7okQrtqeFEqiicpefxVgLD/zbkLUQv/uLhsMFE3QEhmg8k9YNPL1ulGl97PB0mG7GNmnxYno=
X-Received: by 2002:ac8:768d:: with SMTP id g13mr33583872qtr.7.1582315551015;
 Fri, 21 Feb 2020 12:05:51 -0800 (PST)
MIME-Version: 1.0
References: <20200221180901.15812-1-tony@atomide.com>
In-Reply-To: <20200221180901.15812-1-tony@atomide.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Fri, 21 Feb 2020 21:05:34 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2C6EV0En1hGuFxCRGzgf2t3-5DAPDUDQc5BmGHm1-t9w@mail.gmail.com>
Message-ID: <CAK8P3a2C6EV0En1hGuFxCRGzgf2t3-5DAPDUDQc5BmGHm1-t9w@mail.gmail.com>
Subject: Re: [PATCH] ARM: OMAP2+: Fix compile if CONFIG_HAVE_ARM_SMCCC is not set
To:     Tony Lindgren <tony@atomide.com>
Cc:     linux-omap <linux-omap@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        kbuild test robot <lkp@intel.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        "Andrew F . Davis" <afd@ti.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Marc Zyngier <maz@kernel.org>, Rob Herring <robh@kernel.org>,
        Russell King <rmk+kernel@arm.linux.org.uk>,
        Steven Price <steven.price@arm.com>,
        Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:T3uswGZ2uqxrmIkxTfQ1p2Y/hgSZj1YPbK2yoGj9PH4+JzUQGdm
 JKVkZy+33J8RTKawD6buAhmuUT5zR59iwi3g7gaVAdSJArRrZzNgn4Jd12nJ25h5OIqcpXn
 MtpyyqBSMnKSz2JH8iBSIKEWxGIzg4ggYpiq+dHTOcqaIUI8J36azygFpUxpniJf1pom+Ih
 HxVPY72Kj71+tySIydK4Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:NmXO0YcmXu0=:JGnrF2WhdIuNHEYamOkoXL
 P323OuE3oVtvPilOR2iWHBW9GwmcTrTwUoZ68T6vQZonKq3L1OnisGOe7NUqsAKWvptImWueC
 snXPCZKtqcrPhuzgm2Z2/yPNpIOmIwpxK5PQ+otwEfV3q4g7cY/kTA52LdRvfDd/BHe3EUeMf
 XjvnQiNFs0RhwoFCPrO0ZV0Fnf5cY5D6K/pcq3sW/F9NQvo/ZiuzFKLKB4Xv7b8OzQMuTsJKI
 r5X3nCsFQ0cUIJX7HmM+DKbcfH1aBBNhRr2TouEvatAOBMjmxq+5d8n0DiuJgPjOvRcJ0t6y8
 yyMtpzV5FTEneU9b+TLNGhUXhl2T+8O4NRDmCvQTcmuEf5D/4NBdE/qmZw4v4eCFzydHZw1fP
 db7f1QtYlP4xPzmSzUCsybLpaAX0drmGoaz5G+szA5RdtZ+c643xXpoQG08Hy7+Mt62m4R1Y3
 Kektv3Ds6RWOaZDsDnuMHYyUPyKX97Gyem2gew75gMSBbLPhA6NOBMwaFi3M1+SK6jHic7cny
 /VkLb3/Qqovneb1vZSPAUWlBp/H+xuoaIZFLhRC1vzeFLAqE94pWHw2607KRyv+qduCScwLUQ
 yscAA89RVpmHg9szsfwY+E8ce8isUyjFUesPZtNYTfrUwDuDMiVew62pUI3eHVPYeBhu4Towj
 ZbS+wMm9ktWxlwsIOaSKGJT0r5HDlfK0qr2Eta7fBvGUMjM/bAErSPA03FHi20Y58GHwsIEXx
 AeFBT3r3QoFQTAgz3Gx4LsniIxWJi9JAV2zh1pUxTepvul4SqEVU19R0kdURV1K1IMAvApFIc
 yU5AXiRHOtyXUpxJh5CtVIm3FABPRLgTKZ35zAoAeKzFFx9Gh4=
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, Feb 21, 2020 at 7:09 PM Tony Lindgren <tony@atomide.com> wrote:
>
> Recent omap changes added runtime checks to use omap_smccc_smc()
> when optee is configured in dts. As the omap-secure code can be
> built for ARMv6 only without ARMv7 and use custom smc calls, we
> now get a build error:
>
> omap-secure.c:(.text+0x94): undefined reference to `__arm_smccc_smc'
>
> Let's just ifdef out omap_smccc_smc() unless the CPU has selected
> CONFIG_HAVE_ARM_SMCCC. The other option discussed was to add an
> inline function to arm-smccc.h, but we'd still also have to add
> ifdef around omap_smccc_smc() to avoid a warning for uninitialized
> value for struct arm_smccc_res in omap_smccc_smc(). And we probably
> should not start initializing values in arm-smccc.h if disabled.
>
> Let's also warn on trying to use omap_smccc_smc() if disabled as
> suggested by Andrew F. Davis <afd@ti.com>.
>
> +#ifdef CONFIG_HAVE_ARM_SMCCC
>  void omap_smccc_smc(u32 fn, u32 arg)
>  {
>         struct arm_smccc_res res;
> @@ -85,6 +86,12 @@ void omap_smccc_smc(u32 fn, u32 arg)
>                       0, 0, 0, 0, 0, 0, &res);
>         WARN(res.a0, "Secure function call 0x%08x failed\n", fn);
>  }
> +#else

Looking through the callers again, this can and is only called
for ARMv7 CPUs, so can't you just avoid the #else path and
turn it into a link error if we ever get callers on ARMv6-only builds?

      Arnd
