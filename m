Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD27B3C64F5
	for <lists+linux-omap@lfdr.de>; Mon, 12 Jul 2021 22:28:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235300AbhGLUaA (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 12 Jul 2021 16:30:00 -0400
Received: from fgw20-7.mail.saunalahti.fi ([62.142.5.81]:50075 "EHLO
        fgw20-7.mail.saunalahti.fi" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235021AbhGLUaA (ORCPT
        <rfc822;linux-omap@vger.kernel.org>);
        Mon, 12 Jul 2021 16:30:00 -0400
Received: from localhost (88-115-248-186.elisa-laajakaista.fi [88.115.248.186])
        by fgw20.mail.saunalahti.fi (Halon) with ESMTP
        id 87ea98c9-e34f-11eb-ba24-005056bd6ce9;
        Mon, 12 Jul 2021 23:27:10 +0300 (EEST)
Date:   Mon, 12 Jul 2021 23:27:08 +0300
From:   andy@surfacebook.localdomain
To:     Vignesh Raghavendra <vigneshr@ti.com>
Cc:     Jan Kiszka <jan.kiszka@siemens.com>,
        Tony Lindgren <tony@atomide.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        linux-serial@vger.kernel.org, linux-omap@vger.kernel.org,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] serial: 8250: 8250_omap: Fix possible interrupt storm
Message-ID: <YOylnHudkwcHHEeZ@surfacebook.localdomain>
References: <20210511151955.28071-1-vigneshr@ti.com>
 <YJ008MjjewRUTn9Z@kroah.com>
 <YLCCJzkkB4N7LTQS@atomide.com>
 <e5b35370-bf2d-7295-e2fd-9aee5bbc3296@ti.com>
 <0ad948ac-f669-3d6d-5eca-4ca48d47d6a3@siemens.com>
 <56c5d73f-741c-2643-1c79-6dc13ebb05c7@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <56c5d73f-741c-2643-1c79-6dc13ebb05c7@ti.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Tue, Jun 22, 2021 at 11:53:38AM +0530, Vignesh Raghavendra kirjoitti:
> On 6/22/21 11:45 AM, Jan Kiszka wrote:
> >>> Vignesh, it seems this quirk needs some soc specific flag added to
> >>> it maybe? Or maybe UART_OMAP_RX_LVL register is not available for
> >>> all the SoCs?
> >>>
> >> Yes indeed :(
> >>
> >>> I think it's best to drop this patch until the issues are resolved,
> >>> also there are some open comments above that might be answered by
> >>> limiting this quirk to a specific range of SoCs :)
> >>>
> >> Oops, I did test patch AM33xx assuming its equivalent to OMAP3, but UART
> >> IP is quite different. I will respin the patch making sure, workaround
> >> applies only to AM65x and K3 SoCs.
> >>
> >> Regards
> >> Vignesh
> >>
> > What's the status here for AM65x? The issue remains present on that
> > platform, and I was hoping to see a quick follow up that limit the fix
> > to that target.
> 
> Sorry for the delay, I am trying to find which other TI SoCs are
> affected by this issue. But that exercise will need a bit more time.
> Will send a fix to address K3 SoCs like AM65x today/tomo.

This all reminds me the very similar issue one found on Intel integrated
(Synopsys DesignWare based) UARTs:

https://lore.kernel.org/linux-serial/20170206233000.3021-1-dianders@chromium.org/
https://lore.kernel.org/linux-serial/1440015124-28393-1-git-send-email-california.l.sullivan@intel.com/

-- 
With Best Regards,
Andy Shevchenko


