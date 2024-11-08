Return-Path: <linux-omap+bounces-2629-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 502979C261E
	for <lists+linux-omap@lfdr.de>; Fri,  8 Nov 2024 21:05:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DBB11B22BED
	for <lists+linux-omap@lfdr.de>; Fri,  8 Nov 2024 20:05:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 912DD1F26D9;
	Fri,  8 Nov 2024 20:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GecJxOJz"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D52CC1C1F10;
	Fri,  8 Nov 2024 20:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731096318; cv=none; b=UynikV2rv+0dqSi/VrkDv2jac9pnCS4DdBOwH74udjMm4HU1jNjKPN9uRtimRwuQLdJ2hw8hfKERXu8d+ow4pv125RBWZVILwajG+zaLYFsfRLtac2jbs6r7cWwCmi0m6M8m3YHx7AP5HPyw51hzbI2EVfbIM25tp5KtMpIhxPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731096318; c=relaxed/simple;
	bh=ogchk/jy1Xbzknx8MDyyzCqzGlBqyzxAFW5fhFS9KBg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YX/A0BGYm5TJ5eVcdDT2KAvl3y+J/ew/IhQqaDOyqqVKv6FaAVoVeDzsUMq2QHZPwnNenwV8ShihUhkHFOc6aD4gQg9Z5b4zcVcq2NaDNY/kTOvgI6LJGjQ26M0bkK3rEocx7jqB5BgTmfROviBT8e9iqjKKyh1t57DRSCGvII4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GecJxOJz; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-720d5ada03cso2587047b3a.1;
        Fri, 08 Nov 2024 12:05:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731096316; x=1731701116; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9B9/uFLOOn4ZbNcTo/txJrGhuvZT2A1CoYSagunaXMA=;
        b=GecJxOJzb/JNlgYDtTt3FZbW5z/URmF+qfIiMNxF/MVJ7HjxD9mfmxz7Ai3v/iCW5v
         cpCGBcJ5u9+H/+Dg0beFfyfkH7JLe8qhXvMIrCtLNO24Ujud6a+yBp8BP59r/6oWwqh/
         Mgfp/7pREIPLPPT24vMN8EwGSoeot1h/xx8OX+ooiReZ9Ye6j+pnSNdFAkHtornLTsun
         k5xJGPrAU02ojQ76rKzlPd44JFp4glYS+F0fLq7DQ0xyvNWpDPrhaccC4oq8VK0d+Ejy
         6jcZzcdHPCoogA1lQAMPivBklO55o9qU185koV5VZnvym5V2x6lxdCEmK7J96ahSxVct
         qEgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731096316; x=1731701116;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9B9/uFLOOn4ZbNcTo/txJrGhuvZT2A1CoYSagunaXMA=;
        b=r8rz+nL1rgBWLR2rIUCwYXN5mSuVWO/mJf2Xl159PayHeBfB6N+7cK7AQvzinUbx6S
         CMYr2Z5FFB2Z9hRFuIJ/HdsmiWExSk5piSkQZTJGM547taZmYkkD9hkkwtZoafvm8baV
         77aEFb34FKbnzxcVfAtSgfCB2oPi0IIN1L8G0v5tjuYBTnCcA82O3KA5tLxQHAVn6W0y
         XLGIPtTIRDn4Py+MJzrRs/FEPixnbaLlHcTDqq2mANOIqBISJAFk2QgKdj9OBlXzFVV7
         ddEvc8ghu5HvTNf9nCjOaCDayxgjxeh1YN5lV7ExCCvb0/AupjP4z411TzSNlKWfm41t
         wicg==
X-Forwarded-Encrypted: i=1; AJvYcCWemLqlX1Xt6u3kCiaKOynk9nhYQmQXrIS96GPJtdGaEVTOwGhVYpEPqmB4pdMMWi7cI6AmHk106lpOEjfNxlMo@vger.kernel.org, AJvYcCWriG21KLPodTtIBAZkYp0zlKqq1ADbjEwYgw/Bqs4IjOtAva6R43veCueFL/f19tOGjn8p6IEf7rvTZnfD@vger.kernel.org, AJvYcCXjzBYt5eRXh4Ewk1rFVk831pUYgn90o0ntIh1DMfqbfCLJhY7aDp36cJOfBDnxiP7A02oxJA+63JnH@vger.kernel.org
X-Gm-Message-State: AOJu0YyLzXZt6xjq8bm9rpT/mSgAkp6c8U5Jr3WtZdc6w8M1Qmul/w5a
	c2TCML1USMef/j72bKlIsWP3umeyAmzd2Jh8+FJlTZfq1t/bf/LF
X-Google-Smtp-Source: AGHT+IE2Lablg6vylck0Olus5bD9lVpuXjOXJcDcWvk1Zob64wzNSD+el3H/ILETLAkH9z2RBYMEqw==
X-Received: by 2002:a05:6a00:4f93:b0:71e:6c65:e7c4 with SMTP id d2e1a72fcca58-7241339e122mr4768961b3a.26.1731096316086;
        Fri, 08 Nov 2024 12:05:16 -0800 (PST)
Received: from mighty.kangaroo-insen.ts.net ([120.88.183.182])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72407a56a30sm4323418b3a.188.2024.11.08.12.05.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 12:05:15 -0800 (PST)
From: Mithil Bavishi <bavishimithil@gmail.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Mithil Bavishi <bavishimithil@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Thierry Reding <thierry.reding@gmail.com>
Cc: linux-omap@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH v3 03/10] dt-bindings: display: bridge: lvds-codec: add doestek,dtc34lm85am
Date: Fri,  8 Nov 2024 20:04:32 +0000
Message-ID: <20241108200440.7562-4-bavishimithil@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241108200440.7562-1-bavishimithil@gmail.com>
References: <20241108200440.7562-1-bavishimithil@gmail.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add compatible strings for the Doestek DTC34LM85AM Flat Panel Display
Transmitter

Signed-off-by: Mithil Bavishi <bavishimithil@gmail.com>
---
 Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
index 6ceeed76e..a8df7e919 100644
--- a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
@@ -33,6 +33,7 @@ properties:
     oneOf:
       - items:
           - enum:
+              - doestek,dtc34lm85am # For the Doestek DTC34LM85AM Flat Panel Display (FPD) Transmitter
               - ti,ds90c185   # For the TI DS90C185 FPD-Link Serializer
               - ti,ds90c187   # For the TI DS90C187 FPD-Link Serializer
               - ti,sn75lvds83 # For the TI SN75LVDS83 FlatLink transmitter
-- 
2.43.0


