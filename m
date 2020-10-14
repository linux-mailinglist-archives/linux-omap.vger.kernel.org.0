Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E87428E41E
	for <lists+linux-omap@lfdr.de>; Wed, 14 Oct 2020 18:14:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728178AbgJNQOe (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 14 Oct 2020 12:14:34 -0400
Received: from netrider.rowland.org ([192.131.102.5]:55587 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1730423AbgJNQOe (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 14 Oct 2020 12:14:34 -0400
Received: (qmail 718746 invoked by uid 1000); 14 Oct 2020 12:14:33 -0400
Date:   Wed, 14 Oct 2020 12:14:33 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Thomas Gleixner <tglx@linutronix.de>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Johan Hovold <johan@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org,
        Thomas Winischhofer <thomas@winischhofer.net>,
        "Ahmed S. Darwish" <a.darwish@linutronix.de>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>, linux-omap@vger.kernel.org,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, Felipe Balbi <balbi@kernel.org>,
        Duncan Sands <duncan.sands@free.fr>
Subject: Re: [patch 03/12] USB: serial: keyspan_pda: Consolidate room query
Message-ID: <20201014161433.GB712494@rowland.harvard.edu>
References: <20201014145215.518912759@linutronix.de>
 <20201014145727.338773481@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201014145727.338773481@linutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, Oct 14, 2020 at 04:52:18PM +0200, Thomas Gleixner wrote:
> From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> 
> Having two copies of the same code doesn't make the code more readable and
> allocating a buffer of 1 byte for a synchronous operation is a pointless
> exercise.

Not so.  In fact, it is required, because a portion of a structure 
cannot be mapped for DMA unless it is aligned at a cache line boundary.

> Add a byte buffer to struct keyspan_pda_private which can be used
> instead. The buffer is only used in open() and tty->write().

This won't work.

>  Console writes
> are not calling into the query. open() obviously happens before write() and
> the writes are serialized by bit 0 of port->write_urbs_free which protects
> also the transaction itself.
> 
> Move the actual query into a helper function and cleanup the usage sites in
> keyspan_pda_write() and keyspan_pda_open().
> 
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Cc: Johan Hovold <johan@kernel.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: linux-usb@vger.kernel.org
> ---
>  drivers/usb/serial/keyspan_pda.c |  102 ++++++++++++++++-----------------------
>  1 file changed, 43 insertions(+), 59 deletions(-)
> 
> --- a/drivers/usb/serial/keyspan_pda.c
> +++ b/drivers/usb/serial/keyspan_pda.c
> @@ -47,6 +47,7 @@ struct keyspan_pda_private {
>  	struct work_struct			unthrottle_work;
>  	struct usb_serial	*serial;
>  	struct usb_serial_port	*port;
> +	u8			query_buf;
>  };
>  
>  
> @@ -436,6 +437,31 @@ static int keyspan_pda_tiocmset(struct t
>  	return rc;
>  }
>  
> +/*
> + * Using priv->query_buf is safe here because this is only called for TTY
> + * operations open() and write(). write() comes post open() obviously and
> + * write() itself is serialized via bit 0 of port->write_urbs_free. Console
> + * writes are never calling into this.
> + */
> +static int keyspan_pda_query_room(struct usb_serial *serial,
> +				  struct keyspan_pda_private *priv)
> +{
> +	int res;
> +
> +	res = usb_control_msg(serial->dev, usb_rcvctrlpipe(serial->dev, 0),
> +			      6, /* write_room */
> +			      USB_TYPE_VENDOR | USB_RECIP_INTERFACE | USB_DIR_IN,
> +			      0, /* value */
> +			      0, /* index */
> +			      &priv->query_buf,
> +			      1,
> +			      2000);

Instead, consider using the new usb_control_msg_recv() API.  But it 
might be better to allocate the buffer once and for all.

Alan Stern
