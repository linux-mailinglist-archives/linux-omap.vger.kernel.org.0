Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E03CCE873
	for <lists+linux-omap@lfdr.de>; Mon,  7 Oct 2019 17:57:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728786AbfJGP4t (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 7 Oct 2019 11:56:49 -0400
Received: from muru.com ([72.249.23.125]:35636 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727791AbfJGP4t (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 7 Oct 2019 11:56:49 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id E459280A5;
        Mon,  7 Oct 2019 15:57:20 +0000 (UTC)
Date:   Mon, 7 Oct 2019 08:56:44 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Adam Ford <aford173@gmail.com>
Cc:     Peter Hurley <peter@hurleysoftware.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Vignesh R <vigneshr@ti.com>, linux-serial@vger.kernel.org,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH] serial: 8250_omap: Fix idling for unloaded serdev drivers
Message-ID: <20191007155644.GR5610@atomide.com>
References: <20190723115400.46432-1-tony@atomide.com>
 <CAHCN7x+6KYjnm5daRe_Y5XEWnDBWQnz8rOKYH2wTgx9avvokmQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHCN7x+6KYjnm5daRe_Y5XEWnDBWQnz8rOKYH2wTgx9avvokmQ@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Adam Ford <aford173@gmail.com> [191004 19:30]:
> On Tue, Jul 23, 2019 at 5:21 PM Tony Lindgren <tony@atomide.com> wrote:
> >
> > For many years omap variants have been setting the runtime PM
> > autosuspend delay to -1 to prevent unsafe policy with lossy first
> > character on wake-up. The user must specifically enable the timeout
> > for UARTs if desired.
> >
> > We must not enable the workaround for serdev devices though. It leads
> > into UARTs not idling if no serdev devices are loaded and there is no
> > sysfs entry to configure the UART in that case. And this means that
> > my PM may not work unless the serdev modules are loaded.
> >
> > We can detect a serdev device being configured based on a dts child
> > node, and we can simply skip the workround in that case. And the
> > serdev driver can idle the port during runtime when suitable if an
> > out-of-band wake-up GPIO line exists for example.
> >
> > Let's also add some comments to the workaround while at it.
> 
> This seems to help some of the stability issues I am seeing on the
> DM3730 UART2 running Bluetooth at 3000000 baud.
> Does it make sense to backport this to the stable kernels?

Sure if it helps with issues, it should be safe to apply to earlier
kernels that have serdev potentially in use.

No need for earlier kernels before serdev though.

Regards,

Tony

> > Cc: Johan Hovold <johan@kernel.org>
> > Signed-off-by: Tony Lindgren <tony@atomide.com>
> > ---
> >  drivers/tty/serial/8250/8250_omap.c | 11 ++++++++++-
> >  1 file changed, 10 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/tty/serial/8250/8250_omap.c b/drivers/tty/serial/8250/8250_omap.c
> > --- a/drivers/tty/serial/8250/8250_omap.c
> > +++ b/drivers/tty/serial/8250/8250_omap.c
> > @@ -1234,7 +1234,16 @@ static int omap8250_probe(struct platform_device *pdev)
> >
> >         device_init_wakeup(&pdev->dev, true);
> >         pm_runtime_use_autosuspend(&pdev->dev);
> > -       pm_runtime_set_autosuspend_delay(&pdev->dev, -1);
> > +
> > +       /*
> > +        * Disable runtime PM until autosuspend delay unless specifically
> > +        * enabled by the user via sysfs. This is the historic way to
> > +        * prevent an unsafe default policy with lossy characters on wake-up.
> > +        * For serdev devices this is not needed, the policy can be managed by
> > +        * the serdev driver.
> > +        */
> > +       if (!of_get_available_child_count(pdev->dev.of_node))
> > +               pm_runtime_set_autosuspend_delay(&pdev->dev, -1);
> >
> >         pm_runtime_irq_safe(&pdev->dev);
> >         pm_runtime_enable(&pdev->dev);
> > --
> > 2.21.0
