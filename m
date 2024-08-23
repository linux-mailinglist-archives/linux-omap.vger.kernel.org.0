Return-Path: <linux-omap+bounces-1983-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0F3A95CB50
	for <lists+linux-omap@lfdr.de>; Fri, 23 Aug 2024 13:23:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1FC8C1C214AA
	for <lists+linux-omap@lfdr.de>; Fri, 23 Aug 2024 11:23:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A467C187349;
	Fri, 23 Aug 2024 11:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="LBspOPxv"
X-Original-To: linux-omap@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDC2716EB79;
	Fri, 23 Aug 2024 11:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724412208; cv=none; b=XMaGDcyM2yAICyiOudbQUS1q9K+cdfZLjfFT/oePvkkkkok9TnDA2u0HFyJR8sHINbfDM3b6GhM7kfNwymMytyWq2v0LVrLL+A7B6JjvzJmVmX8eDRory7ow8tQGtMrq8atBiBMqRKKMwa9xiCiFeaXhQK4jISxtqmSNx8fFOdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724412208; c=relaxed/simple;
	bh=SaTuvw0MJunv7dLNBgF0IjP/Pg/Ms2j6iJq6un2x1UI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dmKvbjpFQWvW00JRKnTYg35Uu/46ITdsjBzstZ9uKOF18SSGDEst8ps60KG6ZuO9LQzJOVQhwdBsr2PN2YQkAQCybVqe/IKVqAswGAAEJakb5CMhpd6N7UlaMciq/9+1TSCvlxGoYKQsXqILvwkbAOO+Ho4pn4W6R5K/3UewBx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=LBspOPxv; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 492A9E0003;
	Fri, 23 Aug 2024 11:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1724412203;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SaTuvw0MJunv7dLNBgF0IjP/Pg/Ms2j6iJq6un2x1UI=;
	b=LBspOPxvAHp9tbAR2zobwwZpo8tI/F50Z8KlGOxR2la0IMGaiqdlmHH2uZoPUnqRaGosW1
	e9nl/vR6Z/F411fLtagQ8ZhJwO3G8Kosr2n8WYUPY4z8dW4HCqisAWYod6BDEL80UytDkI
	rFAzz5GI9qI0VmHGCogeVLOgxTazofo0vUf7CMlPW8KhKJ+QUKDV1eZqJckKu9cwjBfHes
	wPvbaAtT7ZWdSZidWyGlfTCnKwZ28fko+QCG6MOU+ExiWb3XVVkmw25cvdxMt7xP0tdT09
	OAt0YIf6m9iQri5C9QbLJbUUxRGqUNm3uVvSA5iNVvxtSC3+aeNYaWOrQqWgKQ==
Date: Fri, 23 Aug 2024 13:23:21 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Santosh Shilimkar <ssantosh@kernel.org>, Krzysztof Kozlowski
 <krzk@kernel.org>, Roger Quadros <rogerq@kernel.org>, Tony Lindgren
 <tony@atomide.com>, Vladimir Zapolskiy <vz@mleia.com>, Michal Simek
 <michal.simek@amd.com>, linux-kernel@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 7/7] memory: pl353-smc: simplify with
 devm_clk_get_enabled()
Message-ID: <20240823132321.08f7f9e3@xps-13>
In-Reply-To: <20240823-b4-cleanup-h-guard-v1-7-01668915bd55@linaro.org>
References: <20240823-b4-cleanup-h-guard-v1-0-01668915bd55@linaro.org>
	<20240823-b4-cleanup-h-guard-v1-7-01668915bd55@linaro.org>
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

krzysztof.kozlowski@linaro.org wrote on Fri, 23 Aug 2024 12:16:02 +0200:

> Use devm_clk_get_enabled() to drop clock prepare/unprepare parts and
> make code simpler.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

Thanks,
Miqu=C3=A8l

