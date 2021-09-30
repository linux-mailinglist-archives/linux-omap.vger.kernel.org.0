Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4DB741D462
	for <lists+linux-omap@lfdr.de>; Thu, 30 Sep 2021 09:18:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348614AbhI3HTm (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 30 Sep 2021 03:19:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348519AbhI3HTm (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 30 Sep 2021 03:19:42 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E283DC06161C;
        Thu, 30 Sep 2021 00:17:59 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id g8so18564671edt.7;
        Thu, 30 Sep 2021 00:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tI8ay/PsfUKtXk95kXauKkPTSzNmOY4jVic6xvKi7Io=;
        b=A+pNANqurC74Iy9mKU4Hb9WWlLnmENVZP2v3iVBey0VJHRA9SpSKsHiUxgWl9g1gR4
         WujZ+Y5/nVYw3oYylaBZ2FAjOoCh1Evvusz0Wijwf6eyZIsZ884Frc9IlODFfezJsyDR
         KSsVsdZSIYW60O9PyHsRC7jGfEodMHcR0aahHiVjpyViU9oEWKUYefpb8BuLQuKIYZSg
         TxWOQRDiEFS3Gp18fX5lNWSUxonmYOiuAkXZa7f5eMxr2GbEQuADDTdrRe306jnCYZJc
         jeCRquLG18gECWOqU2ytZUisFwxL7D8rKchOAs/Q78MxB4n0v6ZMHl7aaKGteNlrSyF8
         7DdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tI8ay/PsfUKtXk95kXauKkPTSzNmOY4jVic6xvKi7Io=;
        b=4W8GlItszpbwY0eL2fXDjh/5YivgXtc0UphYAZqZG7tPDzrloi2SEfHerX4jFHsw8Q
         MLGbUc1Nf+pKhP7kyCKREpVhxImVwFWCDGRhzKafpkNwlcevhGu5oQELyMn9yOWZDTxj
         tjs41o2cM/Zf7halH8u0CcDERtp9yzI9+6kbTYjkCtnuNlxFeiP1oYg+cnGnEE3cFblL
         /61ZNo9+VXmkOgMfNcsd9bdj+/NhWX5pb1MSgCGf7INCTKWVHC3G6g2HIVeejZJ7G7NY
         hjd4w7q4lvX2irzJ3D0m6H5Z+vg7itCq6dvGPpMy77LOQebgbbLcxuW/qDhdBnGXhto1
         9ZTg==
X-Gm-Message-State: AOAM530fhU17Ra+7sV4gqCxxO1bnVKoDA9YbxxpY3aDLCX3bnR40BLZ3
        99JHZO9UerOXmtMYUw9cH3XIAlrYgVAaRgx7wCxv/wnwCASRRQ==
X-Google-Smtp-Source: ABdhPJynU5uUyNAdxBx+pfp0pe2EDxb3XxnSZdFkuXejeOzVrk9jh05Gk9CA+fTJMzVy5aSxid2BEnhdz4O2xjYJxHY=
X-Received: by 2002:a50:e0c8:: with SMTP id j8mr5209407edl.283.1632986277990;
 Thu, 30 Sep 2021 00:17:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210930062906.58937-1-tony@atomide.com> <20210930062906.58937-3-tony@atomide.com>
In-Reply-To: <20210930062906.58937-3-tony@atomide.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 30 Sep 2021 10:17:21 +0300
Message-ID: <CAHp75VeZ98Se+BBDdMeJmwu39CbXEL08RF4BR+uu5oJAycEb=A@mail.gmail.com>
Subject: Re: [PATCH 2/4] serial: 8250: Implement wakeup for TX and use it for 8250_omap
To:     Tony Lindgren <tony@atomide.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Johan Hovold <johan@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Linux OMAP Mailing List <linux-omap@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, Sep 30, 2021 at 9:30 AM Tony Lindgren <tony@atomide.com> wrote:
>
> We can use the wakeup() and uart_start_pending_tx() calls to wake up an
> idle serial port and send out the pending TX buffer on runtime PM resume.

> This allows us to remove the depedency to pm_runtime_irq_safe() for

dependency

> 8250_omap driver in the following patches.
>
> We manage the port runtime_suspended flag in the serial port driver as
> only the driver knows when the hardware is runtime PM suspended. Note that
> The current flag for rpm_tx_active cannot be used as it is TX specific
> for 8250_port.
>
> We already have serial8250_start_tx() call serial8250_rpm_get_tx(), and
> serial8250_stop_tx() call serial8250_rpm_put_tx() to take care of the
> runtime PM usage count for TX. To have the serial port driver call
> uart_start_pending_tx() on runtime resume, we must now use just
> pm_runtime_get() for serial8250_start_tx() instead of the sync version.
>
> With these changes we must now also flip 8250_omap driver over to call
> uart_start_pending_tx(). That's currently the only user of UART_CAP_RPM.

Do I understand the flow correctly:
 1) if we suspended, we request resume
 2) until resume is not fulfilled we return error code to user space
to try again
?

In this case we have no register access to the powered off device and
ACPI, for example, may have a chance to resume the device in a
non-atomic way. Is this the correct interpretation?

-- 
With Best Regards,
Andy Shevchenko
