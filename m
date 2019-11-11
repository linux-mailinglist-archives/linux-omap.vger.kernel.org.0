Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 28DA2F80DB
	for <lists+linux-omap@lfdr.de>; Mon, 11 Nov 2019 21:10:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727133AbfKKUKt (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 11 Nov 2019 15:10:49 -0500
Received: from mx2.suse.de ([195.135.220.15]:51594 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726954AbfKKUKt (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 11 Nov 2019 15:10:49 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 74AD0B381;
        Mon, 11 Nov 2019 20:10:45 +0000 (UTC)
Subject: Re: [PATCH] base: soc: Export soc_device_to_device() helper
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-realtek-soc@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Lee Jones <lee.jones@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Hartley Sweeten <hsweeten@visionengravers.com>,
        Alexander Sverdlin <alexander.sverdlin@gmail.com>,
        Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org,
        Michal Simek <michal.simek@xilinx.com>,
        Kevin Hilman <khilman@baylibre.com>,
        linux-amlogic@lists.infradead.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
References: <20191103013645.9856-3-afaerber@suse.de>
 <20191111045609.7026-1-afaerber@suse.de> <20191111052741.GB3176397@kroah.com>
 <586fa37c-6292-aca4-fa7c-73064858afaf@suse.de>
 <20191111064040.GA3502217@kroah.com>
From:   =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Organization: SUSE Software Solutions Germany GmbH
Message-ID: <a88442df-dc6b-07e5-8dee-9e308bdda450@suse.de>
Date:   Mon, 11 Nov 2019 21:10:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191111064040.GA3502217@kroah.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Am 11.11.19 um 07:40 schrieb Greg Kroah-Hartman:
> On Mon, Nov 11, 2019 at 06:42:05AM +0100, Andreas Färber wrote:
>> Hi Greg,
>>
>> Am 11.11.19 um 06:27 schrieb Greg Kroah-Hartman:
>>> On Mon, Nov 11, 2019 at 05:56:09AM +0100, Andreas Färber wrote:
>>>> Use of soc_device_to_device() in driver modules causes a build failure.
>>>> Given that the helper is nicely documented in include/linux/sys_soc.h,
>>>> let's export it as GPL symbol.
>>>
>>> I thought we were fixing the soc drivers to not need this.  What
>>> happened to that effort?  I thought I had patches in my tree (or
>>> someone's tree) that did some of this work already, such that this
>>> symbol isn't needed anymore.
>>
>> I do still see this function used in next-20191108 in drivers/soc/.
>>
>> I'll be happy to adjust my RFC driver if someone points me to how!
> 
> Look at c31e73121f4c ("base: soc: Handle custom soc information sysfs
> entries") for how you can just use the default attributes for the soc to
> create the needed sysfs files, instead of having to do it "by hand"
> which is racy and incorrect.

Unrelated.

>> Given the current struct layout, a type cast might work (but ugly).
>> Or if we stay with my current RFC driver design, we could use the
>> platform_device instead of the soc_device (which would clutter the
>> screen more than "soc soc0:") or resort to pr_info() w/o device.
> 
> Ick, no, don't cast blindly.  What do you need the pointer for?  Is this
> for in-tree code?

No, an RFC patchset: https://patchwork.kernel.org/cover/11224261/

As I indicated above, I used it for a dev_info(), which I can easily
avoid by using pr_info() instead:

diff --git a/drivers/soc/realtek/chip.c b/drivers/soc/realtek/chip.c
index e5078c6731fd..f9380e831659 100644
--- a/drivers/soc/realtek/chip.c
+++ b/drivers/soc/realtek/chip.c
@@ -178,8 +178,7 @@ static int rtd_soc_probe(struct platform_device *pdev)

        platform_set_drvdata(pdev, soc_dev);

-       dev_info(soc_device_to_device(soc_dev),
-               "%s %s (0x%08x) rev %s (0x%08x) detected\n",
+       pr_info("%s %s (0x%08x) rev %s (0x%08x) detected\n",
                soc_dev_attr->family, soc_dev_attr->soc_id, chip_id,
                soc_dev_attr->revision, chip_rev);


But as I said, there is still in-tree code using this helper:


arch/arm/mach-ep93xx/core.c:    return soc_device_to_device(soc_dev);

Returned from ep93xx_init_soc(), which is passed through by
ep93xx_init_devices():

arch/arm/mach-ep93xx/adssphere.c:       ep93xx_init_devices();
arch/arm/mach-ep93xx/edb93xx.c: ep93xx_init_devices();
arch/arm/mach-ep93xx/gesbc9312.c:       ep93xx_init_devices();
arch/arm/mach-ep93xx/micro9.c:  ep93xx_init_devices();
arch/arm/mach-ep93xx/simone.c:  ep93xx_init_devices();
arch/arm/mach-ep93xx/snappercl15.c:     ep93xx_init_devices();
arch/arm/mach-ep93xx/ts72xx.c:  ep93xx_init_devices();
arch/arm/mach-ep93xx/ts72xx.c:  ep93xx_init_devices();
arch/arm/mach-ep93xx/vision_ep9307.c:   ep93xx_init_devices();

Return value unused everywhere.


arch/arm/mach-imx/cpu.c:        return soc_device_to_device(soc_dev);

Used as return value of imx_soc_device_init():

arch/arm/mach-imx/mach-imx6q.c: parent = imx_soc_device_init();
arch/arm/mach-imx/mach-imx6sl.c:        parent = imx_soc_device_init();
arch/arm/mach-imx/mach-imx6sx.c:        parent = imx_soc_device_init();
arch/arm/mach-imx/mach-imx6ul.c:        parent = imx_soc_device_init();

These do a NULL check and pass it to of_platform_default_populate().

arch/arm/mach-imx/mach-imx7d.c: parent = imx_soc_device_init();

This one only does a NULL check.

arch/arm/mach-imx/mach-imx7ulp.c:
of_platform_default_populate(NULL, NULL, imx_soc_device_init());

Speaks for itself.


arch/arm/mach-mxs/mach-mxs.c:   parent = soc_device_to_device(soc_dev);

Passed to of_platform_default_populate().


arch/arm/mach-omap2/id.c:       parent = soc_device_to_device(soc_dev);

Used for device_create_file().


arch/arm/mach-zynq/common.c:    parent = soc_device_to_device(soc_dev);

Passed to of_platform_default_populate().


drivers/soc/amlogic/meson-gx-socinfo.c: dev = soc_device_to_device(soc_dev);

Used for dev_info(). CONFIG_MESON_GX_SOCINFO is bool, thus not affected.


drivers/soc/amlogic/meson-mx-socinfo.c:
dev_info(soc_device_to_device(soc_dev), "Amlogic %s %s detected\n",

Speaks for itself. CONFIG_MESON_MX_SOCINFO is bool, thus not affected.


drivers/soc/tegra/fuse/fuse-tegra.c:    return soc_device_to_device(dev);

Returned from tegra_soc_device_register(). For arm64 NULL-checked only,
but also used for arm in arch/arm/mach-tegra/tegra.c:tegra_dt_init(),
which passes it to of_platform_default_populate().


drivers/soc/ux500/ux500-soc-id.c:       parent =
soc_device_to_device(soc_dev);

Used for device_create_file().


drivers/soc/versatile/soc-integrator.c: dev = soc_device_to_device(soc_dev);

Used for device_create_file().

drivers/soc/versatile/soc-realview.c:
device_create_file(soc_device_to_device(soc_dev), &realview_manf_attr);
drivers/soc/versatile/soc-realview.c:
device_create_file(soc_device_to_device(soc_dev), &realview_board_attr);
drivers/soc/versatile/soc-realview.c:
device_create_file(soc_device_to_device(soc_dev), &realview_arch_attr);
drivers/soc/versatile/soc-realview.c:
device_create_file(soc_device_to_device(soc_dev), &realview_build_attr);

Speaks for itself.


So, not counting my unmerged Realtek driver,
* we have two cases of struct device being used for dev_info(), which
could be cleaned up with device-less pr_info(), I could post a patch,
* frequent usage in arm/mach-* for of_platform_default_populate(), this
seems most difficult to replace if we neither want to cast nor expose
the struct,
* some simply unused, which could be refactored to return void, and
* some for device_create_file(), which could probably be avoided with
custom_attr_group.

It also raises the question of whether new arm platforms such as RTD1195
(mach-realtek) should attempt to use of_platform_default_populate() with
the soc_device somehow, or if not, whether those platforms should be
refactored to consistently no longer do so?

I believe in the Broken Window Theory, i.e. fixing what we can before
mistakes get copied and propagate further in code; but here I don't see
a perspective for getting rid of soc_device_to_device() completely to
prevent new usages, nor can I test all of those platforms myself.

Has a cleanup based on custom_attr_group been attempted already and is
waiting on patches to get reviewed and merged through maintainer trees,
or do we need to prepare new cleanup patches here? A search for
"soc_device_to_device" on LAKML Patchwork shows only this patch of mine.

Thanks,
Andreas

-- 
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 Nürnberg, Germany
GF: Felix Imendörffer
HRB 36809 (AG Nürnberg)
