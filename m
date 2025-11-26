Return-Path: <linux-omap+bounces-5038-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3AFC8B3F5
	for <lists+linux-omap@lfdr.de>; Wed, 26 Nov 2025 18:39:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 87226345A13
	for <lists+linux-omap@lfdr.de>; Wed, 26 Nov 2025 17:39:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A443B340A69;
	Wed, 26 Nov 2025 17:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="dbOe6nvT"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45C2B34026B;
	Wed, 26 Nov 2025 17:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764178616; cv=none; b=ifxsO8UwYQkLGvGWnhprk2FwASWXnjMnkNHgpltwzeeIPuBI5eO0CQyy2vLfaukA6YF1yby2Fh0UlAkCa9OAm4AHPi236DKo/cOkVHcpI6LnHTtGkpp0QclL4jgdhogla//QcedlZQALZ/ZZ1TTFMnD7v9owIXuagpffak8oneU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764178616; c=relaxed/simple;
	bh=35hEHjwEAu2u+NrlDnWa+uc4uMBasamSA3A1Kisq66o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZYxX1dvX3exf1T59+ShD1/XACNPlpFxEqy/yEDbnv+de5EUH1+yD4TIHjiPupBjgGJsAmmOauoEtpXQyB5UfwsIBZYcMBykAilJaTwd9FVIOyVyVMy1aKBtug5eiYpUJT1c+4XUos0Tf/do3o9aD3M7OiEtU5mR/FQ0LxUv6fLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=dbOe6nvT; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 653271A1D87;
	Wed, 26 Nov 2025 17:36:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 37ED460721;
	Wed, 26 Nov 2025 17:36:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C1501102F2334;
	Wed, 26 Nov 2025 18:36:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764178610; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=8TfK+4PegTpbC0dzvRLmi5aNfYCQa5XXLe69RiPnQcY=;
	b=dbOe6nvTTRT3KyxTM0HZMVyjYxjsxEVyjrBR2sL0RV3JL/toUrH7apvFsou7CQSCyf+bVf
	Asoyscn89JIcI5txhm/zJ1Iu4GjPsKjKSIzB3sPyuWDxGYEbl2OWN2U91hd1+Xay2Lp+oY
	b3ZHwEyv9bzLzRGdcBj/3z7deDxy3PhUlKtAljDKtLoloZSrnf+C2LOgCnEAAAj2PIjGIE
	Mr9xnaDiR+swuF8PCQjwYvH5aUXC/gqV+NNzndsSGaPlZeJ/lIKYeI+Ei+tKoHo7l35nvL
	JALtExV+DFvkXaKBhRCoHlKl58B0+MLKkD7dhY8x9/fqK9C+I2D67PinkipMiA==
From: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
Date: Wed, 26 Nov 2025 18:35:44 +0100
Subject: [PATCH 02/21] dt-bindings: display: tilcdc: Add fifo-threshold
 property
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-feature_tilcdc-v1-2-49b9ef2e3aa0@bootlin.com>
References: <20251126-feature_tilcdc-v1-0-49b9ef2e3aa0@bootlin.com>
In-Reply-To: <20251126-feature_tilcdc-v1-0-49b9ef2e3aa0@bootlin.com>
To: Jyri Sarha <jyri.sarha@iki.fi>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Tony Lindgren <tony@atomide.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Markus Schneider-Pargmann <msp@baylibre.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Miguel Gazquez <miguel.gazquez@bootlin.com>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-omap@vger.kernel.org, 
 "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

Add the fifo-threshold property to control the DMA FIFO threshold level,
which specifies the number of words that must be loaded before the DMA
FIFO becomes ready.

This property is needed to support the da850-evm board configuration
which requires a non-default FIFO threshold value. Currently, this value
is specified through the deprecated ti,tilcdc,panel binding. Adding this
property to the tilcdc binding allows for proper configuration while
migrating away from the non-standard panel binding.

The default value is 8 words, with valid values being powers of 2 from
8 to 512.

Related commit: 55da73fa7a68c ("ARM: dts: davinci: da850-evm: Increase
fifo threshold")

Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
---
 Documentation/devicetree/bindings/display/tilcdc/tilcdc.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/tilcdc/tilcdc.yaml b/Documentation/devicetree/bindings/display/tilcdc/tilcdc.yaml
index 34ac1fd04d5c6..bf6d506e25e17 100644
--- a/Documentation/devicetree/bindings/display/tilcdc/tilcdc.yaml
+++ b/Documentation/devicetree/bindings/display/tilcdc/tilcdc.yaml
@@ -46,6 +46,13 @@ properties:
       The maximum pixel clock that can be supported by the lcd controller
       in KHz.
 
+  fifo-threshold:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [8, 16, 32, 64, 128, 256, 512]
+    description:
+      Number of words loaded before the DMA fifo becomes ready. The default
+      value is 8.
+
   blue-and-red-wiring:
     enum: [straight, crossed]
     description:

-- 
2.43.0


