Return-Path: <linux-omap+bounces-3172-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B484CA196B8
	for <lists+linux-omap@lfdr.de>; Wed, 22 Jan 2025 17:42:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 94B6E161190
	for <lists+linux-omap@lfdr.de>; Wed, 22 Jan 2025 16:42:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 845DF2153C3;
	Wed, 22 Jan 2025 16:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I9R+lkrY"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78394149E17;
	Wed, 22 Jan 2025 16:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737564103; cv=none; b=exV5qdTjIfQzNxLnzTckOy+4mnqtGco1AbRIX2hgd5ivIiKve7bZeGEWC9V3FDeCiIMU0Cdk1rMjhSrJJgObSJdA53vRPLUF8SdTNBXtPeIKwWZ2CokYUO2KeoIja4+RCbA2ZbhcLN2FfrTRplsgqQ42zxlc5lsCsz4FdmduiF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737564103; c=relaxed/simple;
	bh=d6UyrRejsmAfm96ju9NgqEy2wiiUs0ECRS5QBVZv7yk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cJhzvrlqESU1ZeBZ3s2Je8VD50pzuYwf+RXYyC2hlin8DDAfzoW4m2AklL1aKOlZqD3vLeChiCYS/HmE1tf97beqOzEM7LI5r70srg7G2sUIvAaNtIlGDS1O1MmJHYY5XleYcmzUL4bIJMmEAw9OW8y20mvvDxV9DazEdllqWGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I9R+lkrY; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5d647d5df90so12002580a12.2;
        Wed, 22 Jan 2025 08:41:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737564100; x=1738168900; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GFopIDpO+r6tipeoCoOKjYN5R3LZIo87O8iXRWy2xZo=;
        b=I9R+lkrYfDDGZzXIJ6tHWhOACWBAs94mepPHV4GoumZ1m3PwtVrtKxzq1LfYmD/6mk
         Csk5WvQFkBMTOAZXhXUwSpia+mb634X5etPXp7cJIoko5X09A54op8qrUh1IMSuweI1p
         atI/mvXEDVBHziBTP4mhBVXM3liE0T6JR8GW2aAHwJ2t6lYkcewpaYd6wGlfmmgZ2kAQ
         PK9o7rerpHtAaHBai6FuJyFylD091LN75cJPPBmfU9kROS6X6qfeN+Frd/Gqvayrcx8+
         d2RYIPZc0bgnm/wYi65cFegvmi3SOHr4Z6MgbqO3n8LmXjQbyTnD83bMxAelO4YsYRq7
         Tr8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737564100; x=1738168900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GFopIDpO+r6tipeoCoOKjYN5R3LZIo87O8iXRWy2xZo=;
        b=FXG0CeDnAemBAzvJQwCKFVnAbCia8hQ5xpNTbs75nJiz9O36IkCX5HNEhHGgojDTVt
         gZrX8oDO/jCpYht4+0pRruoO7ej+SWH8WBUr1mKw0b9uBU8h6uTwLAVXbrS7NRzoULOb
         BRQ43E+5KqDyjP4ECYRi2tNLbTX5N02A5o4CEj0VNyjkMOhOvr4Nk7O7mlUEgzTP5L2U
         POal5VfjaCSynMuUyPKTEodsqm8qJD/deJEngkukMgl3z2MZeOgsC2Jihu8AyaaEW8TH
         OMuLAUHL1ZVcEWX1oXk555xfnMiTnh/TGyn/xW/0NOEcKplW1e8zTNcjBEoK9WBkOvAF
         83Zg==
X-Forwarded-Encrypted: i=1; AJvYcCUkzjVmBYcDnFsxjZeosTRle2Z/VHCIYNvcNW25NJwgo1fp7zT8TRLwk5ynasl4RMb/Zcz4LTQ0AZvd3gU=@vger.kernel.org, AJvYcCUrfSCc9gEJquF6XYdesNyV0/lS3T+5zoeWtj43i1te0rfvaysr607ujb1G/ek8BkG/Gkzsg22HTqhBg1Q=@vger.kernel.org, AJvYcCWOmEMJCQz79hhATX8zU0LWiJZ4GOHv8FCOOj3gFMYdpC0q80HBDSUytAcqinBgnDcegN7t4v9GiD2Z1w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6Amkwsb35qGwINdLcmYlpkw97fwwgOxIVRjqvc3dQjg4r7h1J
	ePPbxjIuZMHgswn3GosWC5zxVJQ/JHOmBrAF3aORmv+guNna3/YJ
X-Gm-Gg: ASbGncvy8OkaqEr7L2T2TrryK1+UtCgxJ2vjamrpWV3OYKtvXBwtQtjqgVVYKMTIt3e
	R8JAFDLjemcpmPDNG/qoHdpLHdQK2VIJDh/nTW/KlPG9HuZHSsm/RhX5SMQiTTQfUe5M4kuIbQE
	ZFEMTOXXt0566LYr5+6YAgRRiNDcYxnhkNClpj+Lb1wj4ktez+MwNF3oFLxWIHmoENvmKm6nZJi
	fBPpbHH5YpQC6ofZ4bW0Sutt4FgI1dGIAt52hn3zR9WWJettTq5xhPSxLa79QTfOa1Kfpq9zGWm
	wpbstGpCls3Ip7yk
X-Google-Smtp-Source: AGHT+IGaWl3R5pzSePJ7g2SzWHz4DTyvSZyHn6h9j0/sOvWSrrQzELuFoFAw7+BqtmWVRdZu0TrxYw==
X-Received: by 2002:a05:6402:42c2:b0:5d3:baa3:29f with SMTP id 4fb4d7f45d1cf-5db7d2f85a3mr20888051a12.9.1737564099491;
        Wed, 22 Jan 2025 08:41:39 -0800 (PST)
Received: from localhost.localdomain ([95.43.220.235])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5db73642580sm8647061a12.15.2025.01.22.08.41.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 08:41:39 -0800 (PST)
From: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Subject: [PATCH v2 1/5] arch: arm: dts: cpcap-mapphone: Set VAUDIO regulator always-on
Date: Wed, 22 Jan 2025 18:41:25 +0200
Message-Id: <20250122164129.807247-2-ivo.g.dimitrov.75@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250122164129.807247-1-ivo.g.dimitrov.75@gmail.com>
References: <20250122164129.807247-1-ivo.g.dimitrov.75@gmail.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

VAUDIO regulator is used by cpcap codec and currently is enabled/disabled
by dapm logic, however, when regulator is turned off, various cpcap
functions (like jack detection) do not work.

Configure VAUDIO regulator-allowed-modes property while at it to enable
low-power regulator mode being set.

Signed-off-by: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
---
 arch/arm/boot/dts/ti/omap/motorola-cpcap-mapphone.dtsi | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/ti/omap/motorola-cpcap-mapphone.dtsi b/arch/arm/boot/dts/ti/omap/motorola-cpcap-mapphone.dtsi
index ea02fd403a9b..83fd58157579 100644
--- a/arch/arm/boot/dts/ti/omap/motorola-cpcap-mapphone.dtsi
+++ b/arch/arm/boot/dts/ti/omap/motorola-cpcap-mapphone.dtsi
@@ -267,6 +267,8 @@ vaudio: VAUDIO {
 		regulator-min-microvolt = <2775000>;
 		regulator-max-microvolt = <2775000>;
 		regulator-enable-ramp-delay = <1000>;
-		regulator-initial-mode = <0x00>; /* NORMAL */
+		regulator-allowed-modes = <0x00>, <0x40>; /* ON, LOW_PWR */
+		regulator-initial-mode = <0x00>; /* ON */
+		regulator-always-on;
 	};
 };
-- 
2.30.2


