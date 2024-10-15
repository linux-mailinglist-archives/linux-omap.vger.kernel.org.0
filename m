Return-Path: <linux-omap+bounces-2422-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1361099E12B
	for <lists+linux-omap@lfdr.de>; Tue, 15 Oct 2024 10:33:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A556EB23122
	for <lists+linux-omap@lfdr.de>; Tue, 15 Oct 2024 08:33:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D6DC1C8776;
	Tue, 15 Oct 2024 08:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JP3f/g+o"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA2318BBA2;
	Tue, 15 Oct 2024 08:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728981193; cv=none; b=lY/j8JTM17P4WvLagQUEtTvcKmff5JF4Nx5a+f9MbpGMM93b9/yLFAqQh8Z2E8nvk+FP33XdFOd9wk1GpHACVL3nuGF3Ej9I5e6OSmjvII/yTnPhcHuQkTfMAO92jjmP9lK0HBMD2DR/2q2evEstPw+HCwmLq+KdA98aCMmu/Pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728981193; c=relaxed/simple;
	bh=qSHMuG4Fq9b0x2gCn0cRZ9FrjmHewU55gF4kABDNxWM=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=XC5jTQqGox1UlqGkdCpi2y5LzgJQlcXIac1J0OmUHxm5M7ScemLdKohBtyYbkcb3irUE4mqa2f/s8QA6hsdheixo0EwJNPWXZjZ+HSEVqu50AlDCQuiAftinnbbdXnm8Op4X+A9C8JuyiEfqunA4LRTJhPrYsjq5QenNGv0+4V0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JP3f/g+o; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60009C4CEC7;
	Tue, 15 Oct 2024 08:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728981192;
	bh=qSHMuG4Fq9b0x2gCn0cRZ9FrjmHewU55gF4kABDNxWM=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=JP3f/g+opdc1UaZ70uB6cQ6IUa/824NdZeIpu4s1so0/WjMWSo+vSs+3fH1k8rx6n
	 8xyQAfNpQzC+eKxnIoVLHk7u1cG5NExJzfo2kDnFp/u29xoA8h6jCnp8qE2YWKqew2
	 qTROn8srssPzf0DVTmpaIfJHJa5jVCR/4a9EDAvFMe9g6clsgrkYFtGFnusQ+duvSQ
	 UXpYWDwFhMHnjeLCDoIbstSCgoXvYW+RdK0ZXG8XSMPNakwDPaiaXNpi6nyf72FX/k
	 YIee06lE6+LLeh1SjU4gYpyaLRsXyA0j3D6jPQ85FJLVSmt5fM+lzTyh55UMOTRcSw
	 51UJaPW/LRZyg==
From: Lee Jones <lee@kernel.org>
To: Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org, 
 Aaro Koskinen <aaro.koskinen@iki.fi>, Lee Jones <lee@kernel.org>, 
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org, 
 Roger Quadros <rogerq@kernel.org>, linux-clk@vger.kernel.org, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Andreas Kemnade <andreas@kemnade.info>
In-Reply-To: <20241014161109.2222-2-andreas@kemnade.info>
References: <20241014161109.2222-1-andreas@kemnade.info>
 <20241014161109.2222-2-andreas@kemnade.info>
Subject: Re: (subset) [PATCH v5 1/3] mfd: twl-core: Add a clock subdevice
 for the TWL6030
Message-Id: <172898119013.384451.4986094816910935104.b4-ty@kernel.org>
Date: Tue, 15 Oct 2024 09:33:10 +0100
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Mon, 14 Oct 2024 18:11:07 +0200, Andreas Kemnade wrote:
> Also the TWL6030 has some clocks, so add a subdevice for that.
> 
> 

Applied, thanks!

[1/3] mfd: twl-core: Add a clock subdevice for the TWL6030
      commit: 5ebc60259a0fdd13aef077726b1773f1ae091efc

--
Lee Jones [李琼斯]


