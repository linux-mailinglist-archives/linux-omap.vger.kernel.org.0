Return-Path: <linux-omap+bounces-3857-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B53DAD8D12
	for <lists+linux-omap@lfdr.de>; Fri, 13 Jun 2025 15:26:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8D0AB18958CC
	for <lists+linux-omap@lfdr.de>; Fri, 13 Jun 2025 13:26:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADE2114D2B7;
	Fri, 13 Jun 2025 13:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LKYbignC"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF181E50E;
	Fri, 13 Jun 2025 13:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749821171; cv=none; b=chNCSrFIBjBxD7/m8aFcp1UX8vknLaB3EYCtPUjhSOhSvJYX4989O0W5W/9q6jp8izP58T/jgOg2W+PX6NZ/RsTcg8OAF0RHb0uc+wfZQC3q43sMBZLtKOkouUGo3BPfXe81airZ/FvaYidWeGI/6uO+Pc0qF1y/1xsbxwhK0uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749821171; c=relaxed/simple;
	bh=SYJIh8lLVtY8mvII/rEA3oBj41WCb2bQoExhQkW/wUg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=KgqFfpKbm4Jwf3wFk12HFpNZUVwKNAZjLrK62HwGvPuqQpLNY+2b0WK1lCCH3yAEuXM6lT24zpGObTDzK0PjYeU1PoSy2m+gBYbG30irqextkryOvOyeIqbpwWIYNYMiCI1CPfJGrXtXXJo8wGvabM2tzrRj+XkM5z2TBFcgQp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LKYbignC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEF12C4CEE3;
	Fri, 13 Jun 2025 13:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749821170;
	bh=SYJIh8lLVtY8mvII/rEA3oBj41WCb2bQoExhQkW/wUg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=LKYbignCJWTDMqwE6LUMC+47XrqfVcznd2Sl9bWdLTY/pi/GN/uxz88eTpQiOk42A
	 u3N/YIiuepeUprmwfeZZWjhMuGu0NID9YBzmY6FT/msiziY//ISoSyxp0UHXQYTaun
	 uVc07FPUybVOdOOsr2YC17qyG88psMO+VCVRRY1g6aGTFhwUSpatixTGawFtdn64/3
	 wX9hOx3Tfmirx4eVlwhY6R8o/V/IAHtXiqGufhcn6M8oRDoIAWl3bmLTf48z+XXxR3
	 NyuTTaKJPjux/KSctz04n5ZFdi5Ihu0O1UMEEDRuRzGN5fonxwWEpnDEqMkbxcWvik
	 MjDD5Cgj8M98Q==
From: Lee Jones <lee@kernel.org>
To: aaro.koskinen@iki.fi, andreas@kemnade.info, khilman@baylibre.com, 
 rogerq@kernel.org, tony@atomide.com, lee@kernel.org, 
 linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Shree Ramamoorthy <s-ramamoorthy@ti.com>
Cc: m-leonard@ti.com, praneeth@ti.com, afd@ti.com
In-Reply-To: <20250527190455.169772-2-s-ramamoorthy@ti.com>
References: <20250527190455.169772-1-s-ramamoorthy@ti.com>
 <20250527190455.169772-2-s-ramamoorthy@ti.com>
Subject: Re: (subset) [PATCH 1/2] mfd: tps65219: Update TPS65214 MFD cell's
 GPIO compatible string
Message-Id: <174982116851.887608.6961830250726419940.b4-ty@kernel.org>
Date: Fri, 13 Jun 2025 14:26:08 +0100
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-459a0

On Tue, 27 May 2025 14:04:54 -0500, Shree Ramamoorthy wrote:
> This patch reflects the change made to move TPS65215 from 1 GPO and 1 GPIO
> to 2 GPOs and 1 GPIO. TPS65215 and TPS65219 both have 2 GPOs and 1 GPIO.
> TPS65214 has 1 GPO and 1 GPIO. TPS65215 will reuse the TPS65219 GPIO
> compatible string.
> 
> TPS65214 TRM: https://www.ti.com/lit/pdf/slvud30
> TPS65215 TRM: https://www.ti.com/lit/pdf/slvucw5/
> 
> [...]

Applied, thanks!

[1/2] mfd: tps65219: Update TPS65214 MFD cell's GPIO compatible string
      commit: 75213cd351ac2df3bb3e70d203cef0a1c7a5f4d4

--
Lee Jones [李琼斯]


