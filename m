Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1AAD641331C
	for <lists+linux-omap@lfdr.de>; Tue, 21 Sep 2021 14:04:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230508AbhIUMGT (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 21 Sep 2021 08:06:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229984AbhIUMGS (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 21 Sep 2021 08:06:18 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73B5FC061574;
        Tue, 21 Sep 2021 05:04:50 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id dj4so17643215edb.5;
        Tue, 21 Sep 2021 05:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PjlwybJCIOyk6kI6/r4pWXearyUORkl4g3ybUpCst+U=;
        b=SarQDHmPNdFnpBy4YkSR+ypw2KsJep6A9+qzjAn/vgdJW93JKYhtRSjuTDzfZoFK5/
         fhrLc7HQs2lOMlFuPQXW4ZJoXUpTUzWSQI4Yba7ndZUddOOWr7slJs6LKCBOdu5e+V3S
         OoQSyajjadng/LTRJVDdH26WPJUhJljiO1MFmg/+ik5PtwZUV+TWb3yAgUJPvRSuAOSe
         Mr1c6QgTlug65gzSrnCJPjh9yLre/uk7ajgPUthJY/Ti6E9F8lPjf7vJh9ABdsmrsWkC
         bQN8a/Nfi2yNZZYj4O7MkkffT5QTRuQ+NsztZrGYtbKLbSPSFnMqUOg8N7+VgtGc9da1
         k3Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PjlwybJCIOyk6kI6/r4pWXearyUORkl4g3ybUpCst+U=;
        b=NKQG5YKuzOajR66+DunQiKSUI7g7eVVWG/zCvrF51TD9luY3UnkbmngtLUOJHepKnx
         XpuIg1gK8CiU0K6pOdtlwnwkI2EtO2cs8aR0E2+ss5qICqZOZH2V8xaEw8/1jhjm59Uo
         IiwaiH6zoRPzjh/Ji09RSUgOei85dWhja75WFbJcD63vzJwCXs+vJwH/iVfMuIqd2TVm
         aqiDRc7zysNeIGD1AQr+KjFFMJkev33nll2jO4C32fuMmkOZVFVFHwzxuc1Let3f+asU
         joIGSSyy+4vDWXtioGFpvSFLDfl/V/P8AL/bH8fp/7owr96/p45FDCHu7aFiDDLZvlZw
         PGGA==
X-Gm-Message-State: AOAM530zRC31zs1OkmtvQ5hI61opJqC8CoWosc2xvlHw/vOUtUbBwnWH
        USlk9MbKJHJSoetrpPzre6jwoNg7v5OsOMNdmbQ=
X-Google-Smtp-Source: ABdhPJz3raeyYe4OAKqhiP0XFxXtjQmAUm8g/XPotRYQ96GojP9JjYyw+85vTb3EQpXDDX96JOCmAN6FKYGc8wnWk2o=
X-Received: by 2002:a17:906:90c9:: with SMTP id v9mr32849608ejw.356.1632225856357;
 Tue, 21 Sep 2021 05:04:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210921103346.64824-1-tony@atomide.com>
In-Reply-To: <20210921103346.64824-1-tony@atomide.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 21 Sep 2021 15:03:39 +0300
Message-ID: <CAHp75Vef_Y8M9RmpCvfpo9OWC4Nt3rzV7S9esJBcub_5DZQj1Q@mail.gmail.com>
Subject: Re: [PATCH 0/6] Get rid of pm_runtime_irq_safe() for 8250_omap
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

On Tue, Sep 21, 2021 at 1:34 PM Tony Lindgren <tony@atomide.com> wrote:
>
> Hi,
>
> Here are patches to get rid of pm_runtime_irq_safe() for the 8250_omap
> driver.
>
> For removing the pm_runtime_irq_safe() usage, serial TX is the last
> remaining issue. We deal with TX by waking up the port and returning 0
> bytes written from write_room() and write() if the port is not available
> because of PM runtime autoidle.

of the PM

>
> This series also removes the dependency to Andy's pending generic serial
> layer PM runtime patches, and hopefully makes that work a bit easier :)


Thank you, Tony, very much! The series looks to me in a good
condition, hence, FWIW,
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Regards,
>
> Tony
>
>
> Tony Lindgren (6):
>   n_tty: Start making use of -EAGAIN returned from
>     process_output_block()
>   tty: n_gsm: Don't ignore write return value in gsmld_output()
>   serial: core: Add new prep_tx for power management
>   serial: 8250: Implement prep_tx for power management
>   serial: 8250_omap: Require a valid wakeirq for deeper idle states
>   serial: 8250_omap: Drop the use of pm_runtime_irq_safe()
>
>  Documentation/driver-api/serial/driver.rst |  9 ++++++
>  drivers/tty/n_gsm.c                        |  5 ++-
>  drivers/tty/n_tty.c                        |  8 +++--
>  drivers/tty/serial/8250/8250_omap.c        | 36 +++++++++++++++-------
>  drivers/tty/serial/8250/8250_port.c        | 24 +++++++++++++++
>  drivers/tty/serial/serial_core.c           | 23 ++++++++++++++
>  include/linux/serial_core.h                |  1 +
>  7 files changed, 90 insertions(+), 16 deletions(-)
>
> --
> 2.33.0



-- 
With Best Regards,
Andy Shevchenko
