Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C14AC3B109B
	for <lists+linux-omap@lfdr.de>; Wed, 23 Jun 2021 01:29:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229849AbhFVXbz (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 22 Jun 2021 19:31:55 -0400
Received: from thoth.sbs.de ([192.35.17.2]:42196 "EHLO thoth.sbs.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229501AbhFVXbz (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 22 Jun 2021 19:31:55 -0400
X-Greylist: delayed 1951 seconds by postgrey-1.27 at vger.kernel.org; Tue, 22 Jun 2021 19:31:54 EDT
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
        by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 15MMuVSg027778
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 23 Jun 2021 00:56:31 +0200
Received: from [167.87.93.200] ([167.87.93.200])
        by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 15MMuQ3p002566;
        Wed, 23 Jun 2021 00:56:27 +0200
Subject: Re: [PATCH v2] serial: 8250: 8250_omap: Fix possible interrupt storm
 on K3 SoCs
To:     Vignesh Raghavendra <vigneshr@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>
Cc:     Tony Lindgren <tony@atomide.com>, linux-serial@vger.kernel.org,
        linux-omap@vger.kernel.org,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>
References: <20210622145704.11168-1-vigneshr@ti.com>
From:   Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <d55fc5bb-b56d-bed6-0753-574b12e2ee92@siemens.com>
Date:   Wed, 23 Jun 2021 00:56:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210622145704.11168-1-vigneshr@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 22.06.21 16:57, Vignesh Raghavendra wrote:
> On K3 family of SoCs (which includes AM654 SoC), it is observed that RX
> TIMEOUT is signalled after RX FIFO has been drained, in which case a
> dummy read of RX FIFO is required to clear RX TIMEOUT condition.
> Otherwise, this would lead to an interrupt storm.
> 
> Fix this by introducing UART_RX_TIMEOUT_QUIRK flag and doing a dummy
> read in IRQ handler when RX TIMEOUT is reported with no data in RX FIFO.
> 
> Fixes: be70874498f3 ("serial: 8250_omap: Add support for AM654 UART controller")
> Reported-by: Jan Kiszka <jan.kiszka@siemens.com>
> Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
> ---
> v2:
> Restrict workaround to K3 family of devices only (ti,am654-uart) where
> issue was reported.
> 
> v1: https://lore.kernel.org/r/20210511151955.28071-1-vigneshr@ti.com
> 
>  drivers/tty/serial/8250/8250_omap.c | 20 +++++++++++++++++++-
>  1 file changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/tty/serial/8250/8250_omap.c b/drivers/tty/serial/8250/8250_omap.c
> index c06631ced414..79418d4beb48 100644
> --- a/drivers/tty/serial/8250/8250_omap.c
> +++ b/drivers/tty/serial/8250/8250_omap.c
> @@ -43,6 +43,7 @@
>  #define UART_ERRATA_CLOCK_DISABLE	(1 << 3)
>  #define	UART_HAS_EFR2			BIT(4)
>  #define UART_HAS_RHR_IT_DIS		BIT(5)
> +#define UART_RX_TIMEOUT_QUIRK		BIT(6)
>  
>  #define OMAP_UART_FCR_RX_TRIG		6
>  #define OMAP_UART_FCR_TX_TRIG		4
> @@ -104,6 +105,9 @@
>  #define UART_OMAP_EFR2			0x23
>  #define UART_OMAP_EFR2_TIMEOUT_BEHAVE	BIT(6)
>  
> +/* RX FIFO occupancy indicator */
> +#define UART_OMAP_RX_LVL		0x64
> +
>  struct omap8250_priv {
>  	int line;
>  	u8 habit;
> @@ -611,6 +615,7 @@ static int omap_8250_dma_handle_irq(struct uart_port *port);
>  static irqreturn_t omap8250_irq(int irq, void *dev_id)
>  {
>  	struct uart_port *port = dev_id;
> +	struct omap8250_priv *priv = port->private_data;
>  	struct uart_8250_port *up = up_to_u8250p(port);
>  	unsigned int iir;
>  	int ret;
> @@ -625,6 +630,18 @@ static irqreturn_t omap8250_irq(int irq, void *dev_id)
>  	serial8250_rpm_get(up);
>  	iir = serial_port_in(port, UART_IIR);
>  	ret = serial8250_handle_irq(port, iir);
> +
> +	/*
> +	 * On K3 SoCs, it is observed that RX TIMEOUT is signalled after
> +	 * FIFO has been drained, in which case a dummy read of RX FIFO
> +	 * is required to clear RX TIMEOUT condition.
> +	 */
> +	if (priv->habit & UART_RX_TIMEOUT_QUIRK &&
> +	    (iir & UART_IIR_RX_TIMEOUT) == UART_IIR_RX_TIMEOUT &&
> +	    serial_port_in(port, UART_OMAP_RX_LVL) == 0) {
> +		serial_port_in(port, UART_RX);
> +	}
> +
>  	serial8250_rpm_put(up);
>  
>  	return IRQ_RETVAL(ret);
> @@ -1218,7 +1235,8 @@ static struct omap8250_dma_params am33xx_dma = {
>  
>  static struct omap8250_platdata am654_platdata = {
>  	.dma_params	= &am654_dma,
> -	.habit		= UART_HAS_EFR2 | UART_HAS_RHR_IT_DIS,
> +	.habit		= UART_HAS_EFR2 | UART_HAS_RHR_IT_DIS |
> +			  UART_RX_TIMEOUT_QUIRK,
>  };
>  
>  static struct omap8250_platdata am33xx_platdata = {
> 

Tested-by: Jan Kiszka <jan.kiszka@siemens.com>

Thanks,
Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux
