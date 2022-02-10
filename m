Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A9B3D4B0D29
	for <lists+linux-omap@lfdr.de>; Thu, 10 Feb 2022 13:05:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241395AbiBJMFX (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 10 Feb 2022 07:05:23 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:57714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241393AbiBJMFW (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 10 Feb 2022 07:05:22 -0500
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id DD7D010B5
        for <linux-omap@vger.kernel.org>; Thu, 10 Feb 2022 04:05:21 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 91BEB80FC;
        Thu, 10 Feb 2022 12:04:51 +0000 (UTC)
Date:   Thu, 10 Feb 2022 14:05:18 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Romain Naour <romain.naour@smile.fr>
Cc:     linux-omap@vger.kernel.org
Subject: Re: AM5749: tty serial 8250 omap driver crash
Message-ID: <YgT/fhpFQfkj1b0j@atomide.com>
References: <2c80fd8a-2935-9a6d-43fd-f95fa53c93d2@smile.fr>
 <YgDSj7FJS7nbkJol@atomide.com>
 <e3cf5082-b494-9309-6878-da208920fa5a@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e3cf5082-b494-9309-6878-da208920fa5a@smile.fr>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

* Romain Naour <romain.naour@smile.fr> [220209 09:13]:
> Le 07/02/2022 à 09:04, Tony Lindgren a écrit :
> > Interesting, what's the exception you get with the -rt kernel? Is it an
> > unhandled external abort or something else?
> 
> "asynchronous external abort"

OK

> Maybe there is something wrong with the smart-standby or smart-idle feature in
> the UART IP ? I'm not sure.

Could be that too, but maybe it's as simple as the patch below. Care to
give it a try?

> Are you able to reproduce it ?
> Maybe on a IDK574 or a Beaglebone-AI board ?

Not sure why I'm not seeing this one with my test systems.. Have not tried
with the RT patches for a while though.

Regards,

Tony

8< -------
diff --git a/drivers/tty/serial/8250/8250_omap.c b/drivers/tty/serial/8250/8250_omap.c
--- a/drivers/tty/serial/8250/8250_omap.c
+++ b/drivers/tty/serial/8250/8250_omap.c
@@ -163,6 +163,8 @@ static void omap8250_set_mctrl(struct uart_port *port, unsigned int mctrl)
 	struct omap8250_priv *priv = up->port.private_data;
 	u8 lcr;
 
+	pm_runtime_get_sync(port->dev);
+
 	serial8250_do_set_mctrl(port, mctrl);
 
 	if (!mctrl_gpio_to_gpiod(up->gpios, UART_GPIO_RTS)) {
@@ -179,6 +181,9 @@ static void omap8250_set_mctrl(struct uart_port *port, unsigned int mctrl)
 		serial_out(up, UART_EFR, priv->efr);
 		serial_out(up, UART_LCR, lcr);
 	}
+
+	pm_runtime_mark_last_busy(port->dev);
+	pm_runtime_put_autosuspend(port->dev);
 }
 
 /*
