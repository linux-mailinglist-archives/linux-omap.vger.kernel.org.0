Return-Path: <linux-omap+bounces-5428-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FDD0D14A3B
	for <lists+linux-omap@lfdr.de>; Mon, 12 Jan 2026 19:01:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4DA9F3019866
	for <lists+linux-omap@lfdr.de>; Mon, 12 Jan 2026 17:50:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C24837F119;
	Mon, 12 Jan 2026 17:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="r+fsgxij"
X-Original-To: linux-omap@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 591A637E2FE;
	Mon, 12 Jan 2026 17:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768240209; cv=none; b=b83GSoR7hhC88YKQI0G+DMY+pYUWudfUf8xzdy0CEUORHtDSWxHqsd7iaTPKtds4p6YgxNrSgSujy00Hmk8PHWOxHcW2srB8TOfkx8ZXX13Hd2FXk1SZa4vV7FNjWApzYi4zuA1SsUkAJYFzYgfct2dTYy/BSrnl/oSTordMcnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768240209; c=relaxed/simple;
	bh=If0EDU6H4zCtbyzNr1wpDXu4gqKUvy4RcPtwcDab0Jg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VNunT4zFPaRDdBNOc2Tzx74qP+HctKWV7fvyp1q6G9lIRmjR4YsOwr4SVmu9jpm0E0XnMJ67vnoteK6S5oGMjQmJSeKno9JwCOp+U3YByoQD/oHg7SNlVfl2jx1VKAm16v/P4xkYPTkOKHlY144vipAprpUs/xb+Twf/T/befxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=r+fsgxij; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-152.bb.dnainternet.fi [81.175.209.152])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id D49C1316;
	Mon, 12 Jan 2026 18:49:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1768240180;
	bh=If0EDU6H4zCtbyzNr1wpDXu4gqKUvy4RcPtwcDab0Jg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r+fsgxijiI5VwhvVQ0/zspPgkpcAp+k8uz8tvsulb5M0phoPVD8Nc1C9NL7cBFz0W
	 lasBayTK2d5c34FlRBIkNR+PeiAyIq/IG6n3YP7rLTFV1VQAYoDos/iYaiqY7pimQw
	 tzy52CdaIw4CdBV+qoEM45ZOLeExVKNY22nxdrPI=
Date: Mon, 12 Jan 2026 19:49:45 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: display: bridge: nxp,tda998x: Add missing
 clocks
Message-ID: <20260112174945.GC26365@pendragon.ideasonboard.com>
References: <2b66577296583a6787f770f0eb13c42a6b50768b.1768233569.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2b66577296583a6787f770f0eb13c42a6b50768b.1768233569.git.geert+renesas@glider.be>

Hi Geert,

Thank you for the patch.

On Mon, Jan 12, 2026 at 05:02:40PM +0100, Geert Uytterhoeven wrote:
> Some TDA998x variants (e.g. TDA19988) have an OSC_IN pin, to connect
> an external oscillator circuit or clock source.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> This fixes "make dtbs_check":
> 
>     arch/arm64/boot/dts/renesas/r8a774c0-ek874-mipi-2.1.dtb: tda19988@70 (nxp,tda998x): Unevaluated properties are not allowed ('clocks' was unexpected)
> 	    from schema $id: http://devicetree.org/schemas/display/bridge/nxp,tda998x.yaml
>     arch/arm64/boot/dts/renesas/r8a774c0-cat874.dtb: tda19988@70 (nxp,tda998x): Unevaluated properties are not allowed ('clocks' was unexpected)
> 	    from schema $id: http://devicetree.org/schemas/display/bridge/nxp,tda998x.yaml
>     arch/arm64/boot/dts/renesas/r8a774c0-ek874.dtb: tda19988@70 (nxp,tda998x): Unevaluated properties are not allowed ('clocks' was unexpected)
> 	    from schema $id: http://devicetree.org/schemas/display/bridge/nxp,tda998x.yaml
>     arch/arm64/boot/dts/renesas/r8a774c0-ek874-idk-2121wr.dtb: tda19988@70 (nxp,tda998x): Unevaluated properties are not allowed ('clocks' was unexpected)
> 	    from schema $id: http://devicetree.org/schemas/display/bridge/nxp,tda998x.yaml
> 
> This patch can be considered v3 of "[PATCH v2 2/3] [RFC] arm64: dts:
> renesas: cat874: Drop bogus clocks property"[1], as the pin is actually
> connected to a clock source on that board.  On BeagleBone Black, it is
> also connected to a clock source, but not described in DT.
> 
> The linux driver does not use this clock directly, but I suspect[2] the
> use of this pin is controlled through the AP_ENA register value, as
> specified in the second cell of the the audio-ports property.
> 
> [1] https://lore.kernel.org/97b949cddd7e30e9c05873800330dccd3483b12b.1663165552.git.geert+renesas@glider.be
> [2] I do not have access to the programming manual.
> ---
>  .../devicetree/bindings/display/bridge/nxp,tda998x.yaml        | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/nxp,tda998x.yaml b/Documentation/devicetree/bindings/display/bridge/nxp,tda998x.yaml
> index 3fce9e698ea1d2dd..1205c8e9de329bbc 100644
> --- a/Documentation/devicetree/bindings/display/bridge/nxp,tda998x.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/nxp,tda998x.yaml
> @@ -19,6 +19,9 @@ properties:
>    interrupts:
>      maxItems: 1
>  
> +  clocks:
> +    maxItems: 1
> +

I wonder if we should add a compatible string for the variants with a
clock pin, to let drivers manage the clock.

If the clock does not need to be controlled, an alternative would be to
drop the clocks property from
arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts.

>    video-ports:
>      $ref: /schemas/types.yaml#/definitions/uint32
>      default: 0x230145

-- 
Regards,

Laurent Pinchart

