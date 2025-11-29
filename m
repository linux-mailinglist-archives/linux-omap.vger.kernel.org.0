Return-Path: <linux-omap+bounces-5082-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DF6C3C948C1
	for <lists+linux-omap@lfdr.de>; Sun, 30 Nov 2025 00:03:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 686704E12A7
	for <lists+linux-omap@lfdr.de>; Sat, 29 Nov 2025 23:03:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F038264619;
	Sat, 29 Nov 2025 23:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="qKKu+ohq"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6165DD27E;
	Sat, 29 Nov 2025 23:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764457389; cv=none; b=MYvHz4E2kimVinwu87NW3j08FRTHJ1F4AX5yxwiAuGoerrEuux1/hOKXBsv9Cw7wD9lwOzpNsqmNlF/nlt2GJksGWRpuYoAtlVVhRtUXBGljifz07A/00bzKGKeMLbheo3h3IB0wjBn0fSeI4t7fk0erBHo9NRns2Q1moCiED9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764457389; c=relaxed/simple;
	bh=mgXfxylVhwi5gIj+YRMh5lhm1brcwJLLHDr8VW0uBI4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MU5wZR6ismOTLDrgXv23Y6OfivRXuWZlwR6V7MjIQYi6jXxiHjRtbXoFrWjS5qyhLZTx+9Ba5pgaPnewQ6Pc7KOOZ+H8ECy2zzN+G44KizRhJZHGgZrPU4OnMB7kkyeuO7ALoed77W8kNqkDn16NwjhXKwl2gQSlRM3KYd+0sMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=qKKu+ohq; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=OhkaxTXYbFwBVT95vUBVttCOVL60xkD5u6rG8NP8cIU=; b=qKKu+ohqNwccUiBW/QUjuA473c
	kEjo9KTIeYzq5/yF2WBxhbV1PJdHAwezeimvacjpwTRHq3gGsgizqXJK3wGEulb0wOG9kWup2EJKp
	KPw1RijZF1/aZ9gCXnI9mBAqqAj7LQY+2/3u9or6gr91SIb5OUfyo3CRs0YgUUNbGG2T8B+JzEecZ
	7IyURIQUSJvWRdSsSzsDDuDf2anBF5G8tcrbK83kp2OxhJ7FwBFwqT82fQs7J8oDcBMTRKRixvr6s
	Z2E2egA0S21sFDyNuKM7CwLfaBc7KuAPXd+NMEbvM5kGJeGNT6NZuSjAYGFBBxEzHUt9s3dKv/Q3h
	P2TiqEYQ==;
Date: Sun, 30 Nov 2025 00:02:59 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Richard Weinberger <richard@nod.at>, linux-kernel
 <linux-kernel@vger.kernel.org>, linux-omap <linux-omap@vger.kernel.org>,
 devicetree <devicetree@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Lee
 Jones <lee@kernel.org>, dakr <dakr@kernel.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark
 Brown <broonie@kernel.org>, tony <tony@atomide.com>, rogerq
 <rogerq@kernel.org>, khilman <khilman@baylibre.com>, aaro koskinen
 <aaro.koskinen@iki.fi>, Conor Dooley <conor+dt@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, robh <robh@kernel.org>
Subject: Re: [PATCH 1/4] dt-bindings: Document new common property:
 has-inaccessible-regs
Message-ID: <20251130000259.36c37b4e@kemnade.info>
In-Reply-To: <4fc059f0-8aab-4bd2-a7a2-33a532117e71@kernel.org>
References: <20251129142042.344359-1-richard@nod.at>
	<20251129142042.344359-2-richard@nod.at>
	<7d9fcf24-5ad5-48cf-b36d-83025976f3aa@kernel.org>
	<771947541.4509.1764430418744.JavaMail.zimbra@nod.at>
	<8b0e2b8a-314f-40ee-8f30-c281f3799705@kernel.org>
	<4fc059f0-8aab-4bd2-a7a2-33a532117e71@kernel.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 29 Nov 2025 16:49:11 +0100
Krzysztof Kozlowski <krzk@kernel.org> wrote:

> On 29/11/2025 16:44, Krzysztof Kozlowski wrote:
> >>         scm_conf_clocks: clocks {
> >>                 #address-cells = <1>;
> >>                 #size-cells = <0>;
> >>         };      
> >> };
> >>
> >> So, drivers like ti,pbias-dra7 or ti,dra7xx-phy-gmii-sel touch only registers
> >> they know about and this works well.
> >> But syscon manages the whole register map via regmap, and regmap exposes it all
> >> via debugfs.
> >>
> >> What solution do you propose?
> >> Splitting reg = <0x0 0x1400> into many tiny fractions and not using an mfd anymore?  
> > 
> > Fix the driver. In your case, the syscon driver.  
> 
> BTW, the state of existing TI DRA code is so poor that you don't have
> many choices... or rather every choice has drawbacks. If this was proper
> DTS, then I would say - define register map, used by regmap, for your
> compatible either in syscon driver or dedicated driver (thus new driver
> will be the syscon provider for you, just like Google GS101 syscon is
> special).
> 
> Or maybe this is not syscon at all!
> 
> Remember that syscon is a collection of miscellaneous system controller
> registers. You should not use syscon for other things, like devices with
> incomplete hardware description.
> 
It is referenced in mmu0_disp1, it looks like some syscon.
mmu0_dsp1:
...
   ti,syscon-mmuconfig = <&dsp1_system 0x0>;

So it looks valid. In code omap-iommu.c, aparrently only one register is
written.

But again, DRA7 is not my area, OMAP3-5: yes.

Regards,
Andreas

