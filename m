Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3A867F852C
	for <lists+linux-omap@lfdr.de>; Tue, 12 Nov 2019 01:29:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726908AbfKLA3N (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 11 Nov 2019 19:29:13 -0500
Received: from mx2.suse.de ([195.135.220.15]:40000 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726887AbfKLA3N (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 11 Nov 2019 19:29:13 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id BCDE4B2C6;
        Tue, 12 Nov 2019 00:29:09 +0000 (UTC)
Subject: Re: [PATCH] base: soc: Export soc_device_to_device() helper
From:   =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-realtek-soc@lists.infradead.org,
        Tony Lindgren <tony@atomide.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Fabio Estevam <festevam@gmail.com>,
        Kevin Hilman <khilman@baylibre.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        linux-amlogic@lists.infradead.org,
        Lee Jones <lee.jones@linaro.org>, linux-omap@vger.kernel.org,
        Alexander Sverdlin <alexander.sverdlin@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Hartley Sweeten <hsweeten@visionengravers.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>
References: <20191103013645.9856-3-afaerber@suse.de>
 <20191111045609.7026-1-afaerber@suse.de> <20191111052741.GB3176397@kroah.com>
 <586fa37c-6292-aca4-fa7c-73064858afaf@suse.de>
 <20191111064040.GA3502217@kroah.com>
 <a88442df-dc6b-07e5-8dee-9e308bdda450@suse.de>
Organization: SUSE Software Solutions Germany GmbH
Message-ID: <94db77d0-f7a3-2a16-6a5d-cd28f68fe5b2@suse.de>
Date:   Tue, 12 Nov 2019 01:29:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <a88442df-dc6b-07e5-8dee-9e308bdda450@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Am 11.11.19 um 21:10 schrieb Andreas Färber:
> Am 11.11.19 um 07:40 schrieb Greg Kroah-Hartman:
>> On Mon, Nov 11, 2019 at 06:42:05AM +0100, Andreas Färber wrote:
>>> Hi Greg,
>>>
>>> Am 11.11.19 um 06:27 schrieb Greg Kroah-Hartman:
>>>> On Mon, Nov 11, 2019 at 05:56:09AM +0100, Andreas Färber wrote:
>>>>> Use of soc_device_to_device() in driver modules causes a build failure.
>>>>> Given that the helper is nicely documented in include/linux/sys_soc.h,
>>>>> let's export it as GPL symbol.
>>>>
>>>> I thought we were fixing the soc drivers to not need this.  What
>>>> happened to that effort?  I thought I had patches in my tree (or
>>>> someone's tree) that did some of this work already, such that this
>>>> symbol isn't needed anymore.
>>>
>>> I do still see this function used in next-20191108 in drivers/soc/.
>>>
>>> I'll be happy to adjust my RFC driver if someone points me to how!
>>
>> Look at c31e73121f4c ("base: soc: Handle custom soc information sysfs
>> entries") for how you can just use the default attributes for the soc to
>> create the needed sysfs files, instead of having to do it "by hand"
>> which is racy and incorrect.
> 
> Unrelated.
> 
>>> Given the current struct layout, a type cast might work (but ugly).
>>> Or if we stay with my current RFC driver design, we could use the
>>> platform_device instead of the soc_device (which would clutter the
>>> screen more than "soc soc0:") or resort to pr_info() w/o device.
>>
>> Ick, no, don't cast blindly.  What do you need the pointer for?  Is this
>> for in-tree code?
> 
> No, an RFC patchset: https://patchwork.kernel.org/cover/11224261/
> 
> As I indicated above, I used it for a dev_info(), which I can easily
> avoid by using pr_info() instead:
> 
> diff --git a/drivers/soc/realtek/chip.c b/drivers/soc/realtek/chip.c
> index e5078c6731fd..f9380e831659 100644
> --- a/drivers/soc/realtek/chip.c
> +++ b/drivers/soc/realtek/chip.c
> @@ -178,8 +178,7 @@ static int rtd_soc_probe(struct platform_device *pdev)
> 
>         platform_set_drvdata(pdev, soc_dev);
> 
> -       dev_info(soc_device_to_device(soc_dev),
> -               "%s %s (0x%08x) rev %s (0x%08x) detected\n",
> +       pr_info("%s %s (0x%08x) rev %s (0x%08x) detected\n",
>                 soc_dev_attr->family, soc_dev_attr->soc_id, chip_id,
>                 soc_dev_attr->revision, chip_rev);
> 

Tested and squashed in my tree.

> 
> But as I said, there is still in-tree code using this helper:
[snip]
> So, not counting my unmerged Realtek driver,
> * we have two cases of struct device being used for dev_info(), which
> could be cleaned up with device-less pr_info(), I could post a patch,

Patch sent: https://patchwork.kernel.org/patch/11237949/ (untested)

> * frequent usage in arm/mach-* for of_platform_default_populate(), this
> seems most difficult to replace if we neither want to cast nor expose
> the struct,

One clever way might be to implement a new of_soc_default_populate() in
drivers/base/soc.c that takes a soc_device instead of device, doing the
conversion inside soc.c and calling of_platform_default_populate() from
there. Then we could convert present users to pass around soc_device
instead of device, with a perspective to make soc_device_to_device()
static inside base/soc.c.

sys_soc.h does not presently #include any OF headers, so the declaration
may need to go into of_platform.h and to consider CONFIG_SOC_BUS.

Will require compile-testing for each platform and ideally some kbuild
bot passes to get right, so not a quick shot.

While at it, an of_soc_device_register() variant could fill
soc_device_attribute::machine in common code instead of each platform
duplicating to read this from the DT root node's model property.

> * some simply unused, which could be refactored to return void, and

Patch sent: https://patchwork.kernel.org/patch/11237971/ (untested)

> * some for device_create_file(), which could probably be avoided with
> custom_attr_group.
> 
> It also raises the question of whether new arm platforms such as RTD1195
> (mach-realtek) should attempt to use of_platform_default_populate() with
> the soc_device somehow, or if not, whether those platforms should be
> refactored to consistently no longer do so?
> 
> I believe in the Broken Window Theory, i.e. fixing what we can before
> mistakes get copied and propagate further in code; but here I don't see
> a perspective for getting rid of soc_device_to_device() completely to
> prevent new usages, nor can I test all of those platforms myself.
> 
> Has a cleanup based on custom_attr_group been attempted already and is
> waiting on patches to get reviewed and merged through maintainer trees,
> or do we need to prepare new cleanup patches here? A search for
> "soc_device_to_device" on LAKML Patchwork shows only this patch of mine.

Actually I don't find a single user of custom_attr_group in linux-next,
which may be because the patch introducing it is from October and people
are waiting on the next -rc1 before they can merge patches using it?

Regards,
Andreas

-- 
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 Nürnberg, Germany
GF: Felix Imendörffer
HRB 36809 (AG Nürnberg)
