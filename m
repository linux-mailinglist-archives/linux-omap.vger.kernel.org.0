Return-Path: <linux-omap+bounces-4611-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 382F0B49775
	for <lists+linux-omap@lfdr.de>; Mon,  8 Sep 2025 19:43:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EC9A73AF054
	for <lists+linux-omap@lfdr.de>; Mon,  8 Sep 2025 17:43:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCA0031329D;
	Mon,  8 Sep 2025 17:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="b05xsw9r"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9A001C07C4;
	Mon,  8 Sep 2025 17:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757353420; cv=none; b=fkq9x7DQaATdVmGsHGrU1+kwi/6XrCQVgF5qmXJDd1csZDlZtGvPahj4dwNNXBOeQdYGRGV7vq1dKnDhjioJUJlyW+0zEbfoO4+SG0XpKzSfMQ2IgnHK4a5EsWjEYbbBFp6w19EEhcWY6u/n0EBrcFPbvk2ApC5v0nLmjlFZ1ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757353420; c=relaxed/simple;
	bh=f74QbRSsu1dbVhIZivsvztwsZbLNgy0Go7WHF+slRtY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RCllCnGaBwYUfxZV/Og0YnLnt+3RysoEq4GLWRPVnX4qPf+8N/Zgs5bwnYjsN1MsiWqUMuXEaJS4m/X42C1T1wuDfcAS4KdIVC2+pnPnrAUn34efq6WE81FvZIQEMDMgiv0UyteQQMOIdkB3ia98HxbrCWqXIUFurCtjx1AnNmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=b05xsw9r; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=7DxMFFEmYQJVM9egFKUYNFfua5OLnOklrmMhAPKnTXI=; b=b05xsw9rfQsjYMG19aZXF8tzZG
	/20CStpvERO3aP+bvVk+s09xgiPy7s9jx8yt95sYkEBHlkF9thi/Ld2nmrJB3+kwLTgSngijqtVWR
	yHNcweOwFzmqmducb8nkl6CouFGVYd7/GDFt5Qp5NgD1Ckl05BwQWajrRG9U3CO/EuJhmGA3wzzrK
	3GsyRuEQjWbzjdbPYvcdaoO2ccWqzJJxnXq+fiP82O0VYEOCGITYoTYutzmsqVO0xFTZZ7EQ5Ro1u
	Ut+F3YJ7VXBzsK8mt+RSls7XMHU8SoP334HJBMtAbGmZN48eV5gnuPQg3uC9kviC8A9oSoVHMPEFm
	w0VoC9Nw==;
Date: Mon, 8 Sep 2025 19:43:24 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Barker <paul.barker@sancloud.com>, Marc Murphy
 <marc.murphy@sancloud.com>, Tony Lindgren <tony@atomide.com>, Kishon Vijay
 Abraham I <kishon@kernel.org>, linux-mmc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-omap@vger.kernel.org
Subject: Re: [PATCH v2 1/2] arm: dts: ti: omap: Drop unnecessary or unused
 properties
Message-ID: <20250908194324.5d30155e@akair>
In-Reply-To: <20250908-ti-sdhci-omap-v2-1-72927890482f@gmail.com>
References: <20250908-ti-sdhci-omap-v2-0-72927890482f@gmail.com>
	<20250908-ti-sdhci-omap-v2-1-72927890482f@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Am Mon, 08 Sep 2025 16:17:12 +0000
schrieb Charan Pedumuru <charan.pedumuru@gmail.com>:

> Remove unnecessary properties like ti,needs-special-reset,
> ti,needs-special-hs-handling and cap-mmc-dual-data-rate from the DTS
> files as there is no user of them.
> 
> Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>

Nack. At least ti,needs-special-reset and ti,needs-special-hs-handling
are used by the drivers/mmc/host/omap_hsmmc.c and you remove it from
nodes using compatibles of that driver. So at least restrict that to
sdhci-omap stuff.

Regards,
Andreas

