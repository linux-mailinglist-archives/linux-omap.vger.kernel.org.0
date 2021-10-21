Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 678A8436236
	for <lists+linux-omap@lfdr.de>; Thu, 21 Oct 2021 14:59:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231216AbhJUNBO (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 21 Oct 2021 09:01:14 -0400
Received: from muru.com ([72.249.23.125]:47024 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230463AbhJUNBO (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 21 Oct 2021 09:01:14 -0400
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 5524380EB;
        Thu, 21 Oct 2021 12:59:31 +0000 (UTC)
Date:   Thu, 21 Oct 2021 15:58:56 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     linux-arm-kernel@lists.infradead.org,
        Russell King <linux@armlinux.org.uk>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-omap@vger.kernel.org
Subject: Re: Non-existing config symbols DEBUG_OMAP{3,4,5}UART{1,2}
Message-ID: <YXFkEEwfeF8+osSr@atomide.com>
References: <CAKXUXMy0FUv25cUGDnhnv=3pTd7NGjepbHao7QoQw8h0hh3CRw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKXUXMy0FUv25cUGDnhnv=3pTd7NGjepbHao7QoQw8h0hh3CRw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

* Lukas Bulwahn <lukas.bulwahn@gmail.com> [211011 05:39]:
> Dear Tony,
> 
> With commit d2b310b0234c ("ARM: debug: Use generic 8250 debug_ll for
> omap2 and omap3/4/5 common uarts"), you added address definitions of
> DEBUG_UART_PHYS for OMAP2, OMAP3, OMAP4 and OMAP5 in
> ./arch/arm/Kconfig.debug.
> 
> These definitions depend on:
>   - DEBUG_OMAP2UART1 || DEBUG_OMAP3UART1 || DEBUG_OMAP4UART1 ||
> DEBUG_OMAP5UART1, and
>   - DEBUG_OMAP2UART2 || DEBUG_OMAP3UART2 || DEBUG_OMAP4UART2 ||
> DEBUG_OMAP5UART2.
> 
> As of now, only DEBUG_OMAP2UART{1,2} are defined in
> ./arch/arm/Kconfig.debug, but DEBUG_OMAP{3,4,5}UART{1,2} are not
> defined. Hence, ./scripts/checkkconfigsymbols.py warns here on
> non-existing symbols.
> 
> I am unsure about the best way to resolve this issue.
> 
> - Would you like to simply reuse the config DEBUG_OMAP2UART{1,2} also
> for OMAP3, OMAP4 and OMAP5? Then, we probably just need to delete the
> dead references
> to DEBUG_OMAP{3,4,5}UART{1,2}. If you consider this further change
> helpful, we could even rename the configs to DEBUG_OMAP2PLUSUART{1,2}
> to make the architecture more specific.
> 
> - Do you see the need for separate config definitions for UART{1,2} on
> OMAP3, OMAP4 and OMAP5? Then, we would need to add further definitions
> DEBUG_OMAP{3,4,5}UART{1,2}
> in this file and link those to the specific architecture.
> 
> Once the direction is clear, I am happy to provide a patch to address
> this issue or you can quickly take care of this yourself.

The missing ones should be the same as the DEBUG_OMAP2 I think. We still
have these defined in arch/arm/mach-omap2/include/mach/serial.h, so that
can be used to confirm it.

Seems like we can just reuse the DEBUG_OMAP2UART variants, not sure if
we need to rename these to DEBUG_OMAP2PLUSUART variants.

Regards,

Tony

