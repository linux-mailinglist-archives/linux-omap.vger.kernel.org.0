Return-Path: <linux-omap+bounces-3992-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C7AF6AED493
	for <lists+linux-omap@lfdr.de>; Mon, 30 Jun 2025 08:29:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 177ED172791
	for <lists+linux-omap@lfdr.de>; Mon, 30 Jun 2025 06:29:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9238D1F582F;
	Mon, 30 Jun 2025 06:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="vJV8G9Tu"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1FFA186E2D;
	Mon, 30 Jun 2025 06:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751264985; cv=none; b=NRfqVcwrc6CpHORZsDbm5BR6g3zsiaS0KWSb00WnWhRjWGvjyjZdVXQEqXv6vUVT/6ALlvAc1bwT3SvVv416YGYgkIHJBprrA4uNgsvZlRrX7g/ON/U0MhtEe7GFWxC5d29Lyjzddbm06EcArebFqZ240SS9OG9LeCimOw6dt1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751264985; c=relaxed/simple;
	bh=w8oVhDBXl5+xapHd7y5CpbNAb8HTx/GmZwhpXT/RwjI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ila211hCo+dkDikpzYI2Uo3f92aVoczC9O2NSMOSlWXOJiDPsThg4zYXjefGN2G0vzbLWuedjZUyZUjcrxSBEPMr6PM/fViWswp/gE+N7u/k/HCG1/3RQP0F9PpVHMJIWQPVd+zMA6Sx67uwAJC5GHSui6PNZBwSpaw8WYQTbb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=vJV8G9Tu; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=XrNosHeJWdXsV+nu34dlZfulTCotBTrcAUvtUHsZWpg=; b=vJV8G9TuBT5ty7y8epGASfG6fD
	yOj3bxw8xBc+vnmuEUQffA2IZJrHZ46Ic61tXvQXFSCDqKdvGMvvyb0r5954tcNlq0NwylwEWovyb
	6KnGsW8349pYBPdEAESEvN0MzG1YkOSi+4zXjEtDaJhVUEgEEUn45Qwj3nFnXwzG937xGuq+Mcj14
	MUlASuAsCqv3GxepjncV8B4SgtPCIwIkFzRCZr0eH4WoDdafEuIuE8rTkY0QUAzrWjM3wjqbEkvrv
	cL3HNcSura6wcowpEUkbkHUc3oyEgFvPlfZB/XefW4RUwYkzyIzID931cpsg2QMjD46yiVp7mbSVG
	SmXrHyRA==;
Date: Mon, 30 Jun 2025 08:29:09 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Aaro Koskinen <aaro.koskinen@iki.fi>, Kevin Hilman
 <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, Russell King
 <linux@armlinux.org.uk>, Paul Barker <paul.barker@sancloud.com>, Marc
 Murphy <marc.murphy@sancloud.com>, Jason Kridner <jkridner@gmail.com>,
 Andrew Davis <afd@ti.com>, Bajjuri Praneeth <praneeth@ti.com>, Liam
 Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>, linux-omap@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Thomas Bonnefille
 <thomas.bonnefille@bootlin.com>, Romain Gantois
 <romain.gantois@bootlin.com>, Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v5 0/5] Add support for BeagleBone Green Eco board
Message-ID: <20250630082909.74dd386f@akair>
In-Reply-To: <20250620-bbg-v5-0-84f9b9a2e3a8@bootlin.com>
References: <20250620-bbg-v5-0-84f9b9a2e3a8@bootlin.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Am Fri, 20 Jun 2025 10:15:51 +0200
schrieb Kory Maincent <kory.maincent@bootlin.com>:

> SeeedStudio BeagleBone Green Eco (BBGE) is a clone of the BeagleBone Green
> (BBG). It has minor differences from the BBG, such as a different PMIC,
> a different Ethernet PHY, and a larger eMMC.
> 
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>

Reviewed-by: Andreas Kemnade <andreas@kemnade.info>


