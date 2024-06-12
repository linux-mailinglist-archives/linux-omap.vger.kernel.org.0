Return-Path: <linux-omap+bounces-1523-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 233DB904E52
	for <lists+linux-omap@lfdr.de>; Wed, 12 Jun 2024 10:41:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CCA4C1F219F0
	for <lists+linux-omap@lfdr.de>; Wed, 12 Jun 2024 08:41:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41B0F16D4D9;
	Wed, 12 Jun 2024 08:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qBqOf6iW"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAA1216D31E
	for <linux-omap@vger.kernel.org>; Wed, 12 Jun 2024 08:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718181655; cv=none; b=CJQ8AK4iFyUn2jCqNQSJNS0PZLcU538eiWn5sFQQHHaqVpUuht3aYEcAPevKVZx10QI98EIDrZWkcC1CbIlVgdeXKce1yHzWmaFlwF1/tJRysIyijkQ0IqXO3c8IswH0Mzu3XIyTeU0t42wEZWBrr3brenSrDmS/Mz9ZLIHGbtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718181655; c=relaxed/simple;
	bh=qEiGeubKfIJ1/Zrhs+Ufn5xyc38Z8AX0c5pM0ZIohaU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qf1wAz4Z4v5vw6dOsi2+wtnCovRtZaweF/ztlOPO3TC7c/XNJT/v6A6RgeXbW3RJZsK9RBmUiF05fqGVSUIAHHO1jNGqkoshdITKDxBI8Fzz9XNxVf7taIHGzahjIV1APH4lR8qjHvKNRDXwhFrTpxQ+uujGhxpitRJbukrWgYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qBqOf6iW; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a6f1da33826so269151466b.0
        for <linux-omap@vger.kernel.org>; Wed, 12 Jun 2024 01:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718181651; x=1718786451; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5WiwpAVIIzI25M3vt4yA+PqF3qDsIr7sGRJOC2cnv2A=;
        b=qBqOf6iWgcxm4nXjNM4SNMYOW+uXRLy37yRB7qcV6cnOaWjzp7jdxD6E9RwinMl+tM
         qpW6stDC2eLYLTHZdJ+TXBTKYXz8WNcQR4VRZXqNc00HYDw8GT6IuCSuLQaYbUNMI3ic
         Rdiw8wBInfJEQQ2XVSTRcsRYxPLAAm33q/czkXh1fOmF2wgkVDddLPA8DJlvsucxU8Js
         aPNF1ryKee1c1CSK/oXkveIVCjt7xNN9CnjNnCePn8hC5inSmJQvWEI9nkvUIVsihdvQ
         KtEwIyabeBY6SCGMFEFVOhNyGyULV/GTFU85UhJfcZ5DrABG9I7YFON33GRSYRmGVyYM
         Lw9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718181651; x=1718786451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5WiwpAVIIzI25M3vt4yA+PqF3qDsIr7sGRJOC2cnv2A=;
        b=soHAk7lOXo3lqXvqUlx3xNSVuv9kI4VwRPx9FBhOMq+rKNDLFlIegU410CAigvY1y+
         08njuof7yQ2hU8Cljxw3Yr/WOel5PkIU+FSdPmPzCJG6jl+cfrqjOZsbFWxGu+evSyyj
         okv0F9MQQGMeOkL6cFqyAbA5ncjHbTpunwYJtz4VG1VzEnS5yBTVFitGhkSescOV7Ti0
         e2TYRduq2Jmky2KfnQXJurbuU7EBsXFNhsWVAPTThfhAke57OFlJjM0Tk9IkSWvCXDyq
         9SipaXGR6orPveqPMc0GTuzuUk79zkXmnRZFLHbbeknLZFMm12AROqcD8cHF4Kw3xSFH
         ybCQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmsFq1+3yyq+3fJX5/uFyfd9qZhxRB84gIHn0IczT/sP7ZRBtU8p4Rm6WFAeF/5FcU831sG7gvmJpcZzmEAavTYv74M94LjWy7Bg==
X-Gm-Message-State: AOJu0YzP7zYoHpMEXlSkyGGzCHgMYc4KBlPWc5nLo7h9koSTlgt8M/R+
	NoXguOszNZfLQghMJbWPiGmh+3g18P/dR3H2MjgJMZiIxRUfLJ451iXQNIbjGgM=
X-Google-Smtp-Source: AGHT+IGAvQiUcW8VL4sfb0qoE6C7is4cXciMhqvZWnwVopNLvFYJ8YfuyjbzeXxY/mf4M9KlfYPkjg==
X-Received: by 2002:a17:906:190e:b0:a68:ccbd:bcf0 with SMTP id a640c23a62f3a-a6f47f589d8mr87717366b.28.1718181651095;
        Wed, 12 Jun 2024 01:40:51 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6efbcc252esm604812366b.143.2024.06.12.01.40.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 01:40:50 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Antoine Tenart <atenart@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	arm@kernel.org,
	soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Tsahee Zidenberg <tsahee@annapurnalabs.com>
Subject: [PATCH v2 2/2] amazon: MAINTAINERS: change to odd fixes and Tsahee Zidenberg to CREDITS
Date: Wed, 12 Jun 2024 10:40:38 +0200
Message-ID: <20240612084038.18519-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240612084038.18519-1-krzysztof.kozlowski@linaro.org>
References: <20240612084038.18519-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Last email from Tsahee Zidenberg was in 2016 [1], so move Tsahee from
Amazon platform maintainers to credits (thank you for your contributions
and maintenance!).  Stale maintainer entries hide information whether
subsystem needs help, has a bus-factor or is even orphaned.

The Amazon platform still has active maintainer - Antoine Tenart -
however there was no maintenance activities coming from Antoine.  All
my patches from last 4 years related to Amazon remained unanswered - no
acks, no picks - so document the actual not active status of the
platform by changing it to Odd Fixes.

[1] https://lore.kernel.org/all/?q=f%3Atsahee%40annapurnalabs.com

Cc: Tsahee Zidenberg <tsahee@annapurnalabs.com>
Cc: Antoine Tenart <atenart@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. None
---
 CREDITS     | 4 ++++
 MAINTAINERS | 3 +--
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/CREDITS b/CREDITS
index 2721aa9122bb..93c05f1884f8 100644
--- a/CREDITS
+++ b/CREDITS
@@ -4369,6 +4369,10 @@ N: Haojian Zhuang
 E: haojian.zhuang@gmail.com
 D: MMP support
 
+N: Tsahee Zidenberg
+E: tsahee@annapurnalabs.com
+D: Annapurna Labs Alpine Architecture
+
 N: Richard Zidlicky
 E: rz@linux-m68k.org, rdzidlic@geocities.com
 W: http://www.geocities.com/rdzidlic
diff --git a/MAINTAINERS b/MAINTAINERS
index 0a2c9163933a..63d991d95c73 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2001,10 +2001,9 @@ F:	drivers/soc/amlogic/
 N:	meson
 
 ARM/Annapurna Labs ALPINE ARCHITECTURE
-M:	Tsahee Zidenberg <tsahee@annapurnalabs.com>
 M:	Antoine Tenart <atenart@kernel.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
-S:	Maintained
+S:	Odd Fixes
 F:	arch/arm/boot/dts/amazon/
 F:	arch/arm/mach-alpine/
 F:	arch/arm64/boot/dts/amazon/
-- 
2.43.0


