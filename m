Return-Path: <linux-omap+bounces-581-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52873853FC4
	for <lists+linux-omap@lfdr.de>; Wed, 14 Feb 2024 00:12:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0A26D283B43
	for <lists+linux-omap@lfdr.de>; Tue, 13 Feb 2024 23:12:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D45262A12;
	Tue, 13 Feb 2024 23:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="4BA7CFLg"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51C5B629FC;
	Tue, 13 Feb 2024 23:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707865909; cv=none; b=LgLvQ3S+BZvBpusd5U7zIr/bAKr+EBxPDCRpFVHwiYqCQau31EEvtG+0T4lwTzJuPS3HmzFlFJ02VYhVBvypMMniUIWq6Nd0MQN37Hbc0/6Hl9/fQoc1L/dMp3PCmpLHzCBsYSv+AfvCw+QCnqeKZlfBVdkrtqDcsof3cL8TYrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707865909; c=relaxed/simple;
	bh=prL2hfESnThlLItxRZt0Xvlcubzh1DpyIxIlFlVwGfI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DfebeUf2Vb70P9x+wjYf0FDYTzAGsHagzUuUleBBPzJKlGdBLedM+k21lrFv89tOFdKPPi2ryugi/5lUWqUSB56oyq5ZV4d7M8cLjHTmvup0BL1eGDb+Wd91aqT0sONXJNjYdSPWKjtQ5wRAEOdzkOXE6jiSszP5gRUQMEaNeNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=4BA7CFLg; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=lB5FaevuUNjp7i1rxmH5b66cKmYZn0vdxcffgOQ9hyw=; b=4BA7CFLgNfuOOcuhVB3Bdb4AmH
	mfaoqr12qWs5QinRRcJZNMSNgH1tHJktMHicfdS2IWOesA+hMda2SbOP7MP2PLZJEK8nE9l6PFrXr
	niOtrE87mZzF8vEG+PQtdf+4LCHzRMAe6EPX5mYAfd2TulFVLWUd9wEnfDbWigir6ufsWRDRhxogx
	W78IyTG2jR54qUp7Xqf2x2T7IoNCcms+KXK/fcS88u2BanWbX4bF8ZfenMQ9IEpwTOAjSRa8IMDpX
	LeU1+0aMafaqe+ubZrVVNpaTtnmLjyN7T+YPpUL8/QxepHDyHfdI6KhLUry3murUE9UfiJVvC70oF
	5NpXp6DQ==;
Received: from p2003010777002c001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:107:7700:2c00:1a3d:a2ff:febf:d33a] helo=aktux)
	by mail.andi.de1.cc with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <andreas@kemnade.info>)
	id 1ra1wE-009Pm7-JS; Wed, 14 Feb 2024 00:11:42 +0100
Date: Wed, 14 Feb 2024 00:11:40 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Tony Lindgren <tony@atomide.com>
Cc: =?UTF-8?B?QmVub8OudA==?= Cousson <bcousson@baylibre.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Tero Kristo <kristo@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org
Subject: Re: [PATCH 0/4] Use reg instead of ti,bit-shift for clksel
Message-ID: <20240214001140.2abe0d80@aktux>
In-Reply-To: <20240213105730.5287-1-tony@atomide.com>
References: <20240213105730.5287-1-tony@atomide.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 13 Feb 2024 12:56:40 +0200
Tony Lindgren <tony@atomide.com> wrote:

> Hi all,
> 
> This series updates the clksel clocks to use the standard reg property
> instead of ti,bit-shift.
> 
> I'd like to apply these before we make further use of the clksel clocks
> to reduce the dtb check warnings.
> 

hmm, we still have ti,bit-shift if these clocks are not used below a ti,clksel.
Just wondering, can we completely deorbit ti,bit-shift if we used #address-cells = <2>;
in those cases? I wait a bit with further txt->yaml conversions until
this is settled.

Regards,
Andreas

