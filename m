Return-Path: <linux-omap+bounces-4637-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47590B56B96
	for <lists+linux-omap@lfdr.de>; Sun, 14 Sep 2025 21:26:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2E1A93BFA5D
	for <lists+linux-omap@lfdr.de>; Sun, 14 Sep 2025 19:26:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D98D92E06E6;
	Sun, 14 Sep 2025 19:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l4V9BjNL"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A12702DECCD
	for <linux-omap@vger.kernel.org>; Sun, 14 Sep 2025 19:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757877977; cv=none; b=a+hzeZomrGsO9Bsmcfw01VB+itsQhDaVsWL6bXfeOm2bKHjikmwFNHLPCAMH6CrvlXFYMXmOknFGaaJtiZMv/231Bun4AfQ5sM6LzV0tnRX8yi+J4dXF08xHKTYemuO1UUn2ggpNzK2CV1GWF4B8su5gEZck57jNbwnt8/H4bTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757877977; c=relaxed/simple;
	bh=Bwvc4rU78HriKtF+dQxnrLeZu3hmtBcOywpMflC+wr0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PhAEnBUvbfrDsus1ijLKDom4BeUduMg9m0858UzbJX3FyGgafP/vX1c5jx7Riog0J3kW4zXswR2ocescgOBo1F2gji2bWGkA+uh6YxV9o7iiTVjYkCb9C3Wd5v925lz8k+xnZ8AJNq+5jI8CUXEBACrUfg6aNpQWUXhAoEjFWn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l4V9BjNL; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b0787fa12e2so492548466b.2
        for <linux-omap@vger.kernel.org>; Sun, 14 Sep 2025 12:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757877973; x=1758482773; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+tWORggu1OBca7WXmFFjWgrVVhHzQJbGxIik7S26mM0=;
        b=l4V9BjNLhZlpd4omsZNmvmgPSoNxOTVQxMXjz9UqBAyP15KYGyQO9FMvuAcGQteykF
         +AF4f+CdDZXwh/Acgp8/Nrn8uo+fsnlgzaPeJ1uHSqwH+p4WUfefRZSi0g7Gr/2qprjJ
         tUcWfxvywzLNSmd0sU6GHJ6avOmsoV2ItaMd5OZPYYJS3mseXWR0HFnPHSz3c+ol97Gj
         Q2mZnRvge2qrSvtNuqixXrrv3ZxFg/S20HIIprZGCBwjBnVT29rN1byQCBFPjSEMS74L
         I17zTqpY5enWVa83cFhvwVny9zCiiRpNagHonBGep/olBISvgFP8vfA00xFGw6LmHIBb
         AEHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757877973; x=1758482773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+tWORggu1OBca7WXmFFjWgrVVhHzQJbGxIik7S26mM0=;
        b=oxkhv+hfphr9+d2hlYW5o/pp+PlbABYVHEY9FMBwC8UHzOADCHL+iE2onvLIQ5jHVJ
         sonv/4jAvv2rUOaljLRH5Kw3hTYUgEAeFcFmdmXch8EzkKtdA6nM1kW28rrUa9HIAnQg
         j25KP0T5wdiFoYj36SscDx8LkxVb9mbO7O0O07NocZguEg6bX/DhI+1K1MP2SwzILUh/
         E3v6LFP6VbwPozie4CM57KfFVtQZkXxyTlIRFWQlxwHkmQYzfzxNn4gaBKbKhpKjECO+
         799AXSQT1opGp1Sf9rHPcpSVI5O3aMoioQdShI8wtIQW5xxEUL+ptFARiWbGWluH1Wf9
         anAA==
X-Forwarded-Encrypted: i=1; AJvYcCVTDBmEXZv4Agz6AK5/DmjdsFud3+5LRgCvS4xVoal0ErLn6Q00fULw2xuX5N62nkkGCviA7xOIIqa9@vger.kernel.org
X-Gm-Message-State: AOJu0Yzzo9tw3U94zNDKkJbFioLPV4SoaTtzUyRb0GcGRbxuonqJl7Uv
	IDJf/OnVOL26FZJy64Vc/rZrYsAxsM3jyAAYbsdVvigFyKoYXVZ2l4w=
X-Gm-Gg: ASbGnctS9gCFAN8tdXALPjei9WZK3qHAXDjGo+79GH5Ya1tO35auNjzPz0EU2udgtM3
	YS2BJDTHlqnpWUIkLzIVDDKR0of794LkxnFOwi4sPJ75WQwupnL406EgPcybS5VJMvHfI06J9fU
	3uypTYwC6xIFNMa5/Ztgrr52tSKhiEmykEBJOpUxhwgwNXTMV9VQDtgLnppJ+Lb5W19JqV2UDWX
	wde7uSpN0HRKd2w8e4f/ahsvHoBgsnIWxLRbDQjRdQpLJJoFStlM1VkB/uZX3hqzYG8lyLmLToN
	Jgl2kc9PHbZcdZ7Ac+OMnN7pc2VMJj86ntEdntCj9lZc5/+Jmb52TiRcmvW6s3SZvF4eObMV6t9
	LvaEmPi/F8sLydSVMs8czuFhi84uFCId3z4niZdDA058fLhYIzT+8V+76Zg==
X-Google-Smtp-Source: AGHT+IFol1c2OgKrSsYSL0V4fY6x5qf+hsaS07Lg5SpcRo2Kco6q28gBupc4uxTJENFANQGaH+5BLA==
X-Received: by 2002:a17:907:6d0a:b0:aff:fe6:78f0 with SMTP id a640c23a62f3a-b07c3a65e38mr1054189466b.54.1757877972891;
        Sun, 14 Sep 2025 12:26:12 -0700 (PDT)
Received: from localhost.localdomain ([2a0d:e487:226e:7d72:f695:46fd:3aef:7487])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07baf35488sm707841066b.38.2025.09.14.12.26.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 12:26:12 -0700 (PDT)
From: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
To: andreas@kemnade.info
Cc: lee@kernel.org,
	krzk+dt@kernel.org,
	tony@atomide.com,
	robh@kernel.org,
	conor+dt@kernel.org,
	ukleinek@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	linux-omap@vger.kernel.org,
	jihed.chaibi.dev@gmail.com
Subject: [PATCH v8 3/3] ARM: dts: omap3: n900: Correct obsolete TWL4030 power compatible
Date: Sun, 14 Sep 2025 21:25:16 +0200
Message-Id: <20250914192516.164629-4-jihed.chaibi.dev@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250914192516.164629-1-jihed.chaibi.dev@gmail.com>
References: <20250914192516.164629-1-jihed.chaibi.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The "ti,twl4030-power-n900" compatible string is obsolete and is not
supported by any in-kernel driver. Currently, the kernel falls back to
the second entry, "ti,twl4030-power-idle-osc-off", to bind a driver to
this node.

Make this fallback explicit by removing the obsolete board-specific
compatible. This preserves the existing functionality while making the
DTS compliant with the new, stricter 'ti,twl.yaml' binding.

Fixes: daebabd578647 ("mfd: twl4030-power: Fix PM idle pin configuration to not conflict with regulators")
Signed-off-by: Jihed Chaibi <jihed.chaibi.dev@gmail.com>

---
Changes in v8:
 - No changes.

Changes in v7:
 - No changes.

Changes in v6:
 - This patch was added in this version
---
 arch/arm/boot/dts/ti/omap/omap3-n900.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/ti/omap/omap3-n900.dts b/arch/arm/boot/dts/ti/omap/omap3-n900.dts
index c50ca572d1b..7db73d9bed9 100644
--- a/arch/arm/boot/dts/ti/omap/omap3-n900.dts
+++ b/arch/arm/boot/dts/ti/omap/omap3-n900.dts
@@ -508,7 +508,7 @@ twl_audio: audio {
 	};
 
 	twl_power: power {
-		compatible = "ti,twl4030-power-n900", "ti,twl4030-power-idle-osc-off";
+		compatible = "ti,twl4030-power-idle-osc-off";
 		ti,use_poweroff;
 	};
 };
-- 
2.39.5


