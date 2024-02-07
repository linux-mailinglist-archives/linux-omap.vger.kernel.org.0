Return-Path: <linux-omap+bounces-527-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C86284CC1D
	for <lists+linux-omap@lfdr.de>; Wed,  7 Feb 2024 14:55:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B1619B264F8
	for <lists+linux-omap@lfdr.de>; Wed,  7 Feb 2024 13:55:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56CD67A70F;
	Wed,  7 Feb 2024 13:55:08 +0000 (UTC)
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D7D67CF00;
	Wed,  7 Feb 2024 13:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707314108; cv=none; b=AJ/8vIwVxN6e+bvUO+fYM76MTI9Kn2bzWCJQPiUG6AVSq/enmAQjnO1MxqciljzRk0zE9JcPpLILf1H/ac4akE+j6mtDYGvOozQOyRx6Mfxv1bQctDxuN3aShh/LCmlAIZub4qgo2nRO0e/KmfHKqrPBfBy1r7Auxx+NktVJ4V0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707314108; c=relaxed/simple;
	bh=Kv1GYc7qEdd/QhJJiBR2Ytr6tTJPLvWnKjkrnJGcSxQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nNSFxqVKHAicHpl51TbTzv4oyoEXphOplLizr//jOrCKKWI1yF5izH8SMZWPvzSc3CNQsx08JpHHkfqJyWruE3vBp6E50l/A4Wbh9KDeltan6DydjuPJYOrKCSPcctxyO/6NKyD922TyZSQ0pnD81HCvb9Y/iuSjklbCg4LXj6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07488C433F1;
	Wed,  7 Feb 2024 13:54:58 +0000 (UTC)
Message-ID: <9bc65445-8f50-4227-ad3c-04dd32832419@xs4all.nl>
Date: Wed, 7 Feb 2024 14:54:56 +0100
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] media: i2c: replace of_graph_get_next_endpoint()
Content-Language: en-US, nl
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 =?UTF-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Alexey Brodkin <abrodkin@synopsys.com>, Alim Akhtar
 <alim.akhtar@samsung.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Daniel Vetter <daniel@ffwll.ch>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@gmail.com>, Eugen Hristev
 <eugen.hristev@collabora.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Helge Deller <deller@gmx.de>, Hugues Fruchet <hugues.fruchet@foss.st.com>,
 Jacopo Mondi <jacopo@jmondi.org>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Russell King <linux@armlinux.org.uk>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Sam Ravnborg
 <sam@ravnborg.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Tim Harvey <tharvey@gateworks.com>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-fbdev@vger.kernel.org, linux-media@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
References: <87ttmmnvzh.wl-kuninori.morimoto.gx@renesas.com>
 <87r0hqnvxc.wl-kuninori.morimoto.gx@renesas.com>
 <20240206134155.GB2827@pendragon.ideasonboard.com>
 <9d1e99b0-892d-4a72-a9b3-886b8ed094b0@xs4all.nl> <m3eddoza9y.fsf@t19.piap.pl>
 <20240207135152.GG2827@pendragon.ideasonboard.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20240207135152.GG2827@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07/02/2024 14:51, Laurent Pinchart wrote:
> On Wed, Feb 07, 2024 at 02:14:33PM +0100, Krzysztof Hałasa wrote:
>> Hans,
>>
>> Hans Verkuil <hverkuil-cisco@xs4all.nl> writes:
>>
>>> Ideally someone would have to actually test this, perhaps with one of those
>>> Renesas boards. While I do have one, it got bricked after I attempted a
>>> u-boot update :-(
>>
>> May be reversible, though.
> 
> Maybe Morimoto-san could help ? :-) What board did you use Hans ?
> 

I have a Koelsch. I tried to update uboot at one time, but bricked it and was
unable to get a different uboot installed.

It would be nice if it can be revived.

Regards,

	Hans

