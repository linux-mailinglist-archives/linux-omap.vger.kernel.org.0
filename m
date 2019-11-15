Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC791FDC11
	for <lists+linux-omap@lfdr.de>; Fri, 15 Nov 2019 12:16:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727171AbfKOLP7 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 15 Nov 2019 06:15:59 -0500
Received: from mx2.suse.de ([195.135.220.15]:42062 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727022AbfKOLP7 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 15 Nov 2019 06:15:59 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 61B3EACEC;
        Fri, 15 Nov 2019 11:15:56 +0000 (UTC)
Subject: Re: Sense of soc bus? (was: [PATCH] base: soc: Export
 soc_device_to_device() helper)
To:     Rob Herring <robh@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
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
        LAKML <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Hartley Sweeten <hsweeten@visionengravers.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Architecture Mailman List <boot-architecture@lists.linaro.org>,
        U-Boot <u-boot@lists.denx.de>
References: <20191103013645.9856-3-afaerber@suse.de>
 <20191111045609.7026-1-afaerber@suse.de> <20191111052741.GB3176397@kroah.com>
 <586fa37c-6292-aca4-fa7c-73064858afaf@suse.de>
 <20191111064040.GA3502217@kroah.com>
 <a88442df-dc6b-07e5-8dee-9e308bdda450@suse.de>
 <20191112052347.GA1197504@kroah.com>
 <20191112072926.isjxfa4ci6akhx56@pengutronix.de>
 <aff81b8e-f041-73a5-6a95-d308fa07842c@suse.de>
 <CAL_JsqLr=fw6zxa=69rtgZ4oxzdw=cVDr3km5ya0pRGsNT1xLw@mail.gmail.com>
From:   =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Organization: SUSE Software Solutions Germany GmbH
Message-ID: <faa9924a-1c61-349c-9c35-da83fd0b3547@suse.de>
Date:   Fri, 15 Nov 2019 12:15:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <CAL_JsqLr=fw6zxa=69rtgZ4oxzdw=cVDr3km5ya0pRGsNT1xLw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Am 14.11.19 um 23:09 schrieb Rob Herring:
> On Tue, Nov 12, 2019 at 4:47 AM Andreas Färber <afaerber@suse.de> wrote:
>> On the other hand, one might argue that such information should just be
>> parsed by EBBR-conformant bootloaders and be passed to the kernel via
>> standard UEFI interfaces and DMI tables. But I'm not aware of Barebox
>> having implemented any of that yet, and even for U-Boot (e.g., Realtek
>> based consumer devices...) not everyone has the GPL sources or tools to
>> update their bootloader. So, having the kernel we control gather
>> information relevant to kernel developers does make some sense to me.
> 
> UEFI and DMI are orthogonal, right. You can't expect DMI on a UEFI+DT system.

Not sure, that's why I CC'ed the EBBR folks for input. If it's not
mandatory today, the next revision of EBBR could just require it - if
that's the unified way between SBBR and EBBR. Little point in doing it
only for EBBR.

On my UEFI+DT based Raspberry Pi 3 Model B I do see it, note the
non-filled Processor Information delivered by U-Boot:

raspi3:~ # dmidecode
# dmidecode 3.2
Getting SMBIOS data from sysfs.
SMBIOS 3.0 present.
7 structures occupying 253 bytes.
Table at 0x3CB3E020.

Handle 0x0000, DMI type 0, 24 bytes
BIOS Information
	Vendor: U-Boot
	Version: 2019.10
	Release Date: 10/26/2019
	ROM Size: 64 kB
	Characteristics:
		PCI is supported
		BIOS is upgradeable
		Selectable boot is supported
		I2O boot is supported
		Targeted content distribution is supported

Handle 0x0001, DMI type 1, 27 bytes
System Information
	Manufacturer: raspberrypi
	Product Name: rpi
	Version: Not Specified
	Serial Number: 00000000********
	UUID: 30303030-3030-3030-6437-623461336666
	Wake-up Type: Reserved
	SKU Number: Not Specified
	Family: Not Specified

Handle 0x0002, DMI type 2, 14 bytes
Base Board Information
	Manufacturer: raspberrypi
	Product Name: rpi
	Version: Not Specified
	Serial Number: Not Specified
	Asset Tag: Not Specified
	Features:
		Board is a hosting board
	Location In Chassis: Not Specified
	Chassis Handle: 0x0000
	Type: Motherboard

Handle 0x0003, DMI type 3, 21 bytes
Chassis Information
	Manufacturer: raspberrypi
	Type: Desktop
	Lock: Not Present
	Version: Not Specified
	Serial Number: Not Specified
	Asset Tag: Not Specified
	Boot-up State: Safe
	Power Supply State: Safe
	Thermal State: Safe
	Security Status: None
	OEM Information: 0x00000000
	Height: Unspecified
	Number Of Power Cords: Unspecified
	Contained Elements: 0

Handle 0x0004, DMI type 4, 48 bytes
Processor Information
	Socket Designation: Not Specified
	Type: Central Processor
	Family: Unknown
	Manufacturer: Unknown
	ID: 00 00 00 00 00 00 00 00
	Version: Unknown
	Voltage: Unknown
	External Clock: Unknown
	Max Speed: Unknown
	Current Speed: Unknown
	Status: Unpopulated
	Upgrade: None
	L1 Cache Handle: Not Provided
	L2 Cache Handle: Not Provided
	L3 Cache Handle: Not Provided
	Serial Number: Not Specified
	Asset Tag: Not Specified
	Part Number: Not Specified
	Characteristics: None

Handle 0x0005, DMI type 32, 11 bytes
System Boot Information
	Status: No errors detected

Handle 0x0006, DMI type 127, 4 bytes
End Of Table


Regards,
Andreas

-- 
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 Nürnberg, Germany
GF: Felix Imendörffer
HRB 36809 (AG Nürnberg)
