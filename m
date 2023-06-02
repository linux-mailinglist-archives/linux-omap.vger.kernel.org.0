Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A612771FC25
	for <lists+linux-omap@lfdr.de>; Fri,  2 Jun 2023 10:33:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234116AbjFBIdp (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 2 Jun 2023 04:33:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234107AbjFBIdo (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 2 Jun 2023 04:33:44 -0400
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com [IPv6:2001:4860:4864:20::2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A1FF196
        for <linux-omap@vger.kernel.org>; Fri,  2 Jun 2023 01:33:41 -0700 (PDT)
Received: by mail-oa1-x2e.google.com with SMTP id 586e51a60fabf-19e7008a20aso1850630fac.1
        for <linux-omap@vger.kernel.org>; Fri, 02 Jun 2023 01:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1685694820; x=1688286820;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0PL2vx+N+FvvAslnwqlsdaRK4WGL6TnmcYbKYt6iUlc=;
        b=LXKgVFnud02Df0LNrLaOrqy0HtgixJEbO1MfDGD9PMMi0cfWhIIJm5aQyrEgQ3+9qu
         vCggTfbQVh/b9XcIcy8hlmuq7O1Uu4Sq9B0yX1/PrFRwZjhUDaTEFcHFiT+O0LBYxM6r
         UYV0qmqVWgHDHlbo6CGOFRTXtUajxBSCrxlew=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685694820; x=1688286820;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0PL2vx+N+FvvAslnwqlsdaRK4WGL6TnmcYbKYt6iUlc=;
        b=Fwa8wh95n/Petg2BGXMzP84hkdTIXXRxiXM5GOkDrjf+mbSElv8PghFV7ZeZ1Hj1Yv
         LCKzVzfW53P8nkmNJvyqmJukIgWiXKoAangeJ/eyu7KPazowVxySwjCR/tlwhKaROmIs
         q0gXocUmL7EVEwEL/nxVxSpWEsMrnXkFcaNFz4nCp2R8YFGr0Ad0MmNYJlcbQ9J3d6bs
         x3jaIPUFEhjTwek2EJu7UIzG3rsHqSCWyHK363vU+f/G1B4YbnZLaEs2ieCt7MYkDmX7
         qS5yb6rYzzfxWZfj0/o0zi74ugt8pt7wIFrbiEKi8tJWZQNk7zkLUNsZ/z+bsZt1DdvN
         zgoQ==
X-Gm-Message-State: AC+VfDyEd9uHZ+jpMXY7rKS6hsT2S1s0otOxOZoeM7mCdf4KEC9ILhvm
        YPZfG/dBZRKirev/c0jPu34eiQ==
X-Google-Smtp-Source: ACHHUZ5l7f485m/XnJDUo13P/NEqBcaKY2mb2ReWCTWz9uysVDRuqfPrxFMbEsfsRiDT+qyHJlAfxA==
X-Received: by 2002:a05:6871:391:b0:19a:733:53c3 with SMTP id z17-20020a056871039100b0019a073353c3mr1329328oaf.35.1685694820086;
        Fri, 02 Jun 2023 01:33:40 -0700 (PDT)
Received: from google.com ([2401:fa00:1:10:9265:2958:3e8a:5bb5])
        by smtp.gmail.com with ESMTPSA id w18-20020a170902e89200b001a64a2b790fsm756356plg.164.2023.06.02.01.33.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jun 2023 01:33:39 -0700 (PDT)
Date:   Fri, 2 Jun 2023 16:33:35 +0800
From:   Chen-Yu Tsai <wenst@chromium.org>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        Dhruva Gole <d-gole@ti.com>,
        Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        John Ogness <john.ogness@linutronix.de>,
        Johan Hovold <johan@kernel.org>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        linux-omap@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
        =?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado 
        <nfraprado@collabora.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v12 1/1] serial: core: Start managing serial controllers
 to enable runtime PM
Message-ID: <20230602083335.GA181647@google.com>
References: <20230525113034.46880-1-tony@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230525113034.46880-1-tony@atomide.com>
X-Spam-Status: No, score=1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FSL_HELO_FAKE,
        RCVD_IN_DNSWL_NONE,RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, May 25, 2023 at 02:30:30PM +0300, Tony Lindgren wrote:
> We want to enable runtime PM for serial port device drivers in a generic
> way. To do this, we want to have the serial core layer manage the
> registered physical serial controller devices.
> 
> To manage serial controllers, let's set up a struct bus and struct device
> for the serial core controller as suggested by Greg and Jiri. The serial
> core controller devices are children of the physical serial port device.
> The serial core controller device is needed to support multiple different
> kind of ports connected to single physical serial port device.
> 
> Let's also set up a struct device for the serial core port. The serial
> core port instances are children of the serial core controller device.
> 
> With the serial core port device we can now flush pending TX on the
> runtime PM resume as suggested by Johan.
> 
> Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Suggested-by: Jiri Slaby <jirislaby@kernel.org>
> Suggested-by: Johan Hovold <johan@kernel.org>
> Signed-off-by: Tony Lindgren <tony@atomide.com>

This patch, in linux-next since 20230601, unfortunately breaks MediaTek
based Chromebooks. The kernel hangs during the probe of the serial ports,
which use the 8250_mtk driver. This happens even with the subsequent
fixes in next-20230602 and on the mailing list:

    serial: core: Fix probing serial_base_bus devices
    serial: core: Don't drop port_mutex in serial_core_remove_one_port
    serial: core: Fix error handling for serial_core_ctrl_device_add()

Without the fixes, the kernel gives "WARNING: bad unlock balance detected!"
With the fixes, it just silently hangs. The last messages seen on the
(serial) console are:

    Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled
    printk: console [ttyS0] disabled
    mt6577-uart 11002000.serial: using DT '/soc/serial@11002000' for 'rs485-term' GPIO lookup
    of_get_named_gpiod_flags: can't parse 'rs485-term-gpios' property of node '/soc/serial@11002000[0]'
    of_get_named_gpiod_flags: can't parse 'rs485-term-gpio' property of node '/soc/serial@11002000[0]'
    mt6577-uart 11002000.serial: using lookup tables for GPIO lookup
    mt6577-uart 11002000.serial: No GPIO consumer rs485-term found
    mt6577-uart 11002000.serial: using DT '/soc/serial@11002000' for 'rs485-rx-during-tx' GPIO lookup
    of_get_named_gpiod_flags: can't parse 'rs485-rx-during-tx-gpios' property of node '/soc/serial@11002000[0]'
    of_get_named_gpiod_flags: can't parse 'rs485-rx-during-tx-gpio' property of node '/soc/serial@11002000[0]'
    mt6577-uart 11002000.serial: using lookup tables for GPIO lookup
    mt6577-uart 11002000.serial: No GPIO consumer rs485-rx-during-tx found

What can we do to help resolve this?

Thanks
ChenYu

> ---
> Changes since v11:
> - Reworked code to add struct serial_ctrl_device and serial_port_device
>   wrappers around struct device for type checking as suggested by Greg
> 
> Changes since v10:
> 
> - Added missing handling for unknown type in serial_base_device_add()
>   as noted by kernel test robot
> 
> - Use y instead of objs fro serial_base in Makefile as noted by Andy
> 
> - Improve serial_port pm_ops alignment as noted by Andy
> 
> Changes since v9:
> 
> - Built in serial_base and core related components into serial_base.ko as
>   suggested by Greg. We now have module_init only in serial_base.c that
>   calls serial_base_ctrl_init() and serial_base_port_init(). I renamed
>   serial_bus.c to serial_base_bus.c to build serial_base.ko. Note that
>   if we wanted to build these into serial_core.ko, renaming serial_core.c
>   would be needed which is not necessarily nice for folks that may have
>   pending patches
> 
> - Dropped string comparison for ctrl and port, and switched to using
>   struct device_type as suggested by Greg
> 
> - Dropped port->state checks in serial_base_get_port() as noted by
>   Greg
> 
> - Dropped EXPORT_SYMBOL_NS(), these are no longer needed with components
>   built into serial_base.ko. I also noticed that we have some dependency
>   loops if components are not built into serial_base.ko. And we would
>   have hard time later on moving port specific functions to serial_port.c
>   for example
> 
> - Dropped checks for negative ctrl_id in serial_core_ctrl_find() as
>   suggested by Greg
> 
> - Stopped resetting ctrl_id in serial_core_remove_one_port(), instead
>   let's properly init it in serial8250_init_port(). The ctrl_id is
>   optionally passed to uart_add_one_port() and zero otherwise
> 
> - Moved port_mutex and UPF_DEAD handling from serial_core_add_one_port()
>   to serial_core_register_port() to simplify things a bit
> 
> - Updated license and copyright as suggested by Greg
> 
> - Dropped Andy's reviewed-by, things still changed quite a bit
> 
> Changes since v8:
> 
> - Drop unnecessary free for name noticed by Andy, the name is freed
>   on put_device()
> 
> - Cosmetic fix for comments in serial_port.c noted by Andy
> 
> - Spelling fix for word uninitialized in serial_base_get_port()
> 
> Changes since v7:
> 
> - Add release() put_device() to serial_base.c as noted by Andy
> 
> - Make struct serial_base_device private to serial_base.c by adding
>   serial_base_get_port()
> 
> - Add more comments to __uart_start()
> 
> - Coding style improvments for serial_base.c from Andy
> 
> Changes since v6:
> 
> - Fix up a memory leak and a bunch of issues in serial_base.c as noted
>   by Andy
> 
> - Replace bool with new_ctrl_dev for freeing the added device on
>   error path
> 
> - Drop unused pm ops for serial_ctrl.c as noted by kernel test robot
> 
> - Drop documentation updates for acpi devices for now to avoid a merge
>   conflict and make testing easier between -rc2 and Linux next
> 
> Changes since v5:
> 
> - Replace platform bus and device with bus_add() and device_add(),
>   Greg did not like platform bus and device here. This also gets
>   rid of the need for platform data with struct serial_base_device,
>   see new file serial_base.c
> 
> - Update documentation to drop reference to struct uart_device as
>   suggested by Andy
> 
> Changes since v4:
> 
> - Fix issue noted by Ilpo by calling serial_core_add_one_port() after
>   the devices are created
> 
> Changes since v3:
> 
> - Simplify things by adding a serial core control device as the child of
>   the physical serial port as suggested by Jiri
> 
> - Drop the tinkering of the physical serial port device for runtime PM.
>   Serial core just needs to manage port->port_dev with the addition of
>   the serial core control device and the device hierarchy will keep the
>   pysical serial port device enabled as needed
> 
> - Simplify patch description with all the runtime PM tinkering gone
> 
> - Coding style improvments as noted by Andy
> 
> - Post as a single RFC patch as we're close to the merge window
> 
> Changes since v2:
> 
> - Make each serial port a proper device as suggested by Greg. This is
>   a separate patch that flushes the TX on runtime PM resume
> 
> Changes since v1:
> 
> - Use kref as suggested by Andy
> 
> - Fix memory leak on error as noted by Andy
> 
> - Use use unsigned char for supports_autosuspend as suggested by Andy
> 
> - Coding style improvments as suggested by Andy
> ---
>  drivers/tty/serial/8250/8250_core.c  |   1 +
>  drivers/tty/serial/8250/8250_port.c  |   1 +
>  drivers/tty/serial/Makefile          |   3 +-
>  drivers/tty/serial/serial_base.h     |  46 ++++++
>  drivers/tty/serial/serial_base_bus.c | 200 +++++++++++++++++++++++++++
>  drivers/tty/serial/serial_core.c     | 192 ++++++++++++++++++++++---
>  drivers/tty/serial/serial_ctrl.c     |  68 +++++++++
>  drivers/tty/serial/serial_port.c     | 105 ++++++++++++++
>  include/linux/serial_core.h          |   5 +-
>  9 files changed, 598 insertions(+), 23 deletions(-)
>  create mode 100644 drivers/tty/serial/serial_base.h
>  create mode 100644 drivers/tty/serial/serial_base_bus.c
>  create mode 100644 drivers/tty/serial/serial_ctrl.c
>  create mode 100644 drivers/tty/serial/serial_port.c
> 
> diff --git a/drivers/tty/serial/8250/8250_core.c b/drivers/tty/serial/8250/8250_core.c
> --- a/drivers/tty/serial/8250/8250_core.c
> +++ b/drivers/tty/serial/8250/8250_core.c
> @@ -1039,6 +1039,7 @@ int serial8250_register_8250_port(const struct uart_8250_port *up)
>  		if (uart->port.dev)
>  			uart_remove_one_port(&serial8250_reg, &uart->port);
>  
> +		uart->port.ctrl_id	= up->port.ctrl_id;
>  		uart->port.iobase       = up->port.iobase;
>  		uart->port.membase      = up->port.membase;
>  		uart->port.irq          = up->port.irq;
> diff --git a/drivers/tty/serial/8250/8250_port.c b/drivers/tty/serial/8250/8250_port.c
> --- a/drivers/tty/serial/8250/8250_port.c
> +++ b/drivers/tty/serial/8250/8250_port.c
> @@ -3214,6 +3214,7 @@ void serial8250_init_port(struct uart_8250_port *up)
>  	struct uart_port *port = &up->port;
>  
>  	spin_lock_init(&port->lock);
> +	port->ctrl_id = 0;
>  	port->ops = &serial8250_pops;
>  	port->has_sysrq = IS_ENABLED(CONFIG_SERIAL_8250_CONSOLE);
>  
> diff --git a/drivers/tty/serial/Makefile b/drivers/tty/serial/Makefile
> --- a/drivers/tty/serial/Makefile
> +++ b/drivers/tty/serial/Makefile
> @@ -3,7 +3,8 @@
>  # Makefile for the kernel serial device drivers.
>  #
>  
> -obj-$(CONFIG_SERIAL_CORE) += serial_core.o
> +obj-$(CONFIG_SERIAL_CORE) += serial_base.o
> +serial_base-y := serial_core.o serial_base_bus.o serial_ctrl.o serial_port.o
>  
>  obj-$(CONFIG_SERIAL_EARLYCON) += earlycon.o
>  obj-$(CONFIG_SERIAL_EARLYCON_SEMIHOST) += earlycon-semihost.o
> diff --git a/drivers/tty/serial/serial_base.h b/drivers/tty/serial/serial_base.h
> new file mode 100644
> --- /dev/null
> +++ b/drivers/tty/serial/serial_base.h
> @@ -0,0 +1,46 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +/*
> + * Serial core related functions, serial port device drivers do not need this.
> + *
> + * Copyright (C) 2023 Texas Instruments Incorporated - https://www.ti.com/
> + * Author: Tony Lindgren <tony@atomide.com>
> + */
> +
> +#define to_serial_base_ctrl_device(d) container_of((d), struct serial_ctrl_device, dev)
> +#define to_serial_base_port_device(d) container_of((d), struct serial_port_device, dev)
> +
> +struct uart_driver;
> +struct uart_port;
> +struct device_driver;
> +struct device;
> +
> +struct serial_ctrl_device {
> +	struct device dev;
> +};
> +
> +struct serial_port_device {
> +	struct device dev;
> +	struct uart_port *port;
> +};
> +
> +int serial_base_ctrl_init(void);
> +void serial_base_ctrl_exit(void);
> +
> +int serial_base_port_init(void);
> +void serial_base_port_exit(void);
> +
> +int serial_base_driver_register(struct device_driver *driver);
> +void serial_base_driver_unregister(struct device_driver *driver);
> +
> +struct serial_ctrl_device *serial_base_ctrl_add(struct uart_port *port,
> +						struct device *parent);
> +struct serial_port_device *serial_base_port_add(struct uart_port *port,
> +						struct serial_ctrl_device *parent);
> +void serial_base_ctrl_device_remove(struct serial_ctrl_device *ctrl_dev);
> +void serial_base_port_device_remove(struct serial_port_device *port_dev);
> +
> +int serial_ctrl_register_port(struct uart_driver *drv, struct uart_port *port);
> +void serial_ctrl_unregister_port(struct uart_driver *drv, struct uart_port *port);
> +
> +int serial_core_register_port(struct uart_driver *drv, struct uart_port *port);
> +void serial_core_unregister_port(struct uart_driver *drv, struct uart_port *port);
> diff --git a/drivers/tty/serial/serial_base_bus.c b/drivers/tty/serial/serial_base_bus.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/tty/serial/serial_base_bus.c
> @@ -0,0 +1,200 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Serial base bus layer for controllers
> + *
> + * Copyright (C) 2023 Texas Instruments Incorporated - https://www.ti.com/
> + * Author: Tony Lindgren <tony@atomide.com>
> + *
> + * The serial core bus manages the serial core controller instances.
> + */
> +
> +#include <linux/container_of.h>
> +#include <linux/device.h>
> +#include <linux/module.h>
> +#include <linux/serial_core.h>
> +#include <linux/slab.h>
> +#include <linux/spinlock.h>
> +
> +#include "serial_base.h"
> +
> +static int serial_base_match(struct device *dev, struct device_driver *drv)
> +{
> +	int len = strlen(drv->name);
> +
> +	return !strncmp(dev_name(dev), drv->name, len);
> +}
> +
> +static struct bus_type serial_base_bus_type = {
> +	.name = "serial-base",
> +	.match = serial_base_match,
> +};
> +
> +int serial_base_driver_register(struct device_driver *driver)
> +{
> +	driver->bus = &serial_base_bus_type;
> +
> +	return driver_register(driver);
> +}
> +
> +void serial_base_driver_unregister(struct device_driver *driver)
> +{
> +	driver_unregister(driver);
> +}
> +
> +static int serial_base_device_init(struct uart_port *port,
> +				   struct device *dev,
> +				   struct device *parent_dev,
> +				   const struct device_type *type,
> +				   void (*release)(struct device *dev),
> +				   int id)
> +{
> +	device_initialize(dev);
> +	dev->type = type;
> +	dev->parent = parent_dev;
> +	dev->bus = &serial_base_bus_type;
> +	dev->release = release;
> +
> +	return dev_set_name(dev, "%s.%s.%d", type->name, dev_name(port->dev), id);
> +}
> +
> +static const struct device_type serial_ctrl_type = {
> +	.name = "ctrl",
> +};
> +
> +static void serial_base_ctrl_release(struct device *dev)
> +{
> +	struct serial_ctrl_device *ctrl_dev = to_serial_base_ctrl_device(dev);
> +
> +	kfree(ctrl_dev);
> +}
> +
> +void serial_base_ctrl_device_remove(struct serial_ctrl_device *ctrl_dev)
> +{
> +	if (!ctrl_dev)
> +		return;
> +
> +	device_del(&ctrl_dev->dev);
> +}
> +
> +struct serial_ctrl_device *serial_base_ctrl_add(struct uart_port *port,
> +						struct device *parent)
> +{
> +	struct serial_ctrl_device *ctrl_dev;
> +	int err;
> +
> +	ctrl_dev = kzalloc(sizeof(*ctrl_dev), GFP_KERNEL);
> +	if (!ctrl_dev)
> +		return ERR_PTR(-ENOMEM);
> +
> +	err = serial_base_device_init(port, &ctrl_dev->dev,
> +				      parent, &serial_ctrl_type,
> +				      serial_base_ctrl_release,
> +				      port->ctrl_id);
> +	if (err)
> +		goto err_free_ctrl_dev;
> +
> +	err = device_add(&ctrl_dev->dev);
> +	if (err)
> +		goto err_put_device;
> +
> +	return ctrl_dev;
> +
> +err_put_device:
> +	put_device(&ctrl_dev->dev);
> +err_free_ctrl_dev:
> +	kfree(ctrl_dev);
> +
> +	return ERR_PTR(err);
> +}
> +
> +static const struct device_type serial_port_type = {
> +	.name = "port",
> +};
> +
> +static void serial_base_port_release(struct device *dev)
> +{
> +	struct serial_port_device *port_dev = to_serial_base_port_device(dev);
> +
> +	kfree(port_dev);
> +}
> +
> +struct serial_port_device *serial_base_port_add(struct uart_port *port,
> +						struct serial_ctrl_device *ctrl_dev)
> +{
> +	struct serial_port_device *port_dev;
> +	int err;
> +
> +	port_dev = kzalloc(sizeof(*port_dev), GFP_KERNEL);
> +	if (!port_dev)
> +		return ERR_PTR(-ENOMEM);
> +
> +	err = serial_base_device_init(port, &port_dev->dev,
> +				      &ctrl_dev->dev, &serial_port_type,
> +				      serial_base_port_release,
> +				      port->line);
> +	if (err)
> +		goto err_free_port_dev;
> +
> +	port_dev->port = port;
> +
> +	err = device_add(&port_dev->dev);
> +	if (err)
> +		goto err_put_device;
> +
> +	return port_dev;
> +
> +err_put_device:
> +	put_device(&port_dev->dev);
> +err_free_port_dev:
> +	kfree(port_dev);
> +
> +	return ERR_PTR(err);
> +}
> +
> +void serial_base_port_device_remove(struct serial_port_device *port_dev)
> +{
> +	if (!port_dev)
> +		return;
> +
> +	device_del(&port_dev->dev);
> +}
> +
> +static int serial_base_init(void)
> +{
> +	int ret;
> +
> +	ret = bus_register(&serial_base_bus_type);
> +	if (ret)
> +		return ret;
> +
> +	ret = serial_base_ctrl_init();
> +	if (ret)
> +		goto err_bus_unregister;
> +
> +	ret = serial_base_port_init();
> +	if (ret)
> +		goto err_ctrl_exit;
> +
> +	return 0;
> +
> +err_ctrl_exit:
> +	serial_base_ctrl_exit();
> +
> +err_bus_unregister:
> +	bus_unregister(&serial_base_bus_type);
> +
> +	return ret;
> +}
> +module_init(serial_base_init);
> +
> +static void serial_base_exit(void)
> +{
> +	serial_base_port_exit();
> +	serial_base_ctrl_exit();
> +	bus_unregister(&serial_base_bus_type);
> +}
> +module_exit(serial_base_exit);
> +
> +MODULE_AUTHOR("Tony Lindgren <tony@atomide.com>");
> +MODULE_DESCRIPTION("Serial core bus");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/tty/serial/serial_core.c b/drivers/tty/serial/serial_core.c
> --- a/drivers/tty/serial/serial_core.c
> +++ b/drivers/tty/serial/serial_core.c
> @@ -17,6 +17,7 @@
>  #include <linux/gpio/consumer.h>
>  #include <linux/kernel.h>
>  #include <linux/of.h>
> +#include <linux/pm_runtime.h>
>  #include <linux/proc_fs.h>
>  #include <linux/seq_file.h>
>  #include <linux/device.h>
> @@ -31,6 +32,8 @@
>  #include <linux/irq.h>
>  #include <linux/uaccess.h>
>  
> +#include "serial_base.h"
> +
>  /*
>   * This is used to lock changes in serial line configuration.
>   */
> @@ -134,9 +137,30 @@ static void __uart_start(struct tty_struct *tty)
>  {
>  	struct uart_state *state = tty->driver_data;
>  	struct uart_port *port = state->uart_port;
> +	struct serial_port_device *port_dev;
> +	int err;
>  
> -	if (port && !(port->flags & UPF_DEAD) && !uart_tx_stopped(port))
> +	if (!port || port->flags & UPF_DEAD || uart_tx_stopped(port))
> +		return;
> +
> +	port_dev = port->port_dev;
> +
> +	/* Increment the runtime PM usage count for the active check below */
> +	err = pm_runtime_get(&port_dev->dev);
> +	if (err < 0) {
> +		pm_runtime_put_noidle(&port_dev->dev);
> +		return;
> +	}
> +
> +	/*
> +	 * Start TX if enabled, and kick runtime PM. If the device is not
> +	 * enabled, serial_port_runtime_resume() calls start_tx() again
> +	 * after enabling the device.
> +	 */
> +	if (pm_runtime_active(&port_dev->dev))
>  		port->ops->start_tx(port);
> +	pm_runtime_mark_last_busy(&port_dev->dev);
> +	pm_runtime_put_autosuspend(&port_dev->dev);
>  }
>  
>  static void uart_start(struct tty_struct *tty)
> @@ -3042,7 +3066,7 @@ static const struct attribute_group tty_dev_attr_group = {
>  };
>  
>  /**
> - * uart_add_one_port - attach a driver-defined port structure
> + * serial_core_add_one_port - attach a driver-defined port structure
>   * @drv: pointer to the uart low level driver structure for this port
>   * @uport: uart port structure to use for this port.
>   *
> @@ -3051,8 +3075,9 @@ static const struct attribute_group tty_dev_attr_group = {
>   * This allows the driver @drv to register its own uart_port structure with the
>   * core driver. The main purpose is to allow the low level uart drivers to
>   * expand uart_port, rather than having yet more levels of structures.
> + * Caller must hold port_mutex.
>   */
> -int uart_add_one_port(struct uart_driver *drv, struct uart_port *uport)
> +static int serial_core_add_one_port(struct uart_driver *drv, struct uart_port *uport)
>  {
>  	struct uart_state *state;
>  	struct tty_port *port;
> @@ -3066,7 +3091,6 @@ int uart_add_one_port(struct uart_driver *drv, struct uart_port *uport)
>  	state = drv->state + uport->line;
>  	port = &state->port;
>  
> -	mutex_lock(&port_mutex);
>  	mutex_lock(&port->mutex);
>  	if (state->uart_port) {
>  		ret = -EINVAL;
> @@ -3131,21 +3155,14 @@ int uart_add_one_port(struct uart_driver *drv, struct uart_port *uport)
>  		       uport->line);
>  	}
>  
> -	/*
> -	 * Ensure UPF_DEAD is not set.
> -	 */
> -	uport->flags &= ~UPF_DEAD;
> -
>   out:
>  	mutex_unlock(&port->mutex);
> -	mutex_unlock(&port_mutex);
>  
>  	return ret;
>  }
> -EXPORT_SYMBOL(uart_add_one_port);
>  
>  /**
> - * uart_remove_one_port - detach a driver defined port structure
> + * serial_core_remove_one_port - detach a driver defined port structure
>   * @drv: pointer to the uart low level driver structure for this port
>   * @uport: uart port structure for this port
>   *
> @@ -3153,20 +3170,16 @@ EXPORT_SYMBOL(uart_add_one_port);
>   *
>   * This unhooks (and hangs up) the specified port structure from the core
>   * driver. No further calls will be made to the low-level code for this port.
> + * Caller must hold port_mutex.
>   */
> -void uart_remove_one_port(struct uart_driver *drv, struct uart_port *uport)
> +static void serial_core_remove_one_port(struct uart_driver *drv,
> +					struct uart_port *uport)
>  {
>  	struct uart_state *state = drv->state + uport->line;
>  	struct tty_port *port = &state->port;
>  	struct uart_port *uart_port;
>  	struct tty_struct *tty;
>  
> -	mutex_lock(&port_mutex);
> -
> -	/*
> -	 * Mark the port "dead" - this prevents any opens from
> -	 * succeeding while we shut down the port.
> -	 */
>  	mutex_lock(&port->mutex);
>  	uart_port = uart_port_check(state);
>  	if (uart_port != uport)
> @@ -3177,7 +3190,6 @@ void uart_remove_one_port(struct uart_driver *drv, struct uart_port *uport)
>  		mutex_unlock(&port->mutex);
>  		goto out;
>  	}
> -	uport->flags |= UPF_DEAD;
>  	mutex_unlock(&port->mutex);
>  
>  	/*
> @@ -3209,6 +3221,7 @@ void uart_remove_one_port(struct uart_driver *drv, struct uart_port *uport)
>  	 * Indicate that there isn't a port here anymore.
>  	 */
>  	uport->type = PORT_UNKNOWN;
> +	uport->port_dev = NULL;
>  
>  	mutex_lock(&port->mutex);
>  	WARN_ON(atomic_dec_return(&state->refcount) < 0);
> @@ -3218,7 +3231,6 @@ void uart_remove_one_port(struct uart_driver *drv, struct uart_port *uport)
>  out:
>  	mutex_unlock(&port_mutex);
>  }
> -EXPORT_SYMBOL(uart_remove_one_port);
>  
>  /**
>   * uart_match_port - are the two ports equivalent?
> @@ -3253,6 +3265,144 @@ bool uart_match_port(const struct uart_port *port1,
>  }
>  EXPORT_SYMBOL(uart_match_port);
>  
> +static struct serial_ctrl_device *
> +serial_core_get_ctrl_dev(struct serial_port_device *port_dev)
> +{
> +	struct device *dev = &port_dev->dev;
> +
> +	return to_serial_base_ctrl_device(dev->parent);
> +}
> +
> +/*
> + * Find a registered serial core controller device if one exists. Returns
> + * the first device matching the ctrl_id. Caller must hold port_mutex.
> + */
> +static struct serial_ctrl_device *serial_core_ctrl_find(struct uart_driver *drv,
> +							struct device *phys_dev,
> +							int ctrl_id)
> +{
> +	struct uart_state *state;
> +	int i;
> +
> +	lockdep_assert_held(&port_mutex);
> +
> +	for (i = 0; i < drv->nr; i++) {
> +		state = drv->state + i;
> +		if (!state->uart_port || !state->uart_port->port_dev)
> +			continue;
> +
> +		if (state->uart_port->dev == phys_dev &&
> +		    state->uart_port->ctrl_id == ctrl_id)
> +			return serial_core_get_ctrl_dev(state->uart_port->port_dev);
> +	}
> +
> +	return NULL;
> +}
> +
> +static struct serial_ctrl_device *serial_core_ctrl_device_add(struct uart_port *port)
> +{
> +	return serial_base_ctrl_add(port, port->dev);
> +}
> +
> +static int serial_core_port_device_add(struct serial_ctrl_device *ctrl_dev,
> +				       struct uart_port *port)
> +{
> +	struct serial_port_device *port_dev;
> +
> +	port_dev = serial_base_port_add(port, ctrl_dev);
> +	if (IS_ERR(port_dev))
> +		return PTR_ERR(port_dev);
> +
> +	port->port_dev = port_dev;
> +
> +	return 0;
> +}
> +
> +/*
> + * Initialize a serial core port device, and a controller device if needed.
> + */
> +int serial_core_register_port(struct uart_driver *drv, struct uart_port *port)
> +{
> +	struct serial_ctrl_device *ctrl_dev, *new_ctrl_dev = NULL;
> +	int ret;
> +
> +	mutex_lock(&port_mutex);
> +
> +	/*
> +	 * Prevent serial_port_runtime_resume() from trying to use the port
> +	 * until serial_core_add_one_port() has completed
> +	 */
> +	port->flags |= UPF_DEAD;
> +
> +	/* Inititalize a serial core controller device if needed */
> +	ctrl_dev = serial_core_ctrl_find(drv, port->dev, port->ctrl_id);
> +	if (!ctrl_dev) {
> +		new_ctrl_dev = serial_core_ctrl_device_add(port);
> +		if (!new_ctrl_dev) {
> +			ret = -ENODEV;
> +			goto err_unlock;
> +		}
> +		ctrl_dev = new_ctrl_dev;
> +	}
> +
> +	/*
> +	 * Initialize a serial core port device. Tag the port dead to prevent
> +	 * serial_port_runtime_resume() trying to do anything until port has
> +	 * been registered. It gets cleared by serial_core_add_one_port().
> +	 */
> +	ret = serial_core_port_device_add(ctrl_dev, port);
> +	if (ret)
> +		goto err_unregister_ctrl_dev;
> +
> +	ret = serial_core_add_one_port(drv, port);
> +	if (ret)
> +		goto err_unregister_port_dev;
> +
> +	port->flags &= ~UPF_DEAD;
> +
> +	mutex_unlock(&port_mutex);
> +
> +	return 0;
> +
> +err_unregister_port_dev:
> +	serial_base_port_device_remove(port->port_dev);
> +
> +err_unregister_ctrl_dev:
> +	serial_base_ctrl_device_remove(new_ctrl_dev);
> +
> +err_unlock:
> +	mutex_unlock(&port_mutex);
> +
> +	return ret;
> +}
> +
> +/*
> + * Removes a serial core port device, and the related serial core controller
> + * device if the last instance.
> + */
> +void serial_core_unregister_port(struct uart_driver *drv, struct uart_port *port)
> +{
> +	struct device *phys_dev = port->dev;
> +	struct serial_port_device *port_dev = port->port_dev;
> +	struct serial_ctrl_device *ctrl_dev = serial_core_get_ctrl_dev(port_dev);
> +	int ctrl_id = port->ctrl_id;
> +
> +	mutex_lock(&port_mutex);
> +
> +	port->flags |= UPF_DEAD;
> +
> +	serial_core_remove_one_port(drv, port);
> +
> +	/* Note that struct uart_port *port is no longer valid at this point */
> +	serial_base_port_device_remove(port_dev);
> +
> +	/* Drop the serial core controller device if no ports are using it */
> +	if (!serial_core_ctrl_find(drv, phys_dev, ctrl_id))
> +		serial_base_ctrl_device_remove(ctrl_dev);
> +
> +	mutex_unlock(&port_mutex);
> +}
> +
>  /**
>   * uart_handle_dcd_change - handle a change of carrier detect state
>   * @uport: uart_port structure for the open port
> diff --git a/drivers/tty/serial/serial_ctrl.c b/drivers/tty/serial/serial_ctrl.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/tty/serial/serial_ctrl.c
> @@ -0,0 +1,68 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Serial core controller driver
> + *
> + * Copyright (C) 2023 Texas Instruments Incorporated - https://www.ti.com/
> + * Author: Tony Lindgren <tony@atomide.com>
> + *
> + * This driver manages the serial core controller struct device instances.
> + * The serial core controller devices are children of the physical serial
> + * port device.
> + */
> +
> +#include <linux/device.h>
> +#include <linux/module.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/serial_core.h>
> +#include <linux/spinlock.h>
> +
> +#include "serial_base.h"
> +
> +static int serial_ctrl_probe(struct device *dev)
> +{
> +	pm_runtime_enable(dev);
> +
> +	return 0;
> +}
> +
> +static int serial_ctrl_remove(struct device *dev)
> +{
> +	pm_runtime_disable(dev);
> +
> +	return 0;
> +}
> +
> +/*
> + * Serial core controller device init functions. Note that the physical
> + * serial port device driver may not have completed probe at this point.
> + */
> +int serial_ctrl_register_port(struct uart_driver *drv, struct uart_port *port)
> +{
> +	return serial_core_register_port(drv, port);
> +}
> +
> +void serial_ctrl_unregister_port(struct uart_driver *drv, struct uart_port *port)
> +{
> +	serial_core_unregister_port(drv, port);
> +}
> +
> +static struct device_driver serial_ctrl_driver = {
> +	.name = "ctrl",
> +	.suppress_bind_attrs = true,
> +	.probe = serial_ctrl_probe,
> +	.remove = serial_ctrl_remove,
> +};
> +
> +int serial_base_ctrl_init(void)
> +{
> +	return serial_base_driver_register(&serial_ctrl_driver);
> +}
> +
> +void serial_base_ctrl_exit(void)
> +{
> +	serial_base_driver_unregister(&serial_ctrl_driver);
> +}
> +
> +MODULE_AUTHOR("Tony Lindgren <tony@atomide.com>");
> +MODULE_DESCRIPTION("Serial core controller driver");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/tty/serial/serial_port.c b/drivers/tty/serial/serial_port.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/tty/serial/serial_port.c
> @@ -0,0 +1,105 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Serial core port device driver
> + *
> + * Copyright (C) 2023 Texas Instruments Incorporated - https://www.ti.com/
> + * Author: Tony Lindgren <tony@atomide.com>
> + */
> +
> +#include <linux/device.h>
> +#include <linux/module.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/serial_core.h>
> +#include <linux/spinlock.h>
> +
> +#include "serial_base.h"
> +
> +#define SERIAL_PORT_AUTOSUSPEND_DELAY_MS	500
> +
> +/* Only considers pending TX for now. Caller must take care of locking */
> +static int __serial_port_busy(struct uart_port *port)
> +{
> +	return !uart_tx_stopped(port) &&
> +		uart_circ_chars_pending(&port->state->xmit);
> +}
> +
> +static int serial_port_runtime_resume(struct device *dev)
> +{
> +	struct serial_port_device *port_dev = to_serial_base_port_device(dev);
> +	struct uart_port *port;
> +	unsigned long flags;
> +
> +	port = port_dev->port;
> +
> +	if (port->flags & UPF_DEAD)
> +		goto out;
> +
> +	/* Flush any pending TX for the port */
> +	spin_lock_irqsave(&port->lock, flags);
> +	if (__serial_port_busy(port))
> +		port->ops->start_tx(port);
> +	spin_unlock_irqrestore(&port->lock, flags);
> +
> +out:
> +	pm_runtime_mark_last_busy(dev);
> +
> +	return 0;
> +}
> +
> +static DEFINE_RUNTIME_DEV_PM_OPS(serial_port_pm,
> +				 NULL, serial_port_runtime_resume, NULL);
> +
> +static int serial_port_probe(struct device *dev)
> +{
> +	pm_runtime_enable(dev);
> +	pm_runtime_set_autosuspend_delay(dev, SERIAL_PORT_AUTOSUSPEND_DELAY_MS);
> +	pm_runtime_use_autosuspend(dev);
> +
> +	return 0;
> +}
> +
> +static int serial_port_remove(struct device *dev)
> +{
> +	pm_runtime_dont_use_autosuspend(dev);
> +	pm_runtime_disable(dev);
> +
> +	return 0;
> +}
> +
> +/*
> + * Serial core port device init functions. Note that the physical serial
> + * port device driver may not have completed probe at this point.
> + */
> +int uart_add_one_port(struct uart_driver *drv, struct uart_port *port)
> +{
> +	return serial_ctrl_register_port(drv, port);
> +}
> +EXPORT_SYMBOL(uart_add_one_port);
> +
> +void uart_remove_one_port(struct uart_driver *drv, struct uart_port *port)
> +{
> +	serial_ctrl_unregister_port(drv, port);
> +}
> +EXPORT_SYMBOL(uart_remove_one_port);
> +
> +static struct device_driver serial_port_driver = {
> +	.name = "port",
> +	.suppress_bind_attrs = true,
> +	.probe = serial_port_probe,
> +	.remove = serial_port_remove,
> +	.pm = pm_ptr(&serial_port_pm),
> +};
> +
> +int serial_base_port_init(void)
> +{
> +	return serial_base_driver_register(&serial_port_driver);
> +}
> +
> +void serial_base_port_exit(void)
> +{
> +	serial_base_driver_unregister(&serial_port_driver);
> +}
> +
> +MODULE_AUTHOR("Tony Lindgren <tony@atomide.com>");
> +MODULE_DESCRIPTION("Serial controller port driver");
> +MODULE_LICENSE("GPL");
> diff --git a/include/linux/serial_core.h b/include/linux/serial_core.h
> --- a/include/linux/serial_core.h
> +++ b/include/linux/serial_core.h
> @@ -28,6 +28,7 @@
>  
>  struct uart_port;
>  struct serial_struct;
> +struct serial_port_device;
>  struct device;
>  struct gpio_desc;
>  
> @@ -458,6 +459,7 @@ struct uart_port {
>  						struct serial_rs485 *rs485);
>  	int			(*iso7816_config)(struct uart_port *,
>  						  struct serial_iso7816 *iso7816);
> +	int			ctrl_id;		/* optional serial core controller id */
>  	unsigned int		irq;			/* irq number */
>  	unsigned long		irqflags;		/* irq flags  */
>  	unsigned int		uartclk;		/* base uart clock */
> @@ -563,7 +565,8 @@ struct uart_port {
>  	unsigned int		minor;
>  	resource_size_t		mapbase;		/* for ioremap */
>  	resource_size_t		mapsize;
> -	struct device		*dev;			/* parent device */
> +	struct device		*dev;			/* serial port physical parent device */
> +	struct serial_port_device *port_dev;		/* serial core port device */
>  
>  	unsigned long		sysrq;			/* sysrq timeout */
>  	unsigned int		sysrq_ch;		/* char for sysrq */
> -- 
> 2.40.1
> 
