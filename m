Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0D674FD0C0
	for <lists+linux-omap@lfdr.de>; Thu, 14 Nov 2019 23:09:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727054AbfKNWJq (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 14 Nov 2019 17:09:46 -0500
Received: from mail.kernel.org ([198.145.29.99]:50974 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726986AbfKNWJq (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 14 Nov 2019 17:09:46 -0500
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1ADE720709;
        Thu, 14 Nov 2019 22:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573769384;
        bh=+oCl5I4WgAiVj5cZFdRcKeFuP4ocS7IjmU0JQrFvBXM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ZylKBYIa2HRb8Y9h4r5VuFNY3m61Z4mZm8Qqw8+CcrxZGewHYN4sP8+ekaY40yUn5
         +m/zPYXX6fR3uzdXfoK0g8I5j7r1RKjgD5d/ts/3nETBvAGrc9ndMLGJbNPfL9MgGA
         5KsjZf012CIa6ev5OO2ozkRcENuJI1MlI888c+DI=
Received: by mail-qk1-f182.google.com with SMTP id 71so6486163qkl.0;
        Thu, 14 Nov 2019 14:09:44 -0800 (PST)
X-Gm-Message-State: APjAAAX2vXtctesxw0oa9iaNx27h32+7b5WYzuWvAggMWVYuour5PSdu
        eL4aiam6zaRGkQyoC/RgfxdKrb0iGt3VR7s9aQ==
X-Google-Smtp-Source: APXvYqxksGqfN7IlIeyK03fPclS2/QAcrB2xhtK9dzMqeKDsFLOpqRTImRYjXwnAh9iWmkNy5LSGL+8JpPqKXBF/Ozw=
X-Received: by 2002:ae9:dd83:: with SMTP id r125mr9995212qkf.223.1573769379837;
 Thu, 14 Nov 2019 14:09:39 -0800 (PST)
MIME-Version: 1.0
References: <20191103013645.9856-3-afaerber@suse.de> <20191111045609.7026-1-afaerber@suse.de>
 <20191111052741.GB3176397@kroah.com> <586fa37c-6292-aca4-fa7c-73064858afaf@suse.de>
 <20191111064040.GA3502217@kroah.com> <a88442df-dc6b-07e5-8dee-9e308bdda450@suse.de>
 <20191112052347.GA1197504@kroah.com> <20191112072926.isjxfa4ci6akhx56@pengutronix.de>
 <aff81b8e-f041-73a5-6a95-d308fa07842c@suse.de>
In-Reply-To: <aff81b8e-f041-73a5-6a95-d308fa07842c@suse.de>
From:   Rob Herring <robh@kernel.org>
Date:   Thu, 14 Nov 2019 16:09:28 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLr=fw6zxa=69rtgZ4oxzdw=cVDr3km5ya0pRGsNT1xLw@mail.gmail.com>
Message-ID: <CAL_JsqLr=fw6zxa=69rtgZ4oxzdw=cVDr3km5ya0pRGsNT1xLw@mail.gmail.com>
Subject: Re: Sense of soc bus? (was: [PATCH] base: soc: Export
 soc_device_to_device() helper)
To:     =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
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
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
        Lee Jones <lee.jones@linaro.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        Alexander Sverdlin <alexander.sverdlin@gmail.com>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Hartley Sweeten <hsweeten@visionengravers.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Architecture Mailman List <boot-architecture@lists.linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, Nov 12, 2019 at 4:47 AM Andreas F=C3=A4rber <afaerber@suse.de> wrot=
e:
>
> Am 12.11.19 um 08:29 schrieb Uwe Kleine-K=C3=B6nig:
> > On Tue, Nov 12, 2019 at 06:23:47AM +0100, Greg Kroah-Hartman wrote:
> >> On Mon, Nov 11, 2019 at 09:10:41PM +0100, Andreas F=C3=A4rber wrote:
> >>> Am 11.11.19 um 07:40 schrieb Greg Kroah-Hartman:
> >>>> On Mon, Nov 11, 2019 at 06:42:05AM +0100, Andreas F=C3=A4rber wrote:
> >>>>> Am 11.11.19 um 06:27 schrieb Greg Kroah-Hartman:
> >>>>>> On Mon, Nov 11, 2019 at 05:56:09AM +0100, Andreas F=C3=A4rber wrot=
e:
> >>>>>>> Use of soc_device_to_device() in driver modules causes a build fa=
ilure.
> >>>>>>> Given that the helper is nicely documented in include/linux/sys_s=
oc.h,
> >>>>>>> let's export it as GPL symbol.
> >>>>>>
> >>>>>> I thought we were fixing the soc drivers to not need this.  What
> >>>>>> happened to that effort?  I thought I had patches in my tree (or
> >>>>>> someone's tree) that did some of this work already, such that this
> >>>>>> symbol isn't needed anymore.
> >>>>>
> >>>>> I do still see this function used in next-20191108 in drivers/soc/.
> >>>>>
> >>>>> I'll be happy to adjust my RFC driver if someone points me to how!
> >>>>
> >>>> Look at c31e73121f4c ("base: soc: Handle custom soc information sysf=
s
> >>>> entries") for how you can just use the default attributes for the so=
c to
> >>>> create the needed sysfs files, instead of having to do it "by hand"
> >>>> which is racy and incorrect.
> >>>
> >>> Unrelated.
> >>>
> >>>>> Given the current struct layout, a type cast might work (but ugly).
> >>>>> Or if we stay with my current RFC driver design, we could use the
> >>>>> platform_device instead of the soc_device (which would clutter the
> >>>>> screen more than "soc soc0:") or resort to pr_info() w/o device.
> >>>>
> >>>> Ick, no, don't cast blindly.  What do you need the pointer for?  Is =
this
> >>>> for in-tree code?
> >>>
> >>> No, an RFC patchset: https://patchwork.kernel.org/cover/11224261/
> >>>
> >>> As I indicated above, I used it for a dev_info(), which I can easily
> >>> avoid by using pr_info() instead:
> >>>
> >>> diff --git a/drivers/soc/realtek/chip.c b/drivers/soc/realtek/chip.c
> >>> index e5078c6731fd..f9380e831659 100644
> >>> --- a/drivers/soc/realtek/chip.c
> >>> +++ b/drivers/soc/realtek/chip.c
> >>> @@ -178,8 +178,7 @@ static int rtd_soc_probe(struct platform_device *=
pdev)
> >>>
> >>>         platform_set_drvdata(pdev, soc_dev);
> >>>
> >>> -       dev_info(soc_device_to_device(soc_dev),
> >>> -               "%s %s (0x%08x) rev %s (0x%08x) detected\n",
> >>> +       pr_info("%s %s (0x%08x) rev %s (0x%08x) detected\n",
> >>>                 soc_dev_attr->family, soc_dev_attr->soc_id, chip_id,
> >>>                 soc_dev_attr->revision, chip_rev);
> >>
> >> First off, the driver should not be spitting out noise for when all go=
es
> >> well like this :)
> >
> > I didn't follow the discussion closely, but I think I want to object
> > here a bit. While I agree that each driver emitting some stuff to the
> > log buffer is hardly helpful, seeing the exact SoC details is indeed
> > useful at times. With my Debian kernel team member hat on, I'd say
> > keep this information. This way the SoC details make it into kernel bug
> > reports without effort on our side.
>
> Seconded. For example, RTD1295 will support LSADC only from revision B00
> on (and it's not the first time I'm seeing such things in the industry).
> So if a user complains, it will be helpful to see that information.
>
> Referencing your Amlogic review, with all due respect for its authors,
> the common framework here just lets that information evaporate into the
> deeps of sysfs. People who know can check /sys/bus/soc/devices/soc0, but
> ordinary users will at most upload dmesg output to a Bugzilla ticket.
>
> And it was precisely info-level boot output from the Amlogic GX driver
> that made me aware of this common framework and inspired me to later
> contribute such a driver elsewhere myself. That's not a bad effect. ;)
>
> So if anything, we should standardize that output and move it into
> soc_device_register(): "<family> <soc_id> [rev <revision>] detected"
> with suitable NULL checks? (what I did above for Realtek, minus hex)
>
> The info level seems correct to me - it allows people to use a different
> log_level if they only care about warnings or errors on the console;
> it's not debug info for that driver, except in my case the accompanying
> hex numbers that I'd be happy to drop in favor of standardization.
>
> Another aspect here is that the overall amount of soc_device_register()
> users is just an estimated one third above the analysis shared before.
> In particular server platforms, be it arm64 or x86_64, that potentially
> have more than one SoC integrated in a multi-socket configuration, don't
> feed into this soc bus at all! Therefore my comment that
> dev_info()-printed "soc soc0:" is kind of useless if there's only one
> SoC on those boards. I'm not aware of any tool or a more common file
> aggregating this information, certainly not /proc/cpuinfo and I'm not
> aware of any special "lssoc" tool either. And if there's no ACPI/DMI
> driver feeding support-relevant information into this framework to be
> generally useful, I don't expect the big distros to spend time on
> improving its usability.

lshw? That works with info from DT, sysfs, and DMI. It did have some
endian bugs (written for sparc/power) last time I looked at it 5+
years ago.

> So if we move info output into base/soc.c, we could continue using
> dev_info() with "soc"-grep'able prefix in the hopes that someday we'll
> have more than one soc device on the bus and will need to distinguish;
> otherwise yes, pr_info() would change the output format for Amlogic (and
> so would a harmonization of the text), but does anyone really care in
> practice? Tools shouldn't be relying on its output format, and humans
> will understand equally either way.
>
> Finally, arch/arm seems unique in that it has the machine_desc mechanism
> that allows individual SoCs to force creating their soc_device early and
> using it as parent for further DT-created platform_devices. With arm64
> we've lost that ability, and nios2 is not using it either.
> A bad side effect (with SUSE hat on) is that this parent design pattern
> does not allow to build such drivers as modules, which means that distro
> configs using arm's multi-platform, e.g., CONFIG_ARCH_MULTI_V7 will get
> unnecessary code creep as new platforms get added over time (beyond the
> basic clk, pinctrl, tty and maybe timer).
> Even if it were possible to call into a driver module that early, using
> it as parent would seem to imply that all the references by its children
> would not allow to unload the module, which I'd consider a flawed design
> for such an "optional" read-once driver. If we want the device hierarchy
> to have a soc root then most DT based platforms will have a /soc DT node
> anyway (although no device_type =3D "soc") that we probably could have a
> device registered for in common code rather than each SoC platform
> handling that differently? That might then make soc_register_device()
> not the creator of the device (if pre-existent) but the supplier of data
> to that core device, which should then allow to unload the data provider
> with just the sysfs data disappearing until re-inserted (speeding up the
> develop-and-test cycle on say not-so-resource-constrained platforms).

I for one would like to for this to be consistent. Either we always
have an SoC device parent or never. I wouldn't decide based on having
a DT node or not either. Generally, we should always have MMIO devices
under a bus node and perhaps more than one, but that doesn't always
happen. I think building the drivers as modules is a good reason to do
away with the parent device.

It would also allow getting rid of remaining
of_platform_default_populate calls in arm platforms except for auxdata
cases. Pretty much that's the ones you list below in arch/arm/.

> On the other hand, one might argue that such information should just be
> parsed by EBBR-conformant bootloaders and be passed to the kernel via
> standard UEFI interfaces and DMI tables. But I'm not aware of Barebox
> having implemented any of that yet, and even for U-Boot (e.g., Realtek
> based consumer devices...) not everyone has the GPL sources or tools to
> update their bootloader. So, having the kernel we control gather
> information relevant to kernel developers does make some sense to me.

UEFI and DMI are orthogonal, right. You can't expect DMI on a UEFI+DT syste=
m.

Rob

>
> Thoughts?
>
> Regards,
> Andreas
>
> P.S. Sorry that a seemingly trivial one-line 0-day fix derailed into
> this fundamental use case discussion.
>
> arch/arm/mach-ep93xx/core.c:    soc_dev =3D soc_device_register(soc_dev_a=
ttr);
> arch/arm/mach-imx/cpu.c:        soc_dev =3D soc_device_register(soc_dev_a=
ttr);
> arch/arm/mach-mvebu/mvebu-soc-id.c:     soc_dev =3D
> soc_device_register(soc_dev_attr);
> arch/arm/mach-mxs/mach-mxs.c:   soc_dev =3D soc_device_register(soc_dev_a=
ttr);
> arch/arm/mach-omap2/id.c:       soc_dev =3D soc_device_register(soc_dev_a=
ttr);
> arch/arm/mach-tegra/tegra.c:    struct device *parent =3D
> tegra_soc_device_register();
> arch/arm/mach-zynq/common.c:    soc_dev =3D soc_device_register(soc_dev_a=
ttr);
> arch/nios2/platform/platform.c:         soc_dev =3D
> soc_device_register(soc_dev_attr);
> drivers/soc/amlogic/meson-gx-socinfo.c: soc_dev =3D
> soc_device_register(soc_dev_attr);
> drivers/soc/amlogic/meson-mx-socinfo.c: soc_dev =3D
> soc_device_register(soc_dev_attr);
> drivers/soc/atmel/soc.c:        soc_dev =3D soc_device_register(soc_dev_a=
ttr);
> drivers/soc/bcm/brcmstb/common.c:       soc_dev =3D
> soc_device_register(soc_dev_attr);
> drivers/soc/fsl/guts.c: soc_dev =3D soc_device_register(&soc_dev_attr);
> drivers/soc/imx/soc-imx-scu.c:  soc_dev =3D soc_device_register(soc_dev_a=
ttr);
> drivers/soc/imx/soc-imx8.c:     soc_dev =3D soc_device_register(soc_dev_a=
ttr);
> drivers/soc/qcom/socinfo.c:     qs->soc_dev =3D
> soc_device_register(&qs->attr);
> drivers/soc/realtek/chip.c:     soc_dev =3D soc_device_register(soc_dev_a=
ttr);
> drivers/soc/renesas/renesas-soc.c:      soc_dev =3D
> soc_device_register(soc_dev_attr);
> drivers/soc/samsung/exynos-chipid.c:    soc_dev =3D
> soc_device_register(soc_dev_attr);
> drivers/soc/tegra/fuse/fuse-tegra.c:    dev =3D soc_device_register(attr)=
;
> drivers/soc/ux500/ux500-soc-id.c:       soc_dev =3D
> soc_device_register(soc_dev_attr);
> drivers/soc/versatile/soc-integrator.c: soc_dev =3D
> soc_device_register(soc_dev_attr);
> drivers/soc/versatile/soc-realview.c:   soc_dev =3D
> soc_device_register(soc_dev_attr);
>
> --
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
> GF: Felix Imend=C3=B6rffer
> HRB 36809 (AG N=C3=BCrnberg)
