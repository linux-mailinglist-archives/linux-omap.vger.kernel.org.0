Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 502324F8080
	for <lists+linux-omap@lfdr.de>; Thu,  7 Apr 2022 15:27:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239606AbiDGN3Z (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 7 Apr 2022 09:29:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238108AbiDGN3Z (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 7 Apr 2022 09:29:25 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 157991017EB
        for <linux-omap@vger.kernel.org>; Thu,  7 Apr 2022 06:27:25 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id C8B2E8125;
        Thu,  7 Apr 2022 13:25:00 +0000 (UTC)
Date:   Thu, 7 Apr 2022 16:27:22 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Johan Hovold <johan@kernel.org>, linux-serial@vger.kernel.org,
        kernel@pengutronix.de,
        Steffen Trumtrar <s.trumtrar@pengutronix.de>,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        regressions@lists.linux.dev
Subject: Re: [PATCH] serial: 8250: Return early in .start_tx() if there are
 no chars to send
Message-ID: <Yk7muv2McT5Sjqbk@atomide.com>
References: <20220217211839.443039-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220217211839.443039-1-u.kleine-koenig@pengutronix.de>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

* Uwe Kleine-König <u.kleine-koenig@pengutronix.de> [700101 02:00]:
> From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
> 
> Don't start the whole chain for TX if there is no data to send. This is
> mostly relevant for rs485 mode as there might be rts-before-send and
> rts-after-send delays involved.
> 
> Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
> Hello,
> 
> a few other drivers have such an early exit already (imx, stm32-usart).
> I wonder if it applies to all UART drivers that there is nothing to do
> in .start_tx() if the circ buffer is empty and there is no x_char to
> send. In this case it would be more sensible to ensure in serial_core
> that .start_tx() is only ever called if there is something to do.

This patch seems to cause a runtime PM regression in v5.18-rc1 where
8250 is never idled for omaps.

Looks like the return added here is not paired with put for the
serial8250_rpm_get_tx() call above?

Regards,

Tony

#regzbot ^introduced 932d596378b0

>  drivers/tty/serial/8250/8250_port.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/tty/serial/8250/8250_port.c b/drivers/tty/serial/8250/8250_port.c
> index 3b12bfc1ed67..5d4668f12f71 100644
> --- a/drivers/tty/serial/8250/8250_port.c
> +++ b/drivers/tty/serial/8250/8250_port.c
> @@ -1657,6 +1657,9 @@ static void serial8250_start_tx(struct uart_port *port)
>  
>  	serial8250_rpm_get_tx(up);
>  
> +	if (!port->x_char && uart_circ_empty(&port->state->xmit))
> +		return;
> +
>  	if (em485 &&
>  	    em485->active_timer == &em485->start_tx_timer)
>  		return;
> 
> base-commit: 754e0b0e35608ed5206d6a67a791563c631cec07
> -- 
> 2.34.1
> 
