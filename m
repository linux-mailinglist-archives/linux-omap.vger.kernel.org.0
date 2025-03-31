Return-Path: <linux-omap+bounces-3518-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ACE3A76399
	for <lists+linux-omap@lfdr.de>; Mon, 31 Mar 2025 11:53:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5D0903AA595
	for <lists+linux-omap@lfdr.de>; Mon, 31 Mar 2025 09:53:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CD6C1DED56;
	Mon, 31 Mar 2025 09:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="Sl2GwtHh"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 788987E107;
	Mon, 31 Mar 2025 09:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743414817; cv=none; b=DTOJkqA2TAnl4DPLg9FZwMDJvaLDuwvnr5drrvdL8qz+G9fbsSSI+qVJD4yDeLUJB6PMct6Bs3QxjuaBB7wHHBSl01cD3N59g6wm9MR39IaMfWhx21uNncLgl7+DBsm2XukLGwdnbFMwh/On5+4Mh++OjzwLv+I4qRumeJvwtwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743414817; c=relaxed/simple;
	bh=s2tStVhn1e1t7IqCmmfP0IH00x+iT51tHDJhGWq4w5Q=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pIAJe+mlLaJdR7kY8Qv8p27woxtGHEm4R+Lpywjoh3K/Xz5GawUwLA9tMhijwj3KtYsIZrR9UQhCAzF+y/UVsjlnsv7VqPChJqV0edIt46d4YwXNFajl2GmTZhEL2m9ieZJ79SY8euNpgPh6LBEsXp3S6duU1WHxs+YUQ3bvwjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=Sl2GwtHh; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=4Z5w3F+5s20TF98d7Wk6lyX/I/bUzPKuZAUpTRIcVFs=; b=Sl2GwtHhJPZka/HRC/U5h0oy/7
	fSUJ7vgm3x1oZ+vf3jtxzhvEXWuAIip5Km4rffuwuWyHxTDIU74RPOcMGGueUktxRMnzmoNtl+QHd
	47uZFVCvqNNOE6MyJJ+xtEKwV/XgAqzCnGxzDXP3nqzXMMXlJW3pe0hZt3HeyemyLSUvwBsMmo4j6
	L189otEvFc32EveqPR6y5Sr/oS8uqff/1+Jss5IwoZ1S4Ldr+ZBoLvN1b0+ZnRAxPu4w/jFnHnF5t
	b2hgxARsfze5gGSECqqdWjpv41nbLs+dZFX6A1m+TN6GIzVya0LIZi/N2LbOQeahRfPQpmrupm0wh
	S8DH9BhQ==;
Date: Mon, 31 Mar 2025 11:53:29 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Tero Kristo <kristo@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 linux-omap@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: ti: Simplify ti_find_clock_provider()
Message-ID: <20250331115329.605ba522@akair>
In-Reply-To: <20250312163330.865573-2-robh@kernel.org>
References: <20250312163330.865573-2-robh@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Am Wed, 12 Mar 2025 11:33:30 -0500
schrieb "Rob Herring (Arm)" <robh@kernel.org>:

> Remove using for_each_of_allnodes_from() which is not safe to use
> without holding the DT spinlock. In reality that probably doesn't
> matter here. This is the only user in the whole tree, so it can be
> made private once removed here. The "from" argument is always NULL, so
> it can be dropped as well.
> 
> There's a slight change in behavior in matching the "clock-output-names"
> value as the prior code would match if the node name matched the
> beginning of the value and the comparision was case insensitive. Now
> it must be an exact match.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> Compiled only. I'm not sure if the the change in behavior is going to 
> matter. 
> 
did some testing. Nothing odd seen at the platforms I tested but I feel
a bit uncomfortable with
https://lore.kernel.org/linux-clk/20240925100603.4cba9176@akair/
in combination with this.

Regards,
Andreas

