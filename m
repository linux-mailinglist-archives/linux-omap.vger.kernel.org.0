Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 43DF034127
	for <lists+linux-omap@lfdr.de>; Tue,  4 Jun 2019 10:07:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726994AbfFDIHP (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 4 Jun 2019 04:07:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:45148 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726828AbfFDIHP (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 4 Jun 2019 04:07:15 -0400
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C08EF24DBC;
        Tue,  4 Jun 2019 08:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559635634;
        bh=sHyWfbwyAVw7JKk2CNcrCheYaj5lTlFffjTrjRb605w=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=GGHi7E3nS8InMHMm6Lj7RN831PK+c5synl+5o0YVe7bm5SxaPLGtnGoz4l1BXwrbL
         nrB7anSS2auYVBfNOXn5TaBjM+u0QlgIi0aO9jCZuDJLEUY/uUbueDcW+/MzwZGvaI
         F/d3zRm5/qUpj9AgXWQtZcdtXfsYe0qVak7mDQVg=
Received: by mail-lf1-f44.google.com with SMTP id 136so4175892lfa.8;
        Tue, 04 Jun 2019 01:07:13 -0700 (PDT)
X-Gm-Message-State: APjAAAVhtAFX0AXhD1BEIZH/72DklsFLR4xguWQ19N5KE38PYejrafRK
        EhW6RtcZmv1JF7WiNdCG/nJAW/jBKc31ka4ApQA=
X-Google-Smtp-Source: APXvYqwADLP+VEgr6xpGA3YxOkg9TXBPTX2f2nBgdA2w5CaYXwC1dmD/WGKupuEPBt0UOCBg2XQaSrz1avbR+Ljmutk=
X-Received: by 2002:ac2:4d1c:: with SMTP id r28mr1619692lfi.159.1559635629899;
 Tue, 04 Jun 2019 01:07:09 -0700 (PDT)
MIME-Version: 1.0
References: <1559634833-19980-1-git-send-email-krzk@kernel.org> <CAMuHMdV0RNdB3_n7J0FWfhUTvzq4390HVsuzxXhexZ_zX-+nvg@mail.gmail.com>
In-Reply-To: <CAMuHMdV0RNdB3_n7J0FWfhUTvzq4390HVsuzxXhexZ_zX-+nvg@mail.gmail.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Tue, 4 Jun 2019 10:06:58 +0200
X-Gmail-Original-Message-ID: <CAJKOXPcY8w7CVkwGWwhssPtz8=tgffzRoAN8-4SMSTYk2_yKEg@mail.gmail.com>
Message-ID: <CAJKOXPcY8w7CVkwGWwhssPtz8=tgffzRoAN8-4SMSTYk2_yKEg@mail.gmail.com>
Subject: Re: [PATCH] ARM: configs: Remove useless UEVENT_HELPER_PATH
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     arm-soc <arm@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>,
        Russell King <linux@armlinux.org.uk>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Sylvain Lemieux <slemieux.tyco@gmail.com>,
        Jason Cooper <jason@lakedaemon.net>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Tony Lindgren <tony@atomide.com>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Marc Gonzalez <marc.w.gonzalez@free.fr>,
        Mans Rullgard <mans@mansr.com>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-aspeed@lists.ozlabs.org,
        "open list:TI ETHERNET SWITCH DRIVER (CPSW)" 
        <linux-omap@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, 4 Jun 2019 at 09:57, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> On Tue, Jun 4, 2019 at 9:54 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > Remove the CONFIG_UEVENT_HELPER_PATH because:
> > 1. It is disabled since commit 1be01d4a5714 ("driver: base: Disable
> >    CONFIG_UEVENT_HELPER by default") as its dependency (UEVENT_HELPER) was
> >    made default to 'n',
> > 2. It is not recommended (help message: "This should not be used today
> >    [...] creates a high system load") and was kept only for ancient
> >    userland,
> > 3. Certain userland specifically requests it to be disabled (systemd
> >    README: "Legacy hotplug slows down the system and confuses udev").
> >
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
>
> Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> >  arch/arm/configs/proceq_vf_bck_defconfig  | 255 +++++++++++++++++++++++++++
> >  arch/arm/configs/proceq_vf_crc_defconfig  | 278 ++++++++++++++++++++++++++++++
>
> These look like unrelated changes? Please drop.

Ooops, indeed. Thanks for spotting them.

Best regards,
Krzysztof
