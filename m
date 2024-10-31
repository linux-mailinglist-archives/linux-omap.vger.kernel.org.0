Return-Path: <linux-omap+bounces-2548-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A8D39B765B
	for <lists+linux-omap@lfdr.de>; Thu, 31 Oct 2024 09:25:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 51A7D1F22B67
	for <lists+linux-omap@lfdr.de>; Thu, 31 Oct 2024 08:25:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B84C1553A1;
	Thu, 31 Oct 2024 08:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="GRXKztcz"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC092148832;
	Thu, 31 Oct 2024 08:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730363099; cv=none; b=TuCc8vcIZCyFB5sLw5crA/IZpSSMp6pFWYZl9Gd40ICtCS19kqSU6V0T868yT8OUH4ebfVhH3vpjM+bkZLcFL/yOejQHaapwSWSbpLzmNUX34jWBYxY2/wdx3g/oUdkRF5BvNGqDxD4sp5vawEjVCvchRkyCd71jRsuAyZ4kYUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730363099; c=relaxed/simple;
	bh=2085cZKK6NaG0KrwCVHxh820iAnqFr3Y1AcKVVhLgkg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ADoEOXRQkYa88N6E7gVVMRCIbhVCoa09lYj3b2JlboWpiJlcMhgTxERgjOxM1y+r0LB1GiLoqeuTBxCQmzvvyCyqkXRs3ttgUXpfWOg5DQKSiGFsfH/6Q8enoFWV6EAaybnLvgUbE2UfkMYLxAgt8vuqpHKszOoKbjb5P1M3NYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=GRXKztcz; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=6fYt6Ir4IwWERhFI8y9nZlCwwzecjaJidhXVGcwCvWU=; b=GRXKztczpc2nfDqLML9r55eXzN
	skITUHmY4UpkyXHopvjrM/mJWs+las4ozm2fsXQLPE6XjG8kdlYZH1EXmj7OsBCsLpNoSUIYybD92
	qf+VV9PNh9oiDWjTo6OeyhTvJras5kzr4+XgkUYKYanLlbMXOQ9pH9pqL3gYvlK2wSM538IRCLbeJ
	yFjkHkR4nzpEctZANHHkRrg83QDQTmKEv2VXb7qxX1OQlOmuH1W5zsukxdLBuDn+5QX5H71iusLVk
	zo5BYl9rJe62L343dl+9PkfI+Az47vbJ+7uzrmh4nKsFDcxRzBskd0DssxQWc7N7qZ2nsAaOGKpAu
	5WHHVfgA==;
Date: Thu, 31 Oct 2024 09:24:48 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mithil Bavishi <bavishimithil@gmail.com>, Aaro Koskinen
 <aaro.koskinen@iki.fi>, Kevin Hilman <khilman@baylibre.com>, Roger Quadros
 <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-omap@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2 3/6] dt-bindings: omap: Add Samaung Galaxy Tab 2 7.0
Message-ID: <20241031092448.174402c3@akair>
In-Reply-To: <46rktrrcnpl53nt3o7qe24cd4wp3cjq2v4sbno5oxdrgyazzfj@uqr5kt7pm2x5>
References: <20241030211847.413-1-bavishimithil@gmail.com>
	<46rktrrcnpl53nt3o7qe24cd4wp3cjq2v4sbno5oxdrgyazzfj@uqr5kt7pm2x5>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Am Thu, 31 Oct 2024 09:18:49 +0100
schrieb Krzysztof Kozlowski <krzk@kernel.org>:

> On Wed, Oct 30, 2024 at 09:18:43PM +0000, Mithil Bavishi wrote:
> > Add samsung-espresso7 codename for the 7 inch variant
> > 
> > Signed-off-by: Mithil Bavishi <bavishimithil@gmail.com>
> > ---
> >  Documentation/devicetree/bindings/arm/ti/omap.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> >  
> 
> This is v2, so where is the changelog? Same for all other patches. No
> cover letter, no changelogs in patches.
> 
The cover letter including changelog is here:
https://lore.kernel.org/linux-omap/20241030211215.347710-1-bavishimithil@gmail.com/T/#t

seems like it was ripped apart somehow.

Regards,
Andreas

