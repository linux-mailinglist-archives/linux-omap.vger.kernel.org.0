Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 450B541D430
	for <lists+linux-omap@lfdr.de>; Thu, 30 Sep 2021 09:11:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348512AbhI3HNK (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 30 Sep 2021 03:13:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348502AbhI3HNJ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 30 Sep 2021 03:13:09 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F95DC06161C;
        Thu, 30 Sep 2021 00:11:27 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id dn26so18197285edb.13;
        Thu, 30 Sep 2021 00:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NivLtE6bvPyO2eyOUU5H2C9JkdzXbEFTOOy+OnsfGMY=;
        b=Wa9ruBHMvrn2OTCwoSQGdpxt13Dc/jBSLCn4+4zCn16WlmlPrjv4GeFntmA38wVtZ1
         epRUkC1rqJ5Al4EB2uMGK1S3CB9woAYdZ/gIu6zLTww/SWYVO6vhsEAijQ84dz9Rv6Rv
         jhqI4sVrkPElOLSNOymWIv56xUOezeXE3mZ5ugIH/4kLvbrHidX3wZ5MkqjGFyQaMKhz
         jqo6eZTQcr2c39wBOijtPmaRfXQNinMOAE39x8Qe2/ZJTTaG+xL2nSe1COA6KxnRZgU7
         0BVejs7UypCK2FgDBQDuKfsyWT75VZggk4yqTNOsNF3p+FBCHtYga0WJiwlvQU874bKa
         6d7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NivLtE6bvPyO2eyOUU5H2C9JkdzXbEFTOOy+OnsfGMY=;
        b=l93Jb9rYbG7uOv3VfiE6LeKn9LTulOdCCPNzEEWrlO5Y58IV0dCzaUwasow/4jEkGb
         yhY6LPWVpyywGHG+f485/C7K0kZBjGUnTFFE7dVeb8gloabMgfzyTED59f8q7BPuN8Ib
         x0RpELp69KPrw/uW9BvfluBzBzb9gJFoUDDmi+hol7VopY/8W4WnySDwy7JnLdPMci8Z
         gLb8yjC0RfscRvyBzf9ZMbycJG+9UpXw/7PveTR2IDuBOnq/vLprmthRl58bKTyG4gIw
         JnZQ/lZQyPUrtF3w3YCsiGmsYLtR0MxtSHjmnvrdnaTXqgWfVo5lOZuNMNh91AknzPYY
         d+MQ==
X-Gm-Message-State: AOAM530ciMQVudcIhW1W1YHXY/qd3C0SGHiNnT6d0Tz0vP1u0A9St6O9
        MleDhOlsAQX5vxzTrEQfqF8ELdtJgNBEp4DCC+7CUP6KMnSuDw==
X-Google-Smtp-Source: ABdhPJyKh0Jnwae394jsULl/1bhpDPyEVgwmlAFmuLsD4VhBrum9ZCgRztHmezNuWMQd7J5/6LbGrixu8Whi87MEqc8=
X-Received: by 2002:a50:e0c8:: with SMTP id j8mr5185272edl.283.1632985885993;
 Thu, 30 Sep 2021 00:11:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210930062906.58937-1-tony@atomide.com> <20210930062906.58937-2-tony@atomide.com>
In-Reply-To: <20210930062906.58937-2-tony@atomide.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 30 Sep 2021 10:10:49 +0300
Message-ID: <CAHp75Ve4RTSdbQYA_u8vs=U75KsNdrm9EqFASAGf4rFKSqVWvQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] serial: core: Add wakeup() and start_pending_tx() for
 power management
To:     Tony Lindgren <tony@atomide.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Johan Hovold <johan@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        linux-serial@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, Sep 30, 2021 at 9:30 AM Tony Lindgren <tony@atomide.com> wrote:
>
> If the serial driver implements PM runtime with autosuspend, the port may
> be powered down on TX. To wake up the port, let's add new wakeup() call
> for serial drivers to implement as needed. We can call wakeup() from
> __uart_start() and flow control related functions before attempting to
> write to the serial port registers.
>
> Let's keep track of the serial port with a new runtime_suspended flag
> that the device driver runtime PM suspend and resume can manage with
> atomic_set(). This is because only the device driver knows what the
> device runtime PM state as in Documentation/power/runtime_pm.rst
> under "9. Autosuspend, or automatically-delayed suspend" for locking.
>
> To allow the serial port drivers to send out pending tx on runtime PM
> resume, let's add start_pending_tx() as suggested by Johan Hovold
> <johan@kernel.org>.

...

> +  wakeup(port)
> +       Wake up port if it has been runtime PM suspended.
> +
> +       Locking: port->lock taken.
> +
> +       Interrupts: locally disabled.

> +       This call must not sleep

If it's suspended via ACPI methods, it can't be resumed here, right?
Only what we can do is to schedule a resume, but it means we may not
access registers immediately after and we have to be sure that the
device is resumed.

Dead end?

-- 
With Best Regards,
Andy Shevchenko
