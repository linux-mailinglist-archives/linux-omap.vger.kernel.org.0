Return-Path: <linux-omap+bounces-2554-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B4A79B78EB
	for <lists+linux-omap@lfdr.de>; Thu, 31 Oct 2024 11:44:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BCF5E1C23E2C
	for <lists+linux-omap@lfdr.de>; Thu, 31 Oct 2024 10:44:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D4F11953A2;
	Thu, 31 Oct 2024 10:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F8k8MLWV"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D19A11993B9
	for <linux-omap@vger.kernel.org>; Thu, 31 Oct 2024 10:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730371470; cv=none; b=C0IwsQlAZAypjBCgQwjyBTwdm28rcBcZSV5wkfkZEfOibmgLmbh3k8JBj0G7hoUT/qCv6VQd3A9oQXq3+eENtArE82S7MCuu0paZB5OScBmCdblqom7Eugaam7m9+ZZpUW0JuxusqwxZ3buL2EOYLMhIQc2Delbw//AKD3P9lJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730371470; c=relaxed/simple;
	bh=6CrcuhJVpVyzZYHnkIztljkwHxS2uMuZoIvXqVnHZpE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q89w/DxfucqnL8TylR6lMuJ2TWyPmF+qeDgepIhJ3SN3WYV5PALxNIJ493JwnFCa6QQM01MboCAKrT/KKdtKyAl6JL9RtAMtSarqTFlAjmOOVtcyZLtTKWIGBt1db+xAGRjAAfYWgBRKsidqIdsFPYfTSuAd/701Pd+QchZvJiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F8k8MLWV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4667C4CED2;
	Thu, 31 Oct 2024 10:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730371470;
	bh=6CrcuhJVpVyzZYHnkIztljkwHxS2uMuZoIvXqVnHZpE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=F8k8MLWVVB2n8i2EG2GeD1q+KWJwfLHhbG0e11wMe08iNRpuDg7SqA2SmaHnsfytc
	 Y0/G0ulePUpwG12ZAV2lBwUnzzBBq1QMPcOIr+FXxs22uwSWVh8jy1uNrbe6Cp26qj
	 d6iBikK07CNDrAr5YFGkTvx2S1Nn2q6UutnkBw2THlEGzlys4as0FlRXXtePdg7h2X
	 keQ8lP7E2ScoAtDCmUtp7aH0nZnv9xbbVoal4QXMfW0V/aGqfC2KBmlz7LYxJUCkOk
	 OBWxcKVI/r0Bd6bc+EECIQg+BwariS53hciZ5HxN34pTH+TYPG6S1DwemPPrCixx7g
	 wBovvT29LEr2w==
Message-ID: <c3c60bcb-186e-462d-aedb-ab90d52a58bd@kernel.org>
Date: Thu, 31 Oct 2024 12:44:26 +0200
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: am335x-bone-common: Increase MDIO reset
 deassert delay to 50ms
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Tony Lindgren <tony@atomide.com>, Kevin Hilman <khilman@baylibre.com>,
 Robert Nelson <robertcnelson@gmail.com>,
 Colin Foster <colin.foster@in-advantage.com>
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <9002a58daa1b2983f39815b748ee9d2f8dcc4829.1730366936.git.geert+renesas@glider.be>
Content-Language: en-US
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <9002a58daa1b2983f39815b748ee9d2f8dcc4829.1730366936.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 31/10/2024 11:29, Geert Uytterhoeven wrote:
> Commit b9bf5612610aa7e3 ("ARM: dts: am335x-bone-common: Increase MDIO
> reset deassert time") already increased the MDIO reset deassert delay
> from 6.5 to 13 ms, but this may still cause Ethernet PHY probe failures:
> 
>     SMSC LAN8710/LAN8720 4a101000.mdio:00: probe with driver SMSC LAN8710/LAN8720 failed with error -5
> 
> On BeagleBone Black Rev. C3, ETH_RESETn is controlled by an open-drain
> AND gate.  It is pulled high by a 10K resistor, and has a 4.7µF
> capacitor to ground, giving an RC time constant of 47ms.  As it takes
> 0.7RC to charge the capacitor above the threshold voltage of a CMOS
> input (VDD/2), the delay should be at least 33ms.  Considering the
> typical tolerance of 20% on capacitors, 40ms would be safer.  Add an
> additional safety margin and settle for 50ms.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Roger Quadros <rogerq@kernel.org>

