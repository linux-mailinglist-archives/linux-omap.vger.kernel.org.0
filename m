Return-Path: <linux-omap+bounces-5191-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B49CB81DF
	for <lists+linux-omap@lfdr.de>; Fri, 12 Dec 2025 08:29:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6A17F302DB79
	for <lists+linux-omap@lfdr.de>; Fri, 12 Dec 2025 07:29:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77E303090D7;
	Fri, 12 Dec 2025 07:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o1NM2jmY"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05276AD24;
	Fri, 12 Dec 2025 07:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765524584; cv=none; b=Y5wrGXU9wyIylibtaWbSzx56s6MLEzRs524HdtCfLD5khErUsX51j69BukqoT2x2X84Fbshm+FQcxjMYqQehY9l7dvsPYQTzWsA9KsirHcbDkwoZWvCCgPvYBlPCOA3bcw2d1SXoX7yPOn/bHbond6SAPNbGCmASM5Lt8NX1yiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765524584; c=relaxed/simple;
	bh=rduUdumnnvnex39AKYNG2xtSbZ3PSZ0eETlOCnoIfYI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qnNubNqrJclxG52xIy9gq7t3nW4RHetCM2i/6OF+UIvj8P1iSRzGKHVUTTMXmsltNbYxQIcRj9cWiPGgDpM4rPJwXdSxeqS3T00UvzvyWr6oETua5iWBowJAG4h9O8WxHAZ270oV4rJtfRpEQXt06U/M4/Ne2xy7mWuSwo781pA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o1NM2jmY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69ACDC4CEF1;
	Fri, 12 Dec 2025 07:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765524583;
	bh=rduUdumnnvnex39AKYNG2xtSbZ3PSZ0eETlOCnoIfYI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o1NM2jmYFdaNvOjyMTldVaizsl4IQBtdiioiDYetBcyjS6FFmomTSFE70fZYxqT3f
	 rHcWnwZ4GvPv3jt+ZJ0B9ghlQZiR5bzXYuP6pWetu+0KrOVyVqEEzGXwbZlMAnWBAy
	 9bhdxKGN6V5R5/MlIMOQPu746l+N2+gBeTwJTbROBl/IbQ/pWnp0At18xHpSv0yO71
	 TY6CNmZ5J3ZylTcepobxAAcldTXjroxmBHowhCzMMvcvs7twS3I+vK3xpovY2AeO+c
	 Zxa8zyn4vf346Ci7XGD8FqoePMENzFqVzB7CKIMOSnmPY0AEHltN5VWYwuRRiqzgfo
	 L7f3ejw/F9QRQ==
Date: Fri, 12 Dec 2025 07:29:37 +0000
From: Lee Jones <lee@kernel.org>
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: Kevin Hilman <khilman@baylibre.com>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>,
	Shree Ramamoorthy <s-ramamoorthy@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>,
	Bajjuri Praneeth <praneeth@ti.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v4 0/2] Enable 1GHz OPP am335x-bonegreen-eco
Message-ID: <20251212072937.GA9275@google.com>
References: <20251112-fix_tps65219-v4-0-696a0f55d5d8@bootlin.com>
 <20251127144138.400d1dcd@kmaincent-XPS-13-7390>
 <7hsedk73ly.fsf@baylibre.com>
 <20251209111534.0f871a04@kmaincent-XPS-13-7390>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251209111534.0f871a04@kmaincent-XPS-13-7390>

On Tue, 09 Dec 2025, Kory Maincent wrote:

> On Mon, 08 Dec 2025 19:09:45 -0800
> Kevin Hilman <khilman@baylibre.com> wrote:
> 
> > Kory Maincent <kory.maincent@bootlin.com> writes:
> > 
> > > On Wed, 12 Nov 2025 16:14:19 +0100
> > > "Kory Maincent (TI.com)" <kory.maincent@bootlin.com> wrote:
> > >  
> > >> The vdd_mpu regulator maximum voltage was previously limited to 1.2985V,
> > >> which prevented the CPU from reaching the 1GHz operating point. This
> > >> limitation was put in place because voltage changes were not working
> > >> correctly, causing the board to stall when attempting higher frequencies.
> > >> Increase the maximum voltage to 1.3515V to allow the full 1GHz OPP to be
> > >> used.
> > >> 
> > >> Add a TPS65219 PMIC driver fixes that properly implement the LOCK register
> > >> handling, to make voltage transitions work reliably.  
> > >
> > > Hello,
> > >
> > > What is the status on this series?
> > > Is there anything that could prevent it from being merged?  
> > 
> > Nothing technical.  I'll start queuing things up after the merge window
> > closes and -rc1 (or maybe -rc2) is out.
> 
> Ok, thank you!

Andrew made a suggestion on the MFD patch, so I unmarked it for review.

-- 
Lee Jones [李琼斯]

