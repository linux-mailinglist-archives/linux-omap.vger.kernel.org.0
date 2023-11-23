Return-Path: <linux-omap+bounces-3-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 828EE7F5C97
	for <lists+linux-omap@lfdr.de>; Thu, 23 Nov 2023 11:39:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B2E561C20D76
	for <lists+linux-omap@lfdr.de>; Thu, 23 Nov 2023 10:39:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C668322EE1;
	Thu, 23 Nov 2023 10:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eqIm9pmM"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58AB222EEC
	for <linux-omap@vger.kernel.org>; Thu, 23 Nov 2023 10:39:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 729FDC433C8;
	Thu, 23 Nov 2023 10:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700735950;
	bh=V8QlEn1tY3YvzwuTK49GT3h8aeTQCvMtxhMSaCgWClk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eqIm9pmM3F/b/jxXxLJElshcaHgClNYbZt3mJ2gBxmGQnlqYalp/F0AIV0SGbwoqS
	 3xh2DhJnCWYbsf4/bLwj2OmdQq/6rsPhS4XyKAbmcTHSUsWGZ/Do/ygrojCFu6m5f6
	 mEQB4khLIXD+iTxSU3Na+u+0YmiIKfbVKwYqlakSRDKz8k3S5vKgnvMdJ/IkITLvG3
	 sWO7jv+kIIQc5vLuks1VZJpk+o+tKNcGh+yxn63IEJEAQgT5ORC6Q481mamyJqeHv9
	 8FiZIyj7Wyl2gTM+yt3VvPhh/lhiOrmugacrlTbnOc47hy4AOPSvWxGBAdAsEqH/0z
	 qP0pZ98ZZoP8w==
Date: Thu, 23 Nov 2023 10:39:06 +0000
From: Lee Jones <lee@kernel.org>
To: Peter Ujfalusi <peter.ujfalusi@gmail.com>
Cc: tony@atomide.com, robh@kernel.org, wens@csie.org,
	linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mfd: twl4030-power: Revert to use of_match_device()
Message-ID: <20231123103906.GE1184245@google.com>
References: <20231029114909.15652-1-peter.ujfalusi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231029114909.15652-1-peter.ujfalusi@gmail.com>

On Sun, 29 Oct 2023, Peter Ujfalusi wrote:

> The core twl chip is probed via i2c and the dev->driver->of_match_table is
> NULL, causing the driver to fail to probe.
> 
> This partially reverts commit 1e0c866887f4.
> 
> Fixes: 1e0c866887f4 ("mfd: Use device_get_match_data() in a bunch of drivers")
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@gmail.com>
> ---
>  drivers/mfd/twl4030-power.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)

Rob, does this work for you?

-- 
Lee Jones [李琼斯]

