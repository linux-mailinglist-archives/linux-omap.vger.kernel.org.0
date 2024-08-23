Return-Path: <linux-omap+bounces-1982-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3227095CB4A
	for <lists+linux-omap@lfdr.de>; Fri, 23 Aug 2024 13:22:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C63E1B234CC
	for <lists+linux-omap@lfdr.de>; Fri, 23 Aug 2024 11:22:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B382187349;
	Fri, 23 Aug 2024 11:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="nGHUpr+G"
X-Original-To: linux-omap@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 210FC4F88C;
	Fri, 23 Aug 2024 11:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724412159; cv=none; b=BkzL2mXQDASBI/5Uxdnj31JuuVHK226tmqlPzTP+G/HosO326ldEIvDxqfiWQEyANaPis/wNlYGDEHtPgVS6FgSJOpZ+0UKO4F5bZeYvoYmnQc6Ca+d04ckE22VSSPjeJpuD91kFWd0Jm2ozxtpSaxv+BP8zN5ddF8PfmAQJ2q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724412159; c=relaxed/simple;
	bh=XO/W9b0svmoB4CJcDqfPWSQb9huCXBU/42O2KZgWVoM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oDW9Gx0m9juJhCOQSGb+lmn6abCQYNURK8S8CiTSiBdqe6WmxHJknNr8faOW2FsGRXsfm+tN6r4PEVbcjOtwqKLt0nloGyjA0lAU5JhiGB23WCwja6Dz2Y+PyaMSWc/r1WLkTFXbPfGST6NdhiP/6W8BKHzoTbKmV242B9Hi4sA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=nGHUpr+G; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id C336220004;
	Fri, 23 Aug 2024 11:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1724412154;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vEErrK9FD0vaKpiSbCT4bPWa4JRwzMbVqQ0MjPMeQMk=;
	b=nGHUpr+GQVkUzfHMd/pK9tdNR0G+Kgkwl1s20E2lhZuUf1eA1wwkHw/Ip8LQz0+8lY0WBW
	1qlAFAHzXcXZ9W7g4j6WX9LI02gsgYLN23y2aR0uPUtza+NgmAhoFvTebGwBOtCuCIUn2p
	s7qOuK0BE94vpK9uQ2cWPk3A610xh7EJyY8FNinYDEhrwLL3DX9hYydSlhlx20I0dxdvqB
	AqTa7Bgw8wswNVqs9fWPpPah6sFyad0cVJiKjRU3cln2jhyNHLSesU8zGS8f+IJPw2DoLY
	fKxsNZdG61JOUODG2xgu5Um/LGh0+kr+jW8paK0aXIxuM76HPOR6hjOE6WV5Lw==
Date: Fri, 23 Aug 2024 13:22:33 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Santosh Shilimkar <ssantosh@kernel.org>, Krzysztof Kozlowski
 <krzk@kernel.org>, Roger Quadros <rogerq@kernel.org>, Tony Lindgren
 <tony@atomide.com>, Vladimir Zapolskiy <vz@mleia.com>, Michal Simek
 <michal.simek@amd.com>, linux-kernel@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 6/7] memory: pl353-smc: simplify with dev_err_probe()
Message-ID: <20240823132233.1421faee@xps-13>
In-Reply-To: <20240823-b4-cleanup-h-guard-v1-6-01668915bd55@linaro.org>
References: <20240823-b4-cleanup-h-guard-v1-0-01668915bd55@linaro.org>
	<20240823-b4-cleanup-h-guard-v1-6-01668915bd55@linaro.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com

Hi Krzysztof,

krzysztof.kozlowski@linaro.org wrote on Fri, 23 Aug 2024 12:16:01 +0200:

> Use dev_err_probe() to avoid dmesg flood on actual defer.  This makes
> the code also simpler.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

Thanks,
Miqu=C3=A8l

