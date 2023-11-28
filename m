Return-Path: <linux-omap+bounces-61-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF3737FC5A8
	for <lists+linux-omap@lfdr.de>; Tue, 28 Nov 2023 21:41:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4AE09B217AC
	for <lists+linux-omap@lfdr.de>; Tue, 28 Nov 2023 20:41:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8702739AFF;
	Tue, 28 Nov 2023 20:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [IPv6:2a02:c205:3004:2154::1])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F0B9170B;
	Tue, 28 Nov 2023 12:41:25 -0800 (PST)
Received: from p200301077700a9001093e13752edbf74.dip0.t-ipconnect.de ([2003:107:7700:a900:1093:e137:52ed:bf74] helo=akair)
	by mail.andi.de1.cc with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <andreas@kemnade.info>)
	id 1r84tU-006otY-HU; Tue, 28 Nov 2023 21:41:20 +0100
Date: Tue, 28 Nov 2023 21:41:16 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, kristo@kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: clock: ti: Convert interface.txt to
 json-schema
Message-ID: <20231128214116.22dfff1e@akair>
In-Reply-To: <7361082a-f271-4ef4-9dad-06ee7445c749@linaro.org>
References: <20231127202359.145778-1-andreas@kemnade.info>
	<7a62ed8a-b0e3-4881-90d7-b8f5d38e482e@linaro.org>
	<20231128093241.707a4fa0@aktux>
	<7361082a-f271-4ef4-9dad-06ee7445c749@linaro.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Am Tue, 28 Nov 2023 09:41:23 +0100
schrieb Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>:

[...] 
> > We have two usecases here (status quo in dts usage and code):
> > If these interface clocks are below a ti,clksel then we are
> > describing multiple bits in the same register and therefore every
> > child of ti,clksel would have the same reg.  
> 
> Regs can have bits, so that could still work.
> 
Yes, it could. Things could be designed in another way. But for now I
want to get rid of dtbs_check warnings and finally have some fun with
that and not always tempted to skip it and just copy over $bad_example.
So I am not in the mood of redesigning everything.

> > If the interface clock is not below a ti,clksel then we have reg.  
> 
> This should be expressed in the bindings. It's fine to make the reg
> optional (skip the description, it's confusing), but the ti,clksel
> should reference this schema and enforce it on the children.
> 
Well there are other compatibles below ti,clksel, too, so should we
rather add them when the other .txt files are converted?

Regards,
Andreas

