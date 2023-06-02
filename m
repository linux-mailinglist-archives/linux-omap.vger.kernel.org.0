Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD01871FA5A
	for <lists+linux-omap@lfdr.de>; Fri,  2 Jun 2023 08:51:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232921AbjFBGvG (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 2 Jun 2023 02:51:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233850AbjFBGvE (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 2 Jun 2023 02:51:04 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 5FA1AEB;
        Thu,  1 Jun 2023 23:51:03 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id C816D8111;
        Fri,  2 Jun 2023 06:51:02 +0000 (UTC)
Date:   Fri, 2 Jun 2023 09:51:01 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Jiri Slaby <jirislaby@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        Dhruva Gole <d-gole@ti.com>,
        Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
        John Ogness <john.ogness@linutronix.de>,
        Johan Hovold <johan@kernel.org>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        linux-omap@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] serial: core: Fix error handling for
 serial_core_ctrl_device_add()
Message-ID: <20230602065101.GG14287@atomide.com>
References: <20230602064104.41508-1-tony@atomide.com>
 <20230602064652.GF14287@atomide.com>
 <ca22d4ad-fd07-2733-a4c4-e6ed9c5ebe3f@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ca22d4ad-fd07-2733-a4c4-e6ed9c5ebe3f@kernel.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Jiri Slaby <jirislaby@kernel.org> [230602 06:48]:
> On 02. 06. 23, 8:46, Tony Lindgren wrote:
> > * Tony Lindgren <tony@atomide.com> [230602 06:41]:
> > > Checking for NULL is not enough as serial_base_ctrl_add() uses ERR_PTR().
> > > 
> > > Fixes: 84a9582fd203 ("serial: core: Start managing serial controllers to enable runtime PM")
> > > Signed-off-by: Tony Lindgren <tony@atomide.com>
> > > ---
> > >   drivers/tty/serial/serial_core.c | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/tty/serial/serial_core.c b/drivers/tty/serial/serial_core.c
> > > --- a/drivers/tty/serial/serial_core.c
> > > +++ b/drivers/tty/serial/serial_core.c
> > > @@ -3342,7 +3342,7 @@ int serial_core_register_port(struct uart_driver *drv, struct uart_port *port)
> > >   	ctrl_dev = serial_core_ctrl_find(drv, port->dev, port->ctrl_id);
> > >   	if (!ctrl_dev) {
> > >   		new_ctrl_dev = serial_core_ctrl_device_add(port);
> > > -		if (!new_ctrl_dev) {
> > > +		if (IS_ERR_OR_NULL(new_ctrl_dev)) {
> > >   			ret = -ENODEV;
> > >   			goto err_unlock;
> > >   		}
> > 
> > Hmm actually we should also change to use ret = PTR_ERR(new_ctrl_dev) here
> > instead of translating all the errors to -ENODEV. Will send out v2 version.
> 
> Why OR_NULL at all, actually?

Yup there should be no need for that thanks.

Regards,

Tony
