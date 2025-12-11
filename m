Return-Path: <linux-omap+bounces-5169-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E8DEDCB568F
	for <lists+linux-omap@lfdr.de>; Thu, 11 Dec 2025 10:49:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CAA443011EDF
	for <lists+linux-omap@lfdr.de>; Thu, 11 Dec 2025 09:47:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D55652FD7AE;
	Thu, 11 Dec 2025 09:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="RGSe8UYm"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C16C32FD690
	for <linux-omap@vger.kernel.org>; Thu, 11 Dec 2025 09:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765446468; cv=none; b=W/RqOrkHNB98MQjRFBt9+sKzB+Eu6z3gkFy5AYMXbmon0nGbhfIBLGeqiMed+aPc5SmKTSnsFqQD/3wjdJJZBueJIy5ZMoIcBdRfJM6fpuGH1jiim4Bzy2OK8SZDZAX9pmd7KgyR1cZ63AO9SDav67kaiN0i+Lej273p+Uw/jDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765446468; c=relaxed/simple;
	bh=5/cZhTyEaxs+cMBKt/g8jpzzvxLdV/3sXD7smW34P3Y=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=iH/4CWlTrT+TRu3Knm9X/k4dh67V0PdAWM+NqXcPUhwqCiXEM+cWkO6lDgGePWORKRuqgwRqnEEy6pRhA6ffKGasULL9YeyPTqn3u6EmnnzHczOV3h3tTR0eTiIsTYAEPBV7PZwPvZcdcayGihVfE+giyP1CipTfOsjxKMJYRwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=RGSe8UYm; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 2F27C1A20E3;
	Thu, 11 Dec 2025 09:47:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F16AA6068C;
	Thu, 11 Dec 2025 09:47:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 06BA9103C8C1E;
	Thu, 11 Dec 2025 10:47:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765446463; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=dEYtoHd6truLlW9dDvvW4TyZqvth1FwMIgnGkOwvmQk=;
	b=RGSe8UYmgqic1d7gzrTAi6DwwYIydD58RU8J6fsmdoC5KlSEJclSPhwA9hemgK7p7TAyxb
	hLGOsvfjj0bVM4vks4oO+w20GsZOAkXbMLifL0QCJxE1oGW36lyEa36v4grMx2+PRF63ir
	inqrCx4Q+I9cc4QXro9EtuXKF14xvgVDPbE8BbAs4ykm46UbcLZCz0AIqjAdpU+rNGnW+5
	0i4s2yiuKa/M8hfjtszF+uB89KxdDZiOmsrjUeeBMHPRyQWlww3fZvYT1Vhw7JTZII4k9P
	ML/tOQlh2X31xmjvB2bAR79Ojdv3x4BY0ox3b2l+56gDER59bOhtr2R0Lf9a3Q==
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 11 Dec 2025 10:47:39 +0100
Message-Id: <DEVAJEYEL7SW.2F8RT465LAL5U@bootlin.com>
Subject: Re: [PATCH 03/21] drm/tilcdc: Remove simulate_vesa_sync flag
Cc: "Jyri Sarha" <jyri.sarha@iki.fi>, "Tomi Valkeinen"
 <tomi.valkeinen@ideasonboard.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Russell King" <linux@armlinux.org.uk>,
 "Bartosz Golaszewski" <brgl@bgdev.pl>, "Tony Lindgren" <tony@atomide.com>,
 "Andrzej Hajda" <andrzej.hajda@intel.com>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Robert Foss" <rfoss@kernel.org>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman"
 <jonas@kwiboo.se>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Markus
 Schneider-Pargmann" <msp@baylibre.com>, "Louis Chauvet"
 <louis.chauvet@bootlin.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, "Miguel Gazquez"
 <miguel.gazquez@bootlin.com>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-omap@vger.kernel.org>
To: "Kory Maincent" <kory.maincent@bootlin.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20251126-feature_tilcdc-v1-0-49b9ef2e3aa0@bootlin.com>
 <20251126-feature_tilcdc-v1-3-49b9ef2e3aa0@bootlin.com>
 <DEUQM2HNEOQU.3K4ZPL44GVZAJ@bootlin.com>
 <20251211104024.1e7d5c42@kmaincent-XPS-13-7390>
In-Reply-To: <20251211104024.1e7d5c42@kmaincent-XPS-13-7390>
X-Last-TLS-Session-Version: TLSv1.3

On Thu Dec 11, 2025 at 10:40 AM CET, Kory Maincent wrote:
> On Wed, 10 Dec 2025 19:10:45 +0100
> "Luca Ceresoli" <luca.ceresoli@bootlin.com> wrote:
>
>> Hi K=C3=B6ry,
>>
>> On Wed Nov 26, 2025 at 6:35 PM CET, Kory Maincent (TI.com) wrote:
>> > The tilcdc hardware does not generate VESA-compliant sync signals. It
>> > aligns the vertical sync (VS) on the second edge of the horizontal syn=
c
>> > (HS) instead of the first edge. To compensate for this hardware
>> > behavior, the driver applies a timing adjustment in mode_fixup().
>> >
>> > Previously, this adjustment was conditional based on the simulate_vesa=
_sync
>> > flag, which was only set when using external encoders. This appears
>> > problematic because:
>> >
>> > 1. The timing adjustment seems needed for the hardware behavior regard=
less
>> >    of whether an external encoder is used
>> > 2. The external encoder infrastructure is driver-specific and being
>> >    removed due to design issues
>> > 3. Boards using tilcdc without bridges (e.g., am335x-evm, am335x-evmsk=
)
>> >    may not be getting the necessary timing adjustments
>> >
>> > Remove the simulate_vesa_sync flag and apply the VESA sync timing
>> > adjustment unconditionally, ensuring consistent behavior across all
>> > configurations. While it's unclear if the previous conditional behavio=
r
>> > was causing actual issues, the unconditional adjustment better reflect=
s
>> > the hardware's characteristics.
>> >
>> > Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
>> > ---
>> >
>> > Only few board currently use tilcdc not associated to a bridge like th=
e
>> > am335x_evm or the am335x-evmsk.
>>
>> Have you tested this change on any affected board?
>>
>> The change looks good to me but without some testing it would be risky.
>
> I have tested it on few boards but not these mainline devicetree as I don=
't
> have them.
>
> I have tested a tilcdc with tda998x bridge (BeagleBone Black), a tilcdc w=
ith
> ti,tilcdc,panel panel (BeagleBone with LCD cape), a tilcdc with it66121 b=
ridge
> (new Beagle Bone Green Eco board with HDMI cape).
> That's all the boards I have.

OK, thanks for the info. For future iterations, I think it's useful to
mention, for all patches that may potentially break existing hardware, such
info on which hardware you have tested.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

