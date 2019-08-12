Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 94592899B8
	for <lists+linux-omap@lfdr.de>; Mon, 12 Aug 2019 11:21:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727248AbfHLJVO (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 12 Aug 2019 05:21:14 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:37647 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727023AbfHLJVN (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 12 Aug 2019 05:21:13 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20190812092110euoutp02029e689816a36fa467c8c452e41dcc43~6Imy2NoSb1185411854euoutp02q
        for <linux-omap@vger.kernel.org>; Mon, 12 Aug 2019 09:21:10 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20190812092110euoutp02029e689816a36fa467c8c452e41dcc43~6Imy2NoSb1185411854euoutp02q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1565601670;
        bh=XADl3E0ocFQktGQLli+F4PApnzQiN9HeNOsiSPxkCBc=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=JxMMK1A9ww1W6OL8JciMBpBYm6OpY4smWIogbXNv2VZUc413rdU1EpHnt5LOir/M5
         LtZlZ3pgZwjqEPEQ2xZvjBkqdSPSdLr4ZZ6OkSMhe80kD7PSf3Mg/Q++Y+trcX0/WD
         HnOVa8OGMDwafwXJ2D+FMMNeQ4r/uo0WoPmgysGc=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20190812092109eucas1p1a8c70054cf60f6f7891e5329afb42db6~6ImyHmub80898908989eucas1p11;
        Mon, 12 Aug 2019 09:21:09 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 3A.B2.04469.58F215D5; Mon, 12
        Aug 2019 10:21:09 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20190812092108eucas1p2484e38c892c4efd7d84aa26efd6b3b4e~6ImxHzFCL3275032750eucas1p2G;
        Mon, 12 Aug 2019 09:21:08 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20190812092108eusmtrp19368d65c7cbbab771e52de4cbaa9d227~6Imw4vXoB1828418284eusmtrp1F;
        Mon, 12 Aug 2019 09:21:08 +0000 (GMT)
X-AuditID: cbfec7f2-54fff70000001175-7e-5d512f859754
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id C4.F2.04117.48F215D5; Mon, 12
        Aug 2019 10:21:08 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20190812092108eusmtip1694326cce266e2d779ea087f823c0236~6ImwV-gVd0771907719eusmtip1g;
        Mon, 12 Aug 2019 09:21:08 +0000 (GMT)
Subject: Re: [PATCH 02/22] ARM: omap1: make omapfb standalone compilable
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Tony Lindgren <tony@atomide.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        linux-omap <linux-omap@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>
From:   Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <9b2b4623-f1cb-0e50-691e-e18f8f864c8f@samsung.com>
Date:   Mon, 12 Aug 2019 11:21:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAK8P3a0_v1XM-fH5TOr-osrdLOsfYGbG8VCqktuSgUU7jKtgNQ@mail.gmail.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01Se0hTcRj1t3t3dx1OrtPyy8pqmJWUj0i5pJiFwS0qHPVHFGIrLyrq1E0t
        LcjIUkzQZiW+C82pWC7fTwxHrvARltoSSTMRjSzTJvmY5HYn+d/5zncO53zwkZi4j+9ERsjj
        WYVcFiUhhHhj99L7Q/c8pMGeb8v309XTAbRR1S2gBw2/CPpuaQ1BP1pV8+jab8N8+mNrIUEX
        lGXhdE3JCEF3Dp4OEDIryyrELBpUOKM1PMOZ0eF2guksqhYwYw90PKau7Daj0zfxmIVa5yDr
        S0K/UDYqIpFVePhfEYY3lxZjsQ3uNwYWM7EU9MQlA1mTQB2B0cEpXgYSkmKqAkF7Qy3BDX8Q
        LHX3I25YQLAwPklsWApmJywLNYI6wzDGDbMI0lf+IpPKnmIgrb1HYMIO1B54PD1lFmFUHgZv
        XrXwTQuCOgoP06rMBhHlD3PqVDOPU3thLbXfzG+hLsJYt4bPaezgXd4kbsLWlBRSC4zmShjl
        CCOTJTwO74Km2UJzGFAzAijLu2PpHQg5RRMCDtvDd129Be+AnpxMnDO8RGBMn7a4mxCoc9Ys
        bl/Q6gbWa5DrEQegptWDo4/Dz9UaZKKBsgX9rB1XwhZUjbkYR4sg/b6YU7uCplxDbMRmtFRi
        2UiSv+m0/E3n5G86J/9/7lOEVyFHNkEZHcYqveTsdXelLFqZIA9zvxYTXYvWn6xnTTffjAwf
        rnYhikQSG5FmJShYzJclKpOiuxCQmMRBFG9cp0ShsqRkVhETokiIYpVdaDuJSxxFN63GL4up
        MFk8G8mysaxiY8sjrZ1SUPyFc3a7bZ7beb7O7WjLkeuTNd6+q+ywNK7wls3gwU+ey8KFfSHn
        ez0Olw4N9RY1nvA2hmrPuqu+bN05x/9tpd/GnNS1+8gCXUojs91KpGc0qx36H83auUpjYfHK
        vOsMljUQ9Zms8HOjTzm7+rw41haZpXXVdfnlxdX3TfYK0FcJrgyXeblhCqXsH6J5AkNgAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrLIsWRmVeSWpSXmKPExsVy+t/xu7ot+oGxBuc3qViseeFg8XfSMXaL
        K1/fs1k0L17PZjHlz3Imi02Pr7FaXN41h81i9pJ+Fov182+xWey/4uXA5fH71yRGj29fJ7F4
        HP66kMXjzrU9bB77565h97jffZzJY/OSeo/jN7YzeXzeJBfAGaVnU5RfWpKqkJFfXGKrFG1o
        YaRnaGmhZ2RiqWdobB5rZWSqpG9nk5Kak1mWWqRvl6CXsWPxPOaCrXoVF7/1MDcwTlPpYuTk
        kBAwkZj99hFjFyMXh5DAUkaJvqkX2LsYOYASMhLH15dB1AhL/LnWxQZR85pRYtbml4wgCWEB
        D4n2PafZQWwRAUWJqS+eMYMUMQvMZZZY9ugyWEJIYDWzxIalwiA2m4CVxMT2VWDNvAJ2Eh+W
        t7CC2CwCqhL/Ws6BxUUFIiTOvF/BAlEjKHFy5hMwm1MgUKJl9l82EJtZQF3iz7xLzBC2uMSt
        J/OZIGx5ie1v5zBPYBSahaR9FpKWWUhaZiFpWcDIsopRJLW0ODc9t9hIrzgxt7g0L10vOT93
        EyMwarcd+7llB2PXu+BDjAIcjEo8vBE/A2KFWBPLiitzDzFKcDArifCW/AUK8aYkVlalFuXH
        F5XmpBYfYjQFem4is5Rocj4woeSVxBuaGppbWBqaG5sbm1koifN2CByMERJITyxJzU5NLUgt
        gulj4uCUamC05Ir9tXx7rcfizUs+qK/g2nX+8N+ko2fTWiod/P6pfPL2Zzv1+9xujo2b2s4e
        2tyj8X+JS5di2LFwl+uJ1U3id8wiVXvviEZ3LWb4yD1zVVS0SdmB/x/3fZ3w/uoXv11JbH92
        JVw6Z/r/+9mA7yYNBv9XOCpMvW9w9oXacukp8w679wU+TG9yUWIpzkg01GIuKk4EAJ7Ifh7w
        AgAA
X-CMS-MailID: 20190812092108eucas1p2484e38c892c4efd7d84aa26efd6b3b4e
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20190808212453epcas2p44ff418662ee1acf428c6842ee4488f9f
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190808212453epcas2p44ff418662ee1acf428c6842ee4488f9f
References: <20190808212234.2213262-1-arnd@arndb.de>
        <CGME20190808212453epcas2p44ff418662ee1acf428c6842ee4488f9f@epcas2p4.samsung.com>
        <20190808212234.2213262-3-arnd@arndb.de>
        <55c9608d-68c4-17f6-2682-7668d5d7720a@samsung.com>
        <CAK8P3a3grFEGr33s327yNMabK5=1kCJc3k7y55dhzQx9sTvkyQ@mail.gmail.com>
        <487da98d-a862-0207-289a-bca8ff18e51a@samsung.com>
        <CAK8P3a0_v1XM-fH5TOr-osrdLOsfYGbG8VCqktuSgUU7jKtgNQ@mail.gmail.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


On 8/9/19 9:55 PM, Arnd Bergmann wrote:
> On Fri, Aug 9, 2019 at 4:36 PM Bartlomiej Zolnierkiewicz
> <b.zolnierkie@samsung.com> wrote:
>> On 8/9/19 1:43 PM, Arnd Bergmann wrote:
> 
>>>
>>> That would have been ok as well, but having the addition here was
>>> intentional and seems more logical to me as this is where the headers
>>> get moved around.
>> I see that this is an optimization for making the patch series more
>> compact but I think that this addition logically belongs to patch #9
>> (which adds support for COMPILE_TEST) where the new code is required.
>>
>> Moreover patch description for patch #2 lacks any comment about this
>> addition being a preparation for changes in patch #9 so I was quite
>> puzzled about its purpose when seeing it first.
>>
>> Therefore please have mercy on the poor/stupid reviewer and don't do
>> such optimizations intentionally (or at least describe them properly
>> somewhere).. ;-)
> 
> Ok, I looked at it some more and agree that you are right. I've split it
> up further now into patches that make more sense by themselves:
> 
> commit ad71cdc54404ecde2e88678ee6bc7ae7fb8aec97
> Author: Arnd Bergmann <arnd@arndb.de>
> Date:   Tue Aug 6 16:08:34 2019 +0200
> 
>     fbdev: omap: avoid using mach/*.h files
> 
>     All the headers we actually need are now in include/linux/soc,
>     so use those versions instead and allow compile-testing on
>     other architectures.
> 
>     Acked-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
>     Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> 
>  drivers/video/backlight/Kconfig          | 4 ++--
>  drivers/video/backlight/omap1_bl.c       | 4 ++--
>  drivers/video/fbdev/omap/Kconfig         | 4 ++--
>  drivers/video/fbdev/omap/lcd_ams_delta.c | 2 +-
>  drivers/video/fbdev/omap/lcd_dma.c       | 3 ++-
>  drivers/video/fbdev/omap/lcd_inn1510.c   | 2 +-
>  drivers/video/fbdev/omap/lcd_osk.c       | 4 ++--
>  drivers/video/fbdev/omap/lcdc.c          | 2 ++
>  drivers/video/fbdev/omap/omapfb_main.c   | 3 +--
>  drivers/video/fbdev/omap/sossi.c         | 1 +
>  10 files changed, 16 insertions(+), 13 deletions(-)
> 
> commit 959e0d68751757e84dd703f60405c7268763dba4
> Author: Arnd Bergmann <arnd@arndb.de>
> Date:   Fri Aug 9 21:27:01 2019 +0200
> 
>     fbdev: omap: pass irqs as resource
> 
>     To avoid relying on the mach/irqs.h header, stop using
>     OMAP_LCDC_IRQ and INT_1610_SoSSI_MATCH directly in the driver
>     code, but instead pass these as resources.
> 
>     Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> 
>  arch/arm/mach-omap1/fb.c               | 19 ++++++++++++++++++-
>  drivers/video/fbdev/omap/lcdc.c        |  6 +++---
>  drivers/video/fbdev/omap/omapfb.h      |  2 ++
>  drivers/video/fbdev/omap/omapfb_main.c | 16 +++++++++++++++-
>  drivers/video/fbdev/omap/sossi.c       |  2 +-
>  5 files changed, 39 insertions(+), 6 deletions(-)
> 
> 
> commit 6643f7a7da3ca7ce8f2ff094fecab7a0fd706acf
> Author: Arnd Bergmann <arnd@arndb.de>
> Date:   Fri Aug 9 21:42:31 2019 +0200
> 
>     ARM: omap1: declare a dummy omap_set_dma_priority
> 
>     omapfb calls directly into the omap_set_dma_priority() function in
>     the DMA driver. This prevents compile-testing omapfb on other
>     architectures. Add an inline function next to the other ones
>     for non-omap configurations.
> 
>     Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> 
>  include/linux/omap-dma.h | 3 +++
>  1 file changed, 3 insertions(+)
> 
> commit 154bfb7ddcecdbca66d9a086776a3108831ef0b9
> Author: Arnd Bergmann <arnd@arndb.de>
> Date:   Mon Aug 5 23:15:37 2019 +0200
> 
>     ARM: omap1: move lcd_dma code into omapfb driver
> 
>     The omapfb driver is split into platform specific code for omap1, and
>     driver code that is also specific to omap1.
> 
>     Moving both parts into the driver directory simplifies the structure
>     and avoids the dependency on certain omap machine header files.
> 
>     As mach/lcd_dma.h can not be included from include/linux/omap-dma.h
>     any more now, move the omap_lcd_dma_running() declaration into the
>     omap-dma header, which matches where it is defined.
> 
>     Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> 
>  arch/arm/mach-omap1/Makefile
>    |  4 ----
>  arch/arm/mach-omap1/include/mach/lcdc.h
>    | 44 --------------------------------------------
>  drivers/video/fbdev/Makefile
>    |  2 +-
>  drivers/video/fbdev/omap/Makefile
>    |  5 +++++
>  {arch/arm/mach-omap1 => drivers/video/fbdev/omap}/lcd_dma.c
>    |  4 +++-
>  {arch/arm/mach-omap1/include/mach =>
> drivers/video/fbdev/omap}/lcd_dma.h |  2 --
>  drivers/video/fbdev/omap/lcdc.c
>    |  2 +-
>  drivers/video/fbdev/omap/lcdc.h
>    | 35 +++++++++++++++++++++++++++++++++++
>  drivers/video/fbdev/omap/sossi.c                                         |  1 +
>  include/linux/omap-dma.h
>    |  4 ++--
>  10 files changed, 48 insertions(+), 55 deletions(-)
> 
> commit b8ddb98d29a43fecb4387d0d8218935cb1997a28
> Author: Arnd Bergmann <arnd@arndb.de>
> Date:   Tue Aug 6 14:59:00 2019 +0200
> 
>     ARM: omap1: innovator: pass lcd control address as pdata
> 
>     To avoid using the mach/omap1510.h header file, pass the correct
>     address as platform data.
> 
>     Acked-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
>     Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> 
>  arch/arm/mach-omap1/board-innovator.c  | 3 +++
>  drivers/video/fbdev/omap/lcd_inn1510.c | 7 +++++--
>  2 files changed, 8 insertions(+), 2 deletions(-)

Thank you for reworking the patch series.

> The resulting code is the same as before, I'll post that again along
> the rest of the series next week. Should I add your Ack to each
> patch already?

Yes, please do.

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics
