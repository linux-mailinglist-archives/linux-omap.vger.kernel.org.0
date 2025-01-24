Return-Path: <linux-omap+bounces-3221-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 09626A1BDAB
	for <lists+linux-omap@lfdr.de>; Fri, 24 Jan 2025 21:54:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BCE02188EDF9
	for <lists+linux-omap@lfdr.de>; Fri, 24 Jan 2025 20:54:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C7D71DC19E;
	Fri, 24 Jan 2025 20:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="JfSel7QF"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 275001DB366;
	Fri, 24 Jan 2025 20:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737752085; cv=none; b=aByiYOHbzPu8Uf1TfMu/uOGAZJUrEtQAqAQP0D5uN6LS2nw6QmlRiJqB4kRvPCVn1MAyUEcQeqQv2r0rDnOHG3if66SgTILQoEas5raBzbouR38dCL9AZJIqayagzm1KVn7ZQHANsa5BLUgvnnsIlxxJL/vOmSs3jkrSDg/UC/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737752085; c=relaxed/simple;
	bh=bhQXCVw1bvBBSpezG1XHNPUGaH1nj1sWk1Dg2F/Qdyw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YfwAvhDIVQylx+2OuOoBnR4Yt3jtHoyBqCyQ4Tp0UvV8bxJ9VUY6u8Uq/eKphDzoGWPTjnqT8nMeakKFiy1sEFLU5Yy2gGubTMrzteXLcWgewziVB1PAgTak2Q9BiUHANxPwdZKuA63JFPYGVQB/BwgTEeIEkF/rsb46gQRfNvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=JfSel7QF; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=Q6hbJURnMhCnEYKFjyF2DAG0VF2IxqR5JLxyc6m2pzk=; b=JfSel7QFOgeb/SN0o63V6jFU4d
	7prmsnXLwMeifqTGK/Jqzppbq9ci1TWLyXvoO913LkExA2SKT5qDF9K4J2ULQ3o7OJygO0F4z5WhM
	cEdmzq6W36TktdLerKEoOZvOrjA4Rd67UMNGIi9mekEYt86jxzeLz0G/xXdo1tyR3nQ/syF3PImv9
	ggCbok2OfX5/Y6qFcBDT8ZPTCgpXsGD5a5kmCD7AqgOu1YyJG1a158vVb9vS2mx7FIOF4zHmiQge6
	33hz4lJsBRSenA7FoSjIUHkHKVD/R+lQpn5ZBqnRgvmHeRtps0+iyL7AzHd9ccdcgS45h0axBSKJy
	0rLJTguA==;
Date: Fri, 24 Jan 2025 21:54:09 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Tom Rini <trini@konsulko.com>
Cc: linux-kernel@vger.kernel.org, Aaro Koskinen <aaro.koskinen@iki.fi>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Robert Nelson <robertcnelson@gmail.com>, Roger Quadros <rogerq@kernel.org>,
 Tony Lindgren <tony@atomide.com>, devicetree@vger.kernel.org,
 linux-omap@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: omap: Add TI Pandaboard A4 variant
Message-ID: <20250124215409.1d5cc5aa@akair>
In-Reply-To: <20250123174901.1182176-1-trini@konsulko.com>
References: <20250123174901.1182176-1-trini@konsulko.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Am Thu, 23 Jan 2025 11:49:00 -0600
schrieb Tom Rini <trini@konsulko.com>:

> Document the ti,omap4-panda-a4 compatible string in the appropriate
> place within the omap family binding file.
> 
> Signed-off-by: Tom Rini <trini@konsulko.com>

Reviewed-by: Andreas Kemnade <andreas@kemnade.info>

Regards,
Andreas

