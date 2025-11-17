Return-Path: <linux-omap+bounces-4927-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 703B3C65D25
	for <lists+linux-omap@lfdr.de>; Mon, 17 Nov 2025 19:57:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8CDEA4EBE84
	for <lists+linux-omap@lfdr.de>; Mon, 17 Nov 2025 18:56:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6205D3358D1;
	Mon, 17 Nov 2025 18:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="RZTK8VWZ"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC8732C95E;
	Mon, 17 Nov 2025 18:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763405622; cv=none; b=FUPCfU/7asQ6cFBt4eUzLKK5MGNizJRsOI0OIHjx36oplj9qwEhjL3jUgyRYqA2kZlu4Y7ZX9Sq7L27BgdAEref44lPljsWwsDORZWVjrCaJFNscFbNeW2lpmC/xAnM8nxl/ivO9sqg4EUmyzy3nm95vcM8niHbdqEAoYBfFUjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763405622; c=relaxed/simple;
	bh=QB+gNDcTJSkeojz5wjACutEvoagQH1P1M1mN6dUL2lQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gBqqxHv18B01SbzeW3sMPW/ULR9oX1x5Baar1fZmBeiNsN4hy0p3XfaOtEYJiJPqP8hYNceGYQObMjhoTCNVlm4qtTcYkPlY9MnReISSMbcVMKN2jTtD/zYlm8vm6iwe2thP+Yg9RFSnjscEsqX1xE+WlLdYElsP2QUhr4+4Pw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=RZTK8VWZ; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=+B5umbgxhoXYeaganClAEN0yTnE0PZFUMxbxKaDPKRA=; b=RZTK8VWZhn5zVE/ScrvnYwU0Ib
	ugf4fYAnWPDvGqDg8xiGDFi3IzAldGTYXPqcsg5GkiOATtK5+nLwvcp9uzysO1SKFV3aTa6kuXL91
	3aDYvaGoa0NCstxc5adFqTmt2daPvXhvRYwoPdjhP2OFaY1jWFBw8vnEXJjdPmhAcsm94ZlUJzvuE
	9ZHlWMzYclqqXElDs40dc9dMS0ClNsY5p7HNbwuFdEatedY5oeRGylEJh9GM07kHJGKiUopAqvpmx
	a+M80FjcHJmN6dyMFV/appC9syVnk0aiHz0gwiF9ha7y+dDf37ompGiuzloM7LjJdBQRfz+9/E9iN
	ASu0CnhQ==;
Date: Mon, 17 Nov 2025 19:53:01 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Kevin Hilman <khilman@baylibre.com>
Cc: linux-kernel@vger.kernel.org, Tony Lindgren <tony@atomide.com>, Aaro
 Koskinen <aaro.koskinen@iki.fi>, Roger Quadros <rogerq@kernel.org>,
 linux-omap@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] MAINTAINERS: sync omap devicetree maintainers with omap
 platform
Message-ID: <20251117195301.05f17649@kemnade.info>
In-Reply-To: <7hed5cpwrc.fsf@baylibre.com>
References: <20240915195321.1071967-1-andreas@kemnade.info>
	<7hed5cpwrc.fsf@baylibre.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi Kevin,

On Sat, 21 Sep 2024 13:39:03 -0700
Kevin Hilman <khilman@baylibre.com> wrote:

> Andreas Kemnade <andreas@kemnade.info> writes:
> 
> > Both used to go through Tony's branches, so lets keep things together.
> > This was missed at the time when Co-Maintainers were added.
> >
> > Signed-off-by: Andreas Kemnade <andreas@kemnade.info>  
> 
> Acked-by: Kevin Hilman <khilman@baylibre.com>
> 
this seem to get lost, what about updating/sending another maintainer pull
request?

Regards,
Andreas

