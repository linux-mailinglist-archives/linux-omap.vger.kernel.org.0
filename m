Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E6D6B269BA
	for <lists+linux-omap@lfdr.de>; Wed, 22 May 2019 20:19:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727984AbfEVSTI (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 22 May 2019 14:19:08 -0400
Received: from emh02.mail.saunalahti.fi ([62.142.5.108]:50276 "EHLO
        emh02.mail.saunalahti.fi" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729517AbfEVSTH (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 22 May 2019 14:19:07 -0400
Received: from darkstar.musicnaut.iki.fi (85-76-4-80-nat.elisa-mobile.fi [85.76.4.80])
        by emh02.mail.saunalahti.fi (Postfix) with ESMTP id 939AB200A2;
        Wed, 22 May 2019 21:19:04 +0300 (EEST)
Date:   Wed, 22 May 2019 21:19:04 +0300
From:   Aaro Koskinen <aaro.koskinen@iki.fi>
To:     Corentin Labbe <clabbe.montjoie@gmail.com>
Cc:     Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org,
        qemu-devel@nongnu.org, linux-kernel@vger.kernel.org
Subject: Re: Running linux on qemu omap
Message-ID: <20190522181904.GE3621@darkstar.musicnaut.iki.fi>
References: <20190520190533.GA28160@Red>
 <20190521232323.GD3621@darkstar.musicnaut.iki.fi>
 <20190522093341.GA32154@Red>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190522093341.GA32154@Red>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

On Wed, May 22, 2019 at 11:33:41AM +0200, Corentin Labbe wrote:
> qemu-system-arm -M help |grep OMAP
> cheetah              Palm Tungsten|E aka. Cheetah PDA (OMAP310)
> n800                 Nokia N800 tablet aka. RX-34 (OMAP2420)
> n810                 Nokia N810 tablet aka. RX-44 (OMAP2420)
> sx1                  Siemens SX1 (OMAP310) V2
> sx1-v1               Siemens SX1 (OMAP310) V1
> 
> > > The maximum I can get with omap1_defconfig is
> > > qemu-system-arm -kernel zImage -nographic -machine cheetah -append 'root=/dev/ram0 console=ttyO0'
> > > Uncompressing Linux... done, booting the kernel.
> > > then nothing more.

With N800/N810 omap2plus_defconfig should be used instead. However,
I don't think that works either (but haven't tried recently). Also with
N800/N810 you need to append the DTB file to the kernel image.

> thanks, with your config I was able to boot both sx1 and cheetah
> (by adding CONFIG_MACH_OMAP_PALMTE=y)

Great!

> Now I need to find what is missing (or in excess) in omap1_defconfig
> to made it boot

A simple (but slow) way would be to start adding config options from
omap1_defconfig one by one to the working config, and see which one
makes it fail.

> Another obstacle is the disabling of the initrd, perhaps by using
> sdcard as an "initrd" will do the trick, but the sdcard is ignored for
> the moment.

Using CONFIG_INITRAMFS_SOURCE it's possible to include a file system
inside the kernel image.

Based on your boot log, I think the kernel probably panics before the
MMC/sdcard is found (asynchronous probe). You could try adding rootwait
to the kernel command line. (My config has CONFIG_CMDLINE_FORCE=y, so
you need to add it to CONFIG_CMDLINE, as QEMU -append gets ignored). Also
the sdcard will appear as /dev/mmcblk0 instead of /dev/sda.

The sdcard is working fine for me, and it can be used to run a full-blown
distro rootfs; I don't know what is the capacity limit in the MMC driver
but at least 16 GB image is working fine:

[    2.011012] mmc0: new SDHC card at address 4567
[    2.016419] mmcblk0: mmc0:4567 QEMU! 16.0 GiB

A.
