Return-Path: <linux-omap+bounces-2641-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8CE9C2BD7
	for <lists+linux-omap@lfdr.de>; Sat,  9 Nov 2024 11:33:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 138E41F21FB2
	for <lists+linux-omap@lfdr.de>; Sat,  9 Nov 2024 10:33:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D661515098A;
	Sat,  9 Nov 2024 10:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Td5JXVZI"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E52E233D73;
	Sat,  9 Nov 2024 10:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731148419; cv=none; b=C1LYMbsCS9c3UE8gdAUIHdFPTi+0NVowcfgdK617pOkXRdTAbt6rjnuA5B14HWpyasytYIQqDUlG+dh1LxHsgeza/wqroIW2HRdIQIMf1ZZ8gG+J8RmlemrL8I29mc6itSTfMxCAnp7mCjTq+YrpZdvlVXVaHDm2qK4hdmC7bC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731148419; c=relaxed/simple;
	bh=fdJ8kKLr5diHlbxc+zf+bQRD4XLwbVaST3HTEi5AdBI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qFEhhO/5SidoBr9MfSRMobidXYGLSqvrvPuvDtbEJX1yIGwHmMJb9EfLZKxakncu3BXVTWHCRiC+N4TfVy043qiB8DsSBo5H7/qtVoRf3aBxwMZUms3IIJVyfIDitAdPeqySxYinvSVoPpZipvgGVHfmRiXqamAXurV/Ed484a8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Td5JXVZI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 199B9C4CECE;
	Sat,  9 Nov 2024 10:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731148419;
	bh=fdJ8kKLr5diHlbxc+zf+bQRD4XLwbVaST3HTEi5AdBI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Td5JXVZIoLk5aD0ri8BCSz3BxFR9JFEjPuNiTJH3ZfUHaRBmimBqd5btEWCZL4MtS
	 ZXwrcNY2yvVPM5SXZ79hN2AH24HeBuX25NcaE9CQ/bzEUlsQ7IAqDiTCxcaQWJDgIm
	 knL9gdUu7P2p9gtXP1bElM5UcY/k7d7zcjc6GzmNB6cYQJSXpwMf+gxJXXNSt25581
	 Gt9v676E/FWdWUO/1w+QBkJgnUAtK76xwXgjn/zKZ5lQlxRzqCjVcwL8fC+XnHntVd
	 0fx4F4noLVG7bBX131RH8x1HVENtRJBhbU2gQHfNCEEWPOifzSDVaewSu5VLogM1JP
	 PsqHtwCeqvMOw==
Date: Sat, 9 Nov 2024 11:33:35 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mithil Bavishi <bavishimithil@gmail.com>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Thierry Reding <thierry.reding@gmail.com>, linux-omap@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v3 04/10] dt-bindings: display: panel-lvds: Add
 compatible for Samsung LTN070NL01 Panel
Message-ID: <3ds4bjqjr7z4fqtrmc2wgzdacvtfed4y36vtledlk7uj6dwont@tbbmfklxaf53>
References: <20241108200440.7562-1-bavishimithil@gmail.com>
 <20241108200440.7562-5-bavishimithil@gmail.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241108200440.7562-5-bavishimithil@gmail.com>

On Fri, Nov 08, 2024 at 08:04:33PM +0000, Mithil Bavishi wrote:
> The LTN070NL01 is a 7.0 inch 1024x600, 24 bit, VESA Compatible, TFT display panel

Please wrap commit message according to Linux coding style / submission
process (neither too early nor over the limit):
https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


