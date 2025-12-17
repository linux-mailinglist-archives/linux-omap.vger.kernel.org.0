Return-Path: <linux-omap+bounces-5203-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D397BCC8270
	for <lists+linux-omap@lfdr.de>; Wed, 17 Dec 2025 15:23:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0C9BB301FDD0
	for <lists+linux-omap@lfdr.de>; Wed, 17 Dec 2025 14:23:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62554262FF8;
	Wed, 17 Dec 2025 14:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="LHcy7tbc"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7975189BB6;
	Wed, 17 Dec 2025 14:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765981230; cv=none; b=UmJIs4OCN3qZEuUd2p18ba9ON/ZLUOnx5scEBja3mHMNOFKRUBmj/dGl/M9l9TSRrLQ3Msrthsc2Ch2YDWK4nFbTXE3v8C+aLELj9AlCtQ2PzP04Slale79ZGXlY1wrjkB4CzaFawJ3XSBnJpYB4F8v+gOJbUOwJZSgDY4lHItI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765981230; c=relaxed/simple;
	bh=lipV6v7fH5fDipNaO9oCLAiJc1F30ElMLmfBiS56YRQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=eJflMZPHTp50QkzZtwCUNmR1a9aZG/iwTlIIVrRtQEgPh1KurNapTfoLXHNsX/84NDZh2Nt4JqWGfn3WHvUsqa8Tx2tuaVpcU8P9JzFP7zXfrNlwY9ADbrhPEsxCHZ1ZwLeIpIabZoVu/OqvFnypSokDrW+m/EM/X4V2aoJQwzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=LHcy7tbc; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 1AB454E41C63;
	Wed, 17 Dec 2025 14:20:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D2B406072F;
	Wed, 17 Dec 2025 14:20:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C5F1C102F0AD5;
	Wed, 17 Dec 2025 15:20:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765981219; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=FXeSnaeUCeq2poCC8SB7HwoeEyqC5tY0nRKawuzYQpY=;
	b=LHcy7tbcWgKNnbGmUxOlMOBySmxpFEfq3HpPYCboxqOS0InHSE2jsyLPoDc6g1K2IZE/7t
	3buuqUiZoTVvR0KidqwpqnHZzuKCUrptEpiBRoyQ+XN66Ig72pyOXXTojG9kVBcfJkjeps
	An6pX7EtnKRkGqT25rAc1S1a38lAMmftuJ6bcaNx/7W/7w4s3gmhv6/Hmo2jd27iegZQtk
	lwjk63yzkf+h3o1fjamDFT12Z/8OSL8U62AuB06sLvCQTTeox8gqrmmjCBjcoqZSdvcbtH
	4OAyX3SjocA/4RKzdC1VUi35zIKIQVzSlYEL8nN7+dYicXCQbgjQOJo3UvTMFA==
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 17 Dec 2025 15:20:09 +0100
Message-Id: <DF0K3BRQKOSI.10X5SMXI1YM60@bootlin.com>
To: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>, "Jyri Sarha"
 <jyri.sarha@iki.fi>, "Tomi Valkeinen" <tomi.valkeinen@ideasonboard.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Russell King"
 <linux@armlinux.org.uk>, "Bartosz Golaszewski" <brgl@bgdev.pl>, "Tony
 Lindgren" <tony@atomide.com>, "Andrzej Hajda" <andrzej.hajda@intel.com>,
 "Neil Armstrong" <neil.armstrong@linaro.org>, "Robert Foss"
 <rfoss@kernel.org>, "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>,
 "Jonas Karlman" <jonas@kwiboo.se>, "Jernej Skrabec"
 <jernej.skrabec@gmail.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v2 03/20] drm/tilcdc: Remove simulate_vesa_sync flag
Cc: "Markus Schneider-Pargmann" <msp@baylibre.com>, "Bajjuri Praneeth"
 <praneeth@ti.com>, "Louis Chauvet" <louis.chauvet@bootlin.com>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, "Miguel Gazquez"
 <miguel.gazquez@bootlin.com>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-omap@vger.kernel.org>
X-Mailer: aerc 0.20.1
References: <20251211-feature_tilcdc-v2-0-f48bac3cd33e@bootlin.com>
 <20251211-feature_tilcdc-v2-3-f48bac3cd33e@bootlin.com>
In-Reply-To: <20251211-feature_tilcdc-v2-3-f48bac3cd33e@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3

Hi K=C3=B6ry,

On Thu Dec 11, 2025 at 5:38 PM CET, Kory Maincent (TI.com) wrote:
> The tilcdc hardware does not generate VESA-compliant sync signals. It
> aligns the vertical sync (VS) on the second edge of the horizontal sync
> (HS) instead of the first edge. To compensate for this hardware
> behavior, the driver applies a timing adjustment in mode_fixup().
>
> Previously, this adjustment was conditional based on the simulate_vesa_sy=
nc
> flag, which was only set when using external encoders. This appears
> problematic because:
>
> 1. The timing adjustment seems needed for the hardware behavior regardles=
s
>    of whether an external encoder is used
> 2. The external encoder infrastructure is driver-specific and being
>    removed due to design issues
> 3. Boards using tilcdc without bridges (e.g., am335x-evm, am335x-evmsk)
>    may not be getting the necessary timing adjustments
>
> Remove the simulate_vesa_sync flag and apply the VESA sync timing
> adjustment unconditionally, ensuring consistent behavior across all
> configurations. While it's unclear if the previous conditional behavior
> was causing actual issues, the unconditional adjustment better reflects
> the hardware's characteristics.
>
> Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>

Code looks good. Based on your testing, which covered both boards currently
setting simulate_vesa_sync and boards not setting it:

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Still it would be good to have this series, and especially this patch,
tested by someone having access to other TI boards.

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

