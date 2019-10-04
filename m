Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D76EECC390
	for <lists+linux-omap@lfdr.de>; Fri,  4 Oct 2019 21:29:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729490AbfJDT3t (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 4 Oct 2019 15:29:49 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:45202 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725932AbfJDT3t (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 4 Oct 2019 15:29:49 -0400
Received: by mail-io1-f68.google.com with SMTP id c25so15905328iot.12;
        Fri, 04 Oct 2019 12:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=y0OJ7/SgReOk2grQFvLnWH91Op9wRRMdd5tOpx1hbC4=;
        b=mHbN9Zq37CUj7dDvd5GrFR4IpOo9GIoKPErGNZnhpHnU56KhvOuWcFlRocijnLctvK
         VLqMyrAwP66rgebj4xeayopAFe9kezh8O0LUhQNIP/3WCjkmfCts8nUSNKv0IA4O3kXS
         9uZmUiVfs/da+hSDrhijeCxDwnUvpbeNy+nUUGPoi7HzCK3irA33zewV4A7tcGGX374y
         Qpk+rsA3D1yrJATG9JfbEflWw/+SyUnbWD0Z71jrVxzDaVdR5IpKN18eJGXFbGdxpYwn
         s8dSDWR37eSDNVweXavLH0TGAt6R0ircrGNjs7pylUYmHUHuMAfTY4H5zmExHRBrdQR+
         MdTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=y0OJ7/SgReOk2grQFvLnWH91Op9wRRMdd5tOpx1hbC4=;
        b=mfI9rzDhvBYzE3bFn5jWbdGoEB0oJL7lm01Q7+lkBvNkLM9Qz/O6GaW78sA3LdOlNP
         8BkgQ+LBZTlo+dzeBfLUE9Nw46JEKFO/Ov7476iutneCNcEnjDB+HHngM/CgrafnMJv2
         wEManqk8LDZxo0XfduKl9b6NQErC6N9chQ/MIGfpnqws33UsFicKq+JZgXprPr2vZgl2
         wnPtaDTqo0UveO1hZZ/T2pfabnAX0daxd1OR67Zg5ve+ohB4xMB8MpdiVAIAWyKltQ+D
         Q2IBVQzYKqFUxVlJt6J79WS1iE9SG2T6r73CUIU6h2GR/4CVjgKuMLAhrWZBBiuRYHdu
         BYFg==
X-Gm-Message-State: APjAAAWAFWa40gFDQXhvy5leYrFovHO4ETd3lkQ88/XVIB1y4AEF9kmT
        TZE4zY+ebpGq50wLSSTAUqjxwFCbC//iFmW5LGU=
X-Google-Smtp-Source: APXvYqzaMGngribRRvqu3VAuNb5LGILxFgGbQKy7BcwnBkr8wOogbBTVo+amQa6LHmrdHfubVeo8mjbYvh53Yxf3djg=
X-Received: by 2002:a92:3314:: with SMTP id a20mr16796103ilf.276.1570217386586;
 Fri, 04 Oct 2019 12:29:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190723115400.46432-1-tony@atomide.com>
In-Reply-To: <20190723115400.46432-1-tony@atomide.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Fri, 4 Oct 2019 14:29:35 -0500
Message-ID: <CAHCN7x+6KYjnm5daRe_Y5XEWnDBWQnz8rOKYH2wTgx9avvokmQ@mail.gmail.com>
Subject: Re: [PATCH] serial: 8250_omap: Fix idling for unloaded serdev drivers
To:     Tony Lindgren <tony@atomide.com>
Cc:     Peter Hurley <peter@hurleysoftware.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Vignesh R <vigneshr@ti.com>, linux-serial@vger.kernel.org,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Johan Hovold <johan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, Jul 23, 2019 at 5:21 PM Tony Lindgren <tony@atomide.com> wrote:
>
> For many years omap variants have been setting the runtime PM
> autosuspend delay to -1 to prevent unsafe policy with lossy first
> character on wake-up. The user must specifically enable the timeout
> for UARTs if desired.
>
> We must not enable the workaround for serdev devices though. It leads
> into UARTs not idling if no serdev devices are loaded and there is no
> sysfs entry to configure the UART in that case. And this means that
> my PM may not work unless the serdev modules are loaded.
>
> We can detect a serdev device being configured based on a dts child
> node, and we can simply skip the workround in that case. And the
> serdev driver can idle the port during runtime when suitable if an
> out-of-band wake-up GPIO line exists for example.
>
> Let's also add some comments to the workaround while at it.

This seems to help some of the stability issues I am seeing on the
DM3730 UART2 running Bluetooth at 3000000 baud.
Does it make sense to backport this to the stable kernels?

adam

>
> Cc: Johan Hovold <johan@kernel.org>
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
>  drivers/tty/serial/8250/8250_omap.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/tty/serial/8250/8250_omap.c b/drivers/tty/serial/8250/8250_omap.c
> --- a/drivers/tty/serial/8250/8250_omap.c
> +++ b/drivers/tty/serial/8250/8250_omap.c
> @@ -1234,7 +1234,16 @@ static int omap8250_probe(struct platform_device *pdev)
>
>         device_init_wakeup(&pdev->dev, true);
>         pm_runtime_use_autosuspend(&pdev->dev);
> -       pm_runtime_set_autosuspend_delay(&pdev->dev, -1);
> +
> +       /*
> +        * Disable runtime PM until autosuspend delay unless specifically
> +        * enabled by the user via sysfs. This is the historic way to
> +        * prevent an unsafe default policy with lossy characters on wake-up.
> +        * For serdev devices this is not needed, the policy can be managed by
> +        * the serdev driver.
> +        */
> +       if (!of_get_available_child_count(pdev->dev.of_node))
> +               pm_runtime_set_autosuspend_delay(&pdev->dev, -1);
>
>         pm_runtime_irq_safe(&pdev->dev);
>         pm_runtime_enable(&pdev->dev);
> --
> 2.21.0
