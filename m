Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 51C15FD824
	for <lists+linux-omap@lfdr.de>; Fri, 15 Nov 2019 09:52:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726818AbfKOIwc (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 15 Nov 2019 03:52:32 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:41619 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726598AbfKOIwb (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 15 Nov 2019 03:52:31 -0500
Received: by mail-wr1-f67.google.com with SMTP id b18so8573005wrj.8
        for <linux-omap@vger.kernel.org>; Fri, 15 Nov 2019 00:52:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:openpgp:autocrypt:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=HnZknD5jkMrmzi5pstYxNKUFF0k7wyMVnzUBd+7cq9A=;
        b=c7o7q7Wj6qf4k4rKlziTDGfY3gzMYdhiKrRSvtwWgVT489nbZoLL77H5qfmImzggwK
         sJT9U0FUZZJSZO/q9v7nNZ0MFXGWvXz/F67aNNU++IeMDcOGkfBbn5RwI1k2TOU21u4J
         H6eA7a1X54EsaFjmYFiIeljq2f/rM2saFXBIiAVwm9mh2vh7oE4AmhBkWMDyyHTlx90e
         gOwm77d5IRumxWwIBk0zU6+ngLW9UX3ujoWIKpUnP6ecFUXp1WZzZaY6XvqO7VROSaCl
         SMmzfGj6+fGqE4bRNpucdCrC5AZrxvf2dzDBO1nGk58NhIXWrY2QIbcxcz6oecSmP5Xm
         EcpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :organization:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=HnZknD5jkMrmzi5pstYxNKUFF0k7wyMVnzUBd+7cq9A=;
        b=n3del1TiZj2s4PHGpI4z7Yvx9eStYzPQxHZg04edI5q3lyBctFYNvSuc6tqHGhT3j8
         uHEKy26UP820hoSB/qNBWbqFRC/fGaO9mZRc68A6lfYU+FKLpMAV7j0H5pQnVLZIIeZN
         6PvsJw5bADHUog9T8EigXw8rcbfRUvPtag7Rk69CU2rolbeAf4ExrLEgvYcCEzvd94Un
         hAOWQVKJuLbxBEEekQ7UMCGNcmMqcc78j5LL2KQnKbotid+raDD0mmbzwicbJnBxwJ7h
         vFaz/8iSYP73gxcmvnjyb0EUUGVqXZIxKx5GuIvKL0YluMX/bbBPaq1CctCIndGitEXm
         gyMw==
X-Gm-Message-State: APjAAAVXeX1y/uPerqwBvjjuw7L+92bKbO/9Ry4Tf6Z4OwUf0c/tYiY8
        2QM5/lJ5A8Wu0p2kQA21l5N+ag==
X-Google-Smtp-Source: APXvYqwByBAWn/+GE23j+4+F5HiPg7FEaiqf/5p/yxZNkWC0+nOGSIMU5rXZ/KUsTboBZ2nt5u1aKg==
X-Received: by 2002:a5d:490b:: with SMTP id x11mr13394819wrq.111.1573807947668;
        Fri, 15 Nov 2019 00:52:27 -0800 (PST)
Received: from [10.1.3.173] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id b3sm9700259wmh.17.2019.11.15.00.52.26
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 15 Nov 2019 00:52:26 -0800 (PST)
Subject: Re: Sense of soc bus? (was: [PATCH] base: soc: Export
 soc_device_to_device() helper)
To:     =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
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
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
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
From:   Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <c8572f70-5550-8cee-4381-fd7de7ae5af0@baylibre.com>
Date:   Fri, 15 Nov 2019 09:52:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <aff81b8e-f041-73a5-6a95-d308fa07842c@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 12/11/2019 11:47, Andreas Färber wrote:
> Am 12.11.19 um 08:29 schrieb Uwe Kleine-König:
>> On Tue, Nov 12, 2019 at 06:23:47AM +0100, Greg Kroah-Hartman wrote:
>>> On Mon, Nov 11, 2019 at 09:10:41PM +0100, Andreas Färber wrote:
>>>> Am 11.11.19 um 07:40 schrieb Greg Kroah-Hartman:
>>>>> On Mon, Nov 11, 2019 at 06:42:05AM +0100, Andreas Färber wrote:
>>>>>> Am 11.11.19 um 06:27 schrieb Greg Kroah-Hartman:
>>>>>>> On Mon, Nov 11, 2019 at 05:56:09AM +0100, Andreas Färber wrote:
>>>>>>>> Use of soc_device_to_device() in driver modules causes a build failure.
>>>>>>>> Given that the helper is nicely documented in include/linux/sys_soc.h,
>>>>>>>> let's export it as GPL symbol.
>>>>>>>
>>>>>>> I thought we were fixing the soc drivers to not need this.  What
>>>>>>> happened to that effort?  I thought I had patches in my tree (or
>>>>>>> someone's tree) that did some of this work already, such that this
>>>>>>> symbol isn't needed anymore.
>>>>>>
>>>>>> I do still see this function used in next-20191108 in drivers/soc/.
>>>>>>
>>>>>> I'll be happy to adjust my RFC driver if someone points me to how!
>>>>>
>>>>> Look at c31e73121f4c ("base: soc: Handle custom soc information sysfs
>>>>> entries") for how you can just use the default attributes for the soc to
>>>>> create the needed sysfs files, instead of having to do it "by hand"
>>>>> which is racy and incorrect.
>>>>
>>>> Unrelated.
>>>>
>>>>>> Given the current struct layout, a type cast might work (but ugly).
>>>>>> Or if we stay with my current RFC driver design, we could use the
>>>>>> platform_device instead of the soc_device (which would clutter the
>>>>>> screen more than "soc soc0:") or resort to pr_info() w/o device.
>>>>>
>>>>> Ick, no, don't cast blindly.  What do you need the pointer for?  Is this
>>>>> for in-tree code?
>>>>
>>>> No, an RFC patchset: https://patchwork.kernel.org/cover/11224261/
>>>>
>>>> As I indicated above, I used it for a dev_info(), which I can easily
>>>> avoid by using pr_info() instead:
>>>>
>>>> diff --git a/drivers/soc/realtek/chip.c b/drivers/soc/realtek/chip.c
>>>> index e5078c6731fd..f9380e831659 100644
>>>> --- a/drivers/soc/realtek/chip.c
>>>> +++ b/drivers/soc/realtek/chip.c
>>>> @@ -178,8 +178,7 @@ static int rtd_soc_probe(struct platform_device *pdev)
>>>>
>>>>         platform_set_drvdata(pdev, soc_dev);
>>>>
>>>> -       dev_info(soc_device_to_device(soc_dev),
>>>> -               "%s %s (0x%08x) rev %s (0x%08x) detected\n",
>>>> +       pr_info("%s %s (0x%08x) rev %s (0x%08x) detected\n",
>>>>                 soc_dev_attr->family, soc_dev_attr->soc_id, chip_id,
>>>>                 soc_dev_attr->revision, chip_rev);
>>>
>>> First off, the driver should not be spitting out noise for when all goes
>>> well like this :)
>>
>> I didn't follow the discussion closely, but I think I want to object
>> here a bit. While I agree that each driver emitting some stuff to the
>> log buffer is hardly helpful, seeing the exact SoC details is indeed
>> useful at times. With my Debian kernel team member hat on, I'd say
>> keep this information. This way the SoC details make it into kernel bug
>> reports without effort on our side.
> 
> Seconded. For example, RTD1295 will support LSADC only from revision B00
> on (and it's not the first time I'm seeing such things in the industry).
> So if a user complains, it will be helpful to see that information.
> 
> Referencing your Amlogic review, with all due respect for its authors,
> the common framework here just lets that information evaporate into the
> deeps of sysfs. 

Hopefully we never had the case where needed to use the soc info in drivers,
but now we have one and having such infrastructure already in-place will help.

Renesas platforms makes a extensive usage of the soc info infrastructure to
figure out plenty of HW parameters at runtime and lower their DT changes.

Neil

> People who know can check /sys/bus/soc/devices/soc0, but
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
> 
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
> anyway (although no device_type = "soc") that we probably could have a
> device registered for in common code rather than each SoC platform
> handling that differently? That might then make soc_register_device()
> not the creator of the device (if pre-existent) but the supplier of data
> to that core device, which should then allow to unload the data provider
> with just the sysfs data disappearing until re-inserted (speeding up the
> develop-and-test cycle on say not-so-resource-constrained platforms).
> 
> On the other hand, one might argue that such information should just be
> parsed by EBBR-conformant bootloaders and be passed to the kernel via
> standard UEFI interfaces and DMI tables. But I'm not aware of Barebox
> having implemented any of that yet, and even for U-Boot (e.g., Realtek
> based consumer devices...) not everyone has the GPL sources or tools to
> update their bootloader. So, having the kernel we control gather
> information relevant to kernel developers does make some sense to me.
> 
> Thoughts?
> 
> Regards,
> Andreas
> 
> P.S. Sorry that a seemingly trivial one-line 0-day fix derailed into
> this fundamental use case discussion.
> 
> arch/arm/mach-ep93xx/core.c:    soc_dev = soc_device_register(soc_dev_attr);
> arch/arm/mach-imx/cpu.c:        soc_dev = soc_device_register(soc_dev_attr);
> arch/arm/mach-mvebu/mvebu-soc-id.c:     soc_dev =
> soc_device_register(soc_dev_attr);
> arch/arm/mach-mxs/mach-mxs.c:   soc_dev = soc_device_register(soc_dev_attr);
> arch/arm/mach-omap2/id.c:       soc_dev = soc_device_register(soc_dev_attr);
> arch/arm/mach-tegra/tegra.c:    struct device *parent =
> tegra_soc_device_register();
> arch/arm/mach-zynq/common.c:    soc_dev = soc_device_register(soc_dev_attr);
> arch/nios2/platform/platform.c:         soc_dev =
> soc_device_register(soc_dev_attr);
> drivers/soc/amlogic/meson-gx-socinfo.c: soc_dev =
> soc_device_register(soc_dev_attr);
> drivers/soc/amlogic/meson-mx-socinfo.c: soc_dev =
> soc_device_register(soc_dev_attr);
> drivers/soc/atmel/soc.c:        soc_dev = soc_device_register(soc_dev_attr);
> drivers/soc/bcm/brcmstb/common.c:       soc_dev =
> soc_device_register(soc_dev_attr);
> drivers/soc/fsl/guts.c: soc_dev = soc_device_register(&soc_dev_attr);
> drivers/soc/imx/soc-imx-scu.c:  soc_dev = soc_device_register(soc_dev_attr);
> drivers/soc/imx/soc-imx8.c:     soc_dev = soc_device_register(soc_dev_attr);
> drivers/soc/qcom/socinfo.c:     qs->soc_dev =
> soc_device_register(&qs->attr);
> drivers/soc/realtek/chip.c:     soc_dev = soc_device_register(soc_dev_attr);
> drivers/soc/renesas/renesas-soc.c:      soc_dev =
> soc_device_register(soc_dev_attr);
> drivers/soc/samsung/exynos-chipid.c:    soc_dev =
> soc_device_register(soc_dev_attr);
> drivers/soc/tegra/fuse/fuse-tegra.c:    dev = soc_device_register(attr);
> drivers/soc/ux500/ux500-soc-id.c:       soc_dev =
> soc_device_register(soc_dev_attr);
> drivers/soc/versatile/soc-integrator.c: soc_dev =
> soc_device_register(soc_dev_attr);
> drivers/soc/versatile/soc-realview.c:   soc_dev =
> soc_device_register(soc_dev_attr);
> 

