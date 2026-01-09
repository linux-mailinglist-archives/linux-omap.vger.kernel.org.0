Return-Path: <linux-omap+bounces-5405-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EB47ED08D55
	for <lists+linux-omap@lfdr.de>; Fri, 09 Jan 2026 12:12:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 835C0301057A
	for <lists+linux-omap@lfdr.de>; Fri,  9 Jan 2026 11:12:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09C4933CE8A;
	Fri,  9 Jan 2026 11:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C0ZnOPkB"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BD1C212FB9;
	Fri,  9 Jan 2026 11:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767957128; cv=none; b=XY6S9ULf6BP883Y9pMrBlS7FtlaPtEt7zIG3lLVJTyxWwNKGgr5vZqe2RnFJgj13Q1SyPhOuzDLEf7+AYn0s57EZ9DnO8wb6c4PPVAKe/z4d1iQF76LZeVuHODIljRo9kFErCTVA27LVM3pPSHX8oQJxSBjTtFs9QbpwblPRIUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767957128; c=relaxed/simple;
	bh=vJuf052dO1jkxExPpH3QeP/4v+AUsUKu2lM7u8u15No=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=nYNbefRaLdY/sltR+5YX6sp8m9QJz/wAzgx81b3iIkDo3fniqqC/zXCjKsArn2iPtc1I8kFVU3ecq9VbMER2dnsB8RQvPral6nBSd/SxuPrHPtOQcJHM91EzrK1L1j06eX9infCc4ElgiWgE+mrSmspsVQrlF17A8XtgW22M6/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C0ZnOPkB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC8F6C4CEF1;
	Fri,  9 Jan 2026 11:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767957128;
	bh=vJuf052dO1jkxExPpH3QeP/4v+AUsUKu2lM7u8u15No=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=C0ZnOPkBAocMz3cGv1PTj4WRpH3XlrdUNB5+ps6JIskUbKsbNikCT47ATskdWUE83
	 7ThtgBx19YMduDrV75RMI1RRhZ5vVwY21AJwMjmZjuzeKM/RIkualSRqKsucyhwR71
	 sDE5adhE6V9Sh99qfUoZCadhmBTLBp6pKbEdR+TJn0qMop15qtCn8tcCSOYs/shvV9
	 HeNIJxHorZ+zw+Oz4Wd3EkEUJwwIZyA1PBO+DlWvrh+JEAO7dRarzeojPF/KJy5BOj
	 9+LBLnj0uJQJOX6mXjgJF6b14SNa9lueIY51A4vjxSN03yHDl2DBTHS7265Q1BvbzV
	 np4+ImKIwgfQw==
From: Lee Jones <lee@kernel.org>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Lee Jones <lee@kernel.org>, Shree Ramamoorthy <s-ramamoorthy@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
Cc: Andrew Davis <afd@ti.com>, Bajjuri Praneeth <praneeth@ti.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-omap@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 stable@vger.kernel.org
In-Reply-To: <20251218-fix_tps65219-v5-1-8bb511417f3a@bootlin.com>
References: <20251218-fix_tps65219-v5-1-8bb511417f3a@bootlin.com>
Subject: Re: (subset) [PATCH v5 1/2] mfd: tps65219: Implement LOCK register
 handling for TPS65214
Message-Id: <176795712434.1656708.9000200659822594124.b4-ty@kernel.org>
Date: Fri, 09 Jan 2026 11:12:04 +0000
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-52d38

On Thu, 18 Dec 2025 16:06:28 +0100, Kory Maincent (TI.com) wrote:
> The TPS65214 PMIC variant has a LOCK_REG register that prevents writes to
> nearly all registers when locked. Unlock the registers at probe time and
> leave them unlocked permanently.
> 
> This approach is justified because:
> - Register locking is very uncommon in typical system operation
> - No code path is expected to lock the registers during runtime
> - Adding a custom regmap write function would add overhead to every
>   register write, including voltage changes triggered by CPU OPP
>   transitions from the cpufreq governor which could happen quite
>   frequently
> 
> [...]

Applied, thanks!

[1/2] mfd: tps65219: Implement LOCK register handling for TPS65214
      commit: 9ef5418bc106177f2330f7bf383f8a2cf29aa435

--
Lee Jones [李琼斯]


