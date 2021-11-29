Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5975D4615FD
	for <lists+linux-omap@lfdr.de>; Mon, 29 Nov 2021 14:13:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238754AbhK2NQ1 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 29 Nov 2021 08:16:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377107AbhK2NO0 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 29 Nov 2021 08:14:26 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6D8CC0048DF
        for <linux-omap@vger.kernel.org>; Mon, 29 Nov 2021 03:55:07 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id d9so15305320wrw.4
        for <linux-omap@vger.kernel.org>; Mon, 29 Nov 2021 03:55:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=VVOPTlZ25TG0A/D/zPlBV/5uhzVs33QmnMBQ/KVuzok=;
        b=lkwhQKXAkPk/45MOJA8n7UmDgKAdLF4A1HrNaCp2DAoqL5jLTFjou3x32wDBBU6GIT
         yI/CJhxLCUTnAb5/Em/j6rhcsE0aVo3sMd3LYPxdE5+hC1/mTgxkJqsMs5FMlUOo6mFj
         p7BNzyn9xjUhYwkgG5BzPtj9HurcHm+ccwOPwS4lv9ee0Rp8UDrMmrydCXbQHsTaZXjk
         xJu5xIGGnwbHMKU206LqjROnwejVkM/SZiOAqwNOvL8q0Fxve51MyLPqAjPb4PZY1YMm
         QSzNrZA4BSS9QFja3wZ8ES46Bccp24Bd6Zbx0NoBWxwAbV7Rw05PPAukg5XBBny7eyFr
         nlLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=VVOPTlZ25TG0A/D/zPlBV/5uhzVs33QmnMBQ/KVuzok=;
        b=c4Ag9Ozc2C8hmKR/pqUxkAEAx7Z6mqOXnC34C8pH66wOgRWWw1Wes3Bpe3P4l45uYW
         tbVbcrj9sssT5dHQi/o6jo+BCmc+nznleB13uIjyI4VQHmGpxSMpLdwiQD3cwQtaD+9P
         6YDzAmueYKCxr1YCUnqgFlHBLP4n3ji0tsCvIEa1ipdkwy0Xjk9WjrzW2PkyEyBxHh7p
         K2jm3/zyJM1HbsNgiSANmYdpk5a5IynNtCBJkqNRQPM2nUBW5rM3Ygbr/AZnBMsSaRpa
         ETWOWTHGKOBsKw6VgUgjQOsJmM6i9UxR9uwVsyyjfzxPVAfkky+bh/bKrdWaiHcu03pJ
         kXVA==
X-Gm-Message-State: AOAM533JaIOkU9Ominq44/r0/AzqeBElkZ0u6hUkPJBbdmOemfsKyoUf
        AEpPd6yD7M5IOzKz4aqiQVUQiQ==
X-Google-Smtp-Source: ABdhPJzBdvU2Vc8uq5wk1K9UX3j47S9iY7roSh9nDqHEi2kZs1JBlBSlXeazNTFhoQ+QITHlIyszPw==
X-Received: by 2002:adf:e742:: with SMTP id c2mr32868966wrn.498.1638186905995;
        Mon, 29 Nov 2021 03:55:05 -0800 (PST)
Received: from google.com ([2.31.167.18])
        by smtp.gmail.com with ESMTPSA id y15sm16736665wry.72.2021.11.29.03.55.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Nov 2021 03:55:05 -0800 (PST)
Date:   Mon, 29 Nov 2021 11:55:01 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Russell King <linux@armlinux.org.uk>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        Joshua Thompson <funaho@jurai.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Nick Hu <nickhu@andestech.com>,
        Greentime Hu <green.hu@gmail.com>,
        Vincent Chen <deanbo422@gmail.com>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        Helge Deller <deller@gmx.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        "H. Peter Anvin" <hpa@zytor.com>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        Juergen Gross <jgross@suse.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Len Brown <lenb@kernel.org>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>,
        Tony Lindgren <tony@atomide.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Avi Fishman <avifishman70@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Tali Perry <tali.perry1@gmail.com>,
        Patrick Venture <venture@google.com>,
        Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Pavel Machek <pavel@ucw.cz>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-csky@vger.kernel.org, linux-ia64@vger.kernel.org,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org,
        xen-devel@lists.xenproject.org, linux-acpi@vger.kernel.org,
        linux-omap@vger.kernel.org, openbmc@lists.ozlabs.org,
        linux-tegra@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v2 28/45] mfd: rn5t618: Use devm_register_power_handler()
Message-ID: <YaS/lStp2b8GhVxw@google.com>
References: <20211027211715.12671-1-digetx@gmail.com>
 <20211027211715.12671-29-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211027211715.12671-29-digetx@gmail.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, 28 Oct 2021, Dmitry Osipenko wrote:

> Use devm_register_power_handler() that replaces global pm_power_off
> variable and allows to register multiple power-off handlers. It also
> provides restart-handler support, i.e. all in one API.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/mfd/rn5t618.c | 56 ++++++++++++++++---------------------------
>  1 file changed, 21 insertions(+), 35 deletions(-)

For my own reference (apply this as-is to your sign-off block):

  Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
