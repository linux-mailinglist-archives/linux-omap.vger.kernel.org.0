Return-Path: <linux-omap+bounces-524-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D7384CB46
	for <lists+linux-omap@lfdr.de>; Wed,  7 Feb 2024 14:14:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2FB6D29083E
	for <lists+linux-omap@lfdr.de>; Wed,  7 Feb 2024 13:14:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 735D576C6E;
	Wed,  7 Feb 2024 13:14:38 +0000 (UTC)
X-Original-To: linux-omap@vger.kernel.org
Received: from ni.piap.pl (ni.piap.pl [195.187.100.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F735A0F1;
	Wed,  7 Feb 2024 13:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.187.100.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707311678; cv=none; b=UaUCHlnC6V+Hnn8GD+0EC5k1K8afCptELrXyBdbhNjmbjgx8B9i2vTpyYUJXUTjO8L+pdNtQ64FnVWBCrE58gGD61mSkxkW9tN+GpjBYYPoEAVGrcKeXUPeEXObuq+ZmohtaZ3cIkcBEmr3Lw5MihIJloUcc0mysbGTNA39egSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707311678; c=relaxed/simple;
	bh=49JTY3sNMNqzNRYaGD0Us16tlkRQVcvuPjaeHDJ9xuc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=FEG5Y9u5Te5MVJPnJ9QTzwBsF7yTauhw42mubV8J0fApSqwr0dITyOavU0285/m3XKk5q3HjcOMgsE3j4mOJUcJMgjmg4nevDWkft7wbhF2wCeGa4giZbeH30R/Rgv5jfunh0kgYohLvzN6WwseCA1qz3P0jPkY/2CiZoIJR9yM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=piap.pl; spf=pass smtp.mailfrom=piap.pl; arc=none smtp.client-ip=195.187.100.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=piap.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=piap.pl
Received: from t19.piap.pl (OSB1819.piap.pl [10.0.9.19])
	by ni.piap.pl (Postfix) with ESMTPS id 9C86DC3F2A7D;
	Wed,  7 Feb 2024 14:14:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 ni.piap.pl 9C86DC3F2A7D
From: =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,  Kuninori Morimoto
 <kuninori.morimoto.gx@renesas.com>,  "Lad, Prabhakar"
 <prabhakar.csengg@gmail.com>,  Uwe =?utf-8?Q?Kleine-K=C3=B6nig?=
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
In-Reply-To: <9d1e99b0-892d-4a72-a9b3-886b8ed094b0@xs4all.nl> (Hans Verkuil's
	message of "Tue, 6 Feb 2024 15:44:45 +0100")
References: <87ttmmnvzh.wl-kuninori.morimoto.gx@renesas.com>
	<87r0hqnvxc.wl-kuninori.morimoto.gx@renesas.com>
	<20240206134155.GB2827@pendragon.ideasonboard.com>
	<9d1e99b0-892d-4a72-a9b3-886b8ed094b0@xs4all.nl>
Sender: khalasa@piap.pl
Date: Wed, 07 Feb 2024 14:14:33 +0100
Message-ID: <m3eddoza9y.fsf@t19.piap.pl>
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

Hans,

Hans Verkuil <hverkuil-cisco@xs4all.nl> writes:

> Ideally someone would have to actually test this, perhaps with one of tho=
se
> Renesas boards. While I do have one, it got bricked after I attempted a
> u-boot update :-(

May be reversible, though.
--=20
Krzysztof "Chris" Ha=C5=82asa

Sie=C4=87 Badawcza =C5=81ukasiewicz
Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
Al. Jerozolimskie 202, 02-486 Warszawa

