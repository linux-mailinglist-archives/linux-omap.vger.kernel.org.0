Return-Path: <linux-omap+bounces-782-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E8BE786F213
	for <lists+linux-omap@lfdr.de>; Sat,  2 Mar 2024 20:18:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 890B81F21DDB
	for <lists+linux-omap@lfdr.de>; Sat,  2 Mar 2024 19:18:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9918E3FE47;
	Sat,  2 Mar 2024 19:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="PejlC6B9"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DA953FE2A;
	Sat,  2 Mar 2024 19:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709407107; cv=none; b=jNWc5o6UUReH5cgPwXD0TeUvyD+4y68OS3Hz3z+BDnGDi+etpk6//9S3cZi6qcnlUkZsLkv2bG6hHX2LdxP5Rcd+ehWQJqsp/ghV9A1y875atpziw2hMofQB/EIICaXqCTBv/C16VxjQeC2CELMOwj5iodgW5erBOISPY7CbRpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709407107; c=relaxed/simple;
	bh=Wk6ntCjlPsAts86m9vzbnmY7O2BjJa1dq1qUTFVePM0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Oqp0/gM6+r3gGgApGTxR6SU793/sUJ4BYU/fRHMkZq3uK65n70uNAZON5SZeA779QT4crWhNxnDs8TLMudZCHdkd8EW3aZms7Q5w2kCwcpLFLDeFtqPwt7Wno/7PIIQJhOYSbG7qWXcp8k7Nv2L536sl8YFNQ8zebCcWEdrb35Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=PejlC6B9; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=KM1TopTRXtLKN5oONX1Ztk1pd6ed32mzkDGzZN+rujY=; b=PejlC6B9YRD/fiQG8n+nRdIjna
	kpTyimgzTR7Lv9KaKWFXoRdy8epOrVj8s+jvEvBKYn4kyFZtlNhxOeWizSfVk8uIKfJhGzdtD6VmE
	szEbJROb/2NQV8fB9Ns80NhHorsNsZlG5K97pZ1FBqBPrCAR3rY8Z+pHxdr79sggXqQUAvrV1vUJh
	SpHKJNPWKMoKtmQe53IJIZ/Q8ChF/m35OAc8H1w6AwOhyTpM/jfGhA47QFI6a11IF1XTGahAlgMb4
	CXiZ6jXJrJnv1NSspmPV1r/n/V61e7Pe/0BJP9jmDwAxPFbq0opeILqtKz5gRUnVz5+EopZ9fENyq
	U0ht6rLg==;
Received: from p200301077700b1001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:107:7700:b100:1a3d:a2ff:febf:d33a] helo=aktux)
	by mail.andi.de1.cc with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <andreas@kemnade.info>)
	id 1rgUsB-009xx8-Qc; Sat, 02 Mar 2024 20:18:15 +0100
Date: Sat, 2 Mar 2024 20:18:13 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Tony Lindgren <tony@atomide.com>
Cc: =?UTF-8?B?QmVub8OudA==?= Cousson <bcousson@baylibre.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Tero Kristo <kristo@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org
Subject: Re: [PATCH 0/4] Use reg instead of ti,bit-shift for clksel
Message-ID: <20240302201813.06fc09d7@aktux>
In-Reply-To: <20240229070626.GH52537@atomide.com>
References: <20240213105730.5287-1-tony@atomide.com>
	<20240214001140.2abe0d80@aktux>
	<20240214054044.GK52537@atomide.com>
	<20240229070626.GH52537@atomide.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi Tony,

On Thu, 29 Feb 2024 09:06:26 +0200
Tony Lindgren <tony@atomide.com> wrote:

> * Tony Lindgren <tony@atomide.com> [240214 05:41]:
> > * Andreas Kemnade <andreas@kemnade.info> [240213 23:11]:  
> > > On Tue, 13 Feb 2024 12:56:40 +0200
> > > Tony Lindgren <tony@atomide.com> wrote:
> > >   
> > > > Hi all,
> > > > 
> > > > This series updates the clksel clocks to use the standard reg property
> > > > instead of ti,bit-shift.
> > > > 
> > > > I'd like to apply these before we make further use of the clksel clocks
> > > > to reduce the dtb check warnings.
> > > >   
> > > 
> > > hmm, we still have ti,bit-shift if these clocks are not used below a ti,clksel.
> > > Just wondering, can we completely deorbit ti,bit-shift if we used #address-cells = <2>;
> > > in those cases? I wait a bit with further txt->yaml conversions until
> > > this is settled.  
> > 
> > No need to wait on the yaml conversion I think :) How about just tag the
> > ti,bit-shift property as deprecated? And add a comment saying it is only
> > needed for the remaining unconnected clocks.
> > 
> > Eventually we can move all the component clocks under clksel clocks, or the
> > related clock such as the dpll clock for the clkdcoldo clocks.  
> 
> Oh and yes, using #clock-cells = <2> would be nice eventually :) I think
> the clkcel binding already supports that. But that still leaves the issue
> of unconnected composite clocks.. I'm pretty sure they all have some real
> parent like clksel for dpll though.
> 
> If you had some good idea in mind for the #address-cells = <2> for the
> remaining unconnected composite clocks maybe clarify it a bit.
> 
I was just wondering whether we could do reg = <register bit> then.

Regards,
Andreas

