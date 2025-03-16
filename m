Return-Path: <linux-omap+bounces-3399-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C274A637BD
	for <lists+linux-omap@lfdr.de>; Sun, 16 Mar 2025 23:44:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D32BA16C711
	for <lists+linux-omap@lfdr.de>; Sun, 16 Mar 2025 22:44:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2B211DF993;
	Sun, 16 Mar 2025 22:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="xbhNTQvi"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C86C4BA3F;
	Sun, 16 Mar 2025 22:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742165070; cv=none; b=D4k96a8eY0inP/m6/V+/JDyjT2EkES6412psQhXQ8LpvCaVvEkaiOLvvaUEulXQ1gKIGwDz4Sq6Ey5ipeO60TDaF/aebWhT3BEKehZ7ZLHQHlt5IY6FkPvsDse1fOWxRBV7SnA1STvYKmMLg1ATN8VF/nXX8dg8gDCTljz1VUM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742165070; c=relaxed/simple;
	bh=xkMYsGth4fo/yygdnibJPcnkNxLeqbJ7eAnF4IBWIM0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Y7LOQuNdlQVwKdA9DL3KxVckBZMxA4kT9viC8EzHYkcUuOK69pVIBOQwpd/7amaUucWszZAS1zc+oEHeC4F0cURNAV/uRsyHz6N8eiKs6RuW50N6rKbEmT02NqOHd5ibGNtOkB67uKqTkyGIi9TaCEr/x1vhZfCviUZfJEQ8Rl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=xbhNTQvi; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=9iNukgtNIY9Oqr4zIk27hG4nG9ifAXuFFIDKOsCWexg=; b=xbhNTQvi4qv5AjC8I3zrEjbWN+
	xIZiQGpP47WcXSnJ7nDtOFSgws5DYop/5WfwVCHvw2SrgBD69Rh/FHveENsVElz6l0DPZmBnZieve
	cfiep9TBzxUGYDPqwBIqnST16IllRA5MmHCppdBLskpGlneHWcwJdvfseoaOiO8pUq5iD4RuT4JWc
	SbtacfAWdIHnMA0CMVsANPAUXkFhKYyh10SltXElOBA/B4XOFhU4V990xqwjZ62sXRiQLx24lXCIL
	u7qqYRikPt69qTXeMbgjlmDHdykMLNVwlUdInGauFDHEVFUuYgaGI5T20s21OK/JebhhGrxwXjDcc
	jro1fZ3A==;
Date: Sun, 16 Mar 2025 23:44:14 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: akemnade@kernel.org, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Tony Lindgren <tony@atomide.com>, Conor Dooley
 <conor+dt@kernel.org>, linux-omap@vger.kernel.org, khilman@baylibre.com,
 devicetree@vger.kernel.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND 1/2] Input: tsc2007 - accept standard properties
Message-ID: <20250316234414.4bf5ba92@akair>
In-Reply-To: <Z1cuSxrV-ceaO1k9@google.com>
References: <20241205204413.2466775-1-akemnade@kernel.org>
	<20241205204413.2466775-2-akemnade@kernel.org>
	<Z1cuSxrV-ceaO1k9@google.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Am Mon, 9 Dec 2024 09:52:11 -0800
schrieb Dmitry Torokhov <dmitry.torokhov@gmail.com>:

> On Thu, Dec 05, 2024 at 09:44:12PM +0100, akemnade@kernel.org wrote:
> > From: Andreas Kemnade <andreas@kemnade.info>
> > 
> > Only some driver-specific properties were accepted, change it
> > to use the now-available standard properties which are
> > found in devicetrees containing this chip.
> > 
> > Signed-off-by: Andreas Kemnade <andreas@kemnade.info>  
> 
> Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

this was in -next but somehow flipped through, so maybe apply it
directly to input now?

Regards,
Andreas

