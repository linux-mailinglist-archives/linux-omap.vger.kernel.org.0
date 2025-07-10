Return-Path: <linux-omap+bounces-4086-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3291CB00FCE
	for <lists+linux-omap@lfdr.de>; Fri, 11 Jul 2025 01:43:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 06DDE160C60
	for <lists+linux-omap@lfdr.de>; Thu, 10 Jul 2025 23:43:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CA6F307488;
	Thu, 10 Jul 2025 23:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KWLsEdq3"
X-Original-To: linux-omap@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54CC82E62C7
	for <linux-omap@vger.kernel.org>; Thu, 10 Jul 2025 23:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752190961; cv=none; b=Wp/sDTcay/KqqMBWGQwRGRFaJ7NmADE3NeuTv9t51JBRKsZX+Afi5XFShOd9oBlMvf+Wah/87MjPEgTHgIJzj3rZtDfrnu/hsG/AMkeAfpNuVBgVFLvz9ieo10VTujA8rWMAdKG9P4k64gb4epWEiOlmzSm9mljfRFwTAY7ri2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752190961; c=relaxed/simple;
	bh=EUcAkc+MwYYvI7xJQeU4DcisuArrrCwBemUDYG66Ivw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oOSl8RpJXghpGS4ll4rlJw8w7XfS7kol6cgKv6LLzcR02F+ycehCFVSE1pxc8u/NUPi4GKm01v5KjzdMH5ffO47GAVfRFDkeAnA8c1dX8H40zZE334iRLU0+F6mXF8sbGnif/pJJk1B1xzCCEg7vOow65tUg4ux/fr5gbiBI/6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KWLsEdq3; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752190959;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VCr73Arn7lW8l2qhlI4qEFhffjvPwgr/9jG/meQTRwk=;
	b=KWLsEdq32MZRRMTd3Cfuf0/DmiODN/Oq2OS6ZBmeBTJAT7lK9tAQTsMOjHwzOLf39Y6FaL
	cEYHeq0FyMFKHSYtH/Bbr7K2lXzgtBPB95VWsVcPAYb3UAQ9tb38Me48j56Wm7bO6UhvUA
	j5YacV0S4ztxqyWI6SNwFpUbkQnAnEE=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-670-6Ers_Q3ENAWv89tHPuG8VA-1; Thu, 10 Jul 2025 19:42:38 -0400
X-MC-Unique: 6Ers_Q3ENAWv89tHPuG8VA-1
X-Mimecast-MFC-AGG-ID: 6Ers_Q3ENAWv89tHPuG8VA_1752190958
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6fd3aeb2825so46689356d6.3
        for <linux-omap@vger.kernel.org>; Thu, 10 Jul 2025 16:42:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752190957; x=1752795757;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VCr73Arn7lW8l2qhlI4qEFhffjvPwgr/9jG/meQTRwk=;
        b=wO2DK23PyEsHvOFQ2DvXhTMBqjxsPexl3ZR+dE6U2WghMC5rhWROdIR8lRfI8pgPPz
         VLzOdmVrTQU//IMPBDbmDcBv2cVHb3LNuRiZczvvSYFNiPDl2zs9gJvlp1/gH+rUILcl
         ELBxnz3IY39Z/3uKrIAZy58Qn2ZIoYEHn5t4qswqCQQaf6WQEtX5FauLvB1ABqv5rs1U
         e0rR6M6FlzquZibU5eTrmxn26yZDm3JcWEKuO1wL+/UAlh+6Vz9ZlFSC0dkzrMJWCR0m
         V21sdZHb3NQUMM4hjnBGK3xeKdtx4VyxelR5jZjtLKY43pIIjXvFQWjiaLbCXiSLSvGC
         OUhA==
X-Forwarded-Encrypted: i=1; AJvYcCVxiUalspcbwM8uyvwvlZ9KYyR0pIh33hionCcpNv31wYi/IWdaiea3IjDALd7cnSUd9CMSj3Tv90D/@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3GI5VLX46+PaqJSBfjmPuGr0msKEybi4fVYCZ5uwgwa/ntYDg
	8tH/iF8PavpG2W6q2l9Ivm0cUNhGg7ZNyGQZ63zMs5R86Ki+5VIQ6Gg/HzRinVLSph1c+R3juo/
	DzAIGelJ3W0cqyF6MljD5hQF70lOTFJvXROmemUqRUWTfuwGjcnDB95KqPqK1hD8=
X-Gm-Gg: ASbGncsuVJvt+rXEGSoh3x22RsnP70PH/55qAlTPhlzP6LVwiUuxRN5JDw6Kzojg3m8
	dSz/0/CcVNj71G00IEoMihL4be3c+SJNyb/iPKBhZmIiWPINcszKQlQe8XlOY03w+7zXOch/cgH
	Hi9+V4Ia8bssk1BLkQFnw5z5ZU2tdDnP7Fo854yGO9rV1rMxrnFy1GlmhvdGB2nQDxxV+tBEXf9
	Bn+IlbGpPFmBU6StFuO7BQRSzYkLNV/vpKWLUYDcCZV/jpt7rBf3GD/pgTvXAb75GtB0wGS5ueM
	u2qwgyI8rS2BnzohvUXViqkw2t694OJT38AS92pH19TC2vQ6eBJr3gquC4jglZabvJOxgGYk7Qn
	BNqk=
X-Received: by 2002:ad4:5b82:0:b0:6fd:3a4d:363a with SMTP id 6a1803df08f44-704a359027fmr22077606d6.25.1752190957607;
        Thu, 10 Jul 2025 16:42:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGLz6ZETzSGQzjCyDHW99TpL/CMMlr/fLIeK9Mwj1zXQh8KrDMwNBRoioYOOVVqlEpleU2jMA==
X-Received: by 2002:ad4:5b82:0:b0:6fd:3a4d:363a with SMTP id 6a1803df08f44-704a359027fmr22077216d6.25.1752190957272;
        Thu, 10 Jul 2025 16:42:37 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7dcde422e03sm153989385a.69.2025.07.10.16.42.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 16:42:36 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 19:42:17 -0400
Subject: [PATCH 2/3] ARM: OMAP2+: clock: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-arm32-clk-round-rate-v1-2-a9146b77aca9@redhat.com>
References: <20250710-arm32-clk-round-rate-v1-0-a9146b77aca9@redhat.com>
In-Reply-To: <20250710-arm32-clk-round-rate-v1-0-a9146b77aca9@redhat.com>
To: Paul Walmsley <paul@pwsan.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-omap@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752190949; l=1927;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=EUcAkc+MwYYvI7xJQeU4DcisuArrrCwBemUDYG66Ivw=;
 b=N+7e5WUdWe0eSqdVYYqPWF410agqUBM3oaZotQ0G8zXJXUkdVBjHFser4LNyGdI4AwRnWbRfy
 5UkEbXLMQmiAkXM1KekVeBLxlTf9LNC8v14IEIyHzxm7lTWB1d0OHWe
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

The change to virt_prcm_set_ops had to be made manually.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 arch/arm/mach-omap2/clkt2xxx_virt_prcm_set.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/arch/arm/mach-omap2/clkt2xxx_virt_prcm_set.c b/arch/arm/mach-omap2/clkt2xxx_virt_prcm_set.c
index 011076a5952f0bfb24eadd13b8991b41b8115bae..96c5cdc718c8b9449a4372e1bb83582eaa91440e 100644
--- a/arch/arm/mach-omap2/clkt2xxx_virt_prcm_set.c
+++ b/arch/arm/mach-omap2/clkt2xxx_virt_prcm_set.c
@@ -70,8 +70,8 @@ static unsigned long omap2_table_mpu_recalc(struct clk_hw *clk,
  * Some might argue L3-DDR, others ARM, others IVA. This code is simple and
  * just uses the ARM rates.
  */
-static long omap2_round_to_table_rate(struct clk_hw *hw, unsigned long rate,
-			       unsigned long *parent_rate)
+static int omap2_determine_rate_to_table(struct clk_hw *hw,
+					 struct clk_rate_request *req)
 {
 	const struct prcm_config *ptr;
 	long highest_rate;
@@ -87,10 +87,12 @@ static long omap2_round_to_table_rate(struct clk_hw *hw, unsigned long rate,
 		highest_rate = ptr->mpu_speed;
 
 		/* Can check only after xtal frequency check */
-		if (ptr->mpu_speed <= rate)
+		if (ptr->mpu_speed <= req->rate)
 			break;
 	}
-	return highest_rate;
+	req->rate = highest_rate;
+
+	return 0;
 }
 
 /* Sets basic clocks based on the specified rate */
@@ -215,7 +217,7 @@ static void omap2xxx_clkt_vps_late_init(void)
 static const struct clk_ops virt_prcm_set_ops = {
 	.recalc_rate	= &omap2_table_mpu_recalc,
 	.set_rate	= &omap2_select_table_rate,
-	.round_rate	= &omap2_round_to_table_rate,
+	.determine_rate = &omap2_determine_rate_to_table,
 };
 
 /**

-- 
2.50.0


