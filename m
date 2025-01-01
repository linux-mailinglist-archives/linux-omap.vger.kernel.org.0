Return-Path: <linux-omap+bounces-2936-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CCFE9FF4EF
	for <lists+linux-omap@lfdr.de>; Wed,  1 Jan 2025 22:08:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9C5471882510
	for <lists+linux-omap@lfdr.de>; Wed,  1 Jan 2025 21:08:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3ABA1E32D3;
	Wed,  1 Jan 2025 21:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="jODNKxlN"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3C22184E;
	Wed,  1 Jan 2025 21:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735765681; cv=none; b=BdKUpgTwZ4aLy0wFLTg5dL/657iDauYgHtUeWkdAkYb3Gnpjbwu/Fx+N5DsJkTcxbBwKexxtHye2MtDKNnn/HpjI1Jw7rDwdDDOr3tXuM5WJawheRfFHNWjKGQb49ZnGv69UbcD6lDA8UaXJSGMduRsPqzi5cZFPZx0OHEYrHYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735765681; c=relaxed/simple;
	bh=jzHrAHy6I5KDM9d48qwxcbGGt7X1mMWgDmz9hwn0BbQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gxsM/b2UA1RD54nfjZwyP6HVlE9TeSIG0QnVGvMVliEoBIW47DQjRfsj/XwdpJVx44/6gWS+6e0+uXFqVB+PNcG0nSj7UxONnqhWm2ls2RSY0wFEeyRCGns6K513U1jZnzqxmRO4WTluLf33aLGFdl9fE5XQnQHRIgoSlK/6sCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=jODNKxlN; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=2aLXwIrwXk3rDeiybbx85SXg95I+A8k7SjwQL0wiFUM=; b=jODNKxlNjL+B2duTuTyFWB70SP
	Rh/XrUoMAl8tvo0lBDef9OwdwK//vm0mDKSglvbjgn+TCy225UMTVifl+/gjXsBYPWOFf0uYVX2Pu
	+rl6qlm/ptCGapa6/JQ4xZiVfIhtpE9YjoUrOrbRXd794Z9OLzUZ/ULAq1x4F2fjfraC4VdyEWDHZ
	UVS/4M5BsxmLVhjw8NSVt5iPvwOKzV9XxrcIR/i6R0HQDzeCM4fVnt/Q48ruzVl3Y/WKugNLC4/6v
	E6cOK5vGCb1VxrcWRwdB+E9GDXmJtDE1i5+iu6rstvB9Hram+BX9rIlvGg11UmwDuaUxK+hopx8Th
	ZAYDTkqw==;
Date: Wed, 1 Jan 2025 22:07:45 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob
 Herring <robh@kernel.org>, Tero Kristo <kristo@kernel.org>, Tony Lindgren
 <tony@atomide.com>, akemnade@kernel.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-omap@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: clock: ti: Convert gate.txt to
 json-schema
Message-ID: <20250101220745.25151fef@akair>
In-Reply-To: <bd1f8992ac2cc60b3192ea93402ed186.sboyd@kernel.org>
References: <20241229135351.5014-1-akemnade@kernel.org>
	<20241229135351.5014-2-akemnade@kernel.org>
	<bd1f8992ac2cc60b3192ea93402ed186.sboyd@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Am Mon, 30 Dec 2024 16:26:57 -0800
schrieb Stephen Boyd <sboyd@kernel.org>:

> Quoting akemnade@kernel.org (2024-12-29 05:53:50)
> > From: Andreas Kemnade <andreas@kemnade.info>
> > 
> > Convert the OMAP gate clock device tree binding to json-schema.
> > Specify the creator of the original binding as a maintainer.
> > Choose GPL-only license because original binding was also GPL.
> > Clean up the examples during conversion to meet modern standards and
> > remove examples with no additional value.
> > Due to usage in code and existing devicetree binding, add the
> > ti,set-rate-parent property.  
> 
> Can we somehow mark these bindings as "undesirable"? We don't want new
> bindings to be written that use one node per clock. At the least we
> should put that into the description.
> 

yes, good idea. I think a good keyword would be: depcrecated design
pattern.

Regards,
Andreas

