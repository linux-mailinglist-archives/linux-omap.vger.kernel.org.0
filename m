Return-Path: <linux-omap+bounces-1518-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 57EF4903F2D
	for <lists+linux-omap@lfdr.de>; Tue, 11 Jun 2024 16:50:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D82302824AA
	for <lists+linux-omap@lfdr.de>; Tue, 11 Jun 2024 14:50:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B4B4171A5;
	Tue, 11 Jun 2024 14:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="1aqU3CL3"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail2.andi.de1.cc (vmd64148.contaboserver.net [161.97.139.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 989C6171A1;
	Tue, 11 Jun 2024 14:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=161.97.139.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718117400; cv=none; b=cU3b5188Je7F4DmdDE79/KgnvqGzkWWIP3Pn9MGP+tHiiezyL0kKHr9CxoBU17Mx/74ilKbJWdp6SaB5fcljgg4os8d5rnDtBeOQxsEheUSXvXRI1iH0QhiZWFzmzot+8QsJY6qM2GoE4UsSuGEubIMfTBi7KphVh7fhTLQwD5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718117400; c=relaxed/simple;
	bh=mwraJ4rGdDIfQI416mB2JANpZgIZosVzrfC35FrESUw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qX0BTl9gOq3TDelDsRLEchuVr3jB/FwyMSb12SGGLpSL5RKcW5jB4HBrmEyHtLnuol89Q73U2RMCKj9S/1fwqAV0COACHlvdxhSr0Z/q26qIQF01rWPE5XVBwgjIzxJzQK8Nmf3HGWa+NpYSDLR2lqyWKV/BOncOKlSAWHIgUIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=1aqU3CL3; arc=none smtp.client-ip=161.97.139.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by mail2.andi.de1.cc with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <andreas@kemnade.info>)
	id 1sH2ot-0008ac-1D;
	Tue, 11 Jun 2024 16:49:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=gRFPV5bnvyRPifN5Rx8mFlhmhaUoDCNSJVc7gDzwLXw=; b=1aqU3CL39FnXmKZD4gdrFknifI
	bQGypJx+I4mPeFuFaytbBZggjSIw1BEUjjIk0GN28uw6RRsgWC3CYYmmMX4ui6Yq0oUr9vpJFA8JQ
	+uKd8/tMcNzGpQ+pghwHNtaF+21KIYQ27kJlSXOjscPA9SZ36F8081A1YmiqrQIzYUr1OxoJAv8F/
	0rXr5K8kBVysW4n3uwrC8DaqPNzur9TnbM/YgNZMOkVE66b3j49qbwL3byKcIRCIt/8wBvLirfo5f
	eVHSTk8mV3t3Dz3njl8Qfr6m9FvkeK+L0XErzYCc88ySigBEmBuVe+87BK5TZKGuOZo9Jng7BkGya
	J3tkboUw==;
Received: from p200300c20737c2001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:c2:737:c200:1a3d:a2ff:febf:d33a] helo=aktux)
	by mail.andi.de1.cc with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <andreas@kemnade.info>)
	id 1sH2op-00325g-2M;
	Tue, 11 Jun 2024 16:49:53 +0200
Date: Tue, 11 Jun 2024 16:49:51 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: Mighty <bavishimithil@gmail.com>
Cc: =?UTF-8?B?QmVub8OudA==?= Cousson <bcousson@baylibre.com>, Tony Lindgren
 <tony@atomide.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] ARM: dts: twl6032: Add DTS file for TWL6032 PMIC
Message-ID: <20240611164951.51754ffc@aktux>
In-Reply-To: <20240611132134.31269-1-bavishimithil@gmail.com>
References: <20240611132134.31269-1-bavishimithil@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi,

On Tue, 11 Jun 2024 18:51:34 +0530
Mighty <bavishimithil@gmail.com> wrote:

> From: Mithil Bavishi <bavishimithil@gmail.com>
> 
> Add a dedicated DTS file for the TWL6032 PMIC (Phoenix Lite). Already
> has driver support with TWL6030 (Phoenix) since both of them are so
> similar, some nodes can be reused from TWL6030 as well.
> 
> This can be included in the board files like twl6030.
> Example:
> ...
> &i2c1 {
>     twl: twl@48 {
>         reg = <0x48>;
>         interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
>         interrupt-controller;
>         interrupt-parent = <&gic>;
>     };
> };
> 
> /include/ "twl6032.dtsi"
> ...
> 
> Used in devices like samsung-espresso, amazon-jem, epson-embt2ws etc.
> 
> Regulator values are found from downstream kernel for espresso.
> 
hmm, that might be board specific stuff, maybe keep them as they are in the
twl6030.dtsi and override them in board specific dts files if needed.
And is there any reason why you left out the pwm stuff?
I think the twl6030.dtsi and twl6032.dtsi should be as similar as possible.

Regards,
Andreas

