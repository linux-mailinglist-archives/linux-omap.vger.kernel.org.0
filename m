Return-Path: <linux-omap+bounces-3567-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9664CA83CAF
	for <lists+linux-omap@lfdr.de>; Thu, 10 Apr 2025 10:24:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 96A753B1C31
	for <lists+linux-omap@lfdr.de>; Thu, 10 Apr 2025 08:20:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D4672206B1;
	Thu, 10 Apr 2025 08:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="xQkbkOyX"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 309F71EF372;
	Thu, 10 Apr 2025 08:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744272982; cv=none; b=R/sj+LVYwL+U1Dof9+n5GTr1Ts+C7rKHm654fQffKJLUHf8q8CuY7Hl87+yDo1Y31Hfmvwu+z0ja/99y9zmiO9ARmdzhPAni42rj2EyIe7AYCqBT0KvoJ9zR2zuKA+GPfGjoLt3jKMJG5OKJizczlJxGS/JWeqzpuPPskNR819M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744272982; c=relaxed/simple;
	bh=MzYU37628qQVk8rusO7w7hVbAH4WyjlSPuhSMH8ZHrU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=am7S3SPMYe0l6Ggl7hxIJWrrW1Lio59H4fP9yMz66YtgXajwZ1BSszfDmT9i0sQMY1w1lMAl+NjKPs58OpbqjvmD1QESsadpUpmyWeRDYjhpo/kw6RKHtv05Waxyx1c28AKHOzPMXFIU2tufFa4j+hiIuOoR+yBMRUCOWrdciUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=xQkbkOyX; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=taziRnpP+R7rCwCs3/lun0EtTT6nmtMK6MYz17WL9Gw=; b=xQkbkOyXAhxPa9yYg9wtvKJVXN
	Qsi1HGwWtcf5R8WuzuPdvtMUk5WKxEJ1nHGYPgECWBikVDNKZjOQuMTmcqzZ++RbChqMXFVy4uzon
	PEy/jArkBcI/SF+hz3WKvPW4TbaFrIz/PN+WJVTw7pjHZpDEN3feBNrHzx1rWZsuusZyMSEk9wdRp
	x5MAdciIQOL5eABfbP1q7oFx9Pj5YEJNzfikF6GH1Fp5nudZWR8BGWE/a7Z82Ibf0/Nqpmf3UuZTo
	4Bj4mfSoyGhZQTGGBHW+h8M6mF2RpyOz8iOpFMjvgReQAiPDlylXwQQae/RqmntjUU4asEkiRZYqg
	Ijo114Hw==;
Date: Thu, 10 Apr 2025 10:16:06 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: Roger Quadros <rogerq@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 linux-omap@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Aaro Koskinen <aaro.koskinen@iki.fi>,
 devicetree@vger.kernel.org, Tony Lindgren <tony@atomide.com>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v2 1/2] ARM: dts: omap4: panda: fix resources needed for
 Panda
Message-ID: <20250410101512.5b4c12b2@kemnade.info>
In-Reply-To: <7aefa588-9f64-4bb4-8782-05eb1ef9d5b2@kernel.org>
References: <20250330151401.444956-1-andreas@kemnade.info>
	<20250330151401.444956-2-andreas@kemnade.info>
	<7aefa588-9f64-4bb4-8782-05eb1ef9d5b2@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 2 Apr 2025 15:11:47 +0300
Roger Quadros <rogerq@kernel.org> wrote:

> On 30/03/2025 18:14, Andreas Kemnade wrote:
> > The Pandaboard needs a 32k clock in the TWL6030 to be enabled
> > to work. With some luck, it is enabled by some U-Boot fork.
> > Do not rely on it and properly specify the requirement.  
> 
> It would be nice to mention who exactly needs the 32K clock.
> From your changes it looks like the wl12xx module needs it?
> 
correct, I will send a better descrption.

Regards,
Andreas

