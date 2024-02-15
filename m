Return-Path: <linux-omap+bounces-601-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E779855CC8
	for <lists+linux-omap@lfdr.de>; Thu, 15 Feb 2024 09:45:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CDEBD1F211E5
	for <lists+linux-omap@lfdr.de>; Thu, 15 Feb 2024 08:45:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4560414264;
	Thu, 15 Feb 2024 08:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="NA9DyMAT";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="dhJRth0H"
X-Original-To: linux-omap@vger.kernel.org
Received: from fout6-smtp.messagingengine.com (fout6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFBC513AFB
	for <linux-omap@vger.kernel.org>; Thu, 15 Feb 2024 08:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707986735; cv=none; b=k3EluwWmaJ/KDTJcgbSFcZ6dZgO/K23fRGBcH3UI8/YsXReEjxSiVXlrk+DSZ2zoYdyJw3YhzNKykKOGnYO7FNFw6OOpJhOAVdVsAGxJfgtTaupnqAZVyqJ63ZNcEHTW1bI31q99Vhr5QnC9J84JbUxLfWTtHudHEfqFA7AdKxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707986735; c=relaxed/simple;
	bh=LQCZNsAstPR9+ngIgsTottFXrECte72Nojv2dwraMFc=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=H8d2vQUhbbLPLwsOgtHDYs+JusM4SWOYNtS19rKW8pYDmXuND3KsZu0RHh6NIYIxNIUwP2ZWlLIe7I348cfelg5H9KwHttKgNdrP7lLON9buwPVkFhGGlFr4r9ZCMms+0/DLCXFBITvXyjMgbMfM7ySE8XDtut2+wy/INA8dQyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=NA9DyMAT; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=dhJRth0H; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfout.nyi.internal (Postfix) with ESMTP id 8FBFE13800BC;
	Thu, 15 Feb 2024 03:45:32 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Thu, 15 Feb 2024 03:45:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1707986732;
	 x=1708073132; bh=nK32Yno8wiK67485X68quq4Ct0mngu1clT9OWAjEztc=; b=
	NA9DyMATG05xs/5vihPTc7l4PiLOWVoc2WYSWY1ob/wtSO7ixGB9/pzS0kfz0QCP
	d+JVVtot/8XsVSyIbTXjaBd3LdbqzK/t2V7y+7c7cSea9Lkdmlxiw+W9+tqGI/dW
	kiIUChyKJA7TBPdrCZLC0j/pNn+MxchBuN6qRoYGEz5S0SncQqm5JKkoLE7/O/Hn
	bFYScGsuRaUNcSXKNu0h4Td9Od+rAyzaC4upyU7JAbpTlKn1RT/FHCqDrtb/odrD
	AwGXlUykPvAgIo9JHWs6qHEdXc/PhNBGJIgXEgcfI1pX7gtr3nOgJh8eFyBak+/p
	xPjzH1MLV7ZgV8JuSOBfhQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1707986732; x=
	1708073132; bh=nK32Yno8wiK67485X68quq4Ct0mngu1clT9OWAjEztc=; b=d
	hJRth0H5m64CnfNsYW3XX/JqpZ0U4m/8Z/Ck/bR4Oe5iW+dD54hgWBunyxpfDaBC
	ELwlog7u+Dp6FlF4qmFyhlBmOoMo7NlGLROv4rX3jeTZtP0TWWS2A8T0h3Eo3cdx
	RyYMhmZKR3A3faMgZUxY7/ISP/1Ko+leLLauZGznMyHW1F84wdi6UQrdagBL5sVe
	ydWegVKnHhlUQSJ+kCplPa8p6puTLdEKlve84t7zH2epD+vx3XQ/Y6ZAP7NVBfC4
	SYUm3qxjwyVdBHfyKSBtKRHfN1VT+WUxbSVAS1XH+nHDM9lBwi4LhEluD1wLIYoo
	A0+tqcTiFieM8x801XeYg==
X-ME-Sender: <xms:LM_NZYWw57-MfAm4xXakmYXVoFCdc7Q5gI3TFVsaMmK1H5PAajtBqw>
    <xme:LM_NZcnCzzao1pQuXLS5tcklX_MolRXKMSOyNrYUmt6BD7P-8MS12Cn22G8AaetHX
    gKeGi23u_5P2WqFLRM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudelgdeilecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepgeefjeehvdelvdffieejieejiedvvdfhleeivdelveehjeelteegudektdfg
    jeevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:LM_NZcbdItZ1hOn4TBfE5O4HTBpj7owzsHmhTK2kZEVKkI7jfsN94A>
    <xmx:LM_NZXW9g-u2bIGqw2xYmT_ArIHNAJTjoiUgGO1JX0egRvC0PE2CFw>
    <xmx:LM_NZSmNbv2-dSO1kAK4B5uUwEYakB3PfGQ6-ZfYSyItikwtRskoIg>
    <xmx:LM_NZRq4m2kWszPQBriIoM0__WXuSFYQfbeFjzHR8k5t4BXmqlDC4A>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 0876CB6008D; Thu, 15 Feb 2024 03:45:31 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-144-ge5821d614e-fm-20240125.002-ge5821d61
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <7c8a5c5b-a94a-4b87-a043-f1e398b55872@app.fastmail.com>
In-Reply-To: <20240215093113.5c58cabe@aktux>
References: 
 <CAFEAcA88UGhjh8-iBvhxx6GdWg74dinYouiguTcz=qEe51L7Ag@mail.gmail.com>
 <fe5476c7-82e0-4353-a943-7f39b14e1b5b@roeck-us.net>
 <CAFEAcA-bqOM4Ptws-tsEwo2HDZ6YSX1Y+xGkR0WueRD_dUd0+Q@mail.gmail.com>
 <7bd858a2-9983-4ddf-8749-09c9b2e261f9@roeck-us.net>
 <fbab8e59-6d2d-4193-a5ca-9fea3c524229@app.fastmail.com>
 <CACRpkdbmJe8ZE7N0p_utWucyw+3mp1Qrb0bQEKcJPmwNFtVA_g@mail.gmail.com>
 <CALT56yOT_U9jVkhTP=zZu-32B4pta5zaJocn9695N7ari4cFyQ@mail.gmail.com>
 <be4038e1-a578-4439-a9bf-e936484c64cc@app.fastmail.com>
 <20240215093113.5c58cabe@aktux>
Date: Thu, 15 Feb 2024 09:45:11 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Andreas Kemnade" <andreas@kemnade.info>
Cc: "Dmitry Baryshkov" <dbaryshkov@gmail.com>,
 "Linus Walleij" <linus.walleij@linaro.org>, paul.eggleton@linux.intel.com,
 "Andrea Adami" <andrea.adami@gmail.com>,
 "Guenter Roeck" <linux@roeck-us.net>,
 "Peter Maydell" <peter.maydell@linaro.org>,
 "QEMU Developers" <qemu-devel@nongnu.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 "Marcin Juszkiewicz" <marcin.juszkiewicz@linaro.org>,
 "Aaro Koskinen" <aaro.koskinen@iki.fi>,
 "Janusz Krzysztofik" <jmkrzyszt@gmail.com>,
 "Tony Lindgren" <tony@atomide.com>, Linux-OMAP <linux-omap@vger.kernel.org>,
 "Daniel Mack" <daniel@zonque.org>, "Robert Jarzmik" <robert.jarzmik@free.fr>,
 "Haojian Zhuang" <haojian.zhuang@gmail.com>,
 "Stefan Lehner" <stefan-lehner@aon.at>
Subject: Re: possible deprecation and removal of some old QEMU Arm machine types
 (pxa2xx, omap, sa1110)
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 15, 2024, at 09:31, Andreas Kemnade wrote:
> On Wed, 14 Feb 2024 23:42:58 +0100
> "Arnd Bergmann" <arnd@arndb.de> wrote:
>> On Wed, Feb 14, 2024, at 13:26, Dmitry Baryshkov wrote:
>> > On Tue, 13 Feb 2024 at 23:22, Linus Walleij <linus.walleij@linaro.o=
rg> wrote: =20
>> >> On Tue, Feb 13, 2024 at 9:12=E2=80=AFPM Arnd Bergmann <arnd@arndb.=
de> wrote: =20
>> >> > On Tue, Feb 13, 2024, at 16:36, Guenter Roeck wrote: =20
>> >> > > On Tue, Feb 13, 2024 at 03:14:21PM +0000, Peter Maydell wrote:=
 =20
>> >>
>> >> Andrea Adami and Dmitry Eremin-Solenikov did the work in 2017 to
>> >> modernize it a bit, and Russell helped out. I was under the impres=
sion
>> >> that they only used real hardware though! =20
>> >
>> > I used both Qemu and actual hardware (having collie, poodle, tosa a=
nd
>> > c860 that was easy).
>> >
>> > The biggest issue with Zaurus PDAs was that supporting interesting
>> > parts of the platform (PCMCIA, companion chips) required almost
>> > rebootstrapping of the corresponding drivers.
>> > E.g. I had a separate driver for the LoCoMo chip which worked prope=
rly
>> > with the DT systems.
>> > PCMCIA was a huuuge trouble and it didn't play well at all. The dri=
ver
>> > must be rewritten to use the component framework. =20
>>=20
>> If we want to actually go there, I think the best option for PCMCIA
>> support is likely to replace the entire "soc_common" pcmcia driver
>> with a simple drivers/pata/ storage driver and no support for
>> other cards. There was a driver until commit 38943cbd25a2
>> ("ata: remove palmld pata driver") that could serve as an
>> template.
>>=20
> hmm, main usage for PCMCIA/CF in those devices was often something els=
e,
> not storage, at least on the IPAQ h2200. Wondering wether that road is
> actually good. When I was mainly using those devices, I was not good in
> mainlining things.

Do we still support any non-storage CF devices that someone might
actually use? Do you have a specific example in mind? These are
the currently supported devices that I see:

git grep -B4 -w depends.*PCMCIA | grep "Kconfig-\(config\|menuconfig\)" =
| grep -v ^drivers/pcmcia
drivers/ata/Kconfig-config PATA_PCMCIA
drivers/bluetooth/Kconfig-config BT_HCIDTL1
drivers/bluetooth/Kconfig-config BT_HCIBT3C
drivers/bluetooth/Kconfig-config BT_HCIBLUECARD
drivers/comedi/Kconfig-menuconfig COMEDI_PCMCIA_DRIVERS
drivers/mmc/host/Kconfig-config MMC_SDRICOH_CS
drivers/mtd/maps/Kconfig-config MTD_PCMCIA
drivers/mtd/maps/Kconfig-config MTD_PCMCIA_ANONYMOUS
drivers/net/arcnet/Kconfig-menuconfig ARCNET
drivers/net/arcnet/Kconfig-config ARCNET_COM20020_CS
drivers/net/can/sja1000/Kconfig-config CAN_EMS_PCMCIA
drivers/net/can/sja1000/Kconfig-config CAN_PEAK_PCMCIA
drivers/net/can/softing/Kconfig-config CAN_SOFTING_CS
drivers/net/ethernet/3com/Kconfig-config NET_VENDOR_3COM
drivers/net/ethernet/3com/Kconfig-config PCMCIA_3C574
drivers/net/ethernet/3com/Kconfig-config PCMCIA_3C589
drivers/net/ethernet/8390/Kconfig-config PCMCIA_AXNET
drivers/net/ethernet/8390/Kconfig-config APNE
drivers/net/ethernet/8390/Kconfig-config PCMCIA_PCNET
drivers/net/ethernet/amd/Kconfig-config PCMCIA_NMCLAN
drivers/net/ethernet/fujitsu/Kconfig-config NET_VENDOR_FUJITSU
drivers/net/ethernet/fujitsu/Kconfig-config PCMCIA_FMVJ18X
drivers/net/ethernet/smsc/Kconfig-config PCMCIA_SMC91C92
drivers/net/ethernet/xircom/Kconfig-config NET_VENDOR_XIRCOM
drivers/net/ethernet/xircom/Kconfig-config PCMCIA_XIRC2PS
drivers/parport/Kconfig-config PARPORT_PC_PCMCIA
drivers/scsi/pcmcia/Kconfig-menuconfig SCSI_LOWLEVEL_PCMCIA
drivers/ssb/Kconfig-config SSB_PCMCIAHOST_POSSIBLE
drivers/tty/Kconfig-config IPWIRELESS
drivers/tty/serial/8250/Kconfig-config SERIAL_8250_CS
drivers/usb/host/Kconfig-config USB_SL811_CS
sound/pcmcia/Kconfig-menuconfig SND_PCMCIA

     Arnd

