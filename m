Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C3201219A5
	for <lists+linux-omap@lfdr.de>; Mon, 16 Dec 2019 20:06:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726510AbfLPTDd (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 16 Dec 2019 14:03:33 -0500
Received: from mail-il1-f195.google.com ([209.85.166.195]:33061 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726390AbfLPTDd (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 16 Dec 2019 14:03:33 -0500
Received: by mail-il1-f195.google.com with SMTP id r81so6328599ilk.0;
        Mon, 16 Dec 2019 11:03:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ck1hLhwSHsxU4HX6xIBXPsVqEUK44VPQA89Rn8jGGuY=;
        b=QMOYkt+Dgwg+QpYo9pIxOHMJ4twFhfGv+NutR3SmTq+VsYY5/eck7P8wJpL+9miaqW
         QXjOwgO24Z1pmxfcbJEeuNYFP4SxqQ2POdx5FKclCw7BuNUMyDisYicACKoYvdSpqn8Q
         95wXiNEWETEYSKm8bGHkaw+7DSX5rQ4LiHEXgAdzIcrgWyF++9DUc7UzoS814BbAzPx3
         ZDhQMNsZJ/88XeOJ3Yd2h4lVv307j1byoqLevCUZJv9GLDc4p4hB4zvkhukLqc5NvUkS
         H2RVhJuE4msKmT0grPiL4Vd7Tl0TLKSSwZUwdDcDlH4IXUEdJ/Vv3vycwronvNbmjfFd
         nLOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ck1hLhwSHsxU4HX6xIBXPsVqEUK44VPQA89Rn8jGGuY=;
        b=HkxJMCBzu5fUpnwJSt7ATWVfRHGImJxZ0OWN/YZWjwLUv/mLtBM3bNl5dTzcQvOKH7
         7K02D5rOH+ETmfQRWfeLIs9jh7if2WXB/Kfhu1s9s1JU8THN9jhQnRln5/680rIpbvyM
         YM/Wbkuk6oWNm8GSVrVaVo96meLFfjdtQSQqHrMQ/jUBFbhpZkANz/HciXDpKT7zUnoA
         GeqfBX1ZaV29mQpoiQ9lKofhzQDq//Y+TZmfF0nmyW268iCxThUZhI+o5Eq7bFLZuxWM
         Thddm5SmBHSMeoFKLWl/ZT7nywlDMADwITg8rVeSQrw+x2CzDKvoJf6f6ZOgNvMj8EGs
         PnHw==
X-Gm-Message-State: APjAAAUqWrsYI1mJnTrZtXiIjtaofX6oiK8WmI4NLPFb06TsoKfD0WIr
        woJQbmK1Jm4xLwR5MNcAXZhrpa/C+q7Snu6QAf0=
X-Google-Smtp-Source: APXvYqwO7oXYYv+mzV2pJaMp0PXw81S6LrL/BZmy2OSI1itMD2phWOB1PU9MCTuXBQuX3Po4snX73E+BpN2Cbf/IW/4=
X-Received: by 2002:a92:dc91:: with SMTP id c17mr11266604iln.78.1576523012236;
 Mon, 16 Dec 2019 11:03:32 -0800 (PST)
MIME-Version: 1.0
References: <20191216145359.28219-1-tony@atomide.com> <20191216164335.GP35479@atomide.com>
In-Reply-To: <20191216164335.GP35479@atomide.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Mon, 16 Dec 2019 13:03:20 -0600
Message-ID: <CAHCN7xLYRm3Lstb=-r6hguDOrxwi-dT0nTzkhYM0S5GYtEzckw@mail.gmail.com>
Subject: Re: [PATCHv2] w1: omap-hdq: Simplify driver with PM runtime autosuspend
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

On Mon, Dec 16, 2019 at 10:43 AM Tony Lindgren <tony@atomide.com> wrote:
>
> * Tony Lindgren <tony@atomide.com> [191216 14:54]:
> > Vignesh, any comments on the ti,mode = "1w" and removal of the call to
> > hdq_disable_interrupt()? Is there some specific section where we need
> > to have interrupts disabled and then re-enabled?
>
> OK I got "1w" mode working too now. We need to clear the irqstatus before
> calling wait_event_timeout() on it, and we're now missing it in the
> hdq_read_byte().
>
> Looks like we should not tinker with the actual irstatus register though,
> that's up to the hdq_isr() to manage.
>
> So the following helper is probably what we want to do additionally.
> I'll be posting v3 of the $subject patch.

I manually attempted to apply the patches.  I 'think' I did it right.

For testing, I ran:
  watch cat /sys/devices/w1_bus_master1/01-000000000000/power_supply/bq27000-battery/voltage_now

I inserted and removed the power cable several times and observed the
voltage readings with the battery connected.
The numbers looked reasonable.

I then put the board to suspend, waited a few seconds and woke the
board from sleep.  I resumed my 'watch' function from above and it
worked just fine.
If there is nothing else you want me to test, go ahead and add:

Tested-by: Adam Ford <aford173@gmail.com> #logicpd-torpedo-37xx-devkit

adam
>
> Regards,
>
> Tony
>
> 8< ----------------------
> diff --git a/drivers/w1/masters/omap_hdq.c b/drivers/w1/masters/omap_hdq.c
> --- a/drivers/w1/masters/omap_hdq.c
> +++ b/drivers/w1/masters/omap_hdq.c
> @@ -119,22 +119,24 @@ static int hdq_wait_for_flag(struct hdq_data *hdq_data, u32 offset,
>         return ret;
>  }
>
> +/* Clear saved irqstatus after using an interrupt */
> +static void hdq_reset_irqstatus(struct hdq_data *hdq_data)
> +{
> +       unsigned long irqflags;
> +
> +       spin_lock_irqsave(&hdq_data->hdq_spinlock, irqflags);
> +       hdq_data->hdq_irqstatus = 0;
> +       spin_unlock_irqrestore(&hdq_data->hdq_spinlock, irqflags);
> +}
> +
>  /* write out a byte and fill *status with HDQ_INT_STATUS */
>  static int hdq_write_byte(struct hdq_data *hdq_data, u8 val, u8 *status)
>  {
>         int ret;
>         u8 tmp_status;
> -       unsigned long irqflags;
>
>         *status = 0;
>
> -       spin_lock_irqsave(&hdq_data->hdq_spinlock, irqflags);
> -       /* clear interrupt flags via a dummy read */
> -       hdq_reg_in(hdq_data, OMAP_HDQ_INT_STATUS);
> -       /* ISR loads it with new INT_STATUS */
> -       hdq_data->hdq_irqstatus = 0;
> -       spin_unlock_irqrestore(&hdq_data->hdq_spinlock, irqflags);
> -
>         hdq_reg_out(hdq_data, OMAP_HDQ_TX_DATA, val);
>
>         /* set the GO bit */
> @@ -168,6 +170,7 @@ static int hdq_write_byte(struct hdq_data *hdq_data, u8 val, u8 *status)
>         }
>
>  out:
> +       hdq_reset_irqstatus(hdq_data);
>         return ret;
>  }
>
> @@ -219,7 +222,6 @@ static int omap_hdq_break(struct hdq_data *hdq_data)
>  {
>         int ret = 0;
>         u8 tmp_status;
> -       unsigned long irqflags;
>
>         ret = mutex_lock_interruptible(&hdq_data->hdq_mutex);
>         if (ret < 0) {
> @@ -228,13 +230,6 @@ static int omap_hdq_break(struct hdq_data *hdq_data)
>                 goto rtn;
>         }
>
> -       spin_lock_irqsave(&hdq_data->hdq_spinlock, irqflags);
> -       /* clear interrupt flags via a dummy read */
> -       hdq_reg_in(hdq_data, OMAP_HDQ_INT_STATUS);
> -       /* ISR loads it with new INT_STATUS */
> -       hdq_data->hdq_irqstatus = 0;
> -       spin_unlock_irqrestore(&hdq_data->hdq_spinlock, irqflags);
> -
>         /* set the INIT and GO bit */
>         hdq_reg_merge(hdq_data, OMAP_HDQ_CTRL_STATUS,
>                 OMAP_HDQ_CTRL_STATUS_INITIALIZATION | OMAP_HDQ_CTRL_STATUS_GO,
> @@ -283,6 +278,7 @@ static int omap_hdq_break(struct hdq_data *hdq_data)
>                         " return to zero, %x", tmp_status);
>
>  out:
> +       hdq_reset_irqstatus(hdq_data);
>         mutex_unlock(&hdq_data->hdq_mutex);
>  rtn:
>         return ret;
> @@ -330,6 +326,7 @@ static int hdq_read_byte(struct hdq_data *hdq_data, u8 *val)
>         /* the data is ready. Read it in! */
>         *val = hdq_reg_in(hdq_data, OMAP_HDQ_RX_DATA);
>  out:
> +       hdq_reset_irqstatus(hdq_data);
>         mutex_unlock(&hdq_data->hdq_mutex);
>  rtn:
>         return ret;
> @@ -363,7 +360,6 @@ static u8 omap_w1_triplet(void *_hdq, u8 bdir)
>                 goto rtn;
>         }
>
> -       hdq_data->hdq_irqstatus = 0;
>         /* read id_bit */
>         hdq_reg_merge(_hdq, OMAP_HDQ_CTRL_STATUS,
>                       ctrl | OMAP_HDQ_CTRL_STATUS_DIR, mask);
> @@ -377,7 +373,9 @@ static u8 omap_w1_triplet(void *_hdq, u8 bdir)
>         }
>         id_bit = (hdq_reg_in(_hdq, OMAP_HDQ_RX_DATA) & 0x01);
>
> -       hdq_data->hdq_irqstatus = 0;
> +       /* Must clear irqstatus for another RXCOMPLETE interrupt */
> +       hdq_reset_irqstatus(hdq_data);
> +
>         /* read comp_bit */
>         hdq_reg_merge(_hdq, OMAP_HDQ_CTRL_STATUS,
>                       ctrl | OMAP_HDQ_CTRL_STATUS_DIR, mask);
> @@ -420,6 +418,7 @@ static u8 omap_w1_triplet(void *_hdq, u8 bdir)
>                       OMAP_HDQ_CTRL_STATUS_SINGLE);
>
>  out:
> +       hdq_reset_irqstatus(hdq_data);
>         mutex_unlock(&hdq_data->hdq_mutex);
>  rtn:
>         pm_runtime_mark_last_busy(hdq_data->dev);
> @@ -460,7 +459,7 @@ static u8 omap_w1_read_byte(void *_hdq)
>         if (ret < 0) {
>                 pm_runtime_put_noidle(hdq_data->dev);
>
> -               return ret;
> +               return -1;
>         }
>
>         ret = hdq_read_byte(hdq_data, &val);
> --
> 2.24.1
