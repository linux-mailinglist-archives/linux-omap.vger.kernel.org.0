Return-Path: <linux-omap+bounces-2642-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52BDD9C2BDC
	for <lists+linux-omap@lfdr.de>; Sat,  9 Nov 2024 11:34:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B4BAAB2216F
	for <lists+linux-omap@lfdr.de>; Sat,  9 Nov 2024 10:34:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 073EF14F9F4;
	Sat,  9 Nov 2024 10:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DAUVuD7o"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9698A233D73;
	Sat,  9 Nov 2024 10:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731148477; cv=none; b=FRkUZCbc+iXMqsGGxdU9dH9eJdXqwzpvU5Dqs7Ksf96M4oSs68ZXBLgBHZT/rOAbe9MK0FzmBUeEEzyaHz2JCqnZ+NmptDOwCAcmmgPBsW3ff/RRxXfWMe1kKGRqp/C2YUQqYnZeYI1uI01fohezTHSuVSZqdzCN4epN4vzcxtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731148477; c=relaxed/simple;
	bh=YrjS963uNgkad88N3YmG6Ne3LmcmTYNa7B9ja3oPTXI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uh2LjUr4NibMcsCYytSqTCYLc5XcLoKBYeNUAsqdtx1QVQEawxhMpIho5kVRhWa7aFXbgJZ6GpcuvdUEiKWp8AcgNStu/Ultax1mV+vhv9mYprUyc+WRUjy82Il1syLzj/6N9ijmMf7enxAD66nLKNCHjsyg60TrmvKSoPihcO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DAUVuD7o; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B972C4CECE;
	Sat,  9 Nov 2024 10:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731148477;
	bh=YrjS963uNgkad88N3YmG6Ne3LmcmTYNa7B9ja3oPTXI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DAUVuD7odJA8ZaJz441KqxN3NmIqQCLjYWR8RQzmaUveErBU7c+eIqq3Ph/y2i25l
	 ungvDimwUyi7vUmP94+VmI4x+JZGE84FhY6ShAia/3cQtejhNDTPZ7fvE53p3NFXmA
	 Acm0p917oprNSaBtgQIkpex0HTxpepSIvweDJ8ObEL5037lYhloRTDLDTXW1PgwG5A
	 VCbZfpbX9pcJhyfDbqxvXQHajV3nyY7aC1OLK+HFGelf47IhM4t0WARjemNab1ihq5
	 UKYkCjnaFxZxxv0lYhVF8+Dorm9THbCNnzJM0ozpK+z1v0qrHa2FOvASnUw52j2Ucw
	 cPESRXw4eIMdg==
Date: Sat, 9 Nov 2024 11:34:34 +0100
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
Subject: Re: [PATCH v3 05/10] dt-bindings: display: panel-lvds: Add
 compatible for Samsung LTN101AL03 Panel
Message-ID: <5qnim7ibats5nduuvfxkfo3gbjidbwpo273xdgkgnqpfzp4dkb@t64beyf2ot3j>
References: <20241108200440.7562-1-bavishimithil@gmail.com>
 <20241108200440.7562-6-bavishimithil@gmail.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241108200440.7562-6-bavishimithil@gmail.com>

On Fri, Nov 08, 2024 at 08:04:34PM +0000, Mithil Bavishi wrote:
> The LTN101AL03 is a 10.1 inch 800x1280, 24 bit, VESA Compatible, TFT display panel
> 
> Signed-off-by: Mithil Bavishi <bavishimithil@gmail.com>
> ---

Squash it with previous patch. Each of such trivial one-liners for
similar device is review step for me.

Best regards,
Krzysztof


