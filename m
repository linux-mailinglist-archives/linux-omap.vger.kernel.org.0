Return-Path: <linux-omap+bounces-4220-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA77B25DFF
	for <lists+linux-omap@lfdr.de>; Thu, 14 Aug 2025 09:50:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8BD5E8811C4
	for <lists+linux-omap@lfdr.de>; Thu, 14 Aug 2025 07:45:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CA3B29ACF5;
	Thu, 14 Aug 2025 07:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="Q1fQ7Rb6"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D0129A9F3;
	Thu, 14 Aug 2025 07:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755157544; cv=none; b=RYOIy6lWLQ+CCqpNRyi6CDGX7o6sCgV/MVOqF3Hv1qaLjKiXsk1Zl9vyD1y4+zm+77Fv+GBs/uYEMmhM9WSJvaWBo0FuV94vKDFG9F8Kco+wqB8Adp6GldkgWEjXSksJgTEeblQ7wwzhhoKGNIgJ1Crjq+nx4HzWJaw4R8VoYgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755157544; c=relaxed/simple;
	bh=ncqHU0v1iEmUcJfIYKSHufZX6y2o2ZSRc2qysk2DdCA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=K9E3mzG3lMgVWetugQ5+b9CG6A4o7vOA2UYPfuYJEgW4uaqSg/4R4bJNlrpHB0a4iBPwv8fU9187n232sEY0n1llquPM/D1cpVIaU0GRa80yWMjwEs6kvCZub8VJ1dfSKJNX87kMxl05smoFJ9pwAHwheJmNYkXL6wv/7tQya2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=Q1fQ7Rb6; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=qNvBeXZ+P8UApe0dbki/ordaapboF2t4cf+gcZmp5Kg=; b=Q1fQ7Rb6hwaJ4lXdpVjF9d13ga
	HhkZcnGiQBM8IjIuGRHb7BjO7TFY8EdhvX5e7jWcnQSMUpZlWO4cMX8MdOJ9By2R+cP5/ixkpK6Sl
	Y35Lc5kNF8+yoVsaNU0IV1fbRMBsRdKaMWA8RQh0rg2scUbTqvrFtQjB2prXjTln8Q6xFIY4oNvSz
	Ai4UVs7tpNoD3GyaB+XGuGB3E8dlPCDXJ4mmpx9mejBil69Gg5zI4I4v2LZRkQx7CoB0oSsS+X1Lu
	1J63IDSEOO+ZsNOPYgppR5ZFMNqf6vNDEtu9Kbn4zQpZZghOyUAw4rL8X95p0aQHwXFShbDtAB7st
	Q/8ILBTA==;
Date: Thu, 14 Aug 2025 09:45:27 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: Brian Masney <bmasney@redhat.com>
Cc: Tero Kristo <kristo@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Maxime Ripard
 <mripard@kernel.org>, linux-omap@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] clk: ti: convert from clk round_rate() to
 determine_rate()
Message-ID: <20250814094527.29745592@akair>
In-Reply-To: <20250811-b4-clk-ti-round-rate-v1-0-cc0840594a49@redhat.com>
References: <20250811-b4-clk-ti-round-rate-v1-0-cc0840594a49@redhat.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Am Mon, 11 Aug 2025 08:48:05 -0400
schrieb Brian Masney <bmasney@redhat.com>:

> The round_rate() clk ops is deprecated in the clk framework in favor
> of the determine_rate() clk ops. The first two patches in this series
> drops the round_rate() function since a determine_rate() function is
> already implemented. The remaining patches convert the drivers using
> the Coccinelle semantic patch posted below. I did a few minor cosmetic
> cleanups of the code in a few cases.
> 
> I want to call out the changes to the dpll driver since a fair number
> of changes had to be done outside of Coccinelle. I unfortunately don't
> have this particular hardware on hand, so I was not able to test it.
> I broke the changes to this driver up into smaller chunks to make it
> easier to review.
> 
Tested-by: Anddreas Kemnade <andreas@kemnade.info> # OMAP3 GTA04, OMAP4 Panda

No new scary things seen on boot. Can someone check this on AM3, too?

Regards,
Andreas

