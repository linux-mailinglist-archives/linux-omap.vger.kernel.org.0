Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D3293054C0
	for <lists+linux-omap@lfdr.de>; Wed, 27 Jan 2021 08:36:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S316536AbhA0AAi (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 26 Jan 2021 19:00:38 -0500
Received: from mail.kernel.org ([198.145.29.99]:47448 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729073AbhAZSV7 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 26 Jan 2021 13:21:59 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7E859207BC;
        Tue, 26 Jan 2021 18:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611685277;
        bh=MXfhwHib5lhIxe0d2EionO+qD1p7JOcTGIR5T//GcjU=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Vyv6zeCgPBGRmLOGE+ZvJN/iEJbaZMbXGNiKs6W7mrLLyXtdvyXRRMjhIUG4flGz0
         SObPNEWXGHHwcJfUJNuiMDGYMFH/8ozn34f5YEANN+7bqYaurnkm8GG9NwrvNlziq/
         O+icUTumPpIZFw8RhAofdIEpRpC2YkiAovXOWMQqJg9uQPP3e+v84gtclOugTGmOcV
         ++aSNFIc4sQpch4zq96vzAnzS+3zaa/mBeaevzYjYP5n9QywZGVOgMQYAiyYmOP+pZ
         Sq1U3Xwms5ZLaHqaPI4yniW31jcyXpj/T+SM9Ctu5ovfB008PliOds9wV4CCoDyhwc
         GyVUoh4d1+tyA==
Received: by mail-ed1-f43.google.com with SMTP id c6so20960185ede.0;
        Tue, 26 Jan 2021 10:21:17 -0800 (PST)
X-Gm-Message-State: AOAM531+bSa8/wfSUxTkMkqCWoYP6KAcEK0RB3tUKorghTKbVy0gruDu
        l16YNSHn7Vbd0RkSMdhlUX5JAJttecisG/5fnw==
X-Google-Smtp-Source: ABdhPJwqon1vbLCOlmss6J+2GsHVOo4w9BY+GyxQEwzER9kIB9CkFOtLUal0HAuyf9bfo2h5vrYSv5GPYVZbdJOig20=
X-Received: by 2002:a05:6402:1751:: with SMTP id v17mr5717873edx.289.1611685276124;
 Tue, 26 Jan 2021 10:21:16 -0800 (PST)
MIME-Version: 1.0
References: <20210123034428.2841052-1-swboyd@chromium.org>
In-Reply-To: <20210123034428.2841052-1-swboyd@chromium.org>
From:   Rob Herring <robh@kernel.org>
Date:   Tue, 26 Jan 2021 12:21:04 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+voSRnHEEkUZSasdKGrXiBs3yCmzHp6Ua4WNuAgnh4AQ@mail.gmail.com>
Message-ID: <CAL_Jsq+voSRnHEEkUZSasdKGrXiBs3yCmzHp6Ua4WNuAgnh4AQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] Stop NULLifying match pointer in of_match_device()
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Arnd Bergmann <arnd@arndb.de>,
        "David S. Miller" <davem@davemloft.net>,
        Frank Rowand <frowand.list@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Jean Delvare <jdelvare@suse.com>, Jiri Slaby <jslaby@suse.com>,
        Linux HWMON List <linux-hwmon@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        "open list:MEDIA DRIVERS FOR RENESAS - FCP" 
        <linux-renesas-soc@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Linux USB List <linux-usb@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Richard Leitner <richard.leitner@skidata.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, Jan 22, 2021 at 9:44 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> (This is a continuation of this series[1] per Rob's request. I've picked
> up the acks, etc. with b4 and compile tested the patches along with an
> arm64 allmodconfig build. Presumably Rob will pick these up directly.)
>
> of_match_device() uses of_match_ptr() to make the match table argument
> NULL via the pre-processor when CONFIG_OF=n. This makes life harder for
> compilers who think that match tables are never used and warn about
> unused variables when CONFIG_OF=n. This series changes various callers
> to use of_device_get_match_data() instead, which doesn't have this
> problem, and removes the of_match_ptr() usage from of_match_device() so
> that the compiler can stop complaining about unused variables. It will
> do dead code elimination instead and remove the match table if it isn't
> actually used.
>
> [1] https://lore.kernel.org/r/20191004214334.149976-1-swboyd@chromium.org
>
> Cc: Alexandre Torgue <alexandre.torgue@st.com>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Frank Rowand <frowand.list@gmail.com>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Grygorii Strashko <grygorii.strashko@ti.com>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: Jacopo Mondi <jacopo@jmondi.org>
> Cc: Jean Delvare <jdelvare@suse.com>
> Cc: Jiri Slaby <jslaby@suse.com>
> Cc: <linux-hwmon@vger.kernel.org>
> Cc: <linux-kernel@vger.kernel.org>,
> Cc: <linux-media@vger.kernel.org>
> Cc: <linux-omap@vger.kernel.org>
> Cc: <linux-renesas-soc@vger.kernel.org>
> Cc: <linux-serial@vger.kernel.org>
> Cc: <linux-usb@vger.kernel.org>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Richard Leitner <richard.leitner@skidata.com>
> Cc: Rob Herring <robh+dt@kernel.org>
>
> Stephen Boyd (6):
>   media: renesas-ceu: Use of_device_get_match_data()
>   drivers: net: davinci_mdio: Use of_device_get_match_data()
>   serial: stm32: Use of_device_get_match_data()
>   usb: usb251xb: Use of_device_get_match_data()
>   hwmon: (lm70) Avoid undefined reference to match table
>   of/device: Don't NULLify match table in of_match_device() with
>     CONFIG_OF=n
>
>  drivers/hwmon/lm70.c                   |  2 +-
>  drivers/media/platform/renesas-ceu.c   |  2 +-
>  drivers/net/ethernet/ti/davinci_mdio.c | 12 ++---
>  drivers/tty/serial/stm32-usart.c       | 71 ++++++++++++--------------
>  drivers/tty/serial/stm32-usart.h       |  2 +-
>  drivers/usb/misc/usb251xb.c            | 12 ++---
>  include/linux/of_device.h              |  4 +-
>  7 files changed, 47 insertions(+), 58 deletions(-)

Series applied.


Rob
