Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 316998D0C5
	for <lists+linux-omap@lfdr.de>; Wed, 14 Aug 2019 12:36:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726496AbfHNKg6 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 14 Aug 2019 06:36:58 -0400
Received: from mail-qt1-f196.google.com ([209.85.160.196]:34768 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726411AbfHNKg6 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 14 Aug 2019 06:36:58 -0400
Received: by mail-qt1-f196.google.com with SMTP id q4so12382402qtp.1;
        Wed, 14 Aug 2019 03:36:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LDEbTyIJnFa3pozet2GSZKuiwciqafTCxiRFUe/ZD/o=;
        b=o3LC7ZgyrdRpwtdhGYS48Xk8J9mRd67AmTV4clxQcKw1IZXX7gqLkNklHwSSffKbKt
         2if1fNlGbM9VBmxFZ4yUEYKmGLR8jMAt4v18+6Vx7IHsaZGSYsLRf1NfccvSc17yaZw5
         E0s8FE92j7tAXnTODvYDF2UUzIbmoW0Ut41EOEl9zGn+X+sbGUm/4eg9GyLC0My1riES
         P7huRq+fYooy8R6rogFRgtdT5TsbYckzj+WDLgSN9h43i3eYa4QaNNitoREZpO78cSOu
         DUf9kYDH7N6A7G5t+Qr7e/4grsvbuwTNbcx3dbmXtx0cj76UPKtyRqePKMFzSAyoJkkI
         Q0Nw==
X-Gm-Message-State: APjAAAXU6R7t0a0h74ke0KN8zgCeae3xOwMP87+rkEv1LjsrwssRzbPX
        9aF6fOYEtz77qDUSmMSiOGK4bd9CEK121DhSez0=
X-Google-Smtp-Source: APXvYqwV2TBabqJ9UAr2y8hQJw2m2az45KCTEx2a/C7amkL7cSDfPFgfYqeUqWRJZyqYCM2uSOekI8sS/0dFywJPLYg=
X-Received: by 2002:ac8:239d:: with SMTP id q29mr8646894qtq.304.1565779017271;
 Wed, 14 Aug 2019 03:36:57 -0700 (PDT)
MIME-Version: 1.0
References: <20190808212234.2213262-1-arnd@arndb.de> <20190808212234.2213262-15-arnd@arndb.de>
 <20190813103605.GL52127@atomide.com> <CAK8P3a0E+QUn9wcP5Obv-FitWyXCFwcp+oPConeO2p-NV1rqsw@mail.gmail.com>
 <20190813181158.GA26798@darkstar.musicnaut.iki.fi> <CAK8P3a0LjKrc+7c5Ht9OL7LfYyLnG9=y7u+w24ujA1xAid_yCQ@mail.gmail.com>
 <20190814074918.GA52127@atomide.com>
In-Reply-To: <20190814074918.GA52127@atomide.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Wed, 14 Aug 2019 12:36:40 +0200
Message-ID: <CAK8P3a3k_HOGqzMGjtc+7NSaK0Bsa_vxxRFLzY8aP6ev4wa9iA@mail.gmail.com>
Subject: Re: [PATCH 14/22] ARM: omap1: use pci_ioremap_io() for omap_cf
To:     Tony Lindgren <tony@atomide.com>
Cc:     Aaro Koskinen <aaro.koskinen@iki.fi>,
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

On Wed, Aug 14, 2019 at 9:49 AM Tony Lindgren <tony@atomide.com> wrote:
> * Arnd Bergmann <arnd@arndb.de> [190813 19:34]:
> > On Tue, Aug 13, 2019 at 8:12 PM Aaro Koskinen <aaro.koskinen@iki.fi> wrote:
> > diff --git a/arch/arm/mach-omap1/hardware.h b/arch/arm/mach-omap1/hardware.h
> > index 232b8deef907..9fc76a3c9e57 100644
> > --- a/arch/arm/mach-omap1/hardware.h
> > +++ b/arch/arm/mach-omap1/hardware.h
> > @@ -61,7 +61,7 @@ static inline u32 omap_cs3_phys(void)
> >
> >  #endif /* ifndef __ASSEMBLER__ */
> >
> > -#define OMAP1_IO_OFFSET                0x01000000      /* Virtual IO
> > = 0xfefb0000 */
> > +#define OMAP1_IO_OFFSET                0x00fb0000      /* Virtual IO
> > = 0xff000000 */
> >  #define OMAP1_IO_ADDRESS(pa)   IOMEM((pa) - OMAP1_IO_OFFSET)
> >
> >  #include "serial.h"
>
> Oh OK yeah sounds like that's the issue.
>
> > There may be additional locations that hardcode the virtual address.
>
> Those should be in mach-omap1/io.c, and I recall innovator had some
> hardcoded fpga address that should also be checked.

I see four boards with hardcoded I/O addresses, but they are all below
the PCI I/O virtual address range, and are not affected by that change.

For the innovator FPGA access, this was ok, it uses the correct address
in the OMAP1_IO_OFFSET range.

        Arnd
