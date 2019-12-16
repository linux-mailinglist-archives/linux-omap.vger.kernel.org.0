Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA530120392
	for <lists+linux-omap@lfdr.de>; Mon, 16 Dec 2019 12:18:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727306AbfLPLSG (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 16 Dec 2019 06:18:06 -0500
Received: from mail-io1-f66.google.com ([209.85.166.66]:37209 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727059AbfLPLSG (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 16 Dec 2019 06:18:06 -0500
Received: by mail-io1-f66.google.com with SMTP id k24so4820841ioc.4;
        Mon, 16 Dec 2019 03:18:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pYsn65Vt9TP/Qx4xH1Yb4S1PVpAKy9myqJL+WN2a6uQ=;
        b=VSVAy2Vff02QVXwCFU86jWLsJAC2psvmXhS3cQ0BlBZ7+9/U1nI0j89FptX+OesQ3b
         kjMV4p+sbJF3DpjnH0lixkyTpuo5K5T6HH3nUxLq2cB5sZBjUserqnKHOQuWV4Sf6ddH
         2uO/x45maEqhcJatKIzPh7I0VfJNlJcbB7VeicDjvk5lIbVRM6LTSpOPGWTSk/M1qJHD
         mX+8O5iWY9L9eyLgEROxiVAEooR7vdH+uTNddU2xNzTdwLDi33RYX5FcykU5N1bCK6l9
         dbOC1nvxDELdISqClKgQsf8o/x2d0BlYOsqX5kZWxi9I+gMEPD/Y/llefBscXnbC6hA0
         b12w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pYsn65Vt9TP/Qx4xH1Yb4S1PVpAKy9myqJL+WN2a6uQ=;
        b=QVWRZbzMrKUqBSuPnCOMPIez97NG6Qlbi1eE9JFegEpXnpjtuGXZ+zo0ldE75VOBhW
         UP2Z8fJ56t5ng8WXFX3IsG5IYvsINdUWgTHNtzPNB20WqY0SeDvn+y2SmZRbSx5B9Iim
         Xhax4sCP0Qm49DCFOUeYAHjJR+SIHbwIlRF6ydjuYq0d0l0BM3NlNXnuzHCEZkDHXMTl
         tq/B9gWqAGKrB3AaaaB5Y/eM8Jb66jaYevhabmqftwfGJa4o8gmulrRgh7yjt+cAz/km
         GvaV8OfekbhDy0zO7LCgRdHf5BYg1idSyuJEjXB0yuRRqazs7PFE9D/01sWOOs1kQmve
         33WA==
X-Gm-Message-State: APjAAAXl57rKNBKfhrd/M/SSso/PlyH/q4nb2BQZK7ay1GMJf6KD2GNu
        RtE2//sTzAOCwro3ZEphaBsU/5kW8tVnq7E1U7k=
X-Google-Smtp-Source: APXvYqzYuITUJni1wJRyouBaEkDjYVfGbhNd1WX87HlqB9qi6hlOUyyZwG3cksLLBmrERiVoY4+PkKCPBC1uaYO871I=
X-Received: by 2002:a05:6638:76c:: with SMTP id y12mr11307586jad.95.1576495085356;
 Mon, 16 Dec 2019 03:18:05 -0800 (PST)
MIME-Version: 1.0
References: <20191215173817.47918-1-tony@atomide.com>
In-Reply-To: <20191215173817.47918-1-tony@atomide.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Mon, 16 Dec 2019 05:17:54 -0600
Message-ID: <CAHCN7xJq1O8nLG-4Feofh4aAVfMfTXGcHjY8XvFt4aGnwjAVtg@mail.gmail.com>
Subject: Re: [PATCH] w1: omap-hdq: Simplify driver with PM runtime autosuspend
To:     Tony Lindgren <tony@atomide.com>
Cc:     Evgeniy Polyakov <zbr@ioremap.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        "Andrew F . Davis" <afd@ti.com>,
        Andreas Kemnade <andreas@kemnade.info>,
        "H . Nikolaus Schaller" <hns@goldelico.com>,
        Vignesh R <vigneshr@ti.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Sun, Dec 15, 2019 at 11:38 AM Tony Lindgren <tony@atomide.com> wrote:
>
> We've had generic code handling module sysconfig and OCP reset registers
> for omap variants for many years now and all the drivers really needs to
> do is just call runtime PM functions.
>
> Looks like the omap-hdq driver got only partially updated over the years
> to use runtime PM, and still has lots of custom PM code left.
>
> We can replace all the custom code for sysconfig, OCP reset, and PM with
> just a few lines of runtime PM autosuspend code.
>
> Note that the earlier driver specific usage count limit of four seems
> completely artificial and should not be an issue in normal use.
>
> Cc: Adam Ford <aford173@gmail.com>
> Cc: Andrew F. Davis <afd@ti.com>
> Cc: Andreas Kemnade <andreas@kemnade.info>
> Cc: H. Nikolaus Schaller <hns@goldelico.com>
> Cc: Vignesh R <vigneshr@ti.com>
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
>
>
> Can you guys please review and and test on gta04 and torpedo?

I will try to test this series early this week.

adam
>
>
>  drivers/w1/masters/omap_hdq.c | 286 +++++++++++-----------------------
>  1 file changed, 90 insertions(+), 196 deletions(-)
>
> diff --git a/drivers/w1/masters/omap_hdq.c b/drivers/w1/masters/omap_hdq.c
> --- a/drivers/w1/masters/omap_hdq.c
> +++ b/drivers/w1/masters/omap_hdq.c
> @@ -38,12 +38,6 @@
>  #define OMAP_HDQ_INT_STATUS_TXCOMPLETE         BIT(2)
>  #define OMAP_HDQ_INT_STATUS_RXCOMPLETE         BIT(1)
>  #define OMAP_HDQ_INT_STATUS_TIMEOUT            BIT(0)
> -#define OMAP_HDQ_SYSCONFIG                     0x14
> -#define OMAP_HDQ_SYSCONFIG_SOFTRESET           BIT(1)
> -#define OMAP_HDQ_SYSCONFIG_AUTOIDLE            BIT(0)
> -#define OMAP_HDQ_SYSCONFIG_NOIDLE              0x0
> -#define OMAP_HDQ_SYSSTATUS                     0x18
> -#define OMAP_HDQ_SYSSTATUS_RESETDONE           BIT(0)
>
>  #define OMAP_HDQ_FLAG_CLEAR                    0
>  #define OMAP_HDQ_FLAG_SET                      1
> @@ -62,17 +56,9 @@ struct hdq_data {
>         void __iomem            *hdq_base;
>         /* lock status update */
>         struct  mutex           hdq_mutex;
> -       int                     hdq_usecount;
>         u8                      hdq_irqstatus;
>         /* device lock */
>         spinlock_t              hdq_spinlock;
> -       /*
> -        * Used to control the call to omap_hdq_get and omap_hdq_put.
> -        * HDQ Protocol: Write the CMD|REG_address first, followed by
> -        * the data wrire or read.
> -        */
> -       int                     init_trans;
> -       int                     rrw;
>         /* mode: 0-HDQ 1-W1 */
>         int                     mode;
>
> @@ -237,41 +223,6 @@ static void omap_w1_search_bus(void *_hdq, struct w1_master *master_dev,
>         slave_found(master_dev, id);
>  }
>
> -static int _omap_hdq_reset(struct hdq_data *hdq_data)
> -{
> -       int ret;
> -       u8 tmp_status;
> -
> -       hdq_reg_out(hdq_data, OMAP_HDQ_SYSCONFIG,
> -                   OMAP_HDQ_SYSCONFIG_SOFTRESET);
> -       /*
> -        * Select HDQ/1W mode & enable clocks.
> -        * It is observed that INT flags can't be cleared via a read and GO/INIT
> -        * won't return to zero if interrupt is disabled. So we always enable
> -        * interrupt.
> -        */
> -       hdq_reg_out(hdq_data, OMAP_HDQ_CTRL_STATUS,
> -               OMAP_HDQ_CTRL_STATUS_CLOCKENABLE |
> -               OMAP_HDQ_CTRL_STATUS_INTERRUPTMASK);
> -
> -       /* wait for reset to complete */
> -       ret = hdq_wait_for_flag(hdq_data, OMAP_HDQ_SYSSTATUS,
> -               OMAP_HDQ_SYSSTATUS_RESETDONE, OMAP_HDQ_FLAG_SET, &tmp_status);
> -       if (ret)
> -               dev_dbg(hdq_data->dev, "timeout waiting HDQ reset, %x",
> -                               tmp_status);
> -       else {
> -               hdq_reg_out(hdq_data, OMAP_HDQ_CTRL_STATUS,
> -                       OMAP_HDQ_CTRL_STATUS_CLOCKENABLE |
> -                       OMAP_HDQ_CTRL_STATUS_INTERRUPTMASK |
> -                       hdq_data->mode);
> -               hdq_reg_out(hdq_data, OMAP_HDQ_SYSCONFIG,
> -                       OMAP_HDQ_SYSCONFIG_AUTOIDLE);
> -       }
> -
> -       return ret;
> -}
> -
>  /* Issue break pulse to the device */
>  static int omap_hdq_break(struct hdq_data *hdq_data)
>  {
> @@ -357,7 +308,7 @@ static int hdq_read_byte(struct hdq_data *hdq_data, u8 *val)
>                 goto rtn;
>         }
>
> -       if (!hdq_data->hdq_usecount) {
> +       if (pm_runtime_suspended(hdq_data->dev)) {
>                 ret = -EINVAL;
>                 goto out;
>         }
> @@ -394,80 +345,6 @@ static int hdq_read_byte(struct hdq_data *hdq_data, u8 *val)
>
>  }
>
> -/* Enable clocks and set the controller to HDQ/1W mode */
> -static int omap_hdq_get(struct hdq_data *hdq_data)
> -{
> -       int ret = 0;
> -
> -       ret = mutex_lock_interruptible(&hdq_data->hdq_mutex);
> -       if (ret < 0) {
> -               ret = -EINTR;
> -               goto rtn;
> -       }
> -
> -       if (OMAP_HDQ_MAX_USER == hdq_data->hdq_usecount) {
> -               dev_dbg(hdq_data->dev, "attempt to exceed the max use count");
> -               ret = -EINVAL;
> -               goto out;
> -       } else {
> -               hdq_data->hdq_usecount++;
> -               try_module_get(THIS_MODULE);
> -               if (1 == hdq_data->hdq_usecount) {
> -
> -                       pm_runtime_get_sync(hdq_data->dev);
> -
> -                       /* make sure HDQ/1W is out of reset */
> -                       if (!(hdq_reg_in(hdq_data, OMAP_HDQ_SYSSTATUS) &
> -                               OMAP_HDQ_SYSSTATUS_RESETDONE)) {
> -                               ret = _omap_hdq_reset(hdq_data);
> -                               if (ret)
> -                                       /* back up the count */
> -                                       hdq_data->hdq_usecount--;
> -                       } else {
> -                               /* select HDQ/1W mode & enable clocks */
> -                               hdq_reg_out(hdq_data, OMAP_HDQ_CTRL_STATUS,
> -                                       OMAP_HDQ_CTRL_STATUS_CLOCKENABLE |
> -                                       OMAP_HDQ_CTRL_STATUS_INTERRUPTMASK |
> -                                       hdq_data->mode);
> -                               hdq_reg_out(hdq_data, OMAP_HDQ_SYSCONFIG,
> -                                       OMAP_HDQ_SYSCONFIG_NOIDLE);
> -                               hdq_reg_in(hdq_data, OMAP_HDQ_INT_STATUS);
> -                       }
> -               }
> -       }
> -
> -out:
> -       mutex_unlock(&hdq_data->hdq_mutex);
> -rtn:
> -       return ret;
> -}
> -
> -/* Disable clocks to the module */
> -static int omap_hdq_put(struct hdq_data *hdq_data)
> -{
> -       int ret = 0;
> -
> -       ret = mutex_lock_interruptible(&hdq_data->hdq_mutex);
> -       if (ret < 0)
> -               return -EINTR;
> -
> -       hdq_reg_out(hdq_data, OMAP_HDQ_SYSCONFIG,
> -                   OMAP_HDQ_SYSCONFIG_AUTOIDLE);
> -       if (0 == hdq_data->hdq_usecount) {
> -               dev_dbg(hdq_data->dev, "attempt to decrement use count"
> -                       " when it is zero");
> -               ret = -EINVAL;
> -       } else {
> -               hdq_data->hdq_usecount--;
> -               module_put(THIS_MODULE);
> -               if (0 == hdq_data->hdq_usecount)
> -                       pm_runtime_put_sync(hdq_data->dev);
> -       }
> -       mutex_unlock(&hdq_data->hdq_mutex);
> -
> -       return ret;
> -}
> -
>  /*
>   * W1 triplet callback function - used for searching ROM addresses.
>   * Registered only when controller is in 1-wire mode.
> @@ -482,7 +359,12 @@ static u8 omap_w1_triplet(void *_hdq, u8 bdir)
>                   OMAP_HDQ_CTRL_STATUS_INTERRUPTMASK;
>         u8 mask = ctrl | OMAP_HDQ_CTRL_STATUS_DIR;
>
> -       omap_hdq_get(_hdq);
> +       err = pm_runtime_get_sync(hdq_data->dev);
> +       if (err < 0) {
> +               pm_runtime_put_noidle(hdq_data->dev);
> +
> +               return err;
> +       }
>
>         err = mutex_lock_interruptible(&hdq_data->hdq_mutex);
>         if (err < 0) {
> @@ -549,16 +431,30 @@ static u8 omap_w1_triplet(void *_hdq, u8 bdir)
>  out:
>         mutex_unlock(&hdq_data->hdq_mutex);
>  rtn:
> -       omap_hdq_put(_hdq);
> +       pm_runtime_mark_last_busy(hdq_data->dev);
> +       pm_runtime_put_autosuspend(hdq_data->dev);
> +
>         return ret;
>  }
>
>  /* reset callback */
>  static u8 omap_w1_reset_bus(void *_hdq)
>  {
> -       omap_hdq_get(_hdq);
> -       omap_hdq_break(_hdq);
> -       omap_hdq_put(_hdq);
> +       struct hdq_data *hdq_data = _hdq;
> +       int err;
> +
> +       err = pm_runtime_get_sync(hdq_data->dev);
> +       if (err < 0) {
> +               pm_runtime_put_noidle(hdq_data->dev);
> +
> +               return err;
> +       }
> +
> +       omap_hdq_break(hdq_data);
> +
> +       pm_runtime_mark_last_busy(hdq_data->dev);
> +       pm_runtime_put_autosuspend(hdq_data->dev);
> +
>         return 0;
>  }
>
> @@ -569,37 +465,25 @@ static u8 omap_w1_read_byte(void *_hdq)
>         u8 val = 0;
>         int ret;
>
> -       /* First write to initialize the transfer */
> -       if (hdq_data->init_trans == 0)
> -               omap_hdq_get(hdq_data);
> +       ret = pm_runtime_get_sync(hdq_data->dev);
> +       if (ret < 0) {
> +               pm_runtime_put_noidle(hdq_data->dev);
> +
> +               return ret;
> +       }
>
>         ret = hdq_read_byte(hdq_data, &val);
>         if (ret) {
> -               ret = mutex_lock_interruptible(&hdq_data->hdq_mutex);
> -               if (ret < 0) {
> -                       dev_dbg(hdq_data->dev, "Could not acquire mutex\n");
> -                       return -EINTR;
> -               }
> -               hdq_data->init_trans = 0;
> -               mutex_unlock(&hdq_data->hdq_mutex);
> -               omap_hdq_put(hdq_data);
> -               return -1;
> +               ret = -1;
> +               goto out_err;
>         }
>
>         hdq_disable_interrupt(hdq_data, OMAP_HDQ_CTRL_STATUS,
>                               ~OMAP_HDQ_CTRL_STATUS_INTERRUPTMASK);
>
> -       /* Write followed by a read, release the module */
> -       if (hdq_data->init_trans) {
> -               ret = mutex_lock_interruptible(&hdq_data->hdq_mutex);
> -               if (ret < 0) {
> -                       dev_dbg(hdq_data->dev, "Could not acquire mutex\n");
> -                       return -EINTR;
> -               }
> -               hdq_data->init_trans = 0;
> -               mutex_unlock(&hdq_data->hdq_mutex);
> -               omap_hdq_put(hdq_data);
> -       }
> +out_err:
> +       pm_runtime_mark_last_busy(hdq_data->dev);
> +       pm_runtime_put_autosuspend(hdq_data->dev);
>
>         return val;
>  }
> @@ -611,9 +495,12 @@ static void omap_w1_write_byte(void *_hdq, u8 byte)
>         int ret;
>         u8 status;
>
> -       /* First write to initialize the transfer */
> -       if (hdq_data->init_trans == 0)
> -               omap_hdq_get(hdq_data);
> +       ret = pm_runtime_get_sync(hdq_data->dev);
> +       if (ret < 0) {
> +               pm_runtime_put_noidle(hdq_data->dev);
> +
> +               return;
> +       }
>
>         /*
>          * We need to reset the slave before
> @@ -623,31 +510,15 @@ static void omap_w1_write_byte(void *_hdq, u8 byte)
>         if (byte == W1_SKIP_ROM)
>                 omap_hdq_break(hdq_data);
>
> -       ret = mutex_lock_interruptible(&hdq_data->hdq_mutex);
> -       if (ret < 0) {
> -               dev_dbg(hdq_data->dev, "Could not acquire mutex\n");
> -               return;
> -       }
> -       hdq_data->init_trans++;
> -       mutex_unlock(&hdq_data->hdq_mutex);
> -
>         ret = hdq_write_byte(hdq_data, byte, &status);
>         if (ret < 0) {
>                 dev_dbg(hdq_data->dev, "TX failure:Ctrl status %x\n", status);
> -               return;
> +               goto out_err;
>         }
>
> -       /* Second write, data transferred. Release the module */
> -       if (hdq_data->init_trans > 1) {
> -               omap_hdq_put(hdq_data);
> -               ret = mutex_lock_interruptible(&hdq_data->hdq_mutex);
> -               if (ret < 0) {
> -                       dev_dbg(hdq_data->dev, "Could not acquire mutex\n");
> -                       return;
> -               }
> -               hdq_data->init_trans = 0;
> -               mutex_unlock(&hdq_data->hdq_mutex);
> -       }
> +out_err:
> +       pm_runtime_mark_last_busy(hdq_data->dev);
> +       pm_runtime_put_autosuspend(hdq_data->dev);
>  }
>
>  static struct w1_bus_master omap_w1_master = {
> @@ -656,6 +527,35 @@ static struct w1_bus_master omap_w1_master = {
>         .reset_bus      = omap_w1_reset_bus,
>  };
>
> +static int __maybe_unused omap_hdq_runtime_suspend(struct device *dev)
> +{
> +       struct hdq_data *hdq_data = dev_get_drvdata(dev);
> +
> +       hdq_reg_out(hdq_data, 0, hdq_data->mode);
> +       hdq_reg_in(hdq_data, OMAP_HDQ_INT_STATUS);
> +
> +       return 0;
> +}
> +
> +static int __maybe_unused omap_hdq_runtime_resume(struct device *dev)
> +{
> +       struct hdq_data *hdq_data = dev_get_drvdata(dev);
> +
> +       /* select HDQ/1W mode & enable clocks */
> +       hdq_reg_out(hdq_data, OMAP_HDQ_CTRL_STATUS,
> +                   OMAP_HDQ_CTRL_STATUS_CLOCKENABLE |
> +                   OMAP_HDQ_CTRL_STATUS_INTERRUPTMASK |
> +                   hdq_data->mode);
> +       hdq_reg_in(hdq_data, OMAP_HDQ_INT_STATUS);
> +
> +       return 0;
> +}
> +
> +static const struct dev_pm_ops omap_hdq_pm_ops = {
> +       SET_RUNTIME_PM_OPS(omap_hdq_runtime_suspend,
> +                          omap_hdq_runtime_resume, NULL)
> +};
> +
>  static int omap_hdq_probe(struct platform_device *pdev)
>  {
>         struct device *dev = &pdev->dev;
> @@ -677,23 +577,18 @@ static int omap_hdq_probe(struct platform_device *pdev)
>         if (IS_ERR(hdq_data->hdq_base))
>                 return PTR_ERR(hdq_data->hdq_base);
>
> -       hdq_data->hdq_usecount = 0;
> -       hdq_data->rrw = 0;
>         mutex_init(&hdq_data->hdq_mutex);
>
>         pm_runtime_enable(&pdev->dev);
> +       pm_runtime_use_autosuspend(&pdev->dev);
> +       pm_runtime_set_autosuspend_delay(&pdev->dev, 300);
>         ret = pm_runtime_get_sync(&pdev->dev);
>         if (ret < 0) {
> +               pm_runtime_put_noidle(&pdev->dev);
>                 dev_dbg(&pdev->dev, "pm_runtime_get_sync failed\n");
>                 goto err_w1;
>         }
>
> -       ret = _omap_hdq_reset(hdq_data);
> -       if (ret) {
> -               dev_dbg(&pdev->dev, "reset failed\n");
> -               goto err_irq;
> -       }
> -
>         rev = hdq_reg_in(hdq_data, OMAP_HDQ_REVISION);
>         dev_info(&pdev->dev, "OMAP HDQ Hardware Rev %c.%c. Driver in %s mode\n",
>                 (rev >> 4) + '0', (rev & 0x0f) + '0', "Interrupt");
> @@ -715,7 +610,8 @@ static int omap_hdq_probe(struct platform_device *pdev)
>
>         omap_hdq_break(hdq_data);
>
> -       pm_runtime_put_sync(&pdev->dev);
> +       pm_runtime_mark_last_busy(&pdev->dev);
> +       pm_runtime_put_autosuspend(&pdev->dev);
>
>         ret = of_property_read_string(pdev->dev.of_node, "ti,mode", &mode);
>         if (ret < 0 || !strcmp(mode, "hdq")) {
> @@ -739,6 +635,7 @@ static int omap_hdq_probe(struct platform_device *pdev)
>  err_irq:
>         pm_runtime_put_sync(&pdev->dev);
>  err_w1:
> +       pm_runtime_dont_use_autosuspend(&pdev->dev);
>         pm_runtime_disable(&pdev->dev);
>
>         return ret;
> @@ -746,23 +643,19 @@ static int omap_hdq_probe(struct platform_device *pdev)
>
>  static int omap_hdq_remove(struct platform_device *pdev)
>  {
> -       struct hdq_data *hdq_data = platform_get_drvdata(pdev);
> -
> -       mutex_lock(&hdq_data->hdq_mutex);
> +       int active;
>
> -       if (hdq_data->hdq_usecount) {
> -               dev_dbg(&pdev->dev, "removed when use count is not zero\n");
> -               mutex_unlock(&hdq_data->hdq_mutex);
> -               return -EBUSY;
> -       }
> +       active = pm_runtime_get_sync(&pdev->dev);
> +       if (active < 0)
> +               pm_runtime_put_noidle(&pdev->dev);
>
> -       mutex_unlock(&hdq_data->hdq_mutex);
> +       w1_remove_master_device(&omap_w1_master);
>
> -       /* remove module dependency */
> +       pm_runtime_dont_use_autosuspend(&pdev->dev);
> +       if (active >= 0)
> +               pm_runtime_put_sync(&pdev->dev);
>         pm_runtime_disable(&pdev->dev);
>
> -       w1_remove_master_device(&omap_w1_master);
> -
>         return 0;
>  }
>
> @@ -779,6 +672,7 @@ static struct platform_driver omap_hdq_driver = {
>         .driver = {
>                 .name = "omap_hdq",
>                 .of_match_table = omap_hdq_dt_ids,
> +               .pm = &omap_hdq_pm_ops,
>         },
>  };
>  module_platform_driver(omap_hdq_driver);
> --
> 2.24.1
