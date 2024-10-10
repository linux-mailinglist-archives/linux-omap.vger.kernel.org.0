Return-Path: <linux-omap+bounces-2389-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA60799860F
	for <lists+linux-omap@lfdr.de>; Thu, 10 Oct 2024 14:32:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 25DBC1C215EB
	for <lists+linux-omap@lfdr.de>; Thu, 10 Oct 2024 12:32:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E51F1C4623;
	Thu, 10 Oct 2024 12:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="IL1Z8WQW"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FA8329AF;
	Thu, 10 Oct 2024 12:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728563569; cv=none; b=EOwUPNn7zL7fd2nSOyEb0ahFUh/EOqexUQGZC0HqMGUlobq2Vb7/AMSGmzZz+6t2w9nexNXH0ai4v7xP8eNC26tClMvxIVxyhkkn42LpgNd9IvP+VRVCsy3qMrVLOUKisrwpr4XDedhll4/ROaco29t9tOQ+3FTr0271fFR6LfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728563569; c=relaxed/simple;
	bh=vbKGLYhtExLWQh/Nx4lqMelQEMIeC1Uii8AopS84Egs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dtMco76tD/mVNfTaw7neWIxz+9HATw7uMiT7lEDHgWfjNJe/b5s2EtwR4tFDJHEfDxKokhTKL5YXSWpdEqZdOCtb81d6VZdgTei7Iuh9U0JDTwzKwbtDydZZPgm9X3Lgza3utc60SaYUFtqv42Kcmt+/4uJtJfDxPmIYamuBogw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=IL1Z8WQW; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=FHEQgOFTcCkuIA9f7U4xbHHDt594S7u1HPmb6cwzMS0=; b=IL1Z8WQWnHbXNfb3PSy7pm1/Sf
	R1mfPx5Nmnr3astSAgj3X/0r87XK3eQA+mbAHbDmi8pl/7ixMUcmUvgn3bj1NDd+2Y6q9PcVT6Ypb
	sbuLnvoCygtlxSbAAB4qGqnHPJGZomt0NFj91ZHpC7s1XKng8Cg6N/TvMW48S/UZuIEAKySBOrgKv
	kFWlGAE3C8z4df/HVu6OXlDbP58DcuvBhyMRFSk9gENP+rCc2A/E2L5xQbn6EdZ9Nike+EdfEegbr
	p1sPSq3Uu1gsobN+PXMMsPNcbFip3QIyyb8sQ+jS04pLDjOXyjBoKOo3ORqvEDz1NlRf5v0qz9YV5
	mCRr95tg==;
Date: Thu, 10 Oct 2024 14:32:41 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: Roger Quadros <rogerq@kernel.org>
Cc: Kevin Hilman <khilman@baylibre.com>, Michael Turquette
 <mturquette@baylibre.com>, Aaro Koskinen <aaro.koskinen@iki.fi>,
 linux-kernel@vger.kernel.org, Tony Lindgren <tony@atomide.com>,
 linux-clk@vger.kernel.org, Lee Jones <lee@kernel.org>, Stephen Boyd
 <sboyd@kernel.org>, linux-omap@vger.kernel.org
Subject: Re: [PATCH v4 3/3] clk: twl: add TWL6030 support
Message-ID: <20241010143241.2f126066@akair>
In-Reply-To: <901ab11e-bfe3-487c-9867-53289c848792@kernel.org>
References: <20241010074355.58161-1-andreas@kemnade.info>
	<20241010074355.58161-4-andreas@kemnade.info>
	<901ab11e-bfe3-487c-9867-53289c848792@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Am Thu, 10 Oct 2024 14:36:58 +0300
schrieb Roger Quadros <rogerq@kernel.org>:

> > +	if (cinfo->type == TWL_TYPE_6032)  
> 
> Shouldn't this be done for TWL_TYPE_6030?
> 
oops, that flipped through. Well, prepare() works seamlessly...

> > +		ret = twlclk_write(cinfo, TWL_MODULE_PM_RECEIVER,
> > VREG_STATE,
> > +				   ALL_GRP <<
> > TWL6030_CFG_STATE_GRP_SHIFT |
> > +				   TWL6030_CFG_STATE_OFF);
> > +	else> +		ret = twlclk_write(cinfo,
> > TWL_MODULE_PM_RECEIVER, VREG_STATE,
> > +				   TWL6030_CFG_STATE_OFF);
> > +

