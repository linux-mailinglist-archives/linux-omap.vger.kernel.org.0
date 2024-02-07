Return-Path: <linux-omap+bounces-525-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7953684CB5E
	for <lists+linux-omap@lfdr.de>; Wed,  7 Feb 2024 14:20:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 165E81F2777A
	for <lists+linux-omap@lfdr.de>; Wed,  7 Feb 2024 13:20:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38FF477F0A;
	Wed,  7 Feb 2024 13:20:21 +0000 (UTC)
X-Original-To: linux-omap@vger.kernel.org
Received: from ni.piap.pl (ni.piap.pl [195.187.100.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3AE176C7C;
	Wed,  7 Feb 2024 13:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.187.100.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707312021; cv=none; b=Cx5wyv/cSy8tZIVBMfnHxx6dWrCQ+j7PaUuS6VoUjuSkbdRW2qs3OridxlR9tMjD/LaMm/GgpNcCcFNOWCd5ko53qZs4oN1Eyis9eNEbxr1udZrW8MWUfwF67YJskNkdSJPRZMzAjUUdnJyKI8DtHG5JQSr1Yd24RRZMCwn0MJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707312021; c=relaxed/simple;
	bh=9XbXN2HqJLMraSRllZfM8SB0u4PwD0X20StBBC/8AV8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Miiy1ge9jVKObNwYE+OOCSZJDUYSlHmQsCmlUdktPkL5EBoTpQwlFRWQL3GqmVeEJ6kHx1WkZxeDCdGF69Waq+PSHJFQdk0qhbq/WsSYeaBSRs42dfvCTPAWzfgoCdIA3iC0orFe4/DZWhVVPKawWQoeexM5KF+4f7WPDFZj3HI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=piap.pl; spf=pass smtp.mailfrom=piap.pl; arc=none smtp.client-ip=195.187.100.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=piap.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=piap.pl
Received: from t19.piap.pl (OSB1819.piap.pl [10.0.9.19])
	by ni.piap.pl (Postfix) with ESMTPS id 2CA3FC3F2A57;
	Wed,  7 Feb 2024 14:13:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 ni.piap.pl 2CA3FC3F2A57
From: =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,  Hans Verkuil
 <hverkuil-cisco@xs4all.nl>,  "Lad, Prabhakar"
 <prabhakar.csengg@gmail.com>,  =?utf-8?Q?Uwe_Kleine-K=C3=B6nig?=
 <u.kleine-koenig@pengutronix.de>,  Alexandre Belloni
 <alexandre.belloni@bootlin.com>,  Alexandre Torgue
 <alexandre.torgue@foss.st.com>,  Alexey Brodkin <abrodkin@synopsys.com>,
  Alim Akhtar <alim.akhtar@samsung.com>,  Andrzej Hajda
 <andrzej.hajda@intel.com>,  Biju Das <biju.das.jz@bp.renesas.com>,
  Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,  Claudiu Beznea
 <claudiu.beznea@tuxon.dev>,  Daniel Vetter <daniel@ffwll.ch>,  Dave
 Stevenson <dave.stevenson@raspberrypi.com>,  David Airlie
 <airlied@gmail.com>,  Eugen Hristev <eugen.hristev@collabora.com>,
  Florian Fainelli <florian.fainelli@broadcom.com>,  Helge Deller
 <deller@gmx.de>,  Hugues Fruchet <hugues.fruchet@foss.st.com>,  Jacopo
 Mondi <jacopo@jmondi.org>,  Jessica Zhang <quic_jesszhan@quicinc.com>,
  Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,  Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,  Mauro Carvalho Chehab
 <mchehab@kernel.org>,  Maxime Coquelin <mcoquelin.stm32@gmail.com>,
  Maxime Ripard <mripard@kernel.org>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Nicolas Ferre <nicolas.ferre@microchip.com>,
  Russell King <linux@armlinux.org.uk>,  Sakari Ailus
 <sakari.ailus@linux.intel.com>,  Sam Ravnborg <sam@ravnborg.org>,
  Sylwester Nawrocki <s.nawrocki@samsung.com>,  Thomas Zimmermann
 <tzimmermann@suse.de>,  Tim Harvey <tharvey@gateworks.com>,
  dri-devel@lists.freedesktop.org,  linux-arm-kernel@lists.infradead.org,
  linux-fbdev@vger.kernel.org,  linux-media@vger.kernel.org,
  linux-omap@vger.kernel.org,  linux-rpi-kernel@lists.infradead.org,
  linux-samsung-soc@vger.kernel.org,
  linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 2/4] media: i2c: replace of_graph_get_next_endpoint()
In-Reply-To: <20240206134155.GB2827@pendragon.ideasonboard.com> (Laurent
	Pinchart's message of "Tue, 6 Feb 2024 15:41:55 +0200")
References: <87ttmmnvzh.wl-kuninori.morimoto.gx@renesas.com>
	<87r0hqnvxc.wl-kuninori.morimoto.gx@renesas.com>
	<20240206134155.GB2827@pendragon.ideasonboard.com>
Sender: khalasa@piap.pl
Date: Wed, 07 Feb 2024 14:13:05 +0100
Message-ID: <m3il30zace.fsf@t19.piap.pl>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-KLMS-Rule-ID: 3
X-KLMS-Message-Action: skipped
X-KLMS-AntiSpam-Status: not scanned, whitelist
X-KLMS-AntiPhishing: not scanned, whitelist
X-KLMS-AntiVirus: Kaspersky Security for Linux Mail Server, version 8.0.3.30, not scanned, whitelist

Laurent,

Laurent Pinchart <laurent.pinchart@ideasonboard.com> writes:

>> +++ b/drivers/media/i2c/adv7604.c
>> @@ -3205,7 +3205,7 @@ static int adv76xx_parse_dt(struct adv76xx_state *=
state)
>>       np =3D state->i2c_clients[ADV76XX_PAGE_IO]->dev.of_node;
>>
>>       /* Parse the endpoint. */
>> -     endpoint =3D of_graph_get_next_endpoint(np, NULL);
>> +     endpoint =3D of_graph_get_endpoint_by_regs(np, 0, -1);
>
> I think this should be port 1 for the adv7611 and port2 for the adv7612.
> The adv7610 may need to use port 1 too, but the bindings likely need to
> be updated.

To be honest I have no idea about ADV7611 and 7612.
The 7610 I have on Tinyrex "mobo" seems to be single port.

ADV7611 seems to be mostly a 7610 in a different package (LQFP 64
instead of some BGA 76). The driver simply treats ADV7610 as a 7611.

ADV7612 is apparently dual port (only one port can be used at a time)
though:

[ADV7612] =3D {
        .type =3D ADV7612,
        .has_afe =3D false,
        .max_port =3D ADV76XX_PAD_HDMI_PORT_A,    /* B not supported */
        .num_dv_ports =3D 1,                      /* normally 2 */


All related in-tree DTS entries (as of v6.8.0-rc1) seem to be ADV7612.

To me it seems all known devices use the first port only.
--=20
Krzysztof "Chris" Ha=C5=82asa

Sie=C4=87 Badawcza =C5=81ukasiewicz
Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
Al. Jerozolimskie 202, 02-486 Warszawa

