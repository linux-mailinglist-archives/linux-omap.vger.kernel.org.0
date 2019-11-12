Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C0A4F8D25
	for <lists+linux-omap@lfdr.de>; Tue, 12 Nov 2019 11:47:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725899AbfKLKrb (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 12 Nov 2019 05:47:31 -0500
Received: from mx2.suse.de ([195.135.220.15]:52744 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725834AbfKLKra (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 12 Nov 2019 05:47:30 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 729FEAB89;
        Tue, 12 Nov 2019 10:47:27 +0000 (UTC)
Subject: Sense of soc bus? (was: [PATCH] base: soc: Export
 soc_device_to_device() helper)
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
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
        Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh@kernel.org>,
        boot-architecture@lists.linaro.org
References: <20191103013645.9856-3-afaerber@suse.de>
 <20191111045609.7026-1-afaerber@suse.de> <20191111052741.GB3176397@kroah.com>
 <586fa37c-6292-aca4-fa7c-73064858afaf@suse.de>
 <20191111064040.GA3502217@kroah.com>
 <a88442df-dc6b-07e5-8dee-9e308bdda450@suse.de>
 <20191112052347.GA1197504@kroah.com>
 <20191112072926.isjxfa4ci6akhx56@pengutronix.de>
From:   =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Organization: SUSE Software Solutions Germany GmbH
Message-ID: <aff81b8e-f041-73a5-6a95-d308fa07842c@suse.de>
Date:   Tue, 12 Nov 2019 11:47:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191112072926.isjxfa4ci6akhx56@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Am 12.11.19 um 08:29 schrieb Uwe Kleine-König:
> On Tue, Nov 12, 2019 at 06:23:47AM +0100, Greg Kroah-Hartman wrote:
>> On Mon, Nov 11, 2019 at 09:10:41PM +0100, Andreas Färber wrote:
>>> Am 11.11.19 um 07:40 schrieb Greg Kroah-Hartman:
>>>> On Mon, Nov 11, 2019 at 06:42:05AM +0100, Andreas Färber wrote:
>>>>> Am 11.11.19 um 06:27 schrieb Greg Kroah-Hartman:
>>>>>> On Mon, Nov 11, 2019 at 05:56:09AM +0100, Andreas Färber wrote:
>>>>>>> Use of soc_device_to_device() in driver modules causes a build failure.
>>>>>>> Given that the helper is nicely documented in include/linux/sys_soc.h,
>>>>>>> let's export it as GPL symbol.
>>>>>>
>>>>>> I thought we were fixing the soc drivers to not need this.  What
>>>>>> happened to that effort?  I thought I had patches in my tree (or
>>>>>> someone's tree) that did some of this work already, such that this
>>>>>> symbol isn't needed anymore.
>>>>>
>>>>> I do still see this function used in next-20191108 in drivers/soc/.
>>>>>
>>>>> I'll be happy to adjust my RFC driver if someone points me to how!
>>>>
>>>> Look at c31e73121f4c ("base: soc: Handle custom soc information sysfs
>>>> entries") for how you can just use the default attributes for the soc to
>>>> create the needed sysfs files, instead of having to do it "by hand"
>>>> which is racy and incorrect.
>>>
>>> Unrelated.
>>>
>>>>> Given the current struct layout, a type cast might work (but ugly).
>>>>> Or if we stay with my current RFC driver design, we could use the
>>>>> platform_device instead of the soc_device (which would clutter the
>>>>> screen more than "soc soc0:") or resort to pr_info() w/o device.
>>>>
>>>> Ick, no, don't cast blindly.  What do you need the pointer for?  Is this
>>>> for in-tree code?
>>>
>>> No, an RFC patchset: https://patchwork.kernel.org/cover/11224261/
>>>
>>> As I indicated above, I used it for a dev_info(), which I can easily
>>> avoid by using pr_info() instead:
>>>
>>> diff --git a/drivers/soc/realtek/chip.c b/drivers/soc/realtek/chip.c
>>> index e5078c6731fd..f9380e831659 100644
>>> --- a/drivers/soc/realtek/chip.c
>>> +++ b/drivers/soc/realtek/chip.c
>>> @@ -178,8 +178,7 @@ static int rtd_soc_probe(struct platform_device *pdev)
>>>
>>>         platform_set_drvdata(pdev, soc_dev);
>>>
>>> -       dev_info(soc_device_to_device(soc_dev),
>>> -               "%s %s (0x%08x) rev %s (0x%08x) detected\n",
>>> +       pr_info("%s %s (0x%08x) rev %s (0x%08x) detected\n",
>>>                 soc_dev_attr->family, soc_dev_attr->soc_id, chip_id,
>>>                 soc_dev_attr->revision, chip_rev);
>>
>> First off, the driver should not be spitting out noise for when all goes
>> well like this :)
> 
> I didn't follow the discussion closely, but I think I want to object
> here a bit. While I agree that each driver emitting some stuff to the
> log buffer is hardly helpful, seeing the exact SoC details is indeed
> useful at times. With my Debian kernel team member hat on, I'd say
> keep this information. This way the SoC details make it into kernel bug
> reports without effort on our side.

Seconded. For example, RTD1295 will support LSADC only from revision B00
on (and it's not the first time I'm seeing such things in the industry).
So if a user complains, it will be helpful to see that information.

Referencing your Amlogic review, with all due respect for its authors,
the common framework here just lets that information evaporate into the
deeps of sysfs. People who know can check /sys/bus/soc/devices/soc0, but
ordinary users will at most upload dmesg output to a Bugzilla ticket.

And it was precisely info-level boot output from the Amlogic GX driver
that made me aware of this common framework and inspired me to later
contribute such a driver elsewhere myself. That's not a bad effect. ;)

So if anything, we should standardize that output and move it into
soc_device_register(): "<family> <soc_id> [rev <revision>] detected"
with suitable NULL checks? (what I did above for Realtek, minus hex)

The info level seems correct to me - it allows people to use a different
log_level if they only care about warnings or errors on the console;
it's not debug info for that driver, except in my case the accompanying
hex numbers that I'd be happy to drop in favor of standardization.

Another aspect here is that the overall amount of soc_device_register()
users is just an estimated one third above the analysis shared before.
In particular server platforms, be it arm64 or x86_64, that potentially
have more than one SoC integrated in a multi-socket configuration, don't
feed into this soc bus at all! Therefore my comment that
dev_info()-printed "soc soc0:" is kind of useless if there's only one
SoC on those boards. I'm not aware of any tool or a more common file
aggregating this information, certainly not /proc/cpuinfo and I'm not
aware of any special "lssoc" tool either. And if there's no ACPI/DMI
driver feeding support-relevant information into this framework to be
generally useful, I don't expect the big distros to spend time on
improving its usability.

So if we move info output into base/soc.c, we could continue using
dev_info() with "soc"-grep'able prefix in the hopes that someday we'll
have more than one soc device on the bus and will need to distinguish;
otherwise yes, pr_info() would change the output format for Amlogic (and
so would a harmonization of the text), but does anyone really care in
practice? Tools shouldn't be relying on its output format, and humans
will understand equally either way.

Finally, arch/arm seems unique in that it has the machine_desc mechanism
that allows individual SoCs to force creating their soc_device early and
using it as parent for further DT-created platform_devices. With arm64
we've lost that ability, and nios2 is not using it either.
A bad side effect (with SUSE hat on) is that this parent design pattern
does not allow to build such drivers as modules, which means that distro
configs using arm's multi-platform, e.g., CONFIG_ARCH_MULTI_V7 will get
unnecessary code creep as new platforms get added over time (beyond the
basic clk, pinctrl, tty and maybe timer).
Even if it were possible to call into a driver module that early, using
it as parent would seem to imply that all the references by its children
would not allow to unload the module, which I'd consider a flawed design
for such an "optional" read-once driver. If we want the device hierarchy
to have a soc root then most DT based platforms will have a /soc DT node
anyway (although no device_type = "soc") that we probably could have a
device registered for in common code rather than each SoC platform
handling that differently? That might then make soc_register_device()
not the creator of the device (if pre-existent) but the supplier of data
to that core device, which should then allow to unload the data provider
with just the sysfs data disappearing until re-inserted (speeding up the
develop-and-test cycle on say not-so-resource-constrained platforms).

On the other hand, one might argue that such information should just be
parsed by EBBR-conformant bootloaders and be passed to the kernel via
standard UEFI interfaces and DMI tables. But I'm not aware of Barebox
having implemented any of that yet, and even for U-Boot (e.g., Realtek
based consumer devices...) not everyone has the GPL sources or tools to
update their bootloader. So, having the kernel we control gather
information relevant to kernel developers does make some sense to me.

Thoughts?

Regards,
Andreas

P.S. Sorry that a seemingly trivial one-line 0-day fix derailed into
this fundamental use case discussion.

arch/arm/mach-ep93xx/core.c:    soc_dev = soc_device_register(soc_dev_attr);
arch/arm/mach-imx/cpu.c:        soc_dev = soc_device_register(soc_dev_attr);
arch/arm/mach-mvebu/mvebu-soc-id.c:     soc_dev =
soc_device_register(soc_dev_attr);
arch/arm/mach-mxs/mach-mxs.c:   soc_dev = soc_device_register(soc_dev_attr);
arch/arm/mach-omap2/id.c:       soc_dev = soc_device_register(soc_dev_attr);
arch/arm/mach-tegra/tegra.c:    struct device *parent =
tegra_soc_device_register();
arch/arm/mach-zynq/common.c:    soc_dev = soc_device_register(soc_dev_attr);
arch/nios2/platform/platform.c:         soc_dev =
soc_device_register(soc_dev_attr);
drivers/soc/amlogic/meson-gx-socinfo.c: soc_dev =
soc_device_register(soc_dev_attr);
drivers/soc/amlogic/meson-mx-socinfo.c: soc_dev =
soc_device_register(soc_dev_attr);
drivers/soc/atmel/soc.c:        soc_dev = soc_device_register(soc_dev_attr);
drivers/soc/bcm/brcmstb/common.c:       soc_dev =
soc_device_register(soc_dev_attr);
drivers/soc/fsl/guts.c: soc_dev = soc_device_register(&soc_dev_attr);
drivers/soc/imx/soc-imx-scu.c:  soc_dev = soc_device_register(soc_dev_attr);
drivers/soc/imx/soc-imx8.c:     soc_dev = soc_device_register(soc_dev_attr);
drivers/soc/qcom/socinfo.c:     qs->soc_dev =
soc_device_register(&qs->attr);
drivers/soc/realtek/chip.c:     soc_dev = soc_device_register(soc_dev_attr);
drivers/soc/renesas/renesas-soc.c:      soc_dev =
soc_device_register(soc_dev_attr);
drivers/soc/samsung/exynos-chipid.c:    soc_dev =
soc_device_register(soc_dev_attr);
drivers/soc/tegra/fuse/fuse-tegra.c:    dev = soc_device_register(attr);
drivers/soc/ux500/ux500-soc-id.c:       soc_dev =
soc_device_register(soc_dev_attr);
drivers/soc/versatile/soc-integrator.c: soc_dev =
soc_device_register(soc_dev_attr);
drivers/soc/versatile/soc-realview.c:   soc_dev =
soc_device_register(soc_dev_attr);

-- 
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 Nürnberg, Germany
GF: Felix Imendörffer
HRB 36809 (AG Nürnberg)
