Return-Path: <linux-omap+bounces-1393-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6728C9973
	for <lists+linux-omap@lfdr.de>; Mon, 20 May 2024 09:41:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E0A451C212C9
	for <lists+linux-omap@lfdr.de>; Mon, 20 May 2024 07:41:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59F291BF54;
	Mon, 20 May 2024 07:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SIVHYJeh"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E3A912B8B
	for <linux-omap@vger.kernel.org>; Mon, 20 May 2024 07:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716190888; cv=none; b=OFCbTc2ViBV74QpiUF80/LG9EexrS+vtiT8bcE84bydpjC0dUX/wBtZA5dP9os6kkNcdxjEy1vvPPvpLUdVkMZ9VQp14XPt4xLA0aLjXcRRMYDYGRKppuExz6/qkFNJs81jMr40S56El11IHEBB/ldhoUCzuLZiYiJ71xJ7Rrfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716190888; c=relaxed/simple;
	bh=G5RDRHDp8bHkhePtdbNcRht+dyNZhXMGcqFPvB99Cuw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cWh2h25v+WbdNyGoPGM0GYjl52uR8/+ZzJ6VpO3NKNMU90A3NEPocyG1Xm7s2GIHi6kLFoBEbkt20rRhvsMb5LRfJ3IMfjlkfzulvs4nD84VjYd9W/cfUSGxJKi+/Q7vT/QkBqUbGETGD95Pe4M4rkZhas1Sbl1gXl1H7I6TuCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SIVHYJeh; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-56e48d0a632so9363397a12.2
        for <linux-omap@vger.kernel.org>; Mon, 20 May 2024 00:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716190885; x=1716795685; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6A/avYP5YPpm971N8IK0uubu89NMozFIaDiylX6PsHQ=;
        b=SIVHYJehigN7Z+uGkDHc1JXmT3UA1QwdO0L4SKt5cjkYYu08ajuJUYcbokh6wQymlf
         tPn/YOSql7kMgbv9Zkn7+vXUGGGPOzgEuNZjI6j/j7Xl3F+VChveElSxgTUxnzMZKMy/
         qyMvMB5Jsw8xYWgnRzMl4et+c44SCilHajNjEPTtRxm1RjzRDkTyHv3cZel+7WsRxslU
         rFkcnpgrSN329zStFn9cK6YN+dUTB/aa/zC3p0Q1ethr6BW4KS5H6eYaXMFRs3KXOwjN
         76kAJGLny2od8PsfeV6Gdzq6dcdFRNUj1s9tC2iAmzLwyr82qu07fXYHhHJSBYnLbVG7
         wJPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716190885; x=1716795685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6A/avYP5YPpm971N8IK0uubu89NMozFIaDiylX6PsHQ=;
        b=YZhsbQ/1VDsc2H+lynHTzmOkP7EWF/u2YgyoFSZWUpT8CmiJ0fU9eP1gcJ0qlsCzag
         cfbnPsMDJWqogeP3YjqgLE6CFqclo0jrUXcCTWAu0iw+3OuivCkxUTlXDHuOREt362tc
         hB6jOM+UAMpWvJJ4+5rd0BpajfmY7Nt3ozbsUis8ouArJX2L6/Aj5U31nZxpz6KQOuaT
         fjyMSAQIph17QCKo0/5QaeGq+Lqhl5tw3v0lq2bGonnkWOHdWZrIKK/zZaQA0SL1/Ya0
         HfrPd0mMJTyAJNVcxmJNXUmAvu9sp4+vLj8OXOa8I1GkRKj7VWVxSaPIEOBC61hlqBxl
         awFg==
X-Forwarded-Encrypted: i=1; AJvYcCUioKxNIYOLxVk6tgBslmoiUTFJDyGu1lWcHqArcYI1wBwWgXi3QfIkmfLPF+Uv5XH9x81ARWquP39JIB/s39UqRhF1TpGdEjLJ4w==
X-Gm-Message-State: AOJu0YzIuVakU92aSyhxBy67LyqPRYnCVGaPcf2h37JxhtDK2KFRzQ7C
	7ztmupKpjBMq5x2jEwsuMDMrPzCLESdea9Pu1ZUSx6Ie4Ph7lHSAuMe1Euawnmc=
X-Google-Smtp-Source: AGHT+IGaGv6w5Ejo+3PCQdIkO7sIlmQZTkHvXrWEWEQy4bzPDzHGkbybTDIi2J4UNNkyIEUhf7BVeg==
X-Received: by 2002:a17:906:4f83:b0:a59:ea34:fe0d with SMTP id a640c23a62f3a-a5a2d65ed4bmr2937020466b.47.1716190884722;
        Mon, 20 May 2024 00:41:24 -0700 (PDT)
Received: from krzk-bin.. ([178.197.206.169])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a893a91b9sm754853166b.7.2024.05.20.00.41.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 00:41:24 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	arm@kernel.org,
	soc@kernel.org,
	Antoine Tenart <atenart@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] amazon: MAINTAINERS: change to odd fixes and Tsahee Zidenberg to CREDITS
Date: Mon, 20 May 2024 09:40:13 +0200
Message-ID: <20240520074013.9672-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240520074013.9672-1-krzysztof.kozlowski@linaro.org>
References: <20240520074013.9672-1-krzysztof.kozlowski@linaro.org>
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

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 CREDITS     | 4 ++++
 MAINTAINERS | 3 +--
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/CREDITS b/CREDITS
index ea84fb373310..bdf592e0bd25 100644
--- a/CREDITS
+++ b/CREDITS
@@ -4367,6 +4367,10 @@ N: Haojian Zhuang
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
index 8193bd95c84c..3e1ce64801ef 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1958,10 +1958,9 @@ F:	drivers/soc/amlogic/
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


