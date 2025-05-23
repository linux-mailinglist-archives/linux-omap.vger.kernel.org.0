Return-Path: <linux-omap+bounces-3737-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C6C7AC2A95
	for <lists+linux-omap@lfdr.de>; Fri, 23 May 2025 21:49:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 12400189DB45
	for <lists+linux-omap@lfdr.de>; Fri, 23 May 2025 19:49:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E75A19CC1C;
	Fri, 23 May 2025 19:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="5tDMPeRS"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC2D07E1;
	Fri, 23 May 2025 19:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748029748; cv=none; b=LCtEVULG+uTIyWgHU0tM7Z4IUULvJrq5J8Sk0Fi2ipv/IYl3GxWXApDeQcRuu7vKQUOCx4cfF6pqFBa2W+SJhMbjTtMf4ba0aW0dzC3SPGb0N3dHxGakm8aY3tLjibzNzl+dHk3dUfj42cX+zHsV4lofO2oJTVn0n3dgCK5ziec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748029748; c=relaxed/simple;
	bh=sW+SpZJfC54Hz1pkz00s+31W+wLYMl9X2YSvEcoGfXI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mxDC+QcOy5FpEqQq1KIZ/fPq6e9ig2P56ob/oJj7wl6AI5MDgc7VadcUe4cqANBpGtWzpfdJme/aruqUEiFmVNCYDn3co7EawDKXheH2Zp6+rHMyrTqg5EOIuFHljy8Uu7g11uHPjn7IEWCKjsZp8CwFty1rg3aDFpxz6bUA4S8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=5tDMPeRS; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=79s/icVsiY8Ko2RVtcahqgEQcdOzHFxHzgCmFXIv5aI=; b=5tDMPeRSETnCwMg+Jva9n8WhSV
	CWNIYJARGmPJfBxQoD91e+uasPEHbfFbSK5BdvfaxAhzMi2AomecNQyveoPcRW7VyTK8k3b5TugeQ
	ogpt/xVdTGJ25sLL9b4FTeqfFcK1cctM2+ZqyAk/GZqZosAAmKlNFDJ7K6bgYTxpfpChjySbO1XTq
	n3ds/yqjVcc2IqoSkQkucXNr4HNV8M9zi/ETROgS0QSLKQIStY7gwkKvU6hmzBhtsAru41N0FujaJ
	D0YvwDuz6xpooNLroQXso75kp6ajlv2xmyRDHNwJuEcYNkN+mpAMW/InTvG02EZ48UUkMNP27Y/wB
	q5KhwA0Q==;
Date: Fri, 23 May 2025 21:48:54 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Aaro Koskinen <aaro.koskinen@iki.fi>, Kevin Hilman
 <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, Russell King
 <linux@armlinux.org.uk>, Bajjuri Praneeth <praneeth@ti.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, linux-omap@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] arm: omap2plus_defconfig: Enable TPS65219 regulator
Message-ID: <20250523214854.3acced3c@akair>
In-Reply-To: <20250523-bbg-v1-2-ef4a9e57eeee@bootlin.com>
References: <20250523-bbg-v1-0-ef4a9e57eeee@bootlin.com>
	<20250523-bbg-v1-2-ef4a9e57eeee@bootlin.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Am Fri, 23 May 2025 17:57:43 +0200
schrieb Kory Maincent <kory.maincent@bootlin.com>:

> Enable the TPS65219 regulator in the defconfig, as the TPS65214
> variant is used by the newly introduced BeagleBoard Green Eco board.
> 
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>

Reviewed-by: Andreas Kemnade <andreas@kemnade.info>

