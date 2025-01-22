Return-Path: <linux-omap+bounces-3157-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F70BA18E23
	for <lists+linux-omap@lfdr.de>; Wed, 22 Jan 2025 10:13:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 884023AA6B0
	for <lists+linux-omap@lfdr.de>; Wed, 22 Jan 2025 09:13:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CD7420FA8A;
	Wed, 22 Jan 2025 09:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="ZCS64xl+"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61655170A15;
	Wed, 22 Jan 2025 09:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737537196; cv=none; b=syBAgqnXK8AkHbYwwb1xxXm0vC+FPgFHjht8N9WVJmX3qLHnP0aouugw0v6I9T7gJ7+Yt9NLl1xFyy7QimXZEMuHHdaQmVrCbQTbD9RtA868A3afJEJR7sCxtzPL9XOmEi4vDj/CHntrzgC5HPNZsViKYwgZ7RAt2ms29UpkAak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737537196; c=relaxed/simple;
	bh=apCZdHu639KURNhPefV9MUTf8q9Bba5Yzi2+NafFhsQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OBO2VZL4vFrpSr1E0zWw5K9u7mByud7d2KdMO0Q9oBTPC7NEu8qdcT4UHH3/6KrZD1JMpio7Ww7hYlT171fLJH92I/gKJ/0MrayDF273EFT8AYKWLFtNpyGNkBPxoxrsb0G9ZAGYGvH0M5ylxB0JMLBmGYlnYcPNgDjqAmGU/5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=ZCS64xl+; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=OMIN5tgQLMA/NbZDg4cXYqnbrs+8PJlKeVGtCzkyAV0=; b=ZCS64xl++I/GGPhE36lQTUUcSX
	B957oX8i0FXfN3qYDUFBVliIlfzIeAxUPEmroIXE+QE7Mme4JpBGn5EO25CkNB8AOaF9Pc6CjKfo0
	YPXr0+BczHtM0jzV4QarKJ3XglYB1qBjHdchTJtP4JWM5yaFfWCdMY4QEWSs14lprxVpMkCFHr4pH
	ustWAat9nQLEwyz6bDLsHhOMTZUFglHOAVtE49iD0m7eO4ypKrTt0qt3w/UQNUfh/kuH92uZ1lE/N
	cQmQsw+W0VACj6coGXBl2zxVOG7nCzKhYt+6EtDFhlcy/Xw9f6zGnXE6Hd8JeHfDL4A7rjsaOLJBO
	bbtTBL5A==;
Date: Wed, 22 Jan 2025 09:32:36 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Tom Rini <trini@konsulko.com>
Cc: linux-kernel@vger.kernel.org, Aaro Koskinen <aaro.koskinen@iki.fi>,
 Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>,
 Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-omap@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: omap: Add TI Pandaboard A4 variant
Message-ID: <20250122093236.6152c56c@akair>
In-Reply-To: <20250122001240.4166460-1-trini@konsulko.com>
References: <20250122001240.4166460-1-trini@konsulko.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Am Tue, 21 Jan 2025 18:12:40 -0600
schrieb Tom Rini <trini@konsulko.com>:

> Document the ti,omap4-panda-a4 compatible string in the appropriate
> place within the omap family binding file.
> 
> Signed-off-by: Tom Rini <trini@konsulko.com>
> ---
> Cc: Aaro Koskinen <aaro.koskinen@iki.fi>
> Cc: Andreas Kemnade <andreas@kemnade.info>
> Cc: Kevin Hilman <khilman@baylibre.com>
> Cc: Roger Quadros <rogerq@kernel.org>
> Cc: Tony Lindgren <tony@atomide.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: linux-omap@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  Documentation/devicetree/bindings/arm/ti/omap.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/ti/omap.yaml b/Documentation/devicetree/bindings/arm/ti/omap.yaml
> index 93e04a109a12..28e23ca766b4 100644
> --- a/Documentation/devicetree/bindings/arm/ti/omap.yaml
> +++ b/Documentation/devicetree/bindings/arm/ti/omap.yaml
> @@ -137,6 +137,7 @@ properties:
>                - motorola,xyboard-mz609
>                - motorola,xyboard-mz617
>                - ti,omap4-panda
> +              - ti,omap4-panda-a4
>                - ti,omap4-sdp
>            - const: ti,omap4430
>            - const: ti,omap4

This allows compatible = "ti,omap4-panda-a4", "ti,omap4430", "ti,omap4"

According to your other patch, you want
compatible = "ti,omap4-panda-a4", "ti,omap4-panda", "ti,omap4430",
"ti,omap4"

so you need a construction similar to the "ti,omap3-beagle-ab4"


Regards,
Andreas

