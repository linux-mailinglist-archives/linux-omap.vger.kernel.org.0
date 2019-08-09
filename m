Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB9498717C
	for <lists+linux-omap@lfdr.de>; Fri,  9 Aug 2019 07:32:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725920AbfHIFcd (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 9 Aug 2019 01:32:33 -0400
Received: from mga03.intel.com ([134.134.136.65]:48559 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725890AbfHIFcd (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 9 Aug 2019 01:32:33 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 08 Aug 2019 22:32:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,364,1559545200"; 
   d="scan'208";a="193315385"
Received: from pipin.fi.intel.com (HELO pipin) ([10.237.72.175])
  by fmsmga001.fm.intel.com with ESMTP; 08 Aug 2019 22:32:29 -0700
From:   Felipe Balbi <felipe.balbi@linux.intel.com>
To:     Arnd Bergmann <arnd@arndb.de>, Tony Lindgren <tony@atomide.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Russell King <linux@armlinux.org.uk>,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH 03/22] ARM: omap1: move omap15xx local bus handling to usb.c
In-Reply-To: <20190808212234.2213262-4-arnd@arndb.de>
References: <20190808212234.2213262-1-arnd@arndb.de> <20190808212234.2213262-4-arnd@arndb.de>
Date:   Fri, 09 Aug 2019 08:32:28 +0300
Message-ID: <87y302ewer.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Arnd Bergmann <arnd@arndb.de> writes:

> The mach/memory.h file only exists to implement a dma offset for "Local
> Bus" devices, and that consists of the OHCI USB controller for practical
> purposes.
>
> The generic dma-mapping interface has gained this exact feature some
> years ago and can do it much more efficiently, so replace the complex
> __arch_virt_to_dma/__arch_dma_to_pfn/... logic with a much simpler boot
> time initialization.
>
> This should also make any code that performs dma mapping calls at
> runtime much more efficient, by eliminating the strcmp() along with
> the computation.
>
> Similar, a portion of the ohci-omap driver is just there for configuring
> the memory translation, this too can get moved into usb.c
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

For all of these patches related to usb:

Acked-by: Felipe Balbi <felipe.balbi@linux.intel.com>

Thanks for cleaning this up, Arnd.

-- 
balbi
