Return-Path: <linux-omap+bounces-3344-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A1AFA55F62
	for <lists+linux-omap@lfdr.de>; Fri,  7 Mar 2025 05:29:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 66FDD18955D5
	for <lists+linux-omap@lfdr.de>; Fri,  7 Mar 2025 04:29:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 952531922F3;
	Fri,  7 Mar 2025 04:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b="LTtN1jNC"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBDFFDDC1;
	Fri,  7 Mar 2025 04:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.50.62.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741321758; cv=none; b=qo4PE0WkbBvYzCh2qk0QZCT/ta0X56/zvBW3Grw+ncPG9/Rrnf03qF3VupQbzV1TxbeHnA56VwMGalGFGh7xIKCHWEa1Ja/TBbjuahBLS7hExvc4+wzOsxQOGCd3FO4C18M0YONZBm4XNYLmruu0zMc7rNZ7tgpnFd8IZu7Tqns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741321758; c=relaxed/simple;
	bh=zq99OLrs6v7GQld3xy+GtdFAWCh3tj+Uy7CeSu4omdU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SV1vryo9cNJVacdZWlObxwbjHQZLwOfq+ew0nuQJyR8D2OnSEG4yT+bYbT3RlXpJqvC8PXhk8NdB69Qm0PJujJTriMPqpdz8ZWHQ45tmCm9mvvyUoW8yAgaubkPVJKrrmpAtUeGoMOicKSsIVukGPrSSlDu0FRk8mqm4xg169K8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com; spf=fail smtp.mailfrom=atomide.com; dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b=LTtN1jNC; arc=none smtp.client-ip=74.50.62.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=atomide.com
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
	by mail5.25mail.st (Postfix) with ESMTPSA id 212BA604D8;
	Fri,  7 Mar 2025 04:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
	s=25mailst; t=1741321315;
	bh=zq99OLrs6v7GQld3xy+GtdFAWCh3tj+Uy7CeSu4omdU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LTtN1jNCjnMxVUrfzmj8FjpAVY8mhp0KZpGQI8qr0nzdGBt4wFoWvw4yPNeM1rJWL
	 GxGK9QYQ1bAFdYm5TTCxzQekrl62mec5Jv+rsbaEYhkybOCnsiLNg1KVvFLtcsdAiA
	 e5mYXt41o0sLNILXKClup4tQHcry2HXEMXhaDJR4r9aHPJ+qXEsi1qbYMLj+3sMYcz
	 e0Mk8Ewwxz/20iQ9SiZEfr11Q0cgfF2/Dk0k2zr29r1MI8QBTApHeZHUcw63XotDpm
	 InfXy8a3k+/2eMFGkd7s6nGiaXwhI8xhGehQ7YK2sNBk4bV+cCPoyvFcEEsPY68JFz
	 NaCdm9FFETDHw==
Date: Fri, 7 Mar 2025 06:21:31 +0200
From: Tony Lindgren <tony@atomide.com>
To: Andreas Kemnade <andreas@kemnade.info>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: clock: ti: Convert ti-clkctrl.txt to
 json-schema
Message-ID: <20250307042131.GD23206@atomide.com>
References: <20250305224722.66360-1-andreas@kemnade.info>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250305224722.66360-1-andreas@kemnade.info>

* Andreas Kemnade <andreas@kemnade.info> [250305 22:47]:
> Convert the TI clkctrl clock device tree binding to json-schema.
> Specify the creator of the original binding as a maintainer.

Good to see this happening :)

> @Tony: you seem to be the only contributor to the txt binding,
> so we could go with dual-licensing if you agree.

Yes I agree dual-licensing makes sense for the binding.

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/ti,clkctrl.yaml
> @@ -0,0 +1,64 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/ti,clkctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Texas Instruments clkctrl clock
> +
> +maintainers:
> +  - Tony Lindgren <tony@atomide.com>

Please add yourself as a maintainer too for the binding.

Regards,

Tony



