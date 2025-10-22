Return-Path: <linux-omap+bounces-4739-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D902BFBE59
	for <lists+linux-omap@lfdr.de>; Wed, 22 Oct 2025 14:44:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id EA9E2356FDE
	for <lists+linux-omap@lfdr.de>; Wed, 22 Oct 2025 12:44:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 874C7344054;
	Wed, 22 Oct 2025 12:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="YCw1eC0h"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DAFB33C52C;
	Wed, 22 Oct 2025 12:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761137072; cv=none; b=JwjPpfKYwLxsxFXIIn8p6ON3dYHnOaccyYWjSBAqXYYV09cZoWDmWHt8/lNsJAgQ942iDhj+h3v5gdN8YY6OLhbR7aRK1u3G5ykpAqeA/mkU9oTH1M+/7p7PngOH0wAx+9mcTCDJ+8sX3cM4MBmBFNgvQhmDXV1z/mohgsOaxiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761137072; c=relaxed/simple;
	bh=VKKg6R2GGpyhzV6SYM4/YURkRudQx/VKFAbp39pJy2g=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SVc4b7NL1K57SbyaBvefEEP2rDMybxZlM/3Eq1tS3Y2OhS2mb2z+/vHhtS2WRCdz2vc8j4ca4tZyGw+zLjcLZckk/FF8rpCksVDOXDJJBxnaC6D7jmhvgRES9xcx0gdo0UDUZrtlW5a0XI+YGkn74RlNcDC2I3QaWsDjyIpNyD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=YCw1eC0h; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=RHH0V3A771nXPxinUtl+9kdKJ/Xiz0uAziok/Uy7w6U=; b=YCw1eC0h2+mdHNGza9ioOsBTX4
	ByiTfzRHpGOORNNaarkXx4olcM4ccE7E5FSax6hbK3nnTVBOVhZI7YxrhFAwGKFrgtSc1XowSvUam
	yQbrIDR1r/cosUgrUTT8nqm0rqkFRRIJCJe7A148h3nZ1OvHXiHN7ms4OXY5OwOgO/b/MCu4ES9oW
	ZD314PNlzPMmlVgnyVizrG24RdoDz1Ifbc3CnIY6wIo/OOAWjugx4JbVpt8sIcEfiPklKY9K9ff6z
	mwzwVSK3kcRpb3ugxhBIdX5piSV7ACpOPU1UhN09h8n92dEDob/vh6OhpqCawOwoTThc0GM9Pyhr+
	MJFYdD0g==;
Date: Wed, 22 Oct 2025 14:44:22 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: akemnade@kernel.org, Lee Jones <lee@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Tony Lindgren <tony@atomide.com>, Kevin Hilman
 <khilman@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
 linux-omap@vger.kernel.org
Subject: Re: [PATCH 2/3] Input: add TWL603x power button
Message-ID: <20251022144422.7c17322a@kemnade.info>
In-Reply-To: <aalnnbzeajxgnq33go5b2gi72yjzeeun5f2pkbdulu2hwuz663@b65xssnkse7l>
References: <20251020-twl6030-button-v1-0-93e4644ac974@kernel.org>
	<20251020-twl6030-button-v1-2-93e4644ac974@kernel.org>
	<aalnnbzeajxgnq33go5b2gi72yjzeeun5f2pkbdulu2hwuz663@b65xssnkse7l>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 21 Oct 2025 10:58:35 -0700
Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:

> On Mon, Oct 20, 2025 at 02:31:59PM +0200, akemnade@kernel.org wrote:
> > From: Andreas Kemnade <andreas@kemnade.info>
> > 
> > Like the TWL4030, these PMICs also have a power button feature, so add
> > a driver for it.  
> 
> Could it be integrated into twl4030-pwrbutton.c? I think the differences
> can be accounted for via a "chip" structure attached to a compatible...
> 
So what is different:
- different register (but same bit)
- some custom irq stuff for 603x (so if (is_603x) needed)
- different name for the button (can be neglected I think) 

Besides of adding a chip structure  we can do it the same way
as rtc-twl.c is doing: using twl_class_is_xxxx() which derives
its return from the parents compatible. It is simplier, but
I think the chip structure does not hurt much either.

Regards,
Andreas

