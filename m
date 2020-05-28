Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1319A1E5BE1
	for <lists+linux-omap@lfdr.de>; Thu, 28 May 2020 11:31:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728294AbgE1JbQ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 28 May 2020 05:31:16 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:38443 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727981AbgE1JbP (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 28 May 2020 05:31:15 -0400
Received: by mail-lf1-f68.google.com with SMTP id 202so16183400lfe.5;
        Thu, 28 May 2020 02:31:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=XTTyrF3CcrIgGJTtU6zwtoCIbGfhlQi3k9nYSgzhPP0=;
        b=fTd0ubmnMbrcXYQLmRHeD1GzBIUoM+T8ZzLrju2iWV0a6q7Akoh8V9tyb1GM8e79FU
         qajMDNSj6JJpKMdCuT510sR8hQXbMFZfcfCHeqvHq4T4Lchs/ZL6QlsL8/m7jN4PYOzE
         V/9mzpS6L2SchxttPfc5Ws4OEc2+qJFR6VOe6eiFRd2kNxt8W/QqY4zs7EQ6h9BS5cst
         BWmWnZXznfoE5jNxLOVsOF7RB2o32YyMXdmhaaFaQnEaL5ViEYSc8cGTIBCEKS2SI1FF
         hbdd2MZrqe50mtgx12xaugQZQLVAXvQVGs3B+xukO3jAPOvWQN7nl3JUc6tTHavFUCTq
         Bz6w==
X-Gm-Message-State: AOAM531xiY1HxSaJYDGJBQT/NAVbYL/oI7XQnbDco7gm9xQ1MWemubng
        7p6dxH7VgVJw4RopzIDq0Ag=
X-Google-Smtp-Source: ABdhPJwdVXhqanyWtfv/4b7F9+Ge7OAgKITe2eoLS9DAcFx8GgIXmdNa59nY2ZyywTZgR9QaAS6hng==
X-Received: by 2002:a05:6512:3a6:: with SMTP id v6mr1239715lfp.136.1590658270393;
        Thu, 28 May 2020 02:31:10 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id l15sm1328898ljc.73.2020.05.28.02.31.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2020 02:31:09 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1jeEsQ-0003KF-L5; Thu, 28 May 2020 11:31:02 +0200
Date:   Thu, 28 May 2020 11:31:02 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Johan Hovold <johan@kernel.org>, Rob Herring <robh@kernel.org>,
        Alan Cox <gnomes@lxorguk.ukuu.org.uk>,
        Lee Jones <lee.jones@linaro.org>, Jiri Slaby <jslaby@suse.cz>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Pavel Machek <pavel@ucw.cz>,
        Peter Hurley <peter@hurleysoftware.com>,
        Sebastian Reichel <sre@kernel.org>,
        linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH 1/6] tty: n_gsm: Add support for serdev drivers
Message-ID: <20200528093102.GC10358@localhost>
References: <20200512214713.40501-1-tony@atomide.com>
 <20200512214713.40501-2-tony@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200512214713.40501-2-tony@atomide.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, May 12, 2020 at 02:47:08PM -0700, Tony Lindgren wrote:
> We can make use of serdev drivers to do simple device drivers for
> TS 27.010 chanels, and we can handle vendor specific protocols on top
> of TS 27.010 with serdev drivers.
> 
> So far this has been tested with Motorola droid4 where there is a custom
> packet numbering protocol on top of TS 27.010 for the MDM6600 modem.
> 
> I initially though about adding the serdev support into a separate file,
> but that will take some refactoring of n_gsm.c. And I'd like to have
> things working first. Then later on we might want to consider splitting
> n_gsm.c into three pieces for core, tty and serdev parts. And then maybe
> the serdev related parts can be just moved to live under something like
> drivers/tty/serdev/protocol/ngsm.c.

Yeah, perhaps see where this lands first, but it should probably be done
before merging anything.

And it doesn't really make sense exporting these interfaces without the
actual serdev driver as they are closely tied and cannot be reviewed
separately anyway.

> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
>  drivers/tty/n_gsm.c        | 435 +++++++++++++++++++++++++++++++++++++
>  include/linux/serdev-gsm.h | 154 +++++++++++++
>  2 files changed, 589 insertions(+)
>  create mode 100644 include/linux/serdev-gsm.h
> 
> diff --git a/drivers/tty/n_gsm.c b/drivers/tty/n_gsm.c
> --- a/drivers/tty/n_gsm.c
> +++ b/drivers/tty/n_gsm.c
> @@ -39,6 +39,7 @@
>  #include <linux/file.h>
>  #include <linux/uaccess.h>
>  #include <linux/module.h>
> +#include <linux/serdev.h>
>  #include <linux/timer.h>
>  #include <linux/tty_flip.h>
>  #include <linux/tty_driver.h>
> @@ -50,6 +51,7 @@
>  #include <linux/netdevice.h>
>  #include <linux/etherdevice.h>
>  #include <linux/gsmmux.h>
> +#include <linux/serdev-gsm.h>
>  
>  static int debug;
>  module_param(debug, int, 0600);
> @@ -150,6 +152,7 @@ struct gsm_dlci {
>  	/* Data handling callback */
>  	void (*data)(struct gsm_dlci *dlci, const u8 *data, int len);
>  	void (*prev_data)(struct gsm_dlci *dlci, const u8 *data, int len);
> +	struct gsm_serdev_dlci *ops; /* serdev dlci ops, if used */

Please rename the struct with a "_operations" suffix as you refer to
this as "ops" throughout.

>  	struct net_device *net; /* network interface, if created */
>  };
>  
> @@ -198,6 +201,7 @@ enum gsm_mux_state {
>   */
>  
>  struct gsm_mux {
> +	struct gsm_serdev *gsd;		/* Serial device bus data */
>  	struct tty_struct *tty;		/* The tty our ldisc is bound to */
>  	spinlock_t lock;
>  	struct mutex mutex;
> @@ -2346,6 +2350,437 @@ static int gsm_config(struct gsm_mux *gsm, struct gsm_config *c)
>  	return 0;
>  }
>  
> +#ifdef CONFIG_SERIAL_DEV_BUS
> +
> +/**
> + * gsm_serdev_get_config - read ts 27.010 config
> + * @gsd:	serdev-gsm instance
> + * @c:		ts 27.010 config data
> + *
> + * See gsm_copy_config_values() for more information.

Please document this properly since you're exporting these interfaces.

> + */
> +int gsm_serdev_get_config(struct gsm_serdev *gsd, struct gsm_config *c)
> +{
> +	struct gsm_mux *gsm;
> +
> +	if (!gsd || !gsd->gsm)
> +		return -ENODEV;

Is all this paranoia needed?

> +
> +	gsm = gsd->gsm;
> +
> +	if (!c)
> +		return -EINVAL;
> +
> +	gsm_copy_config_values(gsm, c);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(gsm_serdev_get_config);
> +
> +/**
> + * gsm_serdev_set_config - set ts 27.010 config
> + * @gsd:	serdev-gsm instance
> + * @c:		ts 27.010 config data
> + *
> + * See gsm_config() for more information.
> + */
> +int gsm_serdev_set_config(struct gsm_serdev *gsd, struct gsm_config *c)
> +{
> +	struct gsm_mux *gsm;
> +
> +	if (!gsd || !gsd->serdev || !gsd->gsm)
> +		return -ENODEV;

And why check for serdev here?

> +
> +	gsm = gsd->gsm;
> +
> +	if (!c)
> +		return -EINVAL;
> +
> +	return gsm_config(gsm, c);
> +}
> +EXPORT_SYMBOL_GPL(gsm_serdev_set_config);
> +
> +static struct gsm_dlci *gsd_dlci_get(struct gsm_serdev *gsd, int line,
> +				     bool allocate)
> +{
> +	struct gsm_mux *gsm;
> +	struct gsm_dlci *dlci;
> +
> +	if (!gsd || !gsd->gsm)
> +		return ERR_PTR(-ENODEV);
> +
> +	gsm = gsd->gsm;
> +
> +	if (line < 1 || line >= 63)

Line 62 is reserved as well.

> +		return ERR_PTR(-EINVAL);
> +
> +	mutex_lock(&gsm->mutex);
> +
> +	if (gsm->dlci[line]) {
> +		dlci = gsm->dlci[line];
> +		goto unlock;
> +	} else if (!allocate) {
> +		dlci = ERR_PTR(-ENODEV);
> +		goto unlock;
> +	}
> +
> +	dlci = gsm_dlci_alloc(gsm, line);
> +	if (!dlci) {
> +		dlci = ERR_PTR(-ENOMEM);
> +		goto unlock;
> +	}
> +
> +	gsm->dlci[line] = dlci;
> +
> +unlock:
> +	mutex_unlock(&gsm->mutex);
> +
> +	return dlci;
> +}
> +
> +static int gsd_dlci_receive_buf(struct gsm_serdev_dlci *ops,
> +				const unsigned char *buf,
> +				size_t len)
> +{
> +	struct gsm_serdev *gsd = ops->gsd;

This looks backwards, why not pass in gsd instead?

> +	struct gsm_dlci *dlci;
> +	struct tty_port *port;
> +
> +	dlci = gsd_dlci_get(gsd, ops->line, false);
> +	if (IS_ERR(dlci))
> +		return PTR_ERR(dlci);
> +
> +	port = &dlci->port;
> +	tty_insert_flip_string(port, buf, len);
> +	tty_flip_buffer_push(port);
> +
> +	return len;
> +}
> +
> +static void gsd_dlci_data(struct gsm_dlci *dlci, const u8 *buf, int len)
> +{
> +	struct gsm_mux *gsm = dlci->gsm;
> +	struct gsm_serdev *gsd = gsm->gsd;
> +
> +	if (!gsd || !dlci->ops)
> +		return;
> +
> +	switch (dlci->adaption) {
> +	case 0:

0 isn't valid, right?

> +	case 1:
> +		if (dlci->ops->receive_buf)
> +			dlci->ops->receive_buf(dlci->ops, buf, len);
> +		break;

What about adaption 2 with modem status? Why are you not reusing
gsm_dlci_data()?

> +	default:
> +		pr_warn("dlci%i adaption %i not yet implemented\n",
> +			dlci->addr, dlci->adaption);

This needs to be rate limited. Use the dev_ versions when you can.

> +		break;
> +	}
> +}
> +
> +/**
> + * gsm_serdev_write - write data to a ts 27.010 channel
> + * @gsd:	serdev-gsm instance
> + * @ops:	channel ops
> + * @buf:	write buffer
> + * @len:	buffer length
> + */
> +int gsm_serdev_write(struct gsm_serdev *gsd, struct gsm_serdev_dlci *ops,
> +		     const u8 *buf, int len)
> +{
> +	struct gsm_mux *gsm;
> +	struct gsm_dlci *dlci;
> +	struct gsm_msg *msg;
> +	int h, size, total_size = 0;
> +	u8 *dp;
> +
> +	if (!gsd || !gsd->gsm)
> +		return -ENODEV;
> +
> +	gsm = gsd->gsm;
> +
> +	dlci = gsd_dlci_get(gsd, ops->line, false);
> +	if (IS_ERR(dlci))
> +		return PTR_ERR(dlci);
> +
> +	h = dlci->adaption - 1;
> +
> +	if (len > gsm->mtu)
> +		len = gsm->mtu;
> +
> +	size = len + h;
> +
> +	msg = gsm_data_alloc(gsm, dlci->addr, size, gsm->ftype);
> +	if (!msg)
> +		return -ENOMEM;
> +
> +	dp = msg->data;
> +	switch (dlci->adaption) {
> +	case 1:
> +		break;
> +	case 2:
> +		*dp++ = gsm_encode_modem(dlci);
> +		break;
> +	}
> +	memcpy(dp, buf, len);
> +	gsm_data_queue(dlci, msg);
> +	total_size += size;
> +
> +	return total_size;
> +}
> +EXPORT_SYMBOL_GPL(gsm_serdev_write);
> +
> +/**
> + * gsm_serdev_data_kick - indicate more data can be transmitted
> + * @gsd:	serdev-gsm instance
> + *
> + * See gsm_data_kick() for more information.
> + */
> +void gsm_serdev_data_kick(struct gsm_serdev *gsd)
> +{
> +	struct gsm_mux *gsm;
> +	unsigned long flags;
> +
> +	if (!gsd || !gsd->gsm)
> +		return;
> +
> +	gsm = gsd->gsm;
> +
> +	spin_lock_irqsave(&gsm->tx_lock, flags);
> +	gsm_data_kick(gsm);
> +	spin_unlock_irqrestore(&gsm->tx_lock, flags);
> +}
> +EXPORT_SYMBOL_GPL(gsm_serdev_data_kick);
> +
> +/**
> + * gsm_serdev_register_dlci - register a ts 27.010 channel
> + * @gsd:	serdev-gsm instance
> + * @ops:	channel ops
> + */
> +int gsm_serdev_register_dlci(struct gsm_serdev *gsd,
> +			     struct gsm_serdev_dlci *ops)
> +{
> +	struct gsm_dlci *dlci;
> +	struct gsm_mux *gsm;
> +	int retries;
> +
> +	if (!gsd || !gsd->gsm || !gsd->serdev)
> +		return -ENODEV;
> +
> +	gsm = gsd->gsm;
> +
> +	if (!ops || !ops->line)
> +		return -EINVAL;
> +
> +	dlci = gsd_dlci_get(gsd, ops->line, true);
> +	if (IS_ERR(dlci))
> +		return PTR_ERR(dlci);
> +
> +	if (dlci->state == DLCI_OPENING || dlci->state == DLCI_OPEN ||
> +	    dlci->state == DLCI_CLOSING)
> +		return -EBUSY;
> +
> +	mutex_lock(&dlci->mutex);
> +	ops->gsd = gsd;
> +	dlci->ops = ops;
> +	dlci->modem_rx = 0;
> +	dlci->prev_data = dlci->data;

I think this one is only used when bringing up a network interface.

> +	dlci->data = gsd_dlci_data;
> +	mutex_unlock(&dlci->mutex);
> +
> +	gsm_dlci_begin_open(dlci);

Why is this here? This should be handled when opening the serial device
(i.e. by gsmtty_open()).

> +
> +	/*
> +	 * Allow some time for dlci to move to DLCI_OPEN state. Otherwise
> +	 * the serdev consumer driver can start sending data too early during
> +	 * the setup, and the response will be missed by gms_queue() if we
> +	 * still have DLCI_CLOSED state.
> +	 */
> +	for (retries = 10; retries > 0; retries--) {
> +		if (dlci->state == DLCI_OPEN)
> +			break;
> +		msleep(100);
> +	}

What if you time out? This should be handled properly.

> +
> +	if (!retries)
> +		dev_dbg(&gsd->serdev->dev, "dlci%i not currently active\n",
> +			dlci->addr);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(gsm_serdev_register_dlci);
> +
> +/**
> + * gsm_serdev_unregister_dlci - unregister a ts 27.010 channel
> + * @gsd:	serdev-gsm instance
> + * @ops:	channel ops
> + */
> +void gsm_serdev_unregister_dlci(struct gsm_serdev *gsd,
> +				struct gsm_serdev_dlci *ops)
> +{
> +	struct gsm_mux *gsm;
> +	struct gsm_dlci *dlci;
> +
> +	if (!gsd || !gsd->gsm || !gsd->serdev)
> +		return;
> +
> +	gsm = gsd->gsm;
> +
> +	if (!ops || !ops->line)
> +		return;
> +
> +	dlci = gsd_dlci_get(gsd, ops->line, false);
> +	if (IS_ERR(dlci))
> +		return;
> +
> +	mutex_lock(&dlci->mutex);
> +	gsm_destroy_network(dlci);
> +	dlci->data = dlci->prev_data;
> +	dlci->ops->gsd = NULL;
> +	dlci->ops = NULL;
> +	mutex_unlock(&dlci->mutex);
> +
> +	gsm_dlci_begin_close(dlci);

This should all be handled when closing the serial device, that is, by
gsmtty_close().

> +}
> +EXPORT_SYMBOL_GPL(gsm_serdev_unregister_dlci);
> +
> +static int gsm_serdev_output(struct gsm_mux *gsm, u8 *data, int len)
> +{
> +	struct serdev_device *serdev = gsm->gsd->serdev;
> +
> +	if (gsm->gsd->output)
> +		return gsm->gsd->output(gsm->gsd, data, len);
> +	else
> +		return serdev_device_write_buf(serdev, data, len);
> +}

I guess this is needed to handle the motorola framing, but not easy to
tell currently due to the split.

> +
> +static int gsd_receive_buf(struct serdev_device *serdev, const u8 *data,
> +			   size_t count)
> +{
> +	struct gsm_serdev *gsd = serdev_device_get_drvdata(serdev);
> +	struct gsm_mux *gsm;
> +	const unsigned char *dp;
> +	int i;
> +
> +	if (WARN_ON(!gsd))
> +		return 0;

Probably better to take the NULL-deref. Can this ever happen?

> +
> +	gsm = gsd->gsm;
> +
> +	if (debug & 4)
> +		print_hex_dump_bytes("gsd_receive_buf: ",
> +				     DUMP_PREFIX_OFFSET,
> +				     data, count);
> +
> +	for (i = count, dp = data; i; i--, dp++)
> +		gsm->receive(gsm, *dp);
> +
> +	return count;
> +}
> +
> +static void gsd_write_wakeup(struct serdev_device *serdev)
> +{
> +	serdev_device_write_wakeup(serdev);
> +}
> +
> +static struct serdev_device_ops gsd_client_ops = {
> +	.receive_buf = gsd_receive_buf,
> +	.write_wakeup = gsd_write_wakeup,
> +};
> +
> +int gsm_serdev_register_tty_port(struct gsm_serdev *gsd, int line)
> +{
> +	struct gsm_serdev_dlci *ops;
> +	unsigned int base;
> +	int error;
> +
> +	if (line < 1)
> +		return -EINVAL;

Upper limit?

> +
> +	ops = kzalloc(sizeof(*ops), GFP_KERNEL);
> +	if (!ops)
> +		return -ENOMEM;
> +
> +	ops->line = line;
> +	ops->receive_buf = gsd_dlci_receive_buf;
> +
> +	error = gsm_serdev_register_dlci(gsd, ops);
> +	if (error) {
> +		kfree(ops);
> +
> +		return error;
> +	}
> +
> +	base = mux_num_to_base(gsd->gsm);
> +	tty_register_device(gsm_tty_driver, base + ops->line, NULL);

I would expect this to be tty_port_register_device_serdev() so that
serdev gets initialised properly for any client devices (e.g. gnss).

> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(gsm_serdev_register_tty_port);
> +
> +void gsm_serdev_unregister_tty_port(struct gsm_serdev *gsd, int line)
> +{
> +	struct gsm_dlci *dlci;
> +	unsigned int base;
> +
> +	if (line < 1)
> +		return;

As above.

> +
> +	dlci = gsd_dlci_get(gsd, line, false);
> +	if (IS_ERR(dlci))
> +		return;
> +
> +	base = mux_num_to_base(gsd->gsm);
> +	tty_unregister_device(gsm_tty_driver, base + line);
> +	gsm_serdev_unregister_dlci(gsd, dlci->ops);
> +	kfree(dlci->ops);
> +}
> +EXPORT_SYMBOL_GPL(gsm_serdev_unregister_tty_port);
> +
> +int gsm_serdev_register_device(struct gsm_serdev *gsd)
> +{
> +	struct gsm_mux *gsm;
> +	int error;
> +
> +	if (WARN(!gsd || !gsd->serdev || !gsd->output,
> +		 "serdev and output must be initialized\n"))
> +		return -EINVAL;

Just oops if the driver is buggy and fails to set essential fields.

> +
> +	serdev_device_set_client_ops(gsd->serdev, &gsd_client_ops);
> +
> +	gsm = gsm_alloc_mux();
> +	if (!gsm)
> +		return -ENOMEM;
> +
> +	gsm->encoding = 1;
> +	gsm->tty = NULL;
> +	gsm->gsd = gsd;
> +	gsm->output = gsm_serdev_output;
> +	gsd->gsm = gsm;
> +	mux_get(gsd->gsm);
> +
> +	error = gsm_activate_mux(gsd->gsm);
> +	if (error) {
> +		gsm_cleanup_mux(gsd->gsm);
> +		mux_put(gsd->gsm);
> +
> +		return error;
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(gsm_serdev_register_device);
> +
> +void gsm_serdev_unregister_device(struct gsm_serdev *gsd)
> +{
> +	gsm_cleanup_mux(gsd->gsm);
> +	mux_put(gsd->gsm);
> +	gsd->gsm = NULL;
> +}
> +EXPORT_SYMBOL_GPL(gsm_serdev_unregister_device);
> +
> +#endif	/* CONFIG_SERIAL_DEV_BUS */

It looks like you may also have a problem with tty hangups, which serdev
does not support currently. There are multiple paths in n_gsm which can
trigger a hangup (e.g. based on remote input) and would likely lead to a
crash.

Johan
