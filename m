Return-Path: <linux-omap+bounces-1740-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A88692AABE
	for <lists+linux-omap@lfdr.de>; Mon,  8 Jul 2024 22:48:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DC29528315E
	for <lists+linux-omap@lfdr.de>; Mon,  8 Jul 2024 20:48:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA128146D53;
	Mon,  8 Jul 2024 20:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="Ya5O5hJ0"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 177C81E522;
	Mon,  8 Jul 2024 20:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720471695; cv=none; b=s7fCt6bsqU3n9yg2s9Fnk4GMZDBUzhAAYZ3aKimXMSGOFOKwrxJjBnoJa2ZYnggTgTaZQdH2UsFroKHAQHPz52PnIn3C+1PNfBKPYDb0LeVfRU+k93NT0ewl7tiiXxtQuygNSs53/fy37KM2CYZeAjbCcPK5EeyFyOS6NkEr11k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720471695; c=relaxed/simple;
	bh=hmf3tM7swWEbHP67M7gMRWixLCqvfDFzdn2pHxB7eYc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aeB9PlROasxC/JpKPlB7uUf4djVut4zW3QZLLw93XgShSeYIOEoX3d0cv/1ao90YK1r43vsXFbXbBuLroKWP8jAAN0TWkrHBBD9YUMfS6vIpvVKcO+FpNYfxHYnzTJOLRjgL9SdiXmhl6KpOmN4S4b4bh0Hm7eonWKkIOK+ogEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=Ya5O5hJ0; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=2NZfop9xMXj5MCVj5FYiZaUu1Tz5sI/EKDJi9yyJQdI=; b=Ya5O5hJ0EnKooPY1JBAy2CixYj
	e5EOZp/uXx/nWW0cgyJO0B9zCk+ecCZe9ky9Slp5bnDVuJDCtCQrrJFYc3uS9UnBNr5wisFwN9H0d
	BwYQhMfX8E80WoXTIELLHgZi8TLk10tCZDamK1wXIMd1qG03Hq31IM5psmzdxaE0/+n5fSsnXsTvg
	JiIHK2pMy12F1YMIX9CXgIB980MjvaD/cNBAQ9JNd5dDIiXq5TFlnIsL+ACD5m4G/c67COwCBPhzg
	SXne3UcAjbDTtef17SqZPs+F1AgFhn8tZAVfiRpxHw8DWHCjvZTIYI2N4jAqorM/ZOe7EumJmE0+D
	gu/5u5Ag==;
Date: Mon, 8 Jul 2024 22:32:05 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: Rob Herring <robh@kernel.org>
Cc: lee@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 lgirdwood@gmail.com, broonie@kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org, Krzysztof
 Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v4] dt-bindings: regulator: twl-regulator: convert to
 yaml
Message-ID: <20240708223205.22b7029d@akphone>
In-Reply-To: <CAL_Jsq+9v0i-6xvPY6cvnJUSLV1d4irqcPv60p+KwC5sx7WDDg@mail.gmail.com>
References: <20240606111611.371463-1-andreas@kemnade.info>
	<CAL_Jsq+9v0i-6xvPY6cvnJUSLV1d4irqcPv60p+KwC5sx7WDDg@mail.gmail.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.37; aarch64-alpine-linux-musl)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 11 Jun 2024 07:39:25 -0600
Rob Herring <robh@kernel.org> wrote:

> > +
> > +        gpadc {
> > +          compatible = "ti,twl6030-gpadc";
> > +          interrupts = <6>;  
> 
> Now a warning in linux-next:
> 
> Documentation/devicetree/bindings/mfd/ti,twl.example.dtb: gpadc:
> '#io-channel-cells' is a required property
>         from schema $id:
> http://devicetree.org/schemas/iio/adc/ti,twl6030-gpadc.yaml#

I sent a fix. It was not applied, maybe because subject does not
contain regulator and so missing Mark's filter?

Regards
Andreas

