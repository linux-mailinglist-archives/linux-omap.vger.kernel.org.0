Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED5881E61AF
	for <lists+linux-omap@lfdr.de>; Thu, 28 May 2020 15:07:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390086AbgE1NHH (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 28 May 2020 09:07:07 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:46168 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390079AbgE1NHG (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 28 May 2020 09:07:06 -0400
Received: by mail-lf1-f65.google.com with SMTP id r125so16486892lff.13;
        Thu, 28 May 2020 06:07:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jkI1fSmr7NLokyM8fHRV6r1fVitlrGo+0RtUIbQpqRQ=;
        b=VMIddiRVjk8AJxfPvNVEtCjssonFaedjjdAc/8J9i0rZkee/fDwf4q6nyxXzx6biK0
         2CJewAx6eT5rZ26oAJMWbGMSnpiOlwWfnX0vY8cBDqvIUV+8r2todVOJfNG026+tM2Gy
         4UI3wWEPLqC7iweaKfdHXAt1rlPmheLLZC0LDZqTBGb1cREKmK85LP+izw7+YWDtiVn1
         J+qYW78hcud6AzrUM4kdMe4wcPbwWCN0lY+1lo9R23kIqNi/rXQAIdU+2q+pX2muvuJm
         a7otQ13qyZnkB6r/kL55YGrnVX9jm+cSqbh+XYAf5er2RpTi+cbWsAsFF5/ggUltceQO
         IjUA==
X-Gm-Message-State: AOAM530JMPoiQ/aQJ5OO/diWT/bVkRwTCgzJFtbVmRl81u55UYy+vVfO
        QOP1wxu7YYpvnc78CbF+9uI=
X-Google-Smtp-Source: ABdhPJzd6zYpOIGMceQIThtWejSufuaPRYLPZvBs3R+p0dc1VKv/0d9grUaorSC0Lg5FfI839RqoqA==
X-Received: by 2002:ac2:5cac:: with SMTP id e12mr1694160lfq.92.1590671221193;
        Thu, 28 May 2020 06:07:01 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id f10sm1625387lfm.34.2020.05.28.06.06.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2020 06:06:59 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1jeIFJ-0004C6-2q; Thu, 28 May 2020 15:06:53 +0200
Date:   Thu, 28 May 2020 15:06:53 +0200
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
Subject: Re: [PATCH 5/6] gnss: motmdm: Add support for Motorola Mapphone
 MDM6600 modem
Message-ID: <20200528130653.GG10358@localhost>
References: <20200512214713.40501-1-tony@atomide.com>
 <20200512214713.40501-6-tony@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200512214713.40501-6-tony@atomide.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, May 12, 2020 at 02:47:12PM -0700, Tony Lindgren wrote:
> Motorola is using a custom TS 27.010 based serial port line discipline
> for various devices on the modem. These devices can be accessed on
> dedicated channels using Linux kernel serdev-ngsm driver.
> 
> For the GNSS on these devices, we need to kick the GNSS device at a
> desired rate. Otherwise the GNSS device stops sending data after a
> few minutes. The rate we poll data defaults to 1000 ms, and can be
> specified with a module option rate_ms between 1 to 16 seconds.
> 
> Note that AGPS with xtra2.bin is not yet supported, so getting a fix
> can take quite a while. And a recent gpsd is needed to parse the
> $GNGNS output, and to properly handle the /dev/gnss0 character device.
> I've confirmed it works properly with gpsd-3.20.
> 
> Tested-by: Pavel Machek <pavel@ucw.cz>
> Reviewed-by: Pavel Machek <pavel@ucw.cz>
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
>  drivers/gnss/Kconfig  |   8 +
>  drivers/gnss/Makefile |   3 +
>  drivers/gnss/motmdm.c | 419 ++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 430 insertions(+)
>  create mode 100644 drivers/gnss/motmdm.c
> 
> diff --git a/drivers/gnss/Kconfig b/drivers/gnss/Kconfig
> --- a/drivers/gnss/Kconfig
> +++ b/drivers/gnss/Kconfig
> @@ -13,6 +13,14 @@ menuconfig GNSS
>  
>  if GNSS
>  
> +config GNSS_MOTMDM
> +	tristate "Motorola Modem TS 27.010 serdev GNSS receiver support"
> +	depends on SERIAL_DEV_N_GSM
> +	---help---
> +	  Say Y here if you have a Motorola modem using TS 27.010 line
> +	  discipline for GNSS such as a Motorola Mapphone series device
> +	  like Droid 4.
> +
>  config GNSS_SERIAL
>  	tristate
>  
> diff --git a/drivers/gnss/Makefile b/drivers/gnss/Makefile
> --- a/drivers/gnss/Makefile
> +++ b/drivers/gnss/Makefile
> @@ -6,6 +6,9 @@
>  obj-$(CONFIG_GNSS)			+= gnss.o
>  gnss-y := core.o
>  
> +obj-$(CONFIG_GNSS_MOTMDM)		+= gnss-motmdm.o
> +gnss-motmdm-y := motmdm.o
> +
>  obj-$(CONFIG_GNSS_SERIAL)		+= gnss-serial.o
>  gnss-serial-y := serial.o
>  
> diff --git a/drivers/gnss/motmdm.c b/drivers/gnss/motmdm.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/gnss/motmdm.c
> @@ -0,0 +1,419 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Motorola Modem TS 27.010 serdev GNSS driver
> + *
> + * Copyright (C) 2018 - 2020 Tony Lindgren <tony@atomide.com>
> + *
> + * Based on drivers/gnss/sirf.c driver example:
> + * Copyright (C) 2018 Johan Hovold <johan@kernel.org>
> + */
> +
> +#include <linux/errno.h>
> +#include <linux/gnss.h>
> +#include <linux/init.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/serdev-gsm.h>
> +#include <linux/slab.h>
> +
> +#define MOTMDM_GNSS_TIMEOUT	1000
> +#define MOTMDM_GNSS_RATE	1000
> +
> +/*
> + * Motorola MDM GNSS device communicates over a dedicated TS 27.010 channel
> + * using custom data packets. The packets look like AT commands embedded into
> + * a Motorola invented packet using format like "U1234AT+MPDSTART=0,1,100,0".
> + * But it's not an AT compatible serial interface, it's a packet interface
> + * using AT like commands.
> + */

So this shouldn't depend on TS 27.010 and instead be a generic gnss
serial driver. 

What does the interface look like over the corresponding USB port?
AT-commands without the U1234 prefix?

> +#define MOTMDM_GNSS_HEADER_LEN	5				/* U1234 */
> +#define MOTMDM_GNSS_RESP_LEN	(MOTMDM_GNSS_HEADER_LEN + 4)	/* U1234+MPD */
> +#define MOTMDM_GNSS_DATA_LEN	(MOTMDM_GNSS_RESP_LEN + 1)	/* U1234~+MPD */
> +#define MOTMDM_GNSS_STATUS_LEN	(MOTMDM_GNSS_DATA_LEN + 7)	/* STATUS= */
> +#define MOTMDM_GNSS_NMEA_LEN	(MOTMDM_GNSS_DATA_LEN + 8)	/* NMEA=NN, */
> +
> +enum motmdm_gnss_status {
> +	MOTMDM_GNSS_UNKNOWN,
> +	MOTMDM_GNSS_INITIALIZED,
> +	MOTMDM_GNSS_DATA_OR_TIMEOUT,
> +	MOTMDM_GNSS_STARTED,
> +	MOTMDM_GNSS_STOPPED,
> +};
> +
> +struct motmdm_gnss_data {
> +	struct gnss_device *gdev;
> +	struct device *modem;
> +	struct gsm_serdev_dlci dlci;
> +	struct delayed_work restart_work;
> +	struct mutex mutex;	/* For modem commands */
> +	ktime_t last_update;
> +	int status;
> +	unsigned char *buf;
> +	size_t len;
> +	wait_queue_head_t read_queue;
> +	unsigned int parsed:1;
> +};
> +
> +static unsigned int rate_ms = MOTMDM_GNSS_RATE;
> +module_param(rate_ms, uint, 0644);
> +MODULE_PARM_DESC(rate_ms, "GNSS refresh rate between 1000 and 16000 ms (default 1000 ms)");

No module parameters please. Either pick a good default or we need to
come up with a generic (sysfs) interface for polled drivers like this
one.

> +
> +/*
> + * Note that multiple commands can be sent in series with responses coming
> + * out-of-order. For GNSS, we don't need to care about the out-of-order
> + * responses, and can assume we have at most one command active at a time.
> + * For the commands, can use just a jiffies base packet ID and let the modem
> + * sort out the ID conflicts with the modem's unsolicited message ID
> + * numbering.
> + */
> +static int motmdm_gnss_send_command(struct motmdm_gnss_data *ddata,
> +				    const u8 *buf, int len)
> +{
> +	struct gnss_device *gdev = ddata->gdev;
> +	const int timeout_ms = 1000;
> +	unsigned char cmd[128];
> +	int ret, cmdlen;
> +
> +	cmdlen = len + 5 + 1;
> +	if (cmdlen > 128)
> +		return -EINVAL;
> +
> +	mutex_lock(&ddata->mutex);
> +	memset(ddata->buf, 0, ddata->len);
> +	ddata->parsed = false;
> +	snprintf(cmd, cmdlen, "U%04li%s", jiffies % 10000, buf);
> +	ret = serdev_ngsm_write(ddata->modem, &ddata->dlci, cmd, cmdlen);
> +	if (ret < 0)
> +		goto out_unlock;
> +
> +	ret = wait_event_timeout(ddata->read_queue, ddata->parsed,
> +				 msecs_to_jiffies(timeout_ms));
> +	if (ret == 0) {
> +		ret = -ETIMEDOUT;
> +		goto out_unlock;
> +	} else if (ret < 0) {
> +		goto out_unlock;
> +	}
> +
> +	if (!strstr(ddata->buf, ":OK")) {
> +		dev_err(&gdev->dev, "command %s error %s\n",
> +			cmd, ddata->buf);
> +		ret = -EPIPE;
> +	}

I'm still not sure I like all this string parsing being done inside the
kernel (and reimplemented in every driver using an AT interface).

> +
> +	ret = len;
> +
> +out_unlock:
> +	mutex_unlock(&ddata->mutex);
> +
> +	return ret;
> +}
> +
> +/*
> + * Android uses AT+MPDSTART=0,1,100,0 which starts GNSS for a while,
> + * and then GNSS needs to be kicked with an AT command based on a
> + * status message.
> + */
> +static void motmdm_gnss_restart(struct work_struct *work)
> +{
> +	struct motmdm_gnss_data *ddata =
> +		container_of(work, struct motmdm_gnss_data,
> +			     restart_work.work);

Split declaration and initialisation to avoid the line breaks.

> +	struct gnss_device *gdev = ddata->gdev;
> +	const unsigned char *cmd = "AT+MPDSTART=0,1,100,0";
> +	int error;
> +
> +	ddata->last_update = ktime_get();
> +
> +	error = motmdm_gnss_send_command(ddata, cmd, strlen(cmd));
> +	if (error < 0) {
> +		/* Timeouts can happen, don't warn and try again */
> +		if (error != -ETIMEDOUT)
> +			dev_warn(&gdev->dev, "%s: could not start: %i\n",
> +				 __func__, error);

No function names in messages, please. Just spell out what went wrong.

> +
> +		schedule_delayed_work(&ddata->restart_work,
> +				      msecs_to_jiffies(MOTMDM_GNSS_RATE));
> +
> +		return;
> +	}
> +}
> +
> +static void motmdm_gnss_start(struct gnss_device *gdev, int delay_ms)
> +{
> +	struct motmdm_gnss_data *ddata = gnss_get_drvdata(gdev);
> +	ktime_t now, next, delta;
> +	int next_ms;
> +
> +	now = ktime_get();
> +	next = ktime_add_ms(ddata->last_update, delay_ms);
> +	delta = ktime_sub(next, now);
> +	next_ms = ktime_to_ms(delta);
> +
> +	if (next_ms < 0)
> +		next_ms = 0;
> +	if (next_ms > delay_ms)
> +		next_ms = delay_ms;
> +
> +	schedule_delayed_work(&ddata->restart_work, msecs_to_jiffies(next_ms));
> +}
> +
> +static int motmdm_gnss_stop(struct gnss_device *gdev)
> +{
> +	struct motmdm_gnss_data *ddata = gnss_get_drvdata(gdev);
> +	const unsigned char *cmd = "AT+MPDSTOP";
> +
> +	cancel_delayed_work_sync(&ddata->restart_work);
> +
> +	return motmdm_gnss_send_command(ddata, cmd, strlen(cmd));
> +}
> +
> +static int motmdm_gnss_init(struct gnss_device *gdev)
> +{
> +	struct motmdm_gnss_data *ddata = gnss_get_drvdata(gdev);
> +	const unsigned char *cmd = "AT+MPDINIT=1";
> +	int error;
> +
> +	error = motmdm_gnss_send_command(ddata, cmd, strlen(cmd));
> +	if (error < 0)
> +		return error;
> +
> +	motmdm_gnss_start(gdev, 0);
> +
> +	return 0;
> +}
> +
> +static int motmdm_gnss_finish(struct gnss_device *gdev)
> +{
> +	struct motmdm_gnss_data *ddata = gnss_get_drvdata(gdev);
> +	const unsigned char *cmd = "AT+MPDINIT=0";
> +	int error;
> +
> +	error = motmdm_gnss_stop(gdev);
> +	if (error < 0)
> +		return error;
> +
> +	return motmdm_gnss_send_command(ddata, cmd, strlen(cmd));
> +}
> +
> +static int motmdm_gnss_receive_data(struct gsm_serdev_dlci *dlci,
> +				    const unsigned char *buf,
> +				    size_t len)
> +{
> +	struct gnss_device *gdev = dlci->drvdata;
> +	struct motmdm_gnss_data *ddata = gnss_get_drvdata(gdev);
> +	const unsigned char *msg;
> +	size_t msglen;
> +	int error = 0;
> +
> +	if (len <= MOTMDM_GNSS_RESP_LEN)
> +		return 0;
> +
> +	/* Handle U1234+MPD style command response */
> +	if (buf[MOTMDM_GNSS_HEADER_LEN] != '~') {
> +		msg = buf + MOTMDM_GNSS_RESP_LEN;
> +		strncpy(ddata->buf, msg, len - MOTMDM_GNSS_RESP_LEN);
> +		ddata->parsed = true;
> +		wake_up(&ddata->read_queue);
> +
> +		return len;
> +	}
> +
> +	if (len <= MOTMDM_GNSS_DATA_LEN)
> +		return 0;
> +
> +	/* Handle U1234~+MPD style unsolicted message */
> +	switch (buf[MOTMDM_GNSS_DATA_LEN]) {

Shouldn't you check the command string?

> +	case 'N':	/* UNNNN~+MPDNMEA=NN, */
> +		msg = buf + MOTMDM_GNSS_NMEA_LEN;
> +		msglen = len - MOTMDM_GNSS_NMEA_LEN;
> +
> +		/*
> +		 * Firmware bug: Strip out extra duplicate line break always
> +		 * in the data
> +		 */
> +		msglen--;
> +
> +		/*
> +		 * Firmware bug: Strip out extra data based on an
> +		 * earlier line break in the data
> +		 */
> +		if (msg[msglen - 5 - 1] == 0x0a)
> +			msglen -= 5;
> +
> +		error = gnss_insert_raw(gdev, msg, msglen);
> +		break;
> +	case 'S':	/* UNNNN~+MPDSTATUS=N,NN */
> +		msg = buf + MOTMDM_GNSS_STATUS_LEN;
> +		msglen = len - MOTMDM_GNSS_STATUS_LEN;
> +
> +		switch (msg[0]) {
> +		case '1':
> +			ddata->status = MOTMDM_GNSS_INITIALIZED;
> +			break;
> +		case '2':
> +			ddata->status = MOTMDM_GNSS_DATA_OR_TIMEOUT;
> +			if (rate_ms < MOTMDM_GNSS_RATE)
> +				rate_ms = MOTMDM_GNSS_RATE;
> +			if (rate_ms > 16 * MOTMDM_GNSS_RATE)
> +				rate_ms = 16 * MOTMDM_GNSS_RATE;
> +			motmdm_gnss_start(gdev, rate_ms);
> +			break;
> +		case '3':
> +			ddata->status = MOTMDM_GNSS_STARTED;
> +			break;
> +		case '4':
> +			ddata->status = MOTMDM_GNSS_STOPPED;
> +			break;
> +		default:
> +			ddata->status = MOTMDM_GNSS_UNKNOWN;
> +			break;
> +		}
> +		break;
> +	case 'X':	/* UNNNN~+MPDXREQ=N for updated xtra2.bin needed */
> +	default:
> +		break;
> +	}
> +
> +	return len;
> +}
> +
> +static int motmdm_gnss_open(struct gnss_device *gdev)
> +{
> +	struct motmdm_gnss_data *ddata = gnss_get_drvdata(gdev);
> +	struct gsm_serdev_dlci *dlci = &ddata->dlci;
> +	int error;
> +
> +	dlci->drvdata = gdev;
> +	dlci->receive_buf = motmdm_gnss_receive_data;
> +
> +	error = serdev_ngsm_register_dlci(ddata->modem, dlci);
> +	if (error)
> +		return error;
> +
> +	error = motmdm_gnss_init(gdev);
> +	if (error) {
> +		serdev_ngsm_unregister_dlci(ddata->modem, dlci);
> +
> +		return error;
> +	}
> +
> +	return 0;
> +}

How does your "aggressive pm" gsmmux implementation work with the gps if
there are no other clients keeping the modem awake? It seems the modem
would be suspended after 600 milliseconds after being woken up every 10
seconds or so by the polling gnss driver?

What happens to the satellite lock in between? Does the request block
until the gps has an updated position?

Johan
