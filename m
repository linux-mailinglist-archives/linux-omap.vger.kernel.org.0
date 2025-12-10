Return-Path: <linux-omap+bounces-5147-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F73CCB1D20
	for <lists+linux-omap@lfdr.de>; Wed, 10 Dec 2025 04:49:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8257B3064BE8
	for <lists+linux-omap@lfdr.de>; Wed, 10 Dec 2025 03:49:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E95E30F533;
	Wed, 10 Dec 2025 03:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GANpA89x"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 993D826560D;
	Wed, 10 Dec 2025 03:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765338565; cv=none; b=jD8MDyjlwakDzfifYrhUhq3reaaeVNh30K20zjDkctDZcjq+cWFd//s57AabqMNlxpoObdo4VKZXptgVfsikJa1kM0Bo+zYbnW6Trtu7RY9eg+W2+7RQrUCBUXxDFSfahCuxOW6GLN9olxPba4IiUP6lOF+JEzO+xwvw5BOYDFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765338565; c=relaxed/simple;
	bh=T/FUqIYymG8r2tt74VYnJ73FamrE5okQj2rlbfsBCnw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s4OB5s/V/UNWEAtvDBT2Vg0Zk6LLoJDplUZeftI8arMQfFRUkWg8qDQHWNcAnZlTNNaJMHVBWPdzcLVbuj1MwZoSE6FPnRjoBCjJX2SJCOMWQMR74z+25II7DQnveH9LMZwHj2iBCo+rpe3+hxwDCMpj7mZYjFn6LTRSpqx8hfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GANpA89x; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C063C4CEF1;
	Wed, 10 Dec 2025 03:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765338565;
	bh=T/FUqIYymG8r2tt74VYnJ73FamrE5okQj2rlbfsBCnw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GANpA89xDZ4e7tLWNe62xQrkwhzyP9WeKdqsylSA7sFPfm5BkXXBckCoEbjS0gt/C
	 ObiIFoDkK/u9/eEktAY639s1G+3CnOSalQiyL7oiM2VBLs05byymPNPJKJqeyp+Eh3
	 NV/TShTeRZ4KD5irgrqlAitmUy+WDKAKMtlxijYLZgjYwGX2NcCBfqTFEnIWgkdg95
	 jnB4f9GrHLQr98oWa/j20lOp7drWs4szACLFkh9xcb5q+366A5zFZe1Pk2N4eAu7hb
	 dYUIZYu5mx0m2WTnqKW5W7BweTtRe0JQs3KO34bbmyMIZ1pCrYJQq+OKCk1QlEJOQ0
	 zQG17fGZSHyLg==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Matthias Schiffer <matthias.schiffer@tq-group.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Sasha Levin <sashal@kernel.org>,
	aaro.koskinen@iki.fi,
	andreas@kemnade.info,
	rogerq@kernel.org,
	tony@atomide.com,
	linux-omap@vger.kernel.org
Subject: [PATCH AUTOSEL 6.18-5.10] ti-sysc: allow OMAP2 and OMAP4 timers to be reserved on AM33xx
Date: Tue,  9 Dec 2025 22:48:45 -0500
Message-ID: <20251210034915.2268617-4-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251210034915.2268617-1-sashal@kernel.org>
References: <20251210034915.2268617-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.18
Content-Transfer-Encoding: 8bit

From: Matthias Schiffer <matthias.schiffer@tq-group.com>

[ Upstream commit 3f61783920504b2cf99330b372d82914bb004d8e ]

am33xx.dtsi has the same clock setup as am35xx.dtsi, setting
ti,no-reset-on-init and ti,no-idle on timer1_target and timer2_target,
so AM33 needs the same workaround as AM35 to avoid ti-sysc probe
failing on certain target modules.

Signed-off-by: Matthias Schiffer <matthias.schiffer@tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Link: https://lore.kernel.org/r/20250825131114.2206804-1-alexander.stein@ew.tq-group.com
Signed-off-by: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

# Commit Analysis: ti-sysc: allow OMAP2 and OMAP4 timers to be reserved
on AM33xx

## 1. Commit Message Analysis

**Subject/Body**: The commit addresses ti-sysc probe failures on AM33xx
platforms (commonly used in BeagleBone and industrial embedded systems).
The commit explains that AM33xx has the same clock setup as AM35xx (with
`ti,no-reset-on-init` and `ti,no-idle` on timer targets), so it needs
the same workaround.

**Notable absence**: No `Cc: stable@vger.kernel.org` or `Fixes:` tag.
The maintainers didn't explicitly mark this for stable backporting.

## 2. Code Change Analysis

The changes are minimal and well-contained:

1. **New enum value**: Adds `SOC_AM33` to `enum sysc_soc` at
   `drivers/bus/ti-sysc.c:51`
2. **SoC detection**: Adds `SOC_FLAG("AM33*", SOC_AM33)` to
   `sysc_soc_match[]`
3. **Logic extension in `sysc_check_active_timer()`**:
   - Converts if/else to switch statement
   - Adds `SOC_AM33` case alongside existing `SOC_3430` and `SOC_AM35`
     to return `-ENXIO`

**Technical mechanism**: When a timer has both
`SYSC_QUIRK_NO_RESET_ON_INIT` and `SYSC_QUIRK_NO_IDLE` quirks set
(indicating it's likely in use by the system timer driver), and the SoC
is AM33/AM35/3430, the function returns `-ENXIO` allowing the timer to
be "reserved" and preventing probe failure.

## 3. Classification

This falls under the **QUIRKS and WORKAROUNDS** exception category:
- Extends an existing hardware-specific workaround to similar hardware
- Fixes probe failures on real devices
- Follows an established pattern in the driver for handling SoC-specific
  timer behavior

## 4. Scope and Risk Assessment

**Size**: Very small (~20 lines, 1 file)
**Subsystem**: ti-sysc bus driver (OMAP/TI platform-specific)
**Complexity**: Low - straightforward extension of existing logic
**Risk**: Very low - only affects AM33xx platforms, doesn't change
behavior for any other SoC

The switch statement change is a cosmetic improvement that makes the
code cleaner while adding the new case.

## 5. User Impact

**Who is affected**: Users of AM33xx-based systems (BeagleBone Black,
industrial AM335x boards)
**Severity**: Probe failures prevent proper hardware initialization,
which can be significant for embedded systems
**Prevalence**: AM33xx is a widely-deployed platform

## 6. Stability Indicators

- Multiple signed-off-by tags (Matthias Schiffer, Alexander Stein, Kevin
  Hilman)
- Proper review via lore.kernel.org
- Follows established patterns in the codebase (SOC_AM35 workaround
  already existed)

## 7. Dependency Check

The commit is self-contained. The required infrastructure (SOC detection
mechanism, timer quirk handling) already exists in the driver. The only
addition is a new enum value and extending the switch case.

## Summary Assessment

**Pros**:
- Fixes real probe failures on commonly-used embedded platforms
- Very small, contained change with low regression risk
- Extends existing well-tested workaround to similar hardware
- Falls under the "quirks/workarounds" exception for stable

**Cons**:
- No explicit `Cc: stable` tag from maintainers
- No `Fixes:` tag to identify when the bug was introduced
- Adds new code (enum value) rather than purely fixing existing code

**Risk vs Benefit**: The risk is very low (only affects AM33xx
platforms, extends existing logic). The benefit is meaningful for AM33xx
users who would otherwise hit probe failures. This type of platform-
specific quirk extension is common and safe.

## Verdict

This is a small, well-contained fix that extends an existing hardware
workaround to similar hardware (AM33xx). While it lacks explicit stable
tags, it meets the criteria for the "quirks and workarounds" exception.
The fix prevents probe failures on a widely-used embedded platform with
minimal regression risk. The pattern of extending SoC-specific
workarounds to similar SoCs is well-established and safe.

**YES**

 drivers/bus/ti-sysc.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
index 5566ad11399e7..610354ce7f8f0 100644
--- a/drivers/bus/ti-sysc.c
+++ b/drivers/bus/ti-sysc.c
@@ -48,6 +48,7 @@ enum sysc_soc {
 	SOC_UNKNOWN,
 	SOC_2420,
 	SOC_2430,
+	SOC_AM33,
 	SOC_3430,
 	SOC_AM35,
 	SOC_3630,
@@ -2912,6 +2913,7 @@ static void ti_sysc_idle(struct work_struct *work)
 static const struct soc_device_attribute sysc_soc_match[] = {
 	SOC_FLAG("OMAP242*", SOC_2420),
 	SOC_FLAG("OMAP243*", SOC_2430),
+	SOC_FLAG("AM33*", SOC_AM33),
 	SOC_FLAG("AM35*", SOC_AM35),
 	SOC_FLAG("OMAP3[45]*", SOC_3430),
 	SOC_FLAG("OMAP3[67]*", SOC_3630),
@@ -3117,10 +3119,15 @@ static int sysc_check_active_timer(struct sysc *ddata)
 	 * can be dropped if we stop supporting old beagleboard revisions
 	 * A to B4 at some point.
 	 */
-	if (sysc_soc->soc == SOC_3430 || sysc_soc->soc == SOC_AM35)
+	switch (sysc_soc->soc) {
+	case SOC_AM33:
+	case SOC_3430:
+	case SOC_AM35:
 		error = -ENXIO;
-	else
+		break;
+	default:
 		error = -EBUSY;
+	}
 
 	if ((ddata->cfg.quirks & SYSC_QUIRK_NO_RESET_ON_INIT) &&
 	    (ddata->cfg.quirks & SYSC_QUIRK_NO_IDLE))
-- 
2.51.0


