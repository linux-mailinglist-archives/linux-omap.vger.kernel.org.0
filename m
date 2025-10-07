Return-Path: <linux-omap+bounces-4658-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E685FBC16A3
	for <lists+linux-omap@lfdr.de>; Tue, 07 Oct 2025 14:53:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A65633C0F97
	for <lists+linux-omap@lfdr.de>; Tue,  7 Oct 2025 12:53:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A15322DF71B;
	Tue,  7 Oct 2025 12:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vrf2TL8Q"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E84921FF48;
	Tue,  7 Oct 2025 12:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759841607; cv=none; b=RCEyb09vMoMt1mn/PrFSFdKQ1YXbj3PMwT3/jfd68F+5bJFXCmJB3jQHe45/++6zMzHywR+kH7W3I6+r4nTAmumtmtWTb5TefWGFm1LDEvvAf5NiR79YjFJK4iGweAZxLn/XDqr9x+++8IbbRDyBxpKwSuNHSa9MsafLhDXZops=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759841607; c=relaxed/simple;
	bh=JPWlmf592WX06I9M3tsj+KikVBlunSp1rDaNErH1gr4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=AVPS5dQlqi/U1e3JeTW3cOcOrs+YMxttopLZZXInJWIHHv34byCHMRpMT/hxyvO4ylgRf4Z0vOSexjIxdX8AkGTyUIAcDd8+4g6O3j2hriv2cV0yGfU2Tvkx3uS34hLXMwh1oQ9NUrfjXIpATHwNpNaiH4iBl52kpPM9SZ97JU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vrf2TL8Q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 91EE0C4CEF1;
	Tue,  7 Oct 2025 12:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759841606;
	bh=JPWlmf592WX06I9M3tsj+KikVBlunSp1rDaNErH1gr4=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=Vrf2TL8Q2KuaAHshwfpUWdbwV47WoWHISDc8KkXtrC9WNfssYxk7UT62RxzxQCjU+
	 CcAUMpRfxu1N3zN1F8w6T5vz2vl5ng1ScjjnUZ6d++HvAQjYH64zmek3+EVk+Gq6Ws
	 Quua36M1nxiijEyUEYQsfai8kE2MtQjdUC17em6A0WuUR3mR2LgpmmzAEmDlNqLwYp
	 jBeLcVxv+AJ+jKoQO6IrHgXfySM1xfzbzYBj0m5PWNrm55g0L2mlBE0OBYb4q9ILZs
	 AMsfiTpwGls3nrSRObhf3txncAfk6J5Ezor6yvU4GCesCjlTR6jYcenorMT3VvXum4
	 nz49Tm+mFUZmg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8283FCCA476;
	Tue,  7 Oct 2025 12:53:26 +0000 (UTC)
From: Ali Khan via B4 Relay <devnull+abdulalikhan1337.gmail.com@kernel.org>
Date: Tue, 07 Oct 2025 12:53:09 +0000
Subject: [PATCH] ARM: OMAP2+: Fix falg->flag typo in omap_smc2()
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251007-omap-falg-fix-v1-1-545a1de74a0a@gmail.com>
X-B4-Tracking: v=1; b=H4sIADQN5WgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDAwNz3fzcxALdtMScdN20zArd5ERD0zRDY7NkE0MzJaCegqJUoDDYvOj
 Y2loA1fbSbV8AAAA=
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Russell King <linux@armlinux.org.uk>
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Jens Schleusener <Jens.Schleusener@fossies.org>, 
 Ali Khan <abdulalikhan1337@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759841606; l=1869;
 i=abdulalikhan1337@gmail.com; s=20251007; h=from:subject:message-id;
 bh=LO4l4xtXGeg/5kuikNmT+7wW9ZSxcTZ7VwPYOe2JJsc=;
 b=X2XrdnImlsmvmIP+rT9bIf5q8oh9/l/ssN5g7kMwZcb9W2GPAp/bQU6mmsmOCgNYJcnpOYrMR
 zpTqzrk9+cPCmAjP4dclW02HoeYB1Lx2r4qXbIEO9HAdqXxIGuMrSNd
X-Developer-Key: i=abdulalikhan1337@gmail.com; a=ed25519;
 pk=MGvpDjvgp0SIh0jkqpHnh8BE7tUnGwAv3jhzd3o/xS4=
X-Endpoint-Received: by B4 Relay for abdulalikhan1337@gmail.com/20251007
 with auth_id=538
X-Original-From: Ali Khan <abdulalikhan1337@gmail.com>
Reply-To: abdulalikhan1337@gmail.com

From: Ali Khan <abdulalikhan1337@gmail.com>

Fix a spelling error in the omap_smc2() function declaration
and in a corresponding comment within the assembly source.
This was reported via bugzilla in 2019.

Reported-by: Jens Schleusener <Jens.Schleusener@fossies.org>
Link: https://bugzilla.kernel.org/show_bug.cgi?id=205891
Signed-off-by: Ali Khan <abdulalikhan1337@gmail.com>
---
 arch/arm/mach-omap2/omap-secure.h | 2 +-
 arch/arm/mach-omap2/omap-smc.S    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-omap2/omap-secure.h b/arch/arm/mach-omap2/omap-secure.h
index 2517c4a5a0e2..04b4ba0f59ab 100644
--- a/arch/arm/mach-omap2/omap-secure.h
+++ b/arch/arm/mach-omap2/omap-secure.h
@@ -68,7 +68,7 @@ extern u32 omap_secure_dispatcher(u32 idx, u32 flag, u32 nargs,
 				u32 arg1, u32 arg2, u32 arg3, u32 arg4);
 extern void omap_smccc_smc(u32 fn, u32 arg);
 extern void omap_smc1(u32 fn, u32 arg);
-extern u32 omap_smc2(u32 id, u32 falg, u32 pargs);
+extern u32 omap_smc2(u32 id, u32 flag, u32 pargs);
 extern u32 omap_smc3(u32 id, u32 process, u32 flag, u32 pargs);
 extern int omap_secure_ram_reserve_memblock(void);
 extern u32 save_secure_ram_context(u32 args_pa);
diff --git a/arch/arm/mach-omap2/omap-smc.S b/arch/arm/mach-omap2/omap-smc.S
index 7376f528034d..fe3b5478200a 100644
--- a/arch/arm/mach-omap2/omap-smc.S
+++ b/arch/arm/mach-omap2/omap-smc.S
@@ -32,7 +32,7 @@ ENTRY(_omap_smc1)
 ENDPROC(_omap_smc1)
 
 /**
- * u32 omap_smc2(u32 id, u32 falg, u32 pargs)
+ * u32 omap_smc2(u32 id, u32 flag, u32 pargs)
  * Low level common routine for secure HAL and PPA APIs.
  * @id: Application ID of HAL APIs
  * @flag: Flag to indicate the criticality of operation

---
base-commit: 07e27ad16399afcd693be20211b0dfae63e0615f
change-id: 20251007-omap-falg-fix-ca15f136c416

Best regards,
-- 
Ali Khan <abdulalikhan1337@gmail.com>



