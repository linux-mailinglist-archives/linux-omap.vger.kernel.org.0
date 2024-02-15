Return-Path: <linux-omap+bounces-602-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CAA4855CDB
	for <lists+linux-omap@lfdr.de>; Thu, 15 Feb 2024 09:53:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AFC4E282EA2
	for <lists+linux-omap@lfdr.de>; Thu, 15 Feb 2024 08:53:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18F86134D3;
	Thu, 15 Feb 2024 08:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FH5I20mk"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13FA5134B4
	for <linux-omap@vger.kernel.org>; Thu, 15 Feb 2024 08:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707987185; cv=none; b=g94cu5ghyon6LwDC7f1AN9P9knZr+HaHtXi0U5b7xmlX/2XQuaoaSAWXY5ezDOKhHuNEQ/jf0gYyBPEgWsRzXJmdW2aFmv+UgyehlPoxJSrcXiC/VSyJUysrPShTDpH+UH+Z6Wcg0I4t9EFP6oQ3nz29VQQI2nRrmWbyydNCUa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707987185; c=relaxed/simple;
	bh=xgeVRAt1SsbzUHn78Iy//n9UA6VSsUooXbK5f4TSIRQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SNPi7tWMFy6VMcy9jksIGi/SZggn0AshVYA5ALZ7GzwpHoTs5xEV8lMCQyL5lqAZjnGANDCqrZo4SjMP5ddaPOoQeZ/FNKs0vSI9BrhqAwgBsnW9kf5gNpbYaHO8klnKsOciMv+UJ1pz12t8kpjLkikdlGdg2JuD9ffqoWWOKVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FH5I20mk; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-55ad2a47b7aso820524a12.3
        for <linux-omap@vger.kernel.org>; Thu, 15 Feb 2024 00:53:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707987181; x=1708591981; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sjLQlaV8w7UBEfwH5YcxubeTHfuUmicctdfDV7dwdTE=;
        b=FH5I20mkz4N+sVfrWsVQqclLr7PqGwpOhH4qHmDn+MTew23iH6JdhFoYypSJBoiyMp
         oF/9uNT5hvM9r7Ahtmu8I5k1pb9ZCL4T/0Usb1aJVTC/XjThDNHBZiQSxNWSRtzn0h15
         5Son6y+/KfwtB9ZKsicDaOh5ZvYOjRShv2F9ZbLnRFyYCRQynqXelHdKhnhNEAnWO5Is
         YdcZI5iH1RXRy3hwhAtKuhMC9ClQNmeBzECYv59qDA6EcodMBt7+xBnRwsnoXpcjt1Kl
         tvUyqfKC+FzzxEOBWVpKloDZ4ICbIbF9h+BCOd9Ta+7hbU85qDYkxCojqx1GcDBy/Rc8
         F5XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707987181; x=1708591981;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sjLQlaV8w7UBEfwH5YcxubeTHfuUmicctdfDV7dwdTE=;
        b=sLyVPU+h520HcHvHBqbbZj8xCRTDWbD29P9qXzg30VwcFe4sKHsoOZOP0qfwDU0Avi
         vogL1nel85b4Qaz6xGfgobqgdwqB8E/dz6OmDmOSnKPCd122UfvbryS+qjEgMYP0zA16
         nXtrlooJDWeoBt/FCiG7vtnCxQgcLCHIdK11ywmenEGTKFhJfeXnRYaZcFrllb5ydSsK
         fb+Q5VxYvWGt8Ek4ZS/tgBT9ClnMATEgk3G9EVTxSiZrqg4mjqYh/LE9jp7UPgRImbPf
         m3tvzdpzSfPgCztnyP5EUNROykJpIGxk7f03oASQZ+333UXu/xuTF+zlk2EYsfNu3Owc
         Yctg==
X-Forwarded-Encrypted: i=1; AJvYcCXjBaOQj27eiggwKG+QtNv7c03VUuvlPcwT2Wk+ujTJ2H0SwXS6NjKD1ZiZQO3FLBW69G+n8IloFei8yZVSHfaLbNMiSBcq83IxSw==
X-Gm-Message-State: AOJu0YyimQYSKvEbRsByU06vkvjA3V/HoZfL6ZPrGESHkKL3JLswTVTE
	lRFHlrqDW4LgeGbksjRhLYYe6BdEh2Yh0AgAh7XUJelZkRZ+JdKBOWvlCcbFgBRe9lniRTxirQO
	1sKP4XiAK4Kt2GJ5uPegAkQ+/bQY=
X-Google-Smtp-Source: AGHT+IH7yhDqygGkOBZjlnkkmsPexZmUcnfB7dEfwkq0oNkb8Mx/3sHu4Y/cvB1VlTOY6nBJd+sc2mb0SPki6o27D04=
X-Received: by 2002:a50:ee89:0:b0:561:f4e1:8424 with SMTP id
 f9-20020a50ee89000000b00561f4e18424mr667308edr.42.1707987180975; Thu, 15 Feb
 2024 00:53:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAFEAcA88UGhjh8-iBvhxx6GdWg74dinYouiguTcz=qEe51L7Ag@mail.gmail.com>
 <fe5476c7-82e0-4353-a943-7f39b14e1b5b@roeck-us.net> <CAFEAcA-bqOM4Ptws-tsEwo2HDZ6YSX1Y+xGkR0WueRD_dUd0+Q@mail.gmail.com>
 <7bd858a2-9983-4ddf-8749-09c9b2e261f9@roeck-us.net> <fbab8e59-6d2d-4193-a5ca-9fea3c524229@app.fastmail.com>
 <CACRpkdbmJe8ZE7N0p_utWucyw+3mp1Qrb0bQEKcJPmwNFtVA_g@mail.gmail.com>
 <CALT56yOT_U9jVkhTP=zZu-32B4pta5zaJocn9695N7ari4cFyQ@mail.gmail.com>
 <be4038e1-a578-4439-a9bf-e936484c64cc@app.fastmail.com> <20240215093113.5c58cabe@aktux>
 <7c8a5c5b-a94a-4b87-a043-f1e398b55872@app.fastmail.com>
In-Reply-To: <7c8a5c5b-a94a-4b87-a043-f1e398b55872@app.fastmail.com>
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
Date: Thu, 15 Feb 2024 10:52:50 +0200
Message-ID: <CALT56yPLobsL699K9+DDMBWwi7-iLzaYwuDwV7NmecaTY7Z6Tw@mail.gmail.com>
Subject: Re: possible deprecation and removal of some old QEMU Arm machine
 types (pxa2xx, omap, sa1110)
To: Arnd Bergmann <arnd@arndb.de>
Cc: Andreas Kemnade <andreas@kemnade.info>, Linus Walleij <linus.walleij@linaro.org>, 
	paul.eggleton@linux.intel.com, Andrea Adami <andrea.adami@gmail.com>, 
	Guenter Roeck <linux@roeck-us.net>, Peter Maydell <peter.maydell@linaro.org>, 
	QEMU Developers <qemu-devel@nongnu.org>, "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>, 
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>, 
	Linux-OMAP <linux-omap@vger.kernel.org>, Daniel Mack <daniel@zonque.org>, 
	Robert Jarzmik <robert.jarzmik@free.fr>, Haojian Zhuang <haojian.zhuang@gmail.com>, 
	Stefan Lehner <stefan-lehner@aon.at>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 15 Feb 2024 at 10:45, Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Thu, Feb 15, 2024, at 09:31, Andreas Kemnade wrote:
> > On Wed, 14 Feb 2024 23:42:58 +0100
> > "Arnd Bergmann" <arnd@arndb.de> wrote:
> >> On Wed, Feb 14, 2024, at 13:26, Dmitry Baryshkov wrote:
> >> > On Tue, 13 Feb 2024 at 23:22, Linus Walleij <linus.walleij@linaro.or=
g> wrote:
> >> >> On Tue, Feb 13, 2024 at 9:12=E2=80=AFPM Arnd Bergmann <arnd@arndb.d=
e> wrote:
> >> >> > On Tue, Feb 13, 2024, at 16:36, Guenter Roeck wrote:
> >> >> > > On Tue, Feb 13, 2024 at 03:14:21PM +0000, Peter Maydell wrote:
> >> >>
> >> >> Andrea Adami and Dmitry Eremin-Solenikov did the work in 2017 to
> >> >> modernize it a bit, and Russell helped out. I was under the impress=
ion
> >> >> that they only used real hardware though!
> >> >
> >> > I used both Qemu and actual hardware (having collie, poodle, tosa an=
d
> >> > c860 that was easy).
> >> >
> >> > The biggest issue with Zaurus PDAs was that supporting interesting
> >> > parts of the platform (PCMCIA, companion chips) required almost
> >> > rebootstrapping of the corresponding drivers.
> >> > E.g. I had a separate driver for the LoCoMo chip which worked proper=
ly
> >> > with the DT systems.
> >> > PCMCIA was a huuuge trouble and it didn't play well at all. The driv=
er
> >> > must be rewritten to use the component framework.
> >>
> >> If we want to actually go there, I think the best option for PCMCIA
> >> support is likely to replace the entire "soc_common" pcmcia driver
> >> with a simple drivers/pata/ storage driver and no support for
> >> other cards. There was a driver until commit 38943cbd25a2
> >> ("ata: remove palmld pata driver") that could serve as an
> >> template.
> >>
> > hmm, main usage for PCMCIA/CF in those devices was often something else=
,
> > not storage, at least on the IPAQ h2200. Wondering wether that road is
> > actually good. When I was mainly using those devices, I was not good in
> > mainlining things.
>
> Do we still support any non-storage CF devices that someone might
> actually use? Do you have a specific example in mind? These are
> the currently supported devices that I see:

The Bluetooth over the PCMCIA UART worked last time I checked it and
according to your grep it is still a valid user.

If we are talking about re-bootstrap of the PCMCIA subsystem, hostap
and orinoco come to my mind. We dropped those drivers a while ago, but
back at that time they were very useful. Also I had the out-of-tree
driver for Sharp 0.3 MP cameras using CF interface (yeah, sure, all of
those are out-of-tree nowadays).

>
> git grep -B4 -w depends.*PCMCIA | grep "Kconfig-\(config\|menuconfig\)" |=
 grep -v ^drivers/pcmcia
> drivers/ata/Kconfig-config PATA_PCMCIA
> drivers/bluetooth/Kconfig-config BT_HCIDTL1
> drivers/bluetooth/Kconfig-config BT_HCIBT3C
> drivers/bluetooth/Kconfig-config BT_HCIBLUECARD
> drivers/comedi/Kconfig-menuconfig COMEDI_PCMCIA_DRIVERS
> drivers/mmc/host/Kconfig-config MMC_SDRICOH_CS
> drivers/mtd/maps/Kconfig-config MTD_PCMCIA
> drivers/mtd/maps/Kconfig-config MTD_PCMCIA_ANONYMOUS
> drivers/net/arcnet/Kconfig-menuconfig ARCNET
> drivers/net/arcnet/Kconfig-config ARCNET_COM20020_CS
> drivers/net/can/sja1000/Kconfig-config CAN_EMS_PCMCIA
> drivers/net/can/sja1000/Kconfig-config CAN_PEAK_PCMCIA
> drivers/net/can/softing/Kconfig-config CAN_SOFTING_CS
> drivers/net/ethernet/3com/Kconfig-config NET_VENDOR_3COM
> drivers/net/ethernet/3com/Kconfig-config PCMCIA_3C574
> drivers/net/ethernet/3com/Kconfig-config PCMCIA_3C589
> drivers/net/ethernet/8390/Kconfig-config PCMCIA_AXNET
> drivers/net/ethernet/8390/Kconfig-config APNE
> drivers/net/ethernet/8390/Kconfig-config PCMCIA_PCNET
> drivers/net/ethernet/amd/Kconfig-config PCMCIA_NMCLAN
> drivers/net/ethernet/fujitsu/Kconfig-config NET_VENDOR_FUJITSU
> drivers/net/ethernet/fujitsu/Kconfig-config PCMCIA_FMVJ18X
> drivers/net/ethernet/smsc/Kconfig-config PCMCIA_SMC91C92
> drivers/net/ethernet/xircom/Kconfig-config NET_VENDOR_XIRCOM
> drivers/net/ethernet/xircom/Kconfig-config PCMCIA_XIRC2PS
> drivers/parport/Kconfig-config PARPORT_PC_PCMCIA
> drivers/scsi/pcmcia/Kconfig-menuconfig SCSI_LOWLEVEL_PCMCIA
> drivers/ssb/Kconfig-config SSB_PCMCIAHOST_POSSIBLE
> drivers/tty/Kconfig-config IPWIRELESS
> drivers/tty/serial/8250/Kconfig-config SERIAL_8250_CS
> drivers/usb/host/Kconfig-config USB_SL811_CS
> sound/pcmcia/Kconfig-menuconfig SND_PCMCIA
>
>      Arnd



--=20
With best wishes
Dmitry

