Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 90977FDCDA
	for <lists+linux-omap@lfdr.de>; Fri, 15 Nov 2019 13:01:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727241AbfKOMBE (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 15 Nov 2019 07:01:04 -0500
Received: from mx2.suse.de ([195.135.220.15]:34764 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726983AbfKOMBE (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 15 Nov 2019 07:01:04 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 17814ACB4;
        Fri, 15 Nov 2019 12:01:02 +0000 (UTC)
Subject: Re: Sense of soc bus? (was: [PATCH] base: soc: Export
 soc_device_to_device() helper)
To:     Geert Uytterhoeven <geert@linux-m68k.org>
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
        =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        boot-architecture@lists.linaro.org,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org,
        Alexander Sverdlin <alexander.sverdlin@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Hartley Sweeten <hsweeten@visionengravers.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>
References: <20191103013645.9856-3-afaerber@suse.de>
 <20191111045609.7026-1-afaerber@suse.de> <20191111052741.GB3176397@kroah.com>
 <586fa37c-6292-aca4-fa7c-73064858afaf@suse.de>
 <20191111064040.GA3502217@kroah.com>
 <a88442df-dc6b-07e5-8dee-9e308bdda450@suse.de>
 <20191112052347.GA1197504@kroah.com>
 <20191112072926.isjxfa4ci6akhx56@pengutronix.de>
 <aff81b8e-f041-73a5-6a95-d308fa07842c@suse.de>
 <c8572f70-5550-8cee-4381-fd7de7ae5af0@baylibre.com>
 <CAMuHMdWOWWQoJh5=07VMRhtrFR_Gc_qNhjTV4tCsvwvMn0kYfA@mail.gmail.com>
From:   =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Organization: SUSE Software Solutions Germany GmbH
Message-ID: <a0a6d71f-4fb7-51ce-fe33-74f9e588b791@suse.de>
Date:   Fri, 15 Nov 2019 13:00:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <CAMuHMdWOWWQoJh5=07VMRhtrFR_Gc_qNhjTV4tCsvwvMn0kYfA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Geert,

Am 15.11.19 um 09:58 schrieb Geert Uytterhoeven:
> On Fri, Nov 15, 2019 at 9:52 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>> On 12/11/2019 11:47, Andreas Färber wrote:
>>> For example, RTD1295 will support LSADC only from revision B00
>>> on (and it's not the first time I'm seeing such things in the industry).
>>> So if a user complains, it will be helpful to see that information.
>>>
>>> Referencing your Amlogic review, with all due respect for its authors,
>>> the common framework here just lets that information evaporate into the
>>> deeps of sysfs.
>>
>> Hopefully we never had the case where needed to use the soc info in drivers,
>> but now we have one and having such infrastructure already in-place will help.
>>
>> Renesas platforms makes a extensive usage of the soc info infrastructure to
>> figure out plenty of HW parameters at runtime and lower their DT changes.
> 
> We do our best to use it solely for detecting quirks in early SoC revisions.

Got a pointer? I fail to immediately understand how sysfs would help
drivers (as opposed to userspace) detect quirks: Parsing strings back
doesn't sound efficient, and I don't see you exporting any custom APIs
in drivers/soc/renesas/renesas-soc.c?

Regards,
Andreas

-- 
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 Nürnberg, Germany
GF: Felix Imendörffer
HRB 36809 (AG Nürnberg)
