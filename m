Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2FBC98C190
	for <lists+linux-omap@lfdr.de>; Tue, 13 Aug 2019 21:34:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726116AbfHMTeH (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 13 Aug 2019 15:34:07 -0400
Received: from mail-qt1-f196.google.com ([209.85.160.196]:45106 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726007AbfHMTeH (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 13 Aug 2019 15:34:07 -0400
Received: by mail-qt1-f196.google.com with SMTP id k13so10283899qtm.12;
        Tue, 13 Aug 2019 12:34:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IrNYqnrvmJh/91dlAAnnW0hWppUM4hXZeBrKa/Inzcg=;
        b=mNIPjoirJSMIe4tCqJ7NjwKYIUV7VxFiFT/pOU/SM2B8JKgESu58kcvip9oDM5y1ub
         U7UVddGR0p+Haz5PtLfbs+7aNzYawAXwBo7XBRAqBrljrD5JaIKU/zC1/PTpUk24dS7u
         DYA25FhgM1jUk7y02+Taih5e2D9r136nWl8Zo/ymFyEcRcNijUgBJc7ZbT2rCNACB58a
         wUjuUJSNA+udj1ImHhxvMWddNQJAdzMaeYQ9C8BhoaIlbcFPbEb1l5+vuzHde9B8d08N
         mV6egd7st/Z4CmhOVbYCBzuMDgDkjWivIzTAVM0FyIUDEuBK45N7+Gx5ob/Ub49yhlQ9
         DCbQ==
X-Gm-Message-State: APjAAAVqElATewaN92JZtJsQCmTNalLb3aWbNoUn8Fo394qrx0g2k7Yi
        7EwtWO82AX7hmeBM8foGInK6dZO9nx6qQCkAkBQ=
X-Google-Smtp-Source: APXvYqzDVGgCy8YeXkynnehJIA7xTZe4NKEdf8nNIC8nlYN5SK1TrTd5ILkEAKU8XVbhCAvalyqiPKaciPXoQNF05Pk=
X-Received: by 2002:a0c:dd86:: with SMTP id v6mr78537qvk.176.1565724846213;
 Tue, 13 Aug 2019 12:34:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190808212234.2213262-1-arnd@arndb.de> <20190808212234.2213262-15-arnd@arndb.de>
 <20190813103605.GL52127@atomide.com> <CAK8P3a0E+QUn9wcP5Obv-FitWyXCFwcp+oPConeO2p-NV1rqsw@mail.gmail.com>
 <20190813181158.GA26798@darkstar.musicnaut.iki.fi>
In-Reply-To: <20190813181158.GA26798@darkstar.musicnaut.iki.fi>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Tue, 13 Aug 2019 21:33:49 +0200
Message-ID: <CAK8P3a0LjKrc+7c5Ht9OL7LfYyLnG9=y7u+w24ujA1xAid_yCQ@mail.gmail.com>
Subject: Re: [PATCH 14/22] ARM: omap1: use pci_ioremap_io() for omap_cf
To:     Aaro Koskinen <aaro.koskinen@iki.fi>
Cc:     Tony Lindgren <tony@atomide.com>,
        Dominik Brodowski <linux@dominikbrodowski.net>,
        linux-omap <linux-omap@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, Aug 13, 2019 at 8:12 PM Aaro Koskinen <aaro.koskinen@iki.fi> wrote:
> On Tue, Aug 13, 2019 at 01:02:16PM +0200, Arnd Bergmann wrote:
> > On Tue, Aug 13, 2019 at 12:36 PM Tony Lindgren <tony@atomide.com> wrote:
>
> > - I force CONFIG_PCI to be enabled here in order to keep the
> >   asm/io.h logic unchanged. If PCI support in itself is an issue,
> >   then turning on CONFIG_PCI without the rest of this patch
> >   should also break.
>
> The board dies early, probably in pci_reserve_io():
>
> Starting kernel ...
>
> [    0.000000] Booting Linux on physical CPU 0x0
> [    0.000000] Linux version 5.3.0-rc4-osk-los_80efa+-00028-g09f6f22a63e9 (aaro@amd-fx-6350) (gcc version 8.3.0 (GCC)) #1 Tue Aug 13 20:50:11 EEST 2019
> [    0.000000] CPU: ARM926EJ-S [41069263] revision 3 (ARMv5TEJ), cr=0005317f
> [    0.000000] CPU: VIVT data cache, VIVT instruction cache
> [    0.000000] Machine: TI-OSK
> [    0.000000] Ignoring tag cmdline (using the default kernel command line)
> [    0.000000] printk: bootconsole [earlycon0] enabled
> [    0.000000] Memory policy: Data cache writeback
> [    0.000000] Internal error: Oops - undefined instruction: 0 [#1] ARM
> [    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.0-rc4-osk-los_80efa+-00028-g09f6f22a63e9 #1
> [    0.000000] Hardware name: TI-OSK
> [    0.000000] PC is at vm_area_add_early+0x1c/0x74

That sounds like an address conflict in the virtual addres space.

In multiplatform kernels, PCI I/O space is hardwired to addresses
0xfee00000-0xfeffffff,
which happened to be available on all the other machines that needed it so far.

OMAP1_IO_VIRT is 0xfefb0000-0xfefeffff, which clearly overlaps with the end of
the PCI I/O area.

We only really need 4KB of I/O space rather than the full 2MB, but it
would also be
good not to make this too machine specific.

Could we change OMAP1_IO_OFFSET to stay out of that area? Something like

diff --git a/arch/arm/Kconfig.debug b/arch/arm/Kconfig.debug
index 97c114c1ef80..3b66d203dc98 100644
--- a/arch/arm/Kconfig.debug
+++ b/arch/arm/Kconfig.debug
@@ -1794,9 +1794,9 @@ config DEBUG_UART_VIRT
        default 0xfef00000 if ARCH_IXP4XX && !CPU_BIG_ENDIAN
        default 0xfef00003 if ARCH_IXP4XX && CPU_BIG_ENDIAN
        default 0xfef36000 if DEBUG_HIGHBANK_UART
-       default 0xfefb0000 if DEBUG_OMAP1UART1 || DEBUG_OMAP7XXUART1
-       default 0xfefb0800 if DEBUG_OMAP1UART2 || DEBUG_OMAP7XXUART2
-       default 0xfefb9800 if DEBUG_OMAP1UART3 || DEBUG_OMAP7XXUART3
+       default 0xff000000 if DEBUG_OMAP1UART1 || DEBUG_OMAP7XXUART1
+       default 0xff000800 if DEBUG_OMAP1UART2 || DEBUG_OMAP7XXUART2
+       default 0xff009800 if DEBUG_OMAP1UART3 || DEBUG_OMAP7XXUART3
        default 0xff003000 if DEBUG_U300_UART
        default 0xffd01000 if DEBUG_HIP01_UART
        default DEBUG_UART_PHYS if !MMU
diff --git a/arch/arm/mach-omap1/hardware.h b/arch/arm/mach-omap1/hardware.h
index 232b8deef907..9fc76a3c9e57 100644
--- a/arch/arm/mach-omap1/hardware.h
+++ b/arch/arm/mach-omap1/hardware.h
@@ -61,7 +61,7 @@ static inline u32 omap_cs3_phys(void)

 #endif /* ifndef __ASSEMBLER__ */

-#define OMAP1_IO_OFFSET                0x01000000      /* Virtual IO
= 0xfefb0000 */
+#define OMAP1_IO_OFFSET                0x00fb0000      /* Virtual IO
= 0xff000000 */
 #define OMAP1_IO_ADDRESS(pa)   IOMEM((pa) - OMAP1_IO_OFFSET)

 #include "serial.h"

There may be additional locations that hardcode the virtual address.

       Arnd
