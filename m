Return-Path: <linux-omap+bounces-5379-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 237DECFC774
	for <lists+linux-omap@lfdr.de>; Wed, 07 Jan 2026 08:55:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7DE69300E025
	for <lists+linux-omap@lfdr.de>; Wed,  7 Jan 2026 07:53:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9308427A461;
	Wed,  7 Jan 2026 07:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="afnPrEGF"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BEA119B5B1;
	Wed,  7 Jan 2026 07:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767772419; cv=none; b=JIZTPTBRD1HPs9i7Q4nq/IvhjiWkchpeXAYxZ+OSbrdqN3ub28VexDNwNJdhgvTWW8Qh6Z3DhCe4erSRu+iKGq+9SPAi6WplDbLKhjNbSgZ5VrPzvcLmb5zajGIfbYR+vnLcK6dQDjccwVsC9T5VJmrHys8guq3Gl/4bDnkSijg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767772419; c=relaxed/simple;
	bh=9eNqAcghF7tdAA/uOmVCKek4FSJK0Zrf0oL0B3duEBY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qkvCjPjRsSSQ2H+PXBd0FlBrHeRnxQIWbGGnGT1XOaielvYF15HMyqkBnnGp90W0mQuqyb/yrsscKbPHcPx7sbNsL9EleV01cDcEIv5N93bbjwNuEm3yctrMhwHKZShsDPoDTdv8Ir/ynipN4TnNMsgeNPy0KhGW3W3J1SpTscw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=afnPrEGF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21ACCC4CEF7;
	Wed,  7 Jan 2026 07:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767772418;
	bh=9eNqAcghF7tdAA/uOmVCKek4FSJK0Zrf0oL0B3duEBY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=afnPrEGFvVIadMcNUTUWGGnLzqSlm3aYmVcEzgMSZfp3lvcYiSLEOKVX+rMvzyMa7
	 JGfHxFw71fhruvsnL8abYgCZlL6GbsK4hMStDJOU6I6QYiTmhiEe46RwiT/HXqaPsc
	 oHcu4PtOwNzl9t6AV62Aqcz1ahl77a8xioIlr/RdhvDnpSwyvY0hJ4iMvI9EMj6aIJ
	 hx16kke+fO1rSfTQu4/cSXWS5pDmT2fNkrOOBfRm8plI1H+wfe76RR2BKqBSXfdkqk
	 5iDr5yNtwR/wHcxZYVT8NVA+h0iSkIOb0hitquarBOlpD1mPB7daMl5W4kum22G4gQ
	 30bStwyDUPoqw==
Date: Wed, 7 Jan 2026 08:53:36 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
Cc: Jyri Sarha <jyri.sarha@iki.fi>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Tony Lindgren <tony@atomide.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Markus Schneider-Pargmann <msp@baylibre.com>, 
	Bajjuri Praneeth <praneeth@ti.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Louis Chauvet <louis.chauvet@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Miguel Gazquez <miguel.gazquez@bootlin.com>, Herve Codina <herve.codina@bootlin.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH v3 01/22] dt-bindings: display: tilcdc: Convert to DT
 schema
Message-ID: <20260107-elegant-utopian-kangaroo-cdb0cd@quoll>
References: <20260106-feature_tilcdc-v3-0-9bad0f742164@bootlin.com>
 <20260106-feature_tilcdc-v3-1-9bad0f742164@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260106-feature_tilcdc-v3-1-9bad0f742164@bootlin.com>

On Tue, Jan 06, 2026 at 06:42:17PM +0100, Kory Maincent (TI.com) wrote:
> Convert the device tree binding documentation for tilcdc
> from plain text to DT binding schema.
> 
> Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
> ---
> Change in v3:
> - Rename binding file to ti,am33xx-tilcdc.yaml.
> - Use generic node name and drop unused label.
> ---
>  .../bindings/display/tilcdc/ti,am33xx-tilcdc.yaml  | 100 +++++++++++++++++++++
>  .../devicetree/bindings/display/tilcdc/tilcdc.txt  |  82 -----------------
>  2 files changed, 100 insertions(+), 82 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


