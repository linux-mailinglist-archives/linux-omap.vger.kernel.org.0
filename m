Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E3D0AFDDF8
	for <lists+linux-omap@lfdr.de>; Fri, 15 Nov 2019 13:35:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727497AbfKOMfK convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-omap@lfdr.de>); Fri, 15 Nov 2019 07:35:10 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:38854 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727496AbfKOMfK (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 15 Nov 2019 07:35:10 -0500
Received: by mail-ot1-f67.google.com with SMTP id z25so7888900oti.5;
        Fri, 15 Nov 2019 04:35:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=weseOzPMtZu2Zkh9G1J+5ddsMGjRBKSp1rgb8MnewWI=;
        b=Y8gMEmARIyyPz+5yibhUCCzAPO8+umg05BceZRw1lhRNI3WYVX4DoF1CpYG3mIO79c
         6spRqeeWPCv3nLKnZjfHWVKFCbI1V/1QkpKj7r+cQ1ywtGsD9Bhe6QC5rfYqoSoVb3h3
         rsdGDLWMsjl58Zxwl3Nn4DNWBvAnQxQMxfpcVp0NV1EOiMTlI850NHBR3C+6jh0oWYDF
         ezTQikj6OS1Sv+fYoYPvY0cYAjc6W3Rjlzk1HphvRjRBDNy7CAc35HGRlfr2YFa8UNr0
         9avmZa0xoj+HQgi+UFCOy+1xkRxjHQlgZ69gjNNYrulWLFSQgjFQ4uLo9/h1BqI+H6+p
         Q2nQ==
X-Gm-Message-State: APjAAAVEGi2hyVQP1mXyBRULe4XhdpBdwmTMgmazAmkhvw4+RZq2abJ2
        EhilzH4vCKDUF7YNzV1fbsIxU/WVhISlQhPzARc=
X-Google-Smtp-Source: APXvYqxQbOJhyQwpGQWBZF1hmsyHYrJBcMAR+hAoTdODxyYX/u2VKxAy7/eJUh/M6a4TbETYPv02VjN0xr9BlR4aCVA=
X-Received: by 2002:a9d:5511:: with SMTP id l17mr2945702oth.145.1573821307279;
 Fri, 15 Nov 2019 04:35:07 -0800 (PST)
MIME-Version: 1.0
References: <20191103013645.9856-3-afaerber@suse.de> <20191111045609.7026-1-afaerber@suse.de>
 <20191111052741.GB3176397@kroah.com> <586fa37c-6292-aca4-fa7c-73064858afaf@suse.de>
 <20191111064040.GA3502217@kroah.com> <a88442df-dc6b-07e5-8dee-9e308bdda450@suse.de>
 <20191112052347.GA1197504@kroah.com> <20191112072926.isjxfa4ci6akhx56@pengutronix.de>
 <aff81b8e-f041-73a5-6a95-d308fa07842c@suse.de> <c8572f70-5550-8cee-4381-fd7de7ae5af0@baylibre.com>
 <CAMuHMdWOWWQoJh5=07VMRhtrFR_Gc_qNhjTV4tCsvwvMn0kYfA@mail.gmail.com> <a0a6d71f-4fb7-51ce-fe33-74f9e588b791@suse.de>
In-Reply-To: <a0a6d71f-4fb7-51ce-fe33-74f9e588b791@suse.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 15 Nov 2019 13:34:55 +0100
Message-ID: <CAMuHMdU7EYHWRAR+s3ee4Wy6+6_MZON5xARszO7TDXZGyw8d5w@mail.gmail.com>
Subject: Re: Sense of soc bus? (was: [PATCH] base: soc: Export
 soc_device_to_device() helper)
To:     =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-realtek-soc@lists.infradead.org,
        Tony Lindgren <tony@atomide.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        boot-architecture@lists.linaro.org,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
        "open list:TI ETHERNET SWITCH DRIVER (CPSW)" 
        <linux-omap@vger.kernel.org>,
        Alexander Sverdlin <alexander.sverdlin@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Hartley Sweeten <hsweeten@visionengravers.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Andreas,

On Fri, Nov 15, 2019 at 1:01 PM Andreas Färber <afaerber@suse.de> wrote:
> Am 15.11.19 um 09:58 schrieb Geert Uytterhoeven:
> > On Fri, Nov 15, 2019 at 9:52 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
> >> On 12/11/2019 11:47, Andreas Färber wrote:
> >>> For example, RTD1295 will support LSADC only from revision B00
> >>> on (and it's not the first time I'm seeing such things in the industry).
> >>> So if a user complains, it will be helpful to see that information.
> >>>
> >>> Referencing your Amlogic review, with all due respect for its authors,
> >>> the common framework here just lets that information evaporate into the
> >>> deeps of sysfs.
> >>
> >> Hopefully we never had the case where needed to use the soc info in drivers,
> >> but now we have one and having such infrastructure already in-place will help.
> >>
> >> Renesas platforms makes a extensive usage of the soc info infrastructure to
> >> figure out plenty of HW parameters at runtime and lower their DT changes.
> >
> > We do our best to use it solely for detecting quirks in early SoC revisions.
>
> Got a pointer? I fail to immediately understand how sysfs would help
> drivers (as opposed to userspace) detect quirks: Parsing strings back
> doesn't sound efficient, and I don't see you exporting any custom APIs
> in drivers/soc/renesas/renesas-soc.c?

We use soc_device_match(), inside kernel drivers.
Exposure through sysfs is a side-effect of using soc_device_register(),
and welcomed, as it allows the user to find out quickly which SoC and
revision is being used.

FTR, lshw (Ubuntu 18.04 has v2.18, which does seem to be the latest
upstream version) does not parse /sys/devices/soc0/.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
