Return-Path: <linux-omap+bounces-3910-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 05DF0AE037D
	for <lists+linux-omap@lfdr.de>; Thu, 19 Jun 2025 13:29:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AC3F93AD7FA
	for <lists+linux-omap@lfdr.de>; Thu, 19 Jun 2025 11:28:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88A1C22B5B6;
	Thu, 19 Jun 2025 11:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="gnMZLThv"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FE8622A7E6;
	Thu, 19 Jun 2025 11:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750332542; cv=none; b=G8NFbtc3yZsMxiL0mACXZ5v6MHteoJ58T8w+sRpX7MgtdoLSOXhBs8y1ikJ6zV1/0Gl6Dc//T8MVNSFkIzU+rldyAALJdPSVFYeUkUxWUlZoPzYZvz+gr8Ps9xWOb54Ftc3yOb93p23cA/bljYlcrSB6WlhP2futu895VkPUcUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750332542; c=relaxed/simple;
	bh=9DCrtg9pL7wGw7+shaY0rq7YP7MG3KxqY8DbSNRb1vU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Rw6xyddIih5kiIxKde4hZV56BEwzsh3eY2gWC6SUtzvsH7wCD/7mLfMI0aXzBy3nmT6SWau5nLIFimCuzTbQsgTBY/kpk/fV+5gqQTOJ0Qvd56m+UJ64GvPF37gGaHYbnfuijPigzL86Z4sn7Kzmh8NfkUM0dVxE+ngLM83EcQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=gnMZLThv; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=iKincwA05ZxweoMeUklxZHYyUecsuKPd9x1q+OONCGw=; b=gnMZLThv43dnhLW6D3i8zHegva
	aR4FXcTt8RGeQ3ikGzjC5M8yg1WbUIFlyQFyBIX4M/KXb3TKTpPyW0HmKE02ThZquorgeo3MMYy2f
	5q2cn3YpWTe04TwaiggfPTOv3EOWSmvNtaVucxvVj2y7V6xPa7v+0tVIce/eLt+lIOVFGEY+kmFeF
	9I4lPxs8E1AB3220opYIPmJ2/CSyh96OicCc0VTkQP4YcRKlMa8+o/jYSoKT9EDnWUL/H5eVM8HKQ
	5B+yQNVge1Y+Jj8Tm6E/eTUhPAbLl5ovnZZmjtCbD+mUvRLjQZN4Bg/JUwQLiCNsIwPky6CTTz9Q/
	dQUY9olw==;
Date: Thu, 19 Jun 2025 13:28:29 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: Kevin Hilman <khilman@baylibre.com>, Tony Lindgren <tony@atomide.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Aaro Koskinen <aaro.koskinen@iki.fi>,
 Roger Quadros <rogerq@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Paul Barker <paul.barker@sancloud.com>, Marc Murphy
 <marc.murphy@sancloud.com>, Jason Kridner <jkridner@gmail.com>, Andrew
 Davis <afd@ti.com>, Bajjuri Praneeth <praneeth@ti.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, linux-omap@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 2/7] arm: dts: omap: Remove incorrect compatible
 strings from device trees
Message-ID: <20250619132829.76abfedb@akair>
In-Reply-To: <20250619101334.5b67741c@kmaincent-XPS-13-7390>
References: <20250617-bbg-v4-0-827cbd606db6@bootlin.com>
	<20250617-bbg-v4-2-827cbd606db6@bootlin.com>
	<7hzfe4ok9c.fsf@baylibre.com>
	<20250619101334.5b67741c@kmaincent-XPS-13-7390>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Am Thu, 19 Jun 2025 10:13:34 +0200
schrieb Kory Maincent <kory.maincent@bootlin.com>:

[...]
> I am wondering if I will separate my patch series, the cleaning part raises
> lots of push back.
> 
I think this is a good idea, it is usually a good thing to always clean
things up when you bring in something new, but if it becomes the main
work, it is a bit difficult. The /s/tps@/@pmic/ should be done now.
That is unquestioned.

Regards,
Andreas

