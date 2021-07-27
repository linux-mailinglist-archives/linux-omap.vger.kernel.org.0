Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B631C3D7371
	for <lists+linux-omap@lfdr.de>; Tue, 27 Jul 2021 12:39:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236356AbhG0KjJ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 27 Jul 2021 06:39:09 -0400
Received: from muru.com ([72.249.23.125]:55926 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236104AbhG0KjG (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 27 Jul 2021 06:39:06 -0400
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 3600D80F0;
        Tue, 27 Jul 2021 10:39:24 +0000 (UTC)
Date:   Tue, 27 Jul 2021 13:39:05 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Vignesh Raghavendra <vigneshr@ti.com>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Linux OMAP Mailing List <linux-omap@vger.kernel.org>,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] serial: 8250: 8250_omap: Fix possible interrupt storm
Message-ID: <YP/iSZpJ5AIJV70Z@atomide.com>
References: <20210511151955.28071-1-vigneshr@ti.com>
 <YJ008MjjewRUTn9Z@kroah.com>
 <YLCCJzkkB4N7LTQS@atomide.com>
 <e5b35370-bf2d-7295-e2fd-9aee5bbc3296@ti.com>
 <0ad948ac-f669-3d6d-5eca-4ca48d47d6a3@siemens.com>
 <56c5d73f-741c-2643-1c79-6dc13ebb05c7@ti.com>
 <YOylnHudkwcHHEeZ@surfacebook.localdomain>
 <0ae7e313-1ed7-f1be-e8a7-edd1286277a5@ti.com>
 <CAHp75Vcxtk0f2KRSL8gh2mz-AYE7Kav6co8N8XMbsvtyLohG5w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75Vcxtk0f2KRSL8gh2mz-AYE7Kav6co8N8XMbsvtyLohG5w@mail.gmail.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Andy Shevchenko <andy.shevchenko@gmail.com> [210713 09:14]:
> On Tue, Jul 13, 2021 at 11:54 AM Vignesh Raghavendra <vigneshr@ti.com> wrote:
> > On 7/13/21 1:57 AM, andy@surfacebook.localdomain wrote:
> > > Tue, Jun 22, 2021 at 11:53:38AM +0530, Vignesh Raghavendra kirjoitti:
> 
> ...
> 
> > > https://lore.kernel.org/linux-serial/20170206233000.3021-1-dianders@chromium.org/
> >
> > I am not sure if reading UART_LSR is a good idea in the above patch.
> > Some flags in LSR register are cleared on read (at least that's the case
> > for UARTs on TI SoCs) and thus can result in loss of error/FIFO status
> > information.
> >
> > > https://lore.kernel.org/linux-serial/1440015124-28393-1-git-send-email-california.l.sullivan@intel.com/
> >
> > Looks like this never made it.
> 
> Forgot to react to the above. Yes, they never made it because I
> believe due to the exact reason you mentioned above. Also California
> set up different experiments IIRC and it shows that the problem didn;t
> fully disappear with his approach. But maybe yours will work better
> (at least it's not the first time I have seen it on different hardware
> according to people's contributions).

Not sure if this is the same issue with noisy lines, but see also the
following in case it's related:

[PATCH 2/2] serial: 8250_omap: Handle optional overrun-throttle-ms property

Also available at [0] below.

Regards,

Tony

[0] https://lore.kernel.org/linux-omap/20210727103533.51547-1-tony@atomide.com/T/#m5f9da26c32503f2937d3d5977310ca337fa0cb5a
