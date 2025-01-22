Return-Path: <linux-omap+bounces-3178-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0345A199FA
	for <lists+linux-omap@lfdr.de>; Wed, 22 Jan 2025 21:46:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 432091663EC
	for <lists+linux-omap@lfdr.de>; Wed, 22 Jan 2025 20:46:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1394A1BD9DC;
	Wed, 22 Jan 2025 20:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="U8VLO1Jz"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30B5F42065;
	Wed, 22 Jan 2025 20:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737578779; cv=none; b=FwqHnHuViYvW3dm9LOxdEXxh7k0tsUsfCdn0MINvBo9teBrAYjJnM+cq6F9H6MNkL1alqbFZcOoMzMoorLWmO08KRNUwmAyzHkMtPhu/xEwaxxdjMoYGkcgK2ZU1ErgsXTFUDowQ4zZ76N5VQdTYn7tM5Dwlz00Sr8j/m8A1l+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737578779; c=relaxed/simple;
	bh=yQNPUHvhKheci/WIXb4PkX51vNK7mEwyJ2pbAQHN9aU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Scuf0GZr1XKcJuCY96TyEfJrkv1XrdE16NgGrfLiwbCg2R267kKExbbo7d8TOdQd0xSgNpW5nQtCLjdkyZuTjHLyIui4md+q+QP8HpwaWhy/i8R7DpN05rZ7r+P/CpRmskZZ0DG7Jcujeeo8hvQfliROVjv4bdr9pLfG81544Qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=U8VLO1Jz; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=+djc2+MczXBbH+xU7MeLYMVOkGxmt0lObTeqQjidoV4=; b=U8VLO1JzM0eTagAzv/V1mcVxn3
	c7Ah744PLLaWz+l0IscdDfXxegcdYYfF1cQyhT1p5dNXAbGoKGjvTxmGFxbKvVzjiDmQonNVLwIyz
	UJyJk8kDrkP/LdRc2kIFc1xIe9yyrBqRZ7CRuTQTErTyS1PADSe46zlQifHdszZgCu+eoe8eHRP5h
	+17zGWm9XDd1c+QqYe2DH3n8hvc/+yF2jqlMJySp1pYi1cKWd9vkiT4Mg3MnPSYCaSXm7DMK9RG3R
	34ZR/i70JHS6yAksI//e+ZUYuAsHiEN7WBYTDextjZeB7vSPO1hFtH0UsipawljA8BGjlJVM5PKk/
	es0VEaUg==;
Date: Wed, 22 Jan 2025 21:46:04 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Tom Rini <trini@konsulko.com>
Cc: Kevin Hilman <khilman@kernel.org>, linux-kernel@vger.kernel.org,
 Nishanth Menon <nm@ti.com>, Tony Lindgren <tony@atomide.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-omap@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: omap4-panda-a4: Add missing model and
 compatible properties
Message-ID: <20250122214604.79e1e829@akair>
In-Reply-To: <20250122000824.GJ3476@bill-the-cat>
References: <20250121200749.4131923-1-trini@konsulko.com>
	<7hmsfjn5mm.fsf@baylibre.com>
	<20250122000824.GJ3476@bill-the-cat>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi,

Am Tue, 21 Jan 2025 18:08:24 -0600
schrieb Tom Rini <trini@konsulko.com>:

> > If keeping it is just this binding update, then I'd say we keep it, but
> > if it gets any more paninful to maintain, I'm also not going to argue
> > very hard to keep it.  
> 
> I'm not in the position to see if any of the Pandaboards work at this
> point, so I don't know if they're otherwise functional or a huge pile of
> problems.

I am still testing stuff with pandaboards. But I do not have the a4
one. So yes they are functional. Compared with other devices still in
use using the same SoC, here you can play around with everything, know
the device. so it is a reference for keeping the really interesting
devices working.

Regarding the a4: I think it is better to keep that one in, just that
nobody gets confused if he/she digs out his panda board for some
comparison test and uses a wrong board revision.

Regards,
Andreas 

