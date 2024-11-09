Return-Path: <linux-omap+bounces-2639-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1411A9C2BD0
	for <lists+linux-omap@lfdr.de>; Sat,  9 Nov 2024 11:33:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 89440B22205
	for <lists+linux-omap@lfdr.de>; Sat,  9 Nov 2024 10:33:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CEB514E2C2;
	Sat,  9 Nov 2024 10:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cC9Q6d/w"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01904233D73;
	Sat,  9 Nov 2024 10:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731148373; cv=none; b=Xx+DO+76HGgKn6U7kOXagVWJjfj83jVxpme45+Ij3s8jkY0Yf6RVt8EKpVL5ew7XBOexdAGGJ5jPs+eClNPFaeInUKvuzuwhzAFlwsPN7y+s71eqP637JA5YQzsxrH0IAPqsSyuF0oVoKF+jKEPAuzVfRn9U12rMlT6JDl3Xz+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731148373; c=relaxed/simple;
	bh=1uVBzAzPwdrzxRstjz/lLsiLKb6xVUh8k5XZSI+oQvI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VCdBXeaBwa27Ffw0kN55lHyWGqwQ24PudrNUxhSujTio+eLMrRlAMSyJ0rTLY8u3T26GmZWsOkcr6qg4maHs54V+hU1sVIRXxHZfcVDXY3EhfsbMMqFSK/a7n2cl7XciUC/wmYldV18XlOKSXR2JHLiPKQBRMXSSO22/2tADnr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cC9Q6d/w; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF87DC4CECE;
	Sat,  9 Nov 2024 10:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731148372;
	bh=1uVBzAzPwdrzxRstjz/lLsiLKb6xVUh8k5XZSI+oQvI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cC9Q6d/wqajGGtP5Wc58Y5N0B3wfMSgY9xrXmPIW8WQEaHgtirmYlopIJBBYcMHsw
	 5hq271vFdNuBIZz3LumXePencLrY6CZBzWjkBFM0VGuO9PtMIQkyGnUX8FepEPOpoy
	 zT/wcGRlbPVyw13GFWALuwDRNyJPzMxmkjsI5wJm7WZZu/TWvex0IVKfIYVt7pmpCO
	 msHb5VxzX3rHc6/kgJ+ojuFmRP2XH4nlYhlgpp3t+K1zPRj13X2PUFjzDPLI868iwP
	 m1x4g4BUpp8DI/gCfkapdL90ouLeKiNmRdU3f2z25udMRTl4D2kAVB3nh2BLzkovSs
	 NTr3L1Tmyh3ig==
Date: Sat, 9 Nov 2024 11:32:49 +0100
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
Subject: Re: [PATCH v3 02/10] dt-bindings: vendor-prefixes: Add Doestek
Message-ID: <u7fs4q6vbbaeza5mi374pc5jayhvi537rytzxczdb66cqwvwlt@gfa7l6f52dle>
References: <20241108200440.7562-1-bavishimithil@gmail.com>
 <20241108200440.7562-3-bavishimithil@gmail.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241108200440.7562-3-bavishimithil@gmail.com>

On Fri, Nov 08, 2024 at 08:04:31PM +0000, Mithil Bavishi wrote:
> Add vendor prefix for Doestek Co., Ltd.
> Link: http://www.doestek.co.kr/
> 
> Signed-off-by: Mithil Bavishi <bavishimithil@gmail.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof


