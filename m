Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C91DF501B
	for <lists+linux-omap@lfdr.de>; Fri,  8 Nov 2019 16:46:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726095AbfKHPqX (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 8 Nov 2019 10:46:23 -0500
Received: from mail-out.m-online.net ([212.18.0.9]:60413 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726049AbfKHPqX (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 8 Nov 2019 10:46:23 -0500
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 478l4D1VvVz1qqxw;
        Fri,  8 Nov 2019 16:46:20 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 478l4C6vxFz1qqkP;
        Fri,  8 Nov 2019 16:46:19 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id oPMuBfsf3od4; Fri,  8 Nov 2019 16:46:17 +0100 (CET)
X-Auth-Info: R+d3Ak8txY0y/6ScNMK+0PMVmEPWfuNdg6uOiLwAUhY=
Received: from [IPv6:::1] (unknown [195.140.253.167])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Fri,  8 Nov 2019 16:46:17 +0100 (CET)
From:   Marek Vasut <marex@denx.de>
Subject: Re: Minimal patch against TI AM335x UART swallowing the first byte
 using the 8250_omap driver in RS485 mode
To:     Falco Hyfing <hyfinglists@gmail.com>, linux-omap@vger.kernel.org,
        linux-serial@vger.kernel.org
Cc:     giulio.benetti@benettiengineering.com, aford173@gmail.com,
        andrej.skvortzov@gmail.com, sr@denx.de, rafael.gago@gmail.com,
        avistel@gmail.com, matwey.kornilov@gmail.com,
        yegorslists@gmail.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <249e4532-e7a6-a1f3-499f-8a2beef82f41@gmail.com>
Message-ID: <932c4b91-b8ec-a7c5-6155-79539a3ca885@denx.de>
Date:   Fri, 8 Nov 2019 16:45:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <249e4532-e7a6-a1f3-499f-8a2beef82f41@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 11/8/19 3:41 PM, Falco Hyfing wrote:

Hi,

> I stumbled upon this unresolved issue where the TI AM335x UART is
> sporadically swallowing the first byte using the 8250_omap driver in
> RS485 mode.
> 
> Previous discussions of the issue ended on Christmas Eve last year. For
> reference:
> https://marc.info/?w=2&r=1&s=fix+clearing+fifos+rs485+mode+again&q=t

Right, I'm sorry for not following up on that thread anymore. I was ill
during that time and I didn't have the energy to counter all those
negative emails. So thanks for picking this up.

I think the issue is a generic one though, and affects various other
16550 UARTs, it's not isolated to the OMAP UART, which is why I patched
the generic code. I think if we could solve the quirk of that JZ4780
UART, the generic approach would work.

> As our company plans to move our serial device servers' firmware to an
> upstream kernel version we need a solution for this problem.
> 
> I appended a small patch that seems to resolve the issue for our products.
> 
> I would like to kindly ask whether you could test this patch with
> various serial hardware that would be affected by this driver.
> 
> Kind regards,
> 
>     Falco Hyfing
>     Software Engineer at VisionSystems GmbH
> 
> 
> diff --git a/drivers/tty/serial/8250/8250_port.c
> b/drivers/tty/serial/8250/8250_port.c
> index 8407166610ce..25dd44d5f6ff 100644
> --- a/drivers/tty/serial/8250/8250_port.c
> +++ b/drivers/tty/serial/8250/8250_port.c
> @@ -1405,7 +1405,8 @@ static void __do_stop_tx_rs485(struct
> uart_8250_port *p)
>          * Enable previously disabled RX interrupts.
>          */
>         if (!(p->port.rs485.flags & SER_RS485_RX_DURING_TX)) {
> -               serial8250_clear_and_reinit_fifos(p);
> +               serial_port_out(&p->port, UART_FCR, p->fcr |
> +                               UART_FCR_CLEAR_RCVR | UART_FCR_CLEAR_XMIT);
> 
>                 p->ier |= UART_IER_RLSI | UART_IER_RDI;
>                 serial_port_out(&p->port, UART_IER, p->ier);
> 


-- 
Best regards,
Marek Vasut
